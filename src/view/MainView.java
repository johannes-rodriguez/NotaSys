package view;
import model.AppModel;
import model.AppModel.*;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.List;
import java.util.*;
import java.util.function.IntConsumer;
/** Vista principal: composición visual y controles, sin acceso a datos ni SQL. */
public final class MainView extends JFrame {
    public static final Color NAVY=new Color(21,40,65), TEAL=new Color(0,126,128), BG=new Color(244,247,250), INK=new Color(30,46,65), MUTED=new Color(92,109,126);
    public final JLabel connectionInfo=new JLabel("PostgreSQL");
    public final JButton reload=button("Actualizar",false);
    public final JComboBox<Master> company=new JComboBox<>();
    public final JTabbedPane catalogTabs=new JTabbedPane();
    public final Map<String,Grid> catalogGrids=new LinkedHashMap<>();
    public final Grid documents=new Grid(true), notes=new Grid(true);
    public final JComboBox<String> documentType=new JComboBox<>(new String[] {
        "Todos","Factura","Boleta"
    });
    public final JComboBox<String> noteType=new JComboBox<>(new String[] {
        "Todos","Crédito","Débito"
    });
    public final JButton createNote=button("Crear nota de ajuste",true);
    public final JComboBox<Document> historyDocument=new JComboBox<>();
    public final JButton documentHistory=button("Abrir historial del comprobante",true);
    public final JTable auditTable=table();
    public final JButton auditDetail=button("Ver detalle del cambio",false);
    public IntConsumer reportRequested=id-> {
    };
    private final CardLayout cards=new CardLayout();
    private final JPanel content=new JPanel(cards);
    private final JLabel title=new JLabel("Comprobantes");
    private final JLabel subtitle=new JLabel();
    private final Map<String,JButton> nav=new LinkedHashMap<>();
    private String currentSection="Comprobantes";
    public MainView() {
        super("NotaSys · Gestión de notas");
        setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
        setSize(1220,790);
        setMinimumSize(new Dimension(960,640));
        setLocationRelativeTo(null);
        setLayout(new BorderLayout());
        getContentPane().setBackground(BG);
        JPanel side=new JPanel();
        side.setLayout(new BoxLayout(side,BoxLayout.Y_AXIS));
        side.setBackground(NAVY);
        side.setBorder(new EmptyBorder(25,16,20,16));
        side.setPreferredSize(new Dimension(205,600));
        JLabel brand=new JLabel("NotaSys");
        brand.setForeground(Color.WHITE);
        brand.setFont(new Font("Segoe UI",Font.BOLD,27));
        side.add(brand);
        JLabel sub=new JLabel("GESTIÓN DE NOTAS");
        sub.setForeground(new Color(164,187,207));
        sub.setFont(new Font("Segoe UI",Font.PLAIN,11));
        side.add(Box.createVerticalStrut(7));
        side.add(sub);
        side.add(Box.createVerticalStrut(35));
        for(String name:List.of("Catálogos","Comprobantes","Notas de ajuste","Reportes","Historial","Configuración","Ayuda")) {
            JButton b=new JButton(name);
            b.setFont(new Font("Segoe UI",Font.PLAIN,15));
            b.setHorizontalAlignment(SwingConstants.LEFT);
            b.setForeground(Color.WHITE);
            b.setBackground(NAVY);
            b.setOpaque(true);
            b.setBorder(new EmptyBorder(13,12,13,8));
            b.setFocusPainted(true);
            b.setMaximumSize(new Dimension(Integer.MAX_VALUE,48));
            b.addActionListener(e->showSection(name));
            nav.put(name,b);
            side.add(b);
            side.add(Box.createVerticalStrut(5));
        }
        side.add(Box.createVerticalGlue());
        JLabel ver=new JLabel("Versión 1.0");
        ver.setForeground(new Color(164,187,207));
        side.add(ver);
        add(side,BorderLayout.WEST);
        JPanel workspace=new JPanel(new BorderLayout());
        workspace.setBackground(BG);
        JPanel top=new JPanel(new BorderLayout(12,0));
        top.setBackground(Color.WHITE);
        top.setBorder(new EmptyBorder(16,24,16,24));
        JPanel pick=row();
        pick.add(new JLabel("Empresa:"));
        company.setPreferredSize(new Dimension(320,34));
        pick.add(company);
        top.add(pick,BorderLayout.WEST);
        connectionInfo.setForeground(TEAL);
        top.add(connectionInfo,BorderLayout.EAST);
        pick.add(reload);
        workspace.add(top,BorderLayout.NORTH);
        JPanel center=new JPanel(new BorderLayout(0,20));
        center.setBorder(new EmptyBorder(22,24,18,24));
        center.setBackground(BG);
        JPanel headings=new JPanel(new GridLayout(2,1,0,5));
        headings.setOpaque(false);
        title.setFont(new Font("Segoe UI",Font.BOLD,28));
        title.setForeground(INK);
        subtitle.setForeground(MUTED);
        headings.add(title);
        headings.add(subtitle);
        center.add(headings,BorderLayout.NORTH);
        content.setOpaque(false);
        center.add(content);
        workspace.add(center);
        JPanel cats=new JPanel(new BorderLayout());
        cats.setOpaque(false);
        for(String name:List.of("Emisores","Clientes","Productos y servicios")) {
            Grid g=new Grid(false);
            catalogGrids.put(name,g);
            catalogTabs.addTab(name,g);
        }
        cats.add(catalogTabs);
        content.add(cats,"Catálogos");
        documents.filters.add(new JLabel("Tipo:"));
        documents.filters.add(documentType);
        documents.actions.add(createNote);
        content.add(documents,"Comprobantes");
        notes.filters.add(new JLabel("Tipo:"));
        notes.filters.add(noteType);
        content.add(notes,"Notas de ajuste");
        content.add(reportsPanel(),"Reportes");
        content.add(historyPanel(),"Historial");
        content.add(configPanel(),"Configuración");
        content.add(helpPanel(),"Ayuda");
        JLabel foot=new JLabel("  NotaSys · Gestión documental y trazabilidad · PostgreSQL");
        foot.setBorder(new EmptyBorder(10,12,10,12));
        foot.setForeground(MUTED);
        workspace.add(foot,BorderLayout.SOUTH);
        add(workspace);
        showSection("Comprobantes");
    }
    public void showSection(String name) {
        currentSection=name;
        cards.show(content,name);
        title.setText(name.equals("Reportes")?"Centro de reportes":name);
        String text=switch(name) {
            case "Catálogos"->"Emisores, clientes y productos o servicios. Catálogos compartidos.";
            case "Comprobantes"->"Registra facturas y boletas; selecciona una para crear su nota.";
            case "Notas de ajuste"->"Gestiona notas de crédito y débito vinculadas a sus comprobantes.";
            case "Reportes"->"Elige una consulta. Se abrirá en una ventana independiente y ampliable.";
            case "Historial"->"Consulta los documentos relacionados y los cambios registrados.";
            case "Configuración"->"Configuración de la conexión y alcance del sistema.";
            default->"Guía rápida del sistema.";
        };
        subtitle.setText(text);
        nav.forEach((key,b)->b.setBackground(key.equals(name)?TEAL:NAVY));
    }
    public String currentSection() {
        return currentSection;
    }
    private JPanel reportsPanel() {
        JPanel box=new JPanel(new BorderLayout(0,16));
        box.setOpaque(false);
        JPanel grid=new JPanel(new GridLayout(0,2,14,14));
        grid.setOpaque(false);
        for(ReportSpec spec:AppModel.REPORTS) {
            JPanel tile=new JPanel(new BorderLayout(8,10));
            tile.setBackground(Color.WHITE);
            tile.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createLineBorder(new Color(220,228,235)),new EmptyBorder(14,16,14,16)));
            JLabel name=new JLabel(String.format("%02d  %s",spec.id(),spec.title()));
            name.setFont(new Font("Segoe UI",Font.BOLD,14));
            name.setForeground(INK);
            tile.add(name,BorderLayout.NORTH);
            JLabel desc=new JLabel("<html>"+spec.description()+"</html>");
            desc.setForeground(MUTED);
            tile.add(desc);
            JButton open=button("Abrir reporte ↗",false);
            open.addActionListener(e->reportRequested.accept(spec.id()));
            tile.add(open,BorderLayout.SOUTH);
            grid.add(tile);
        }
        JScrollPane scroll=new JScrollPane(grid);
        scroll.setBorder(null);
        scroll.getViewport().setBackground(BG);
        scroll.getVerticalScrollBar().setUnitIncrement(20);
        box.add(scroll);
        return box;
    }
    private JPanel historyPanel() {
        JPanel p=new JPanel(new BorderLayout(0,14));
        p.setOpaque(false);
        JPanel top=new JPanel(new BorderLayout(12,0));
        top.setOpaque(false);
        top.add(historyDocument);
        top.add(documentHistory,BorderLayout.EAST);
        p.add(top,BorderLayout.NORTH);
        p.add(new JScrollPane(auditTable));
        JPanel bottom=row();
        bottom.add(auditDetail);
        bottom.add(new JLabel("El historial registra operaciones guardadas en la base de datos."));
        p.add(bottom,BorderLayout.SOUTH);
        return p;
    }
    private JPanel configPanel() {
        JPanel panel=new JPanel(new BorderLayout());
        panel.add(new JScrollPane(readOnlyText("CONEXIÓN POSTGRESQL\n\nLa conexión se configura al abrir NotaSys. La contraseña no se guarda en disco.\nPara cambiar de servidor, cierra la aplicación y vuelve a conectar.\n\nPERSISTENCIA\n\nLos cambios confirmados se conservan en PostgreSQL. Pulsa Actualizar para recoger cambios de otros usuarios.\nEl historial conserva valores anteriores, valores nuevos, usuario y motivo.\n\nREGLAS DEL PROYECTO\n\nFacturas: series E. Boletas: series B. Notas de débito: series E, conforme a tu script original.\nLa nota hereda cliente, moneda y tasa efectiva del comprobante.\nLos comprobantes nuevos se registran con IGV del 18 %.\n\nNotaSys administra registros internos. No transmite documentos a SUNAT.")));
        return panel;
    }
    private JPanel helpPanel() {
        JPanel panel=new JPanel(new BorderLayout());
        panel.add(new JScrollPane(readOnlyText("CÓMO UTILIZAR NOTASYS\n\n1. Selecciona el emisor.\n2. Registra clientes y servicios en Catálogos.\n3. Crea una factura o boleta en Comprobantes.\n4. Selecciona el comprobante y pulsa Crear nota de ajuste.\n5. Elige únicamente artículos del comprobante; ingresa el valor del ajuste.\n6. Revisa Vista previa y pulsa Guardar.\n7. Abre uno de los 15 reportes, define filtros y selecciona Crédito, Débito o Todos.\n8. Exporta CSV o imprime el documento desde su vista previa.\n\nDESACTIVACIÓN\n\nEs un borrado lógico: requiere motivo y conserva el historial.\nNo equivale a una anulación tributaria. Una nota inactiva deja de consumir saldo disponible.\n\nIMPORTES\n\nLos créditos acumulados por artículo no pueden superar su importe original.\nLas devoluciones tampoco pueden superar la cantidad original.\nLos descuentos reducen importes, sin consumir cantidades como una devolución.\nEl neto documental no representa una cuenta por cobrar.\n\nConsulta LEEME.md y docs/Manual_usuario.md para instalación y operación.")));
        return panel;
    }
    public static JTextArea readOnlyText(String text) {
        JTextArea a=new JTextArea(text);
        a.setEditable(false);
        a.setLineWrap(true);
        a.setWrapStyleWord(true);
        a.setBorder(new EmptyBorder(20,20,20,20));
        a.setFont(new Font("Segoe UI",Font.PLAIN,14));
        a.setBackground(Color.WHITE);
        a.setForeground(INK);
        a.setCaretPosition(0);
        return a;
    }
    public static JPanel row() {
        JPanel p=new JPanel(new FlowLayout(FlowLayout.LEFT,8,0));
        p.setOpaque(false);
        return p;
    }
    public static JButton button(String name,boolean primary) {
        JButton b=new JButton(name);
        b.setFont(new Font("Segoe UI",Font.PLAIN,14));
        b.setBackground(primary?TEAL:Color.WHITE);
        b.setForeground(primary?Color.WHITE:INK);
        b.setOpaque(true);
        b.setBorder(BorderFactory.createCompoundBorder(BorderFactory.createLineBorder(primary?TEAL:new Color(194,207,219)),new EmptyBorder(8,12,8,12)));
        b.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        return b;
    }
    public static JTable table() {
        JTable t=new JTable();
        t.setRowHeight(34);
        t.setFont(new Font("Segoe UI",Font.PLAIN,13));
        t.getTableHeader().setFont(new Font("Segoe UI",Font.BOLD,13));
        t.getTableHeader().setPreferredSize(new Dimension(10,36));
        t.setSelectionBackground(new Color(218,240,240));
        t.setSelectionForeground(INK);
        t.setShowVerticalLines(false);
        t.setGridColor(new Color(228,234,240));
        t.setFillsViewportHeight(true);
        t.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
        return t;
    }
    public static void setTable(JTable table,String[] columns,List<Object[]> rows) {
        DefaultTableModel m=new DefaultTableModel(columns,0) {
            @Override public boolean isCellEditable(int r,int c) {
                return false;
            }
        };
        rows.forEach(m::addRow);
        table.setModel(m);
        table.setAutoCreateRowSorter(false);
    }
    public static void configureTheme() {
        try {
            UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
        }
        catch(Exception ignored) {
        }
        Font font=new Font("Segoe UI",Font.PLAIN,14);
        for(Object key:Collections.list(UIManager.getDefaults().keys()))if(UIManager.get(key) instanceof javax.swing.plaf.FontUIResource)UIManager.put(key,new javax.swing.plaf.FontUIResource(font));
        UIManager.put("Panel.background",BG);
        UIManager.put("Label.foreground",INK);
        UIManager.put("TextField.background",Color.WHITE);
        UIManager.put("ComboBox.background",Color.WHITE);
        UIManager.put("TabbedPane.selected",Color.WHITE);
        UIManager.put("Button.focus",TEAL);
        UIManager.put("ScrollBar.width",14);
    }
    public static final class Grid extends JPanel {
        public final JTextField search=new JTextField(22);
        public final JComboBox<String> state=new JComboBox<>(new String[] {
            "Activos","Inactivos","Todos"
        });
        public final JTable table=MainView.table();
        public final JButton add=button("+ Nuevo",true),view=button("Ver",false),edit=button("Editar",false),deactivate=button("Desactivar",false);
        public final JPanel filters=row(),actions=row();
        public final JLabel count=new JLabel("0 registros");
        public Grid(boolean documents) {
            super(new BorderLayout(0,12));
            setOpaque(false);
            filters.add(new JLabel("Buscar:"));
            filters.add(search);
            search.setToolTipText("Buscar por código, documento, nombre o cliente");
            filters.add(new JLabel("Estado:"));
            filters.add(state);
            JPanel upper=new JPanel(new BorderLayout(8,10));
            upper.setOpaque(false);
            upper.add(filters,BorderLayout.CENTER);
            upper.add(add,BorderLayout.EAST);
            add(upper,BorderLayout.NORTH);
            add(new JScrollPane(table));
            actions.add(view);
            actions.add(edit);
            actions.add(deactivate);
            actions.add(count);
            add(actions,BorderLayout.SOUTH);
        }
    }
}
