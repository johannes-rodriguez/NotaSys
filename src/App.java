import controller.AppController;
import model.AppModel;
import view.MainView;
import javax.swing.SwingUtilities;

/** Entrada de la aplicación. La composición de MVC ocurre solamente aquí. */
public final class App {
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            MainView.configureTheme();
            new AppController(new AppModel(), new MainView()).start();
        });
    }
}
