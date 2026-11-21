import controller.AppController;
import model.*;
import view.*;
import javax.swing.*;
import java.nio.file.*;
import java.util.Arrays;
/** Composition root: injects persistence and report boundaries into the service. */
public final class App {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            MainView.configureTheme();
            ConnectionDialog login = new ConnectionDialog();
            login.connect.addActionListener(event -> {
                char[] password = login.password.getPassword();
                final PsqlGateway gateway;
                final PsqlGateway maintenance;
                try {
                    gateway=new PsqlGateway(clientPath(),login.host.getText().trim(),login.port.getText().trim(), login.database.getText().trim(),login.user.getText().trim(),password);
                    maintenance=new PsqlGateway(clientPath(),login.host.getText().trim(),login.port.getText().trim(), "postgres",login.user.getText().trim(),password);
                }
                catch (Exception error) {
                    login.status.setText(error.getMessage());
                    return;
                }
                finally {
                    Arrays.fill(password,'\0');
                }
                login.connect.setEnabled(false);
                final String databaseName = login.database.getText().trim();
                final boolean useLocal = login.local.isSelected();
                final String databaseUser = login.user.getText().trim();
                final char[] localPassword = login.password.getPassword();
                login.status.setText("Conectando y verificando la estructura...");
                new SwingWorker<AppModel,Void>() {
                    protected AppModel doInBackground() {
                        try {
                            if (useLocal) {
                                new LocalPostgres(clientPath().getParent().getParent().resolve("postgresql"),
                                    Path.of(System.getProperty("user.home"), ".notasys", "postgresql"))
                                    .start(databaseUser, localPassword);
                            }
                            new DatabaseInitializer(maintenance, gateway).initialize(databaseName);
                            PostgresRepository repository=new PostgresRepository(gateway);
                            return new AppModel(repository,repository);
                        } catch (Exception error) {
                            throw new IllegalArgumentException(error.getMessage(), error);
                        } finally {
                            Arrays.fill(localPassword, '\0');
                        }
                    }
                    protected void done() {
                        login.connect.setEnabled(true);
                        try {
                            AppModel model=get();
                            login.savePreferences();
                            MainView view=new MainView();
                            view.connectionInfo.setText("PostgreSQL · "+login.database.getText()+" · "+login.user.getText());
                            new AppController(model,view).start();
                            login.password.setText("");
                            login.dispose();
                        }
                        catch (Exception error) {
                            Throwable cause=error.getCause()==null?error:error.getCause();
                            login.status.setText("No se pudo abrir la base de datos.");
                            JOptionPane.showMessageDialog(login,cause.getMessage(),"Conexión PostgreSQL",JOptionPane.WARNING_MESSAGE);
                        }
                    }
                }
                .execute();
            });
            login.setVisible(true);
        });
    }
    private static Path clientPath() throws Exception {
        Path artifact=Path.of(App.class.getProtectionDomain().getCodeSource().getLocation().toURI());
        Path beside=artifact.getParent().resolve("pgsql/psql.exe");
        if (Files.isRegularFile(beside)) return beside;
        Path dev=Path.of("lib/pgsql/psql.exe").toAbsolutePath();
        if (Files.isRegularFile(dev)) return dev;
        throw new IllegalArgumentException("Falta app/pgsql/psql.exe. Extrae completa la carpeta NotaSys.");
    }
}
