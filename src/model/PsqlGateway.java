package model;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;
import java.util.concurrent.*;
/** Native libpq client. No shell interpolation, password file or visible console. */
public final class PsqlGateway implements SqlGateway {
    private final Path executable;
    private final String host, port, database, user, password;
    public PsqlGateway(Path executable, String host, String port, String database, String user, char[] password) {
        this.executable = executable;
        this.host = host;
        this.port = port;
        this.database = database;
        this.user = user;
        this.password = new String(password);
        if (!port.matches("[0-9]{1,5}") || Integer.parseInt(port) > 65535 || Integer.parseInt(port) < 1) throw new IllegalArgumentException("Puerto inválido.");
        if (host.isBlank() || database.isBlank() || user.isBlank()) throw new IllegalArgumentException("Completa servidor, base y usuario.");
    }
    @Override
    public String execute(String sql) {
        Process process = null;
        ExecutorService readers = Executors.newFixedThreadPool(2);
        try {
            ProcessBuilder builder = new ProcessBuilder(executable.toString(), "-X", "-A", "-t", "-q", "-w", "-v", "ON_ERROR_STOP=1", "-h", host, "-p", port, "-U", user, "-d", database);
            builder.environment().put("PGPASSWORD", password);
            builder.environment().put("PGCLIENTENCODING", "UTF8");
            builder.environment().put("PGCONNECT_TIMEOUT", "8");
            builder.environment().put("PGAPPNAME", "NotaSys");
            // Make the bundled Microsoft runtime available to the native client too.
            Path runtimeBin = executable.toAbsolutePath().getParent().getParent().getParent().resolve("runtime/bin");
            if (java.nio.file.Files.isDirectory(runtimeBin)) {
                builder.environment().put("PATH", runtimeBin + java.io.File.pathSeparator
                    + builder.environment().getOrDefault("PATH", ""));
            }
            Process running = builder.start();
            process = running;
            Future<String> output = readers.submit(() -> new String(running.getInputStream().readAllBytes(), StandardCharsets.UTF_8));
            Future<String> errors = readers.submit(() -> new String(running.getErrorStream().readAllBytes(), StandardCharsets.UTF_8));
            try (var input = running.getOutputStream()) {
                input.write(("SET standard_conforming_strings=on; SET statement_timeout='25s';\n" + sql + "\n").getBytes(StandardCharsets.UTF_8));
            }
            if (!running.waitFor(150, TimeUnit.SECONDS)) {
                running.destroyForcibly();
                throw new IllegalArgumentException("PostgreSQL no respondió a tiempo. Actualiza antes de reintentar.");
            }
            String problem = errors.get(3, TimeUnit.SECONDS);
            if (running.exitValue() != 0) {
                // Keep the first server error, omit SQL statements and internal context.
                String message = problem.lines().filter(line -> line.contains("ERROR:") || line.contains("error:") || line.contains("FATAL:")) .findFirst().orElse("No se pudo conectar a PostgreSQL. Revisa servidor, puerto y credenciales.");
                throw new IllegalArgumentException(message.replaceFirst("^.*?(ERROR:|error:|FATAL:)\\s*", ""));
            }
            return output.get(3, TimeUnit.SECONDS).trim();
        }
        catch (IOException ex) {
            throw new IllegalArgumentException("No se pudo abrir el cliente PostgreSQL. Conserva completa la carpeta de NotaSys.", ex);
        }
        catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
            throw new IllegalArgumentException("Operación interrumpida. Actualiza antes de reintentar.", ex);
        }
        catch (ExecutionException | TimeoutException ex) {
            throw new IllegalArgumentException("No se pudo leer la respuesta de PostgreSQL.", ex);
        }
        finally {
            if (process != null && process.isAlive()) process.destroyForcibly();
            readers.shutdownNow();
        }
    }
}
