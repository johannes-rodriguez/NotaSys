import model.*;
import java.nio.file.Path;

/** Integration checks on the isolated test cluster, including safe retries. */
public final class SetupTest {
    public static void main(String[] args) {
        Path client = Path.of(args[0]);
        SqlGateway maintenance = new PsqlGateway(client, "127.0.0.1", "55439", "postgres", "notasys_admin", new char[0]);
        String name = "notasys_setup_" + Long.toUnsignedString(System.nanoTime());
        SqlGateway target = new PsqlGateway(client, "127.0.0.1", "55439", name, "notasys_admin", new char[0]);
        DatabaseInitializer initializer = new DatabaseInitializer(maintenance, target);
        try {
            initializer.initialize(name);
            String before = target.execute("SELECT count(*) FROM notasys.factura;");
            if (Integer.parseInt(before) < 1) throw new AssertionError("Missing seed data");
            new AppModel(new PostgresRepository(target), new PostgresRepository(target));
            initializer.initialize(name);
            if (!before.equals(target.execute("SELECT count(*) FROM notasys.factura;"))) {
                throw new AssertionError("Repeated setup changed existing data");
            }
            try {
                initializer.initialize("invalid;name");
                throw new AssertionError("Invalid database accepted");
            } catch (IllegalArgumentException expected) {
                // Reject SQL identifiers before executing anything.
            }
            System.out.println("PASS: create database, install SQL, load application, reopen without duplication, reject invalid name.");
        } finally {
            maintenance.execute("DROP DATABASE IF EXISTS \"" + name + "\";");
        }
    }
}
