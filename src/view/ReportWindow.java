package view;

import model.AppModel;
import model.AppModel.*;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;

/** Ventana no modal: se pueden abrir varios reportes sin bloquear el menú. */
public final class ReportWindow extends JFrame {
    public final JTextField from=new JTextField("2026-11-01",10),to=new JTextField("2026-11-30",10);
    public final JComboBox<Object> client=new JComboBox<>(),target=new JComboBox<>();
    public final JComboBox<String> currency=new JComboBox<>(new String[]{"Todas","PEN","USD"}),state=new JComboBox<>(new String[]{"Activos","Inactivos","Todos"});
    public final JButton query=MainView.button("Consultar",true),reset=MainView.button("Limpiar filtros",false),export=MainView.button("Exportar resultados CSV",false),previous=MainView.button("Anterior",false),next=MainView.button("Siguiente",false);
    public final JComboBox<Integer> pageSize=new JComboBox<>(new Integer[]{20,50,100});
    public final JTable table=MainView.table();
    public final JLabel status=new JLabel("Define los filtros y pulsa Consultar."),pageLabel=new JLabel("Sin resultados"),summary=new JLabel(" ");
    private final JPanel filterPanel=new JPanel(new FlowLayout(FlowLayout.LEFT,12,10));
    private final ReportSpec spec;
    public ReportWindow(String companyName,ReportSpec spec,List<Master> clients,List<?> targets){
        super(String.format("%02d · %s — %s",spec.id(),spec.title(),companyName));this.spec=spec;
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);setSize(1130,740);setMinimumSize(new Dimension(900,600));setLocationByPlatform(true);setLayout(new BorderLayout());
        JPanel root=new JPanel(new BorderLayout(0,14));root.setBorder(new EmptyBorder(22,24,20,24));root.setBackground(MainView.BG);setContentPane(root);
        JPanel header=new JPanel(new BorderLayout(0,12));header.setOpaque(false);JPanel titles=new JPanel(new GridLayout(3,1,0,5));titles.setOpaque(false);JLabel title=new JLabel(spec.title());title.setFont(new Font("Segoe UI",Font.BOLD,25));titles.add(title);titles.add(new JLabel(companyName+" · Datos ficticios · Ventana independiente"));JLabel desc=new JLabel(spec.description());desc.setForeground(MainView.MUTED);titles.add(desc);header.add(titles,BorderLayout.NORTH);
        client.addItem("Todos");clients.forEach(client::addItem);client.setPreferredSize(new Dimension(195,32));target.setPreferredSize(new Dimension(230,32));targets.forEach(target::addItem);
        filterPanel.setBackground(Color.WHITE);addField("Desde (AAAA-MM-DD)",from);addField("Hasta (AAAA-MM-DD)",to);addField("Cliente",client);addField("Moneda",currency);addField("Estado",state);
        if(!spec.documentType().isEmpty()||!spec.noteType().isEmpty())addField(spec.noteType().isEmpty()?"Comprobante":"Nota",target);
        JPanel middle=new JPanel(new BorderLayout());middle.setOpaque(false);filterPanel.setPreferredSize(new Dimension(800,(!spec.documentType().isEmpty()||!spec.noteType().isEmpty())?125:78));middle.add(filterPanel,BorderLayout.CENTER);JPanel toolbar=MainView.row();toolbar.setBorder(new EmptyBorder(12,0,0,0));toolbar.add(query);toolbar.add(reset);toolbar.add(export);export.setEnabled(false);middle.add(toolbar,BorderLayout.SOUTH);header.add(middle,BorderLayout.CENTER);header.add(status,BorderLayout.SOUTH);root.add(header,BorderLayout.NORTH);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);root.add(new JScrollPane(table));
        JPanel bottom=new JPanel(new BorderLayout(0,10));bottom.setOpaque(false);summary.setForeground(MainView.MUTED);bottom.add(summary,BorderLayout.NORTH);JPanel pages=MainView.row();pages.add(previous);pages.add(pageLabel);pages.add(next);pages.add(new JLabel("Filas por página:"));pages.add(pageSize);previous.setEnabled(false);next.setEnabled(false);bottom.add(pages,BorderLayout.CENTER);root.add(bottom,BorderLayout.SOUTH);
    }
    private void addField(String label,JComponent field){JPanel p=new JPanel(new BorderLayout(0,5));p.setOpaque(false);JLabel l=new JLabel(label);l.setFont(new Font("Segoe UI",Font.PLAIN,12));l.setLabelFor(field);p.add(l,BorderLayout.NORTH);p.add(field);filterPanel.add(p);}
    public Filter filter(){try{String clientId=client.getSelectedItem() instanceof Master m?m.id():"";Object t=target.getSelectedItem();String key=t instanceof Note n?n.key():t instanceof Document d?d.key():"";return new Filter(LocalDate.parse(from.getText().trim()),LocalDate.parse(to.getText().trim()),clientId,(String)currency.getSelectedItem(),(String)state.getSelectedItem(),key);}catch(DateTimeParseException e){throw new IllegalArgumentException("Usa fechas válidas en formato AAAA-MM-DD.");}}
    public void clearFilters(){from.setText("2026-11-01");to.setText("2026-11-30");client.setSelectedIndex(0);currency.setSelectedIndex(0);state.setSelectedIndex(0);if(target.getItemCount()>0)target.setSelectedIndex(0);}
    public void setBusy(boolean busy){query.setEnabled(!busy);reset.setEnabled(!busy);from.setEnabled(!busy);to.setEnabled(!busy);client.setEnabled(!busy);currency.setEnabled(!busy);state.setEnabled(!busy);target.setEnabled(!busy);pageSize.setEnabled(!busy);if(busy){export.setEnabled(false);previous.setEnabled(false);next.setEnabled(false);status.setText("Consultando…");}}
    public void display(ReportData data,int page,int size){MainView.setTable(table,data.columns(),AppModel.page(data,page,size));for(int c=0;c<table.getColumnCount();c++)table.getColumnModel().getColumn(c).setPreferredWidth(data.columns()[c].contains("Cliente")||data.columns()[c].contains("Descripción")?210:145);int pages=Math.max(1,(data.rows().size()+size-1)/size);pageLabel.setText("Página "+(page+1)+" de "+pages);previous.setEnabled(page>0);next.setEnabled(page+1<pages);export.setEnabled(!data.rows().isEmpty());status.setText(data.rows().isEmpty()?"No se encontraron registros con estos filtros.":data.rows().size()+" resultados · exportación del conjunto completo filtrado");summary.setText("Demo: paginación en memoria. La integración JDBC paginará en PostgreSQL.");}
}
