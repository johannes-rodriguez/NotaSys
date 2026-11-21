package model;

import java.nio.channels.FileChannel;
import java.nio.file.*;
import java.nio.file.attribute.*;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.TimeUnit;

/** Starts the bundled, loopback-only database without installing a Windows service. */
public final class LocalPostgres {
    private final Path engine;
    private final Path home;

    public LocalPostgres(Path engine, Path home) {
        this.engine = engine.toAbsolutePath();
        this.home = home.toAbsolutePath();
    }

    public void start(String user, char[] password) {
        try {
            if (!Files.isRegularFile(engine.resolve("bin/initdb.exe"))) {
                throw new IllegalArgumentException("Falta el motor local. Extrae completa la carpeta EJECUTABLE.");
            }
            Files.createDirectories(home);
            restrict(home);
            try (var channel = FileChannel.open(home.resolve("inicio.lock"), StandardOpenOption.CREATE, StandardOpenOption.WRITE);
                 var lock = channel.tryLock()) {
                if (lock == null) throw new IllegalArgumentException("Otra ventana está preparando NotaSys. Espera y reintenta.");
                Path data = home.resolve("data");
                if (!Files.exists(data.resolve("PG_VERSION"))) {
                    if (password.length < 8) {
                        throw new IllegalArgumentException("Para crear la base local, elige una contraseña de al menos 8 caracteres.");
                    }
                    Path secret = Files.createTempFile(home, "clave-", ".tmp");
                    try {
                        restrict(secret);
                        Files.writeString(secret, new String(password), StandardCharsets.UTF_8);
                        run("initdb.exe", "-D", data.toString(), "-U", user,
                            "--encoding=UTF8", "--locale=C", "--auth=scram-sha-256", "--pwfile=" + secret);
                    } finally {
                        Files.deleteIfExists(secret);
                    }
                    Files.writeString(data.resolve("postgresql.conf"),
                        "\nlisten_addresses='127.0.0.1'\nport=55432\n", StandardCharsets.UTF_8, StandardOpenOption.APPEND);
                }
                if (!Files.readString(data.resolve("PG_VERSION")).trim().equals("18")) {
                    throw new IllegalArgumentException("La base local requiere una migración de versión. No se han modificado sus datos.");
                }
                if (runStatus(data) != 0) {
                    run("pg_ctl.exe", "-D", data.toString(), "-l", home.resolve("postgresql.log").toString(), "-w", "start");
                }
            }
        } catch (IllegalArgumentException error) {
            throw error;
        } catch (Exception error) {
            throw new IllegalArgumentException("No se pudo preparar PostgreSQL local: " + error.getMessage(), error);
        }
    }

    private void restrict(Path path) throws Exception {
        AclFileAttributeView acl = Files.getFileAttributeView(path, AclFileAttributeView.class);
        if (acl != null) {
            var entry = AclEntry.newBuilder().setType(AclEntryType.ALLOW)
                .setPrincipal(Files.getOwner(path)).setPermissions(EnumSet.allOf(AclEntryPermission.class));
            if (Files.isDirectory(path)) entry.setFlags(AclEntryFlag.DIRECTORY_INHERIT, AclEntryFlag.FILE_INHERIT);
            acl.setAcl(List.of(entry.build()));
        }
    }

    private ProcessBuilder command(String... args) {
        List<String> command = new ArrayList<>();
        command.add(engine.resolve("bin").resolve(args[0]).toString());
        command.addAll(Arrays.asList(args).subList(1, args.length));
        return new ProcessBuilder(command).redirectErrorStream(true);
    }

    private int runStatus(Path data) throws Exception {
        Process process = command("pg_ctl.exe", "-D", data.toString(), "status")
            .redirectOutput(ProcessBuilder.Redirect.DISCARD).start();
        if (!process.waitFor(10, TimeUnit.SECONDS)) {
            process.destroyForcibly();
            throw new IllegalArgumentException("No se pudo comprobar el motor local.");
        }
        return process.exitValue();
    }

    private void run(String... args) throws Exception {
        Path log = home.resolve("preparacion.log");
        Process process = command(args).redirectOutput(ProcessBuilder.Redirect.appendTo(log.toFile())).start();
        if (!process.waitFor(120, TimeUnit.SECONDS)) {
            process.destroyForcibly();
            throw new IllegalArgumentException("La preparación excedió el tiempo previsto. Revisa " + log);
        }
        if (process.exitValue() != 0) {
            throw new IllegalArgumentException("No se pudo iniciar el motor local. Revisa " + log
                + ". Comprueba que el puerto 55432 esté libre. No borres tu carpeta de datos.");
        }
    }
}
