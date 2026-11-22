package view;
import model.AppModel;
import model.AppModel.*;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;
/** Formulario reutilizado por comprobantes y notas. El controlador guarda el resultado. */
public final class DocumentDialog extends JDialog {
    public final JComboBox<String> type,currency=new JComboBox<>(new String[] {
        "PEN","USD"
    }
    ),reason=new JComboBox<>();
    public final JComboBox<Master> client=new JComboBox<>(),product=new JComboBox<>();
    public final JComboBox<Document> original=new JComboBox<>();
    public final JTextField number=new JTextField(),date=new JTextField(AppModel.TODAY.toString()),description=new JTextField();
    public final JButton save=MainView.button("Guardar",true);
    public final JLabel originalInfo=new JLabel("Selecciona un comprobante activo.");
    public final JTextField qty=new JTextField("1",6),price=new JTextField("100.00",8);
    public final JTable table=MainView.table();
    private final JLabel totals=new JLabel();
    private final List<Line> lines=new ArrayList<>();
    private final boolean note;
    public DocumentDialog(JFrame owner,boolean note,List<Master> clients,List<Master> products,List<Document> docs) {
        super(owner,note?"Nota de ajuste":"Comprobante",true);
        this.note=note;
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setSize(890,740);
        setMinimumSize(new Dimension(800,660));
        setLocationRelativeTo(owner);
        JPanel root=new JPanel(new BorderLayout(0,15));
        root.setBorder(new EmptyBorder(20,24,20,24));
        setContentPane(root);
        type=new JComboBox<>(note?new String[] {
            "Crédito","Débito"
        }
        :new String[] {
            "Factura","Boleta"
        });
        clients.forEach(client::addItem);
        products.forEach(product::addItem);
        docs.forEach(original::addItem);
        JPanel upper=new JPanel(new BorderLayout(0,14));
        JLabel heading=new JLabel(note?"Registrar nota de ajuste":"Registrar comprobante");
        heading.setFont(new Font("Segoe UI",Font.BOLD,23));
        upper.add(heading,BorderLayout.NORTH);
        JPanel fields=new JPanel(new GridLayout(0,2,16,12));
        field(fields,"Tipo",type);
        field(fields,"Serie y número",number);
        field(fields,"Fecha (AAAA-MM-DD)",date);
        if(note) {
            field(fields,"Comprobante original",original);
            field(fields,"Motivo",reason);
            field(fields,"Descripción del ajuste",description);
        }
        else {
            field(fields,"Cliente",client);
            field(fields,"Moneda",currency);
        }
        upper.add(fields,BorderLayout.CENTER);
        if(note)upper.add(originalInfo,BorderLayout.SOUTH);
        root.add(upper,BorderLayout.NORTH);
        JPanel details=new JPanel(new BorderLayout(0,12));
        details.setBorder(BorderFactory.createTitledBorder("Detalle · valores sin IGV"));
        JPanel entry=new JPanel(new GridLayout(1,4,12,0));
        field(entry,"Producto / servicio",product);
        field(entry,"Cantidad",qty);
        field(entry,note?"Valor unitario del ajuste":"Valor unitario",price);
        JButton add=MainView.button("Agregar ítem",false);
        add.setName("addLine");
        entry.add(add);
        details.add(entry,BorderLayout.NORTH);
        details.add(new JScrollPane(table));
        JPanel lower=new JPanel(new BorderLayout(12,0));
        JButton remove=MainView.button("Quitar ítem",false);
        lower.add(remove,BorderLayout.WEST);
        totals.setHorizontalAlignment(SwingConstants.RIGHT);
        lower.add(totals,BorderLayout.CENTER);
        details.add(lower,BorderLayout.SOUTH);
        root.add(details);
        JPanel bottom=new JPanel(new BorderLayout(0,12));
        JLabel hint=new JLabel(note?"Solo se permiten artículos del comprobante original. El valor ingresado es el ajuste sin IGV.":"Los comprobantes nuevos utilizan IGV del 18 %. Revisa los valores antes de guardar.");
        hint.setFont(new Font("Segoe UI",Font.PLAIN,12));
        hint.setForeground(MainView.MUTED);
        bottom.add(hint,BorderLayout.NORTH);
        JPanel actions=MainView.row();
        JButton cancel=MainView.button("Cancelar",false),preview=MainView.button("Vista previa",false);
        cancel.addActionListener(e->dispose());
        preview.addActionListener(e->preview());
        actions.add(cancel);
        actions.add(preview);
        actions.add(save);
        bottom.add(actions,BorderLayout.EAST);
        root.add(bottom,BorderLayout.SOUTH);
        add.addActionListener(e-> {
            try {
                Master p=(Master)product.getSelectedItem();
                if(p==null)throw new IllegalArgumentException("Registra un producto activo primero.");
                BigDecimal q=decimal(qty.getText()),v=decimal(price.getText());
                if(q.signum()<=0||v.signum()<0)throw new IllegalArgumentException("Cantidad positiva y valor no negativo.");
                if(lines.stream().anyMatch(l->l.productId().equals(p.id())))throw new IllegalArgumentException("El producto ya está agregado. Quita la línea para corregirla.");
                if(note&&type.getSelectedItem().equals("Crédito")) {
                    Document d=(Document)original.getSelectedItem();
                    Line source=d.lines().stream().filter(item->item.productId().equals(p.id())).findFirst().orElseThrow();
                    if(q.compareTo(source.quantity())>0||q.multiply(v).compareTo(source.quantity().multiply(source.price()))>0) throw new IllegalArgumentException("La cantidad o el importe supera el detalle original.");
                }
                lines.add(new Line(p.id(),p.name(),q,v));
                refreshLines();
            }
            catch(IllegalArgumentException ex) {
                error(ex.getMessage());
            }
        });
        remove.addActionListener(e-> {
            int r=table.getSelectedRow();
            if(r>=0) {
                lines.remove(r);
                refreshLines();
            }
            else error("Selecciona un ítem para quitarlo.");
        });
        product.addActionListener(e->loadOriginalPrice());
        type.addActionListener(e->updateReasons());
        original.addActionListener(e->updateOriginalInfo());
        updateReasons();
        updateOriginalInfo();
        refreshLines();
    }
    private static BigDecimal decimal(String text) {
        try {
            BigDecimal d=new BigDecimal(text.trim().replace(',','.'));
            if(d.precision()>12||d.scale()>4)throw new IllegalArgumentException("Usa hasta 12 dígitos y 4 decimales.");
            return d;
        }
        catch(NumberFormatException ex) {
            throw new IllegalArgumentException("Ingresa un número válido, por ejemplo 100.00.");
        }
    }
    private void updateReasons() {
        if(!note)return;
        reason.removeAllItems();
        for(String s:type.getSelectedItem().equals("Crédito")?new String[] {
            "Descuento","Devolución parcial","Corrección del importe"
        }
        :new String[] {
            "Cargo adicional","Intereses","Corrección del importe"
        }
        )reason.addItem(s);
    }
    private void updateOriginalInfo() {
        Document d=(Document)original.getSelectedItem();
        if(!note)return;
        lines.clear();
        product.removeAllItems();
        if(d!=null) {
            for(Line line:d.lines()) product.addItem(new Master(line.productId(),line.description(),"",true));
            select(client,d.client());
            currency.setSelectedItem(d.currency());
            originalInfo.setText("Cliente: "+client.getSelectedItem()+" | "+d.currency()+" | Total original: "+AppModel.money(d.total()));
        }
        else originalInfo.setText("No hay comprobantes activos para seleccionar.");
        loadOriginalPrice();
        refreshLines();
    }
    private void loadOriginalPrice() {
        if(!note)return;
        Document d=(Document)original.getSelectedItem();
        Master item=(Master)product.getSelectedItem();
        if(d==null||item==null)return;
        d.lines().stream().filter(line->line.productId().equals(item.id())).findFirst().ifPresent(line-> {
            qty.setText(line.quantity().stripTrailingZeros().toPlainString());
            price.setText(line.price().stripTrailingZeros().toPlainString());
            price.setToolTipText("Valor original: "+line.price()+". Ingresa aquí el valor unitario del ajuste.");
        });
    }
    private BigDecimal tax(BigDecimal base) {
        Document d=(Document)original.getSelectedItem();
        return note&&d!=null&&d.base().signum()>0?base.multiply(d.tax()).divide(d.base(),2,java.math.RoundingMode.HALF_UP) :base.multiply(new BigDecimal("0.18")).setScale(2,java.math.RoundingMode.HALF_UP);
    }
    private static void field(JPanel panel,String title,JComponent widget) {
        JPanel p=new JPanel(new BorderLayout(0,6));
        JLabel l=new JLabel(title);
        l.setFont(new Font("Segoe UI",Font.PLAIN,12));
        l.setLabelFor(widget);
        p.add(l,BorderLayout.NORTH);
        p.add(widget);
        panel.add(p);
    }
    public List<Line> lines() {
        return List.copyOf(lines);
    }
    public LocalDate date() {
        try {
            return LocalDate.parse(date.getText().trim());
        }
        catch(DateTimeParseException e) {
            throw new IllegalArgumentException("La fecha debe tener formato AAAA-MM-DD y ser válida.");
        }
    }
    public void fill(Document d) {
        type.setSelectedItem(d.type());
        number.setText(d.number());
        date.setText(d.date().toString());
        select(client,d.client());
        currency.setSelectedItem(d.currency());
        lines.clear();
        lines.addAll(d.lines());
        type.setEnabled(false);
        number.setEditable(false);
        refreshLines();
        setTitle("Editar "+d);
    }
    public void fill(Note n) {
        type.setSelectedItem(n.type());
        number.setText(n.number());
        date.setText(n.date().toString());
        for(int i=0; i<original.getItemCount(); i++)if(original.getItemAt(i).key().equals(n.documentKey()))original.setSelectedIndex(i);
        reason.setSelectedItem(n.reason());
        description.setText(n.description());
        lines.clear();
        lines.addAll(n.lines());
        type.setEnabled(false);
        number.setEditable(false);
        original.setEnabled(false);
        refreshLines();
        setTitle("Editar "+n);
    }
    public static void select(JComboBox<Master> box,String id) {
        for(int i=0; i<box.getItemCount(); i++)if(box.getItemAt(i).id().equals(id)) {
            box.setSelectedIndex(i);
            return;
        }
    }
    public void refreshLines() {
        MainView.setTable(table,new String[] {
            "Código","Descripción","Cantidad","Valor unitario","Importe"
        }
        ,lines.stream().map(l->new Object[] {
            l.productId(),l.description(),l.quantity(),AppModel.money(l.price()),AppModel.money(l.amount())
        }
        ).toList());
        int[] widths= {
            90,280,100,135,135
        };
        for(int i=0; i<widths.length; i++)table.getColumnModel().getColumn(i).setPreferredWidth(widths[i]);
        BigDecimal b=lines.stream().map(Line::amount).reduce(BigDecimal.ZERO,BigDecimal::add),t=tax(b);
        totals.setText("Base: "+AppModel.money(b)+"   IGV: "+AppModel.money(t)+"   Total: "+AppModel.money(b.add(t)));
        table.revalidate();
        totals.revalidate();
    }
    public void preview() {
        if(lines.isEmpty()) {
            error("Agrega al menos un ítem para previsualizar.");
            return;
        }
        try {
            date();
        }
        catch(IllegalArgumentException error) {
            error(error.getMessage());
            return;
        }
        Document d=note?(Document)original.getSelectedItem():null;
        Master company=(Master)((MainView)getOwner()).company.getSelectedItem();
        BigDecimal base=lines.stream().map(Line::amount).reduce(BigDecimal.ZERO,BigDecimal::add);
        new DocumentPreview(this,company==null?"":company.name(),company==null?"":company.id(), (note?"Nota de ":"")+type.getSelectedItem(),number.getText(),date.getText(),String.valueOf(client.getSelectedItem()), d==null?String.valueOf(currency.getSelectedItem()):d.currency(),d==null?"":d.toString(), String.valueOf(reason.getSelectedItem()),description.getText(),lines,base,tax(base),"BORRADOR · Sin guardar").setVisible(true);
    }
    private void error(String message) {
        JOptionPane.showMessageDialog(this,message,"Revisa la información",JOptionPane.WARNING_MESSAGE);
    }
}
