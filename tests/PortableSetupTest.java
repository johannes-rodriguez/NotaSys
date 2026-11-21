import model.*;
import java.nio.file.*;
import java.util.concurrent.TimeUnit;

/** Exercises only a new disposable cluster using the bundled engine. */
public final class PortableSetupTest {
    public static void main(String[] args) throws Exception {
        Path engine = Path.of(args[0]).toAbsolutePath();
        Path home = Files.createTempDirectory(Path.of("work"), "NotaSys prueba local ").toAbsolutePath();
        char[] password = "PruebaTemporal-2026".toCharArray();
        LocalPostgres local = new LocalPostgres(engine, home);
        try {
            local.start("notasys_test", password);
            SqlGateway maintenance = new PsqlGateway(engine.resolve("bin/psql.exe"), "127.0.0.1", "55432", "postgres", "notasys_test", password);
            SqlGateway target = new PsqlGateway(engine.resolve("bin/psql.exe"), "127.0.0.1", "55432", "notasys_test", "notasys_test", password);
            new DatabaseInitializer(maintenance, target).initialize("notasys_test");
            new AppModel(new PostgresRepository(target), new PostgresRepository(target));
            local.start("notasys_test", password);
            new DatabaseInitializer(maintenance, target).initialize("notasys_test");
            if (!target.execute("SELECT count(*) FROM notasys.emisor;").equals("2")) throw new AssertionError("Repeated seed");
            try (var files = Files.list(home)) {
                if (files.anyMatch(p -> p.getFileName().toString().startsWith("clave-"))) throw new AssertionError("Password file left behind");
            }
            System.out.println("PASS: bundled initdb, SCRAM authentication, local startup, automatic schema/data, application load, repeated startup, no password file.");
        } finally {
            Process stop = new ProcessBuilder(engine.resolve("bin/pg_ctl.exe").toString(), "-D", home.resolve("data").toString(), "-m", "fast", "-w", "stop").inheritIO().start();
            if (!stop.waitFor(30, TimeUnit.SECONDS)) stop.destroyForcibly();
        }
    }
}
