import model.*;
import model.AppModel.*;
import model.DataRepository.Snapshot;
import java.math.BigDecimal;
import java.nio.file.*;
import java.time.LocalDate;
import java.util.*;
public final class ModelTest {
    static int checks;
    static final String COMPANY="20999999991";
    static final class MemoryRepository implements DataRepository {
        Snapshot state;
        boolean fail;
        MemoryRepository(Snapshot state) {
            this.state=state;
        }
        public Snapshot load() {
            return state;
        }
        public void save(Snapshot before,Snapshot after) {
            if(fail)throw new IllegalArgumentException("Fallo de persistencia");
            state=after;
        }
    }
    static void check(boolean condition,String message) {
        checks++;
        if(!condition)throw new AssertionError(message);
    }
    static void reject(Runnable action,String message) {
        boolean rejected=false;
        try {
            action.run();
        }
        catch(IllegalArgumentException error) {
            rejected=true;
        }
        check(rejected,message);
    }
    public static Snapshot fixture() throws Exception {
        String xml=Files.readString(Path.of(System.getProperty("notasys.root","."),"tests/fixture.xml"));
        return new PostgresRepository(sql->xml).load();
    }
    public static void main(String[] args)throws Exception {
        Snapshot data=fixture();
        check(data.documents().size()==360,"Carga de 360 comprobantes PostgreSQL");
        check(data.notes().size()==384,"Carga de 384 notas PostgreSQL");
        check(data.masters().get("Clientes").size()==32,"32 clientes");
        check(data.masters().get("Productos y servicios").size()==20,"20 servicios");
        check(!data.audits().isEmpty(),"Historial persistente generado por triggers");
        MemoryRepository store=new MemoryRepository(data);
        AppModel model=new AppModel(store,(c,r,f)->new ReportData(new String[] {
            "Prueba"
        }
        ,List.of()));
        Document doc=new Document(COMPANY,"Factura","E999-00000001",LocalDate.of(2026,1,10),"20999999981","PEN", List.of(new Line("S001","Asesoría",new BigDecimal("2"),new BigDecimal("100")),new Line("S002","Revisión",BigDecimal.ONE,new BigDecimal("200"))),true);
        model.saveDocument(doc,null);
        check(model.document(doc.key()).total().compareTo(new BigDecimal("472"))==0,"Total y redondeo");
        reject(()->model.saveDocument(doc,null),"Duplicado");
        Note valid=note(doc,"FC99-00000001","S001","1","25","Descuento");
        model.saveNote(valid,null);
        check(model.notes(COMPANY).stream().anyMatch(n->n.key().equals(valid.key())),"Guardar nota");
        reject(()->model.saveNote(note(doc,"FC99-00000002","S003","1","5","Descuento"),null),"Artículo ajeno");
        reject(()->model.saveNote(note(doc,"FC99-00000002","S001","1","190","Descuento"),null),"Límite por artículo, aunque el total de factura sea mayor");
        reject(()->model.saveNote(note(doc,"FC99-00000002","S001","3","1","Descuento"),null),"Cantidad original");
        reject(()->model.saveNote(note(doc,"FC99-00000002","S001","0","1","Descuento"),null),"Cantidad cero");
        reject(()->model.saveNote(note(doc,"FC99-00000002","S001","1","-1","Descuento"),null),"Precio negativo");
        reject(()->model.saveNote(note(doc,"FC99-00000002","S001","1","1.00001","Descuento"),null),"Escala de PostgreSQL");
        reject(()->model.saveDocument(doc,doc),"Comprobante con notas bloqueado");
        reject(()->model.deactivateDocument(doc,"Cierre"),"No desactivar con notas activas");
        Note first=note(doc,"FC99-00000002","S001","1","1","Devolución parcial");
        model.saveNote(first,null);
        model.saveNote(note(doc,"FC99-00000003","S001","1","1","Devolución parcial"),null);
        reject(()->model.saveNote(note(doc,"FC99-00000004","S001","1","1","Devolución parcial"),null),"Devoluciones acumuladas");
        Master master=new Master("80000001","Cliente nuevo","",true);
        store.fail=true;
        reject(()->model.saveMaster("Clientes",master,null,COMPANY),"Fallo persistencia");
        check(model.masters("Clientes").stream().noneMatch(m->m.id().equals(master.id())),"Rollback del estado en memoria");
        store.fail=false;
        model.saveMaster("Clientes",master,null,COMPANY);
        check(new AppModel(store,(c,r,f)->null).masters("Clientes").contains(master),"Recarga conserva cambios");
        check(AppModel.REPORTS.size()==15,"18 consultas en 15 opciones");
        check(SqlGateway.literal("O'Brien").equals("'O''Brien'"),"Escape SQL");
        check(Json.encode("A\n\"B\\C").equals("\"A\\n\\\"B\\\\C\""),"Escape JSON");
        String csv=AppModel.csv(new ReportData(new String[] {
            "Nombre"
        }
        ,Collections.singletonList(new Object[] {
            "=cmd|' /C calc'!A0"
        }
        )));
        check(csv.contains("'=cmd"),"Fórmulas CSV neutralizadas");
        check(AppModel.page(new ReportData(new String[] {
            "A"
        }
        ,Collections.singletonList(new Object[] {
            1
        }
        )),1,20).isEmpty(),"Página final");
        Document historical=new Document(COMPANY,"Factura","E997-00000001",LocalDate.now(),"20999999981","PEN",doc.lines(),true,new BigDecimal("400"),new BigDecimal("40"));
        check(historical.tax().compareTo(new BigDecimal("40"))==0,"IGV histórico preservado");
        System.out.println(checks+" comprobaciones del modelo y adaptador correctas.");
    }
    static Note note(Document doc,String number,String product,String quantity,String price,String reason) {
        return new Note(COMPANY,"Crédito",number,doc.date().plusDays(1),doc.key(),reason,"Ajuste acordado del servicio", List.of(new Line(product,"Servicio",new BigDecimal(quantity),new BigDecimal(price))),true);
    }
}
