package controller;
import model.AppModel;
import model.AppModel.*;
import view.*;
import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import java.awt.*;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.List;
import java.util.*;
import java.util.concurrent.ExecutionException;
/** Controlador: escucha la vista, valida entradas y coordina las operaciones del modelo. */
public final class AppController {
    private final AppModel model;
    private final MainView view;
    private final Map<String,List<Master>> masterRows=new HashMap<>();
    private List<Document> docRows=List.of();
    private List<Note> noteRows=List.of();
    private List<Audit> auditRows=List.of();
    private final List<ReportWindow> reports=new ArrayList<>();
    private boolean refreshing=false;
    public AppController(AppModel model,MainView view) {
        this.model=model;
        this.view=view;
        bind();
        refresh();
    }
    public void start() {
        view.setVisible(true);
    }
    private String company() {
        Master m=(Master)view.company.getSelectedItem();
        return m==null?"20000000001":m.id();
    }
    private void bind() {
        view.reload.addActionListener(e->runTask(view,view.reload,model::reload,this::refresh));
        view.company.addActionListener(e-> {
            if(!refreshing)refreshTables();
        });
        view.catalogGrids.forEach((catalog,g)-> {
            observe(g.search,this::refreshTables);
            g.state.addActionListener(e->refreshTables());
            g.add.addActionListener(e->masterForm(catalog,null));
            g.edit.addActionListener(e-> {
                Master m=selectedMaster(catalog);
                if(m!=null)masterForm(catalog,m);
            });
            g.view.addActionListener(e-> {
                Master m=selectedMaster(catalog);
                if(m!=null)info(catalog,m.id()+"\n"+m.name()+"\n"+m.extra()+"\nEstado: "+(m.active()?"Activo":"Inactivo"));
            });
            g.deactivate.addActionListener(e-> {
                Master m=selectedMaster(catalog);
                if(m!=null)deactivate(m.name(),reason->model.deactivateMaster(catalog,m,reason,company()));
            });
        });
        observe(view.documents.search,this::refreshTables);
        observe(view.notes.search,this::refreshTables);
        view.documents.state.addActionListener(e->refreshTables());
        view.notes.state.addActionListener(e->refreshTables());
        view.documentType.addActionListener(e->refreshTables());
        view.noteType.addActionListener(e->refreshTables());
        view.documents.add.addActionListener(e->documentForm(null));
        view.documents.edit.addActionListener(e-> {
            Document d=selectedDocument();
            if(d!=null)documentForm(d);
        });
        view.documents.view.addActionListener(e-> {
            Document d=selectedDocument();
            if(d!=null)showDocument(d);
        });
        view.documents.deactivate.addActionListener(e-> {
            Document d=selectedDocument();
            if(d!=null)deactivate(d.toString(),r->model.deactivateDocument(d,r));
        });
        view.createNote.addActionListener(e-> {
            Document d=selectedDocument();
            if(d!=null)noteForm(null,d);
        });
        view.notes.add.addActionListener(e->noteForm(null,null));
        view.notes.edit.addActionListener(e-> {
            Note n=selectedNote();
            if(n!=null)noteForm(n,model.document(n.documentKey()));
        });
        view.notes.view.addActionListener(e-> {
            Note n=selectedNote();
            if(n!=null)showNote(n);
        });
        view.notes.deactivate.addActionListener(e-> {
            Note n=selectedNote();
            if(n!=null)deactivate(n.toString(),r->model.deactivateNote(n,r));
        });
        view.reportRequested=id->openReport(id,null);
        view.documentHistory.addActionListener(e-> {
            Document d=(Document)view.historyDocument.getSelectedItem();
            if(d!=null)openReport(d.type().equals("Factura")?3:4,d.key());
            else warning("No hay comprobantes para consultar.");
        });
        view.auditDetail.addActionListener(e-> {
            int i=view.auditTable.getSelectedRow();
            if(i<0)warning("Selecciona un cambio.");
            else {
                Audit a=auditRows.get(i);
                info("Detalle del cambio",a.time()+"\n"+a.action()+" · "+a.record()+"\n\n"+a.detail());
            }
        });
        view.addWindowListener(new WindowAdapter() {
            @Override public void windowClosing(WindowEvent e) {
                if(JOptionPane.showConfirmDialog(view,"¿Cerrar NotaSys? Los cambios guardados permanecen en PostgreSQL.","Cerrar NotaSys",JOptionPane.YES_NO_OPTION)==JOptionPane.YES_OPTION) {
                    List.copyOf(reports).forEach(Window::dispose);
                    view.dispose();
                }
            }
        });
    }
    private static void observe(JTextField field,Runnable action) {
        field.getDocument().addDocumentListener(new DocumentListener() {
            public void insertUpdate(DocumentEvent e) {
                action.run();
            }
            public void removeUpdate(DocumentEvent e) {
                action.run();
            }
            public void changedUpdate(DocumentEvent e) {
                action.run();
            }
        });
    }
    public void refresh() {
        String keep=company();
        refreshing=true;
        view.company.removeAllItems();
        model.masters("Emisores").stream().filter(Master::active).forEach(view.company::addItem);
        DocumentDialog.select(view.company,keep);
        refreshing=false;
        refreshTables();
    }
    private static boolean search(String query,String text) {
        return text.toLowerCase(Locale.ROOT).contains(query.trim().toLowerCase(Locale.ROOT));
    }
    private void refreshTables() {
        if(refreshing)return;
        String co=company();
        view.catalogGrids.forEach((catalog,g)-> {
            List<Master> rows=model.masters(catalog).stream().filter(m->AppModel.matchesState(m.active(),(String)g.state.getSelectedItem())&&search(g.search.getText(),m.id()+" "+m.name()+" "+m.extra())).toList();
            masterRows.put(catalog,rows);
            MainView.setTable(g.table,new String[] {
                "Código / documento","Nombre o descripción","Unidad","Estado"
            }
            ,rows.stream().map(m->new Object[] {
                m.id(),m.name(),m.extra(),m.active()?"Activo":"Inactivo"
            }
            ).toList());
            g.count.setText(rows.size()+" registros");
        });
        docRows=model.documents(co).stream().filter(d->AppModel.matchesState(d.active(),(String)view.documents.state.getSelectedItem())&&(view.documentType.getSelectedItem().equals("Todos")||d.type().equals(view.documentType.getSelectedItem()))&&search(view.documents.search.getText(),d.number()+" "+d.client()+" "+model.name("Clientes",d.client()))).toList();
        MainView.setTable(view.documents.table,new String[] {
            "Tipo","Documento","Fecha","Cliente","Moneda","Total","Estado"
        }
        ,docRows.stream().map(d->new Object[] {
            d.type(),d.number(),d.date(),model.name("Clientes",d.client()),d.currency(),AppModel.money(d.total()),d.active()?"Activo":"Inactivo"
        }
        ).toList());
        view.documents.count.setText(docRows.size()+" registros");
        noteRows=model.notes(co).stream().filter(n->AppModel.matchesState(n.active(),(String)view.notes.state.getSelectedItem())&&(view.noteType.getSelectedItem().equals("Todos")||n.type().equals(view.noteType.getSelectedItem()))&&search(view.notes.search.getText(),n.number()+" "+model.document(n.documentKey()).number()+" "+model.name("Clientes",model.document(n.documentKey()).client()))).toList();
        MainView.setTable(view.notes.table,new String[] {
            "Tipo","Nota","Fecha","Comprobante","Moneda","Total","Estado"
        }
        ,noteRows.stream().map(n-> {
            Document d=model.document(n.documentKey());
            return new Object[] {
                n.type(),n.number(),n.date(),d.number(),d.currency(),AppModel.money(n.total()),n.active()?"Activo":"Inactivo"
            };
        }
        ).toList());
        view.notes.count.setText(noteRows.size()+" registros");
        Document keep=(Document)view.historyDocument.getSelectedItem();
        view.historyDocument.removeAllItems();
        model.documents(co).forEach(view.historyDocument::addItem);
        if(keep!=null)for(int i=0; i<view.historyDocument.getItemCount(); i++)if(view.historyDocument.getItemAt(i).key().equals(keep.key()))view.historyDocument.setSelectedIndex(i);
        auditRows=model.audits(co);
        MainView.setTable(view.auditTable,new String[] {
            "Fecha y hora","Acción","Registro","Detalle"
        }
        ,auditRows.stream().map(a->new Object[] {
            a.time().withNano(0),a.action(),a.record(),a.detail()
        }
        ).toList());
    }
    private Master selectedMaster(String catalog) {
        int row=view.catalogGrids.get(catalog).table.getSelectedRow();
        if(row<0) {
            warning("Selecciona un registro.");
            return null;
        }
        return masterRows.get(catalog).get(row);
    }
    private Document selectedDocument() {
        int row=view.documents.table.getSelectedRow();
        if(row<0) {
            warning("Selecciona un comprobante.");
            return null;
        }
        return docRows.get(row);
    }
    private Note selectedNote() {
        int row=view.notes.table.getSelectedRow();
        if(row<0) {
            warning("Selecciona una nota.");
            return null;
        }
        return noteRows.get(row);
    }
    private void masterForm(String catalog,Master old) {
        if(old!=null&&!old.active()) {
            warning("El registro está inactivo. Puedes consultarlo, pero no editarlo.");
            return;
        }
        JTextField id=new JTextField(old==null?"":old.id()),name=new JTextField(old==null?"":old.name()),unit=new JTextField(old==null?"SERVICIO":old.extra());
        id.setEditable(old==null);
        JPanel form=new JPanel(new GridLayout(0,1,8,6));
        form.setPreferredSize(new Dimension(430,catalog.equals("Productos y servicios")?240:170));
        form.add(new JLabel(catalog.equals("Emisores")?"RUC (11 dígitos)":catalog.equals("Clientes")?"Documento (DNI 8 / RUC 11)":"Código"));
        form.add(id);
        form.add(new JLabel("Nombre o descripción"));
        form.add(name);
        if(catalog.equals("Productos y servicios")) {
            form.add(new JLabel("Unidad de medida"));
            form.add(unit);
        }
        while(JOptionPane.showConfirmDialog(view,form,(old==null?"Nuevo · ":"Editar · ")+catalog,JOptionPane.OK_CANCEL_OPTION,JOptionPane.PLAIN_MESSAGE)==JOptionPane.OK_OPTION) {
            try {
                model.saveMaster(catalog,new Master(id.getText(),name.getText(),catalog.equals("Productos y servicios")?unit.getText():"",true),old,company());
                refresh();
                return;
            }
            catch(IllegalArgumentException ex) {
                warning(ex.getMessage());
            }
        }
    }
    private void documentForm(Document old) {
        if(old!=null&&!old.active()) {
            warning("El comprobante está inactivo.");
            return;
        }
        DocumentDialog dialog=new DocumentDialog(view,false,active("Clientes"),active("Productos y servicios"),List.of());
        if(old!=null)dialog.fill(old);
        else {
            dialog.number.setText(model.nextNumber(company(),"Factura",false));
            dialog.type.addActionListener(e->dialog.number.setText(model.nextNumber(company(),(String)dialog.type.getSelectedItem(),false)));
        }
        String co=company();
        dialog.save.addActionListener(e-> {
            try {
                Master c=(Master)dialog.client.getSelectedItem();
                if(c==null)throw new IllegalArgumentException("Registra un cliente activo primero.");
                Document d=new Document(co,(String)dialog.type.getSelectedItem(),dialog.number.getText().trim().toUpperCase(Locale.ROOT),dialog.date(),c.id(),(String)dialog.currency.getSelectedItem(),dialog.lines(),true);
                runTask(dialog,dialog.save,()->model.saveDocument(d,old),()-> {
                    dialog.dispose();
                    refreshTables();
                });
            }
            catch(IllegalArgumentException ex) {
                JOptionPane.showMessageDialog(dialog,ex.getMessage(),"Revisa los datos",JOptionPane.WARNING_MESSAGE);
            }
        });
        dialog.setVisible(true);
    }
    private List<Master> active(String catalog) {
        return model.masters(catalog).stream().filter(Master::active).toList();
    }
    private void noteForm(Note old,Document original) {
        if(old!=null&&!old.active()) {
            warning("La nota está inactiva.");
            return;
        }
        if(original!=null&&!original.active()) {
            warning("Selecciona un comprobante activo.");
            return;
        }
        List<Document> docs=model.documents(company()).stream().filter(Document::active).toList();
        if(docs.isEmpty()) {
            warning("Primero registra un comprobante activo.");
            return;
        }
        DocumentDialog dialog=new DocumentDialog(view,true,active("Clientes"),active("Productos y servicios"),docs);
        if(old!=null)dialog.fill(old);
        else {
            if(original!=null)dialog.original.setSelectedItem(original);
            dialog.number.setText(model.nextNumber(company(),"Crédito",true));
            dialog.type.addActionListener(e->dialog.number.setText(model.nextNumber(company(),(String)dialog.type.getSelectedItem(),true)));
        }
        String co=company();
        dialog.save.addActionListener(e-> {
            try {
                Document d=(Document)dialog.original.getSelectedItem();
                if(d==null)throw new IllegalArgumentException("Selecciona el comprobante relacionado.");
                Note n=new Note(co,(String)dialog.type.getSelectedItem(),dialog.number.getText().trim().toUpperCase(Locale.ROOT),dialog.date(),d.key(),String.valueOf(dialog.reason.getSelectedItem()),dialog.description.getText().trim(),dialog.lines(),true);
                runTask(dialog,dialog.save,()->model.saveNote(n,old),()-> {
                    dialog.dispose();
                    refreshTables();
                });
            }
            catch(IllegalArgumentException ex) {
                JOptionPane.showMessageDialog(dialog,ex.getMessage(),"Revisa los datos",JOptionPane.WARNING_MESSAGE);
            }
        });
        dialog.setVisible(true);
    }
    private void deactivate(String name,java.util.function.Consumer<String> operation) {
        JTextArea reason=new JTextArea(3,34);
        reason.setLineWrap(true);
        JPanel panel=new JPanel(new BorderLayout(0,12));
        panel.add(new JLabel("<html>Desactivar <b>"+html(name)+"</b><br>Se conservarán sus datos y vínculos.<br>Esta acción no tramita una anulación ante SUNAT.<br><br>Motivo obligatorio:</html>"),BorderLayout.NORTH);
        panel.add(new JScrollPane(reason));
        while(JOptionPane.showConfirmDialog(view,panel,"Confirmar desactivación",JOptionPane.OK_CANCEL_OPTION,JOptionPane.WARNING_MESSAGE)==JOptionPane.OK_OPTION) {
            try {
                operation.accept(reason.getText().trim());
                refresh();
                return;
            }
            catch(IllegalArgumentException ex) {
                warning(ex.getMessage());
            }
        }
    }
    private static String html(String s) {
        return s.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;");
    }
    private void showDocument(Document d) {
        new DocumentPreview(view,model.name("Emisores",d.company()),d.company(),d.type(),d.number(),d.date().toString(), model.name("Clientes",d.client())+" · "+d.client(),d.currency(),"","","",d.lines(),d.base(),d.tax(),d.active()?"REGISTRADO":"INACTIVO").setVisible(true);
    }
    private void showNote(Note n) {
        Document d=model.document(n.documentKey());
        new DocumentPreview(view,model.name("Emisores",n.company()),n.company(),"Nota de "+n.type(),n.number(),n.date().toString(), model.name("Clientes",d.client())+" · "+d.client(),d.currency(),d.toString(),n.reason(),n.description(),n.lines(),n.base(),n.tax(),n.active()?"REGISTRADO":"INACTIVO").setVisible(true);
    }
    public ReportWindow openReport(int id,String target) {
        String co=company();
        ReportSpec spec=AppModel.REPORTS.get(id-1);
        List<?> targets=!spec.noteType().isEmpty()?model.notes(co).stream().filter(n->spec.noteType().equals("*")||n.type().equals(spec.noteType())).toList():!spec.documentType().isEmpty()?model.documents(co).stream().filter(d->d.type().equals(spec.documentType())).toList():List.of();
        ReportWindow window=new ReportWindow(model.name("Emisores",co),spec,model.masters("Clientes"),targets);
        if(target!=null)for(int i=0; i<window.target.getItemCount(); i++) {
            Object t=window.target.getItemAt(i);
            if(t instanceof Document d&&d.key().equals(target))window.target.setSelectedIndex(i);
        }
        reports.add(window);
        ReportSession session=new ReportSession(window,co,spec);
        window.addWindowListener(new WindowAdapter() {
            @Override public void windowClosed(WindowEvent e) {
                reports.remove(window);
                session.cancel();
            }
        });
        window.setVisible(true);
        return window;
    }
    private final class ReportSession {
        final ReportWindow window;
        final String company;
        final ReportSpec spec;
        ReportData data;
        int page;
        SwingWorker<ReportData,Void> worker;
        ReportSession(ReportWindow w,String co,ReportSpec s) {
            window=w;
            company=co;
            spec=s;
            w.query.addActionListener(e->query());
            w.reset.addActionListener(e-> {
                w.clearFilters();
                clear();
            });
            w.previous.addActionListener(e->query(page-1));
            w.next.addActionListener(e->query(page+1));
            w.pageSize.addActionListener(e-> {
                if(data!=null)query(0);
            });
            w.export.addActionListener(e->export());
            observe(w.from,this::clear);
            observe(w.to,this::clear);
            w.client.addActionListener(e->clear());
            w.currency.addActionListener(e->clear());
            w.state.addActionListener(e->clear());
            w.target.addActionListener(e->clear());
            w.noteType.addActionListener(e->clear());
        }
        void clear() {
            data=null;
            page=0;
            MainView.setTable(window.table,new String[] {
                "Resultados"
            }
            ,List.of());
            window.previous.setEnabled(false);
            window.next.setEnabled(false);
            window.export.setEnabled(false);
            window.pageLabel.setText("Sin resultados");
            window.status.setText("Filtros modificados. Pulsa Consultar.");
            window.summary.setText(" ");
        }
        void query() {
            query(0);
        }
        void query(int requestedPage) {
            final Filter f;
            try {
                f=window.filter();
            }
            catch(IllegalArgumentException ex) {
                JOptionPane.showMessageDialog(window,ex.getMessage(),"Revisa los filtros",JOptionPane.WARNING_MESSAGE);
                return;
            }
            window.setBusy(true);
            worker=new SwingWorker<>() {
                protected ReportData doInBackground() {
                    return model.reportPage(company,spec,f,requestedPage,(Integer)window.pageSize.getSelectedItem());
                }
                protected void done() {
                    if(!window.isDisplayable()||isCancelled())return;
                    window.setBusy(false);
                    try {
                        data=get();
                        page=requestedPage;
                        display();
                    }
                    catch(InterruptedException ex) {
                        Thread.currentThread().interrupt();
                        clear();
                    }
                    catch(ExecutionException ex) {
                        clear();
                        window.status.setText("No se pudo consultar: "+ex.getCause().getMessage());
                    }
                }
            };
            worker.execute();
        }
        void display() {
            if(data!=null)window.display(data,page,(Integer)window.pageSize.getSelectedItem());
        }
        void cancel() {
            if(worker!=null)worker.cancel(true);
        }
        void export() {
            if(data==null)return;
            JFileChooser chooser=new JFileChooser();
            chooser.setDialogTitle("Exportar todos los resultados filtrados");
            chooser.setSelectedFile(new java.io.File("reporte-"+spec.id()+".csv"));
            if(chooser.showSaveDialog(window)!=JFileChooser.APPROVE_OPTION)return;
            Path path=chooser.getSelectedFile().toPath();
            if(!path.getFileName().toString().toLowerCase(Locale.ROOT).endsWith(".csv"))path=path.resolveSibling(path.getFileName()+".csv");
            if(Files.exists(path)&&JOptionPane.showConfirmDialog(window,"El archivo ya existe. ¿Reemplazarlo?","Exportar CSV",JOptionPane.YES_NO_OPTION)!=JOptionPane.YES_OPTION)return;
            final Path dest=path;
            final Filter exportFilter=window.filter();
            window.export.setEnabled(false);
            new SwingWorker<Integer,Void>() {
                protected Integer doInBackground()throws Exception {
                    ReportData snapshot=model.report(company,spec,exportFilter);
                    Files.writeString(dest,AppModel.csv(snapshot),StandardCharsets.UTF_8);
                    return snapshot.rows().size();
                }
                protected void done() {
                    if(!window.isDisplayable())return;
                    window.export.setEnabled(data!=null&&!data.rows().isEmpty());
                    try {
                        int count=get();
                        JOptionPane.showMessageDialog(window,"CSV exportado: "+count+" filas.","Exportación",JOptionPane.INFORMATION_MESSAGE);
                    }
                    catch(Exception ex) {
                        JOptionPane.showMessageDialog(window,"No se pudo escribir el archivo. Revisa la carpeta y los permisos.","Exportación",JOptionPane.ERROR_MESSAGE);
                    }
                }
            }
            .execute();
        }
    }
    private void runTask(Component owner,JButton button,Runnable task,Runnable success) {
        button.setEnabled(false);
        String label=button.getText();
        button.setText("Procesando...");
        new SwingWorker<Void,Void>() {
            protected Void doInBackground() {
                task.run();
                return null;
            }
            protected void done() {
                button.setEnabled(true);
                button.setText(label);
                try {
                    get();
                    success.run();
                }
                catch(Exception error) {
                    Throwable cause=error.getCause()==null?error:error.getCause();
                    JOptionPane.showMessageDialog(owner,cause.getMessage(),"Revisa la operación",JOptionPane.WARNING_MESSAGE);
                }
            }
        }
        .execute();
    }
    private void info(String title,String text) {
        JTextArea a=MainView.readOnlyText(text);
        JScrollPane scroll=new JScrollPane(a);
        scroll.setPreferredSize(new Dimension(600,400));
        JOptionPane.showMessageDialog(view,scroll,title,JOptionPane.PLAIN_MESSAGE);
    }
    private void warning(String text) {
        JOptionPane.showMessageDialog(view,text,"Revisa la información",JOptionPane.WARNING_MESSAGE);
    }
}
