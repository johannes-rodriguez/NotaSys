package view;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.nio.file.*;
import java.util.Properties;
/** Connection inputs; credentials are kept out of the preferences file. */
public final class ConnectionDialog extends JFrame {
    public final JTextField host = new JTextField("127.0.0.1"), port = new JTextField("5432"), database = new JTextField("mzuel_notas"), user = new JTextField("postgres");
    public final JPasswordField password = new JPasswordField();
    public final JCheckBox local = new JCheckBox("Usar PostgreSQL incluido", true);
    public final JButton connect = MainView.button("Guardar y conectar",true);
    public final JLabel status = new JLabel("Preparación automática de PostgreSQL local.");
    private final Path preferences = Path.of(System.getProperty("user.home"),".notasys","conexion.properties");
    public ConnectionDialog() {
        super("NotaSys - Configuración de la base de datos");
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(610,540);
        setLocationRelativeTo(null);
        JPanel root = new JPanel(new BorderLayout(0,20));
        root.setBorder(new EmptyBorder(28,32,28,32));
        setContentPane(root);
        JLabel title = new JLabel("NotaSys");
        title.setFont(new Font("Segoe UI",Font.BOLD,34));
        title.setForeground(MainView.TEAL);
        root.add(title,BorderLayout.NORTH);
        JPanel fields = new JPanel(new GridLayout(0,2,14,18));
        fields.add(new JLabel("Modo local automático"));
        fields.add(local);
        fields.add(new JLabel("Servidor"));
        fields.add(host);
        fields.add(new JLabel("Puerto"));
        fields.add(port);
        fields.add(new JLabel("Base de datos"));
        fields.add(database);
        fields.add(new JLabel("Usuario PostgreSQL"));
        fields.add(user);
        fields.add(new JLabel("Contraseña"));
        fields.add(password);
        root.add(fields);
        JPanel bottom = new JPanel(new GridLayout(0,1,0,12));
        bottom.add(status);
        bottom.add(connect);
        JButton help=MainView.button("Instrucciones de instalación",false);
        help.addActionListener(event -> JOptionPane.showMessageDialog(this, "Deja marcado Usar PostgreSQL incluido.\nEn el primer ingreso elige usuario y contraseña (mínimo 8 caracteres).\nPulsa Guardar y conectar: la preparación es automática.\n\nNo necesitas instalar Java ni PostgreSQL.\nEl motor local usa 127.0.0.1:55432 y conserva los datos entre aperturas.\nPara una base anterior, desmarca el modo local y usa sus credenciales.\nLa contraseña se solicita al abrir y no se guarda en disco.", "Preparación automática", JOptionPane.INFORMATION_MESSAGE));
        bottom.add(help);
        root.add(bottom,BorderLayout.SOUTH);
        getRootPane().setDefaultButton(connect);
        Properties saved = new Properties();
        if (Files.isRegularFile(preferences)) try (var input=Files.newInputStream(preferences)) {
            saved.load(input);
            host.setText(saved.getProperty("host","127.0.0.1"));
            port.setText(saved.getProperty("port","5432"));
            database.setText(saved.getProperty("database","mzuel_notas"));
            user.setText(saved.getProperty("user","postgres"));
            local.setSelected(Boolean.parseBoolean(saved.getProperty("local", "true")));
        }
        catch (Exception ignored) {
            status.setText("No se pudo leer la conexión anterior. Ingresa sus datos.");
        }
        local.addActionListener(event -> applyMode());
        applyMode();
    }
    private void applyMode() {
        host.setEnabled(!local.isSelected());
        port.setEnabled(!local.isSelected());
        if (local.isSelected()) {
            host.setText("127.0.0.1");
            port.setText("55432");
            status.setText("Primer ingreso: elige usuario y clave (mínimo 8 caracteres).");
        } else {
            port.setText("5432");
            status.setText("Conecta a tu instalación existente de PostgreSQL.");
        }
    }
    public void savePreferences() {
        Properties saved=new Properties();
        saved.setProperty("host",host.getText().trim());
        saved.setProperty("port",port.getText().trim());
        saved.setProperty("database",database.getText().trim());
        saved.setProperty("user",user.getText().trim());
        saved.setProperty("local", Boolean.toString(local.isSelected()));
        try {
            Files.createDirectories(preferences.getParent());
            try (var output=Files.newOutputStream(preferences)) {
                saved.store(output,"NotaSys - sin contrasena");
            }
        }
        catch (Exception ignored) {
            /* Connection remains usable without local preferences. */
        }
    }
}
