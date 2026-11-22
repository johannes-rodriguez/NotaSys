package view;
import model.AppModel;
import model.AppModel.*;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.text.MessageFormat;
import java.util.List;
/** Resizable document preview, HTML export and paginated printing. */
public final class DocumentPreview extends JDialog {
    public final JEditorPane paper = new JEditorPane();
    private final String html;
    public DocumentPreview(Window owner, String company, String ruc, String title, String number, String date, String client, String currency, String reference, String reason, String description, List<Line> lines, BigDecimal base, BigDecimal tax, String status) {
        super(owner, "NotaSys · " + title + " " + number, ModalityType.MODELESS);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setSize(920, 820);
        setMinimumSize(new Dimension(720, 560));
        setLocationRelativeTo(owner);
        JPanel root = new JPanel(new BorderLayout(0, 14));
        root.setBorder(new EmptyBorder(18, 20, 18, 20));
        setContentPane(root);
        JPanel toolbar = MainView.row();
        JButton print = MainView.button("Imprimir / PDF", true);
        JButton export = MainView.button("Guardar documento HTML", false);
        toolbar.add(print);
        toolbar.add(export);
        root.add(toolbar, BorderLayout.NORTH);
        html = render(company,ruc,title,number,date,client,currency,reference,reason,description,lines,base,tax,status);
        paper.setContentType("text/html");
        paper.setText(html);
        paper.setEditable(false);
        paper.setCaretPosition(0);
        paper.setBackground(Color.WHITE);
        paper.setBorder(new EmptyBorder(20, 28, 20, 28));
        root.add(new JScrollPane(paper));
        root.add(new JLabel("Registro interno · La emisión electrónica ante SUNAT se gestiona por separado."), BorderLayout.SOUTH);
        print.addActionListener(event -> {
            try {
                paper.print(new MessageFormat("NotaSys · " + number), new MessageFormat("Página {0}"));
            }
            catch (Exception error) {
                JOptionPane.showMessageDialog(this,"No se pudo imprimir: " + error.getMessage());
            }
        });
        export.addActionListener(event -> {
            JFileChooser chooser = new JFileChooser();
            chooser.setSelectedFile(new java.io.File(number.replaceAll("[^A-Za-z0-9_-]", "_") + ".html"));
            if (chooser.showSaveDialog(this) != JFileChooser.APPROVE_OPTION) return;
            var destination = chooser.getSelectedFile().toPath();
            if (!destination.toString().toLowerCase().endsWith(".html")) destination = destination.resolveSibling(destination.getFileName()+".html");
            if (Files.exists(destination) && JOptionPane.showConfirmDialog(this,"¿Reemplazar el documento existente?","Guardar",JOptionPane.YES_NO_OPTION) != JOptionPane.YES_OPTION) return;
            try {
                Files.writeString(destination,html,StandardCharsets.UTF_8);
            }
            catch (Exception error) {
                JOptionPane.showMessageDialog(this,"No se pudo guardar el documento.");
            }
        });
    }
    public static String escape(String text) {
        return String.valueOf(text).replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
    }
    public static String render(String company,String ruc,String title,String number,String date,String client, String currency,String reference,String reason,String description,List<Line> lines, BigDecimal base,BigDecimal tax,String status) {
        StringBuilder page = new StringBuilder("<html><head><meta charset='UTF-8'><style>body{font-family:Segoe UI,Arial,sans-serif;font-size:12px;color:#203149}h1{font-size:25px;color:#00868a}h2{font-size:18px}th{background:#16334e;color:white;padding:10px;text-align:left}td{padding:9px}p{margin-top:8px}.muted{color:#637488}table{border-collapse:collapse;width:100%}</style></head><body>");
        page.append("<table><tr><td width='58%'><h1>NotaSys</h1><h2>").append(escape(company)) .append("</h2><p>RUC: ").append(escape(ruc)).append("</p></td><td bgcolor='#edf5f6'><h2>") .append(escape(title)).append("</h2><h2>").append(escape(number)).append("</h2><p>").append(escape(status)).append("</p></td></tr></table><hr>");
        page.append("<table><tr><td><b>Cliente</b><br>").append(escape(client)).append("</td><td><b>Fecha</b><br>") .append(escape(date)).append("</td><td><b>Moneda</b><br>").append(escape(currency)).append("</td></tr></table>");
        if (!reference.isBlank()) page.append("<p><b>Comprobante modificado:</b> ").append(escape(reference)).append("</p><p><b>Motivo:</b> ").append(escape(reason)).append("</p><p>").append(escape(description)).append("</p>");
        page.append("<br><table border='0' cellspacing='0' cellpadding='8'><tr><th>Código</th><th>Descripción</th><th>Cantidad</th><th>V. unitario</th><th>Importe</th></tr>");
        int index=0;
        for (Line line : lines) {
            page.append("<tr bgcolor='").append(index++%2==0?"#f0f5f8":"#ffffff").append("'><td>").append(escape(line.productId())) .append("</td><td>").append(escape(line.description())).append("</td><td align='right'>").append(line.quantity().stripTrailingZeros().toPlainString()) .append("</td><td align='right'>").append(line.price().stripTrailingZeros().toPlainString()).append("</td><td align='right'>") .append(AppModel.money(line.amount())).append("</td></tr>");
        }
        page.append("</table><br><table><tr><td width='62%'></td><td>Valor de venta</td><td align='right'>").append(AppModel.money(base)) .append("</td></tr><tr><td></td><td>IGV</td><td align='right'>").append(AppModel.money(tax)) .append("</td></tr><tr bgcolor='#e1f2f1'><td></td><td><b>TOTAL ").append(escape(currency)).append("</b></td><td align='right'><b>") .append(AppModel.money(base.add(tax))).append("</b></td></tr></table><br><hr><p class='muted'>").append(escape(status)) .append(" · Generado con NotaSys. Este documento representa un registro interno.</p></body></html>");
        return page.toString();
    }
}
