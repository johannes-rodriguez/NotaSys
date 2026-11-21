import model.*;
import model.AppModel.*;
import java.nio.file.Path;
import java.time.LocalDate;
import java.math.BigDecimal;
import java.util.List;
/** Runs only against the isolated PostgreSQL test cluster, never the user's server. */
public final class IntegrationTest {
    private static int checks;
    private static void check(boolean value, String message) {
        checks++;
        if (!value) throw new AssertionError(message);
    }
    public static void main(String[] args) {
        SqlGateway gateway = new PsqlGateway(Path.of(args[0]), "127.0.0.1", "55439", "postgres", "notasys_admin", new char[0]);
        PostgresRepository repository = new PostgresRepository(gateway);
        AppModel model = new AppModel(repository, repository);
        String company = "20999999991";
        check(model.documents(company).size() >= 180, "Cargar datos reales del servidor");
        Filter filter = new Filter(LocalDate.of(2026,1,1), LocalDate.of(2026,11,19), "", "Todas", "Todos", "", "Crédito");
        ReportData first = model.reportPage(company, AppModel.REPORTS.get(0), filter, 0, 20);
        ReportData second = model.reportPage(company, AppModel.REPORTS.get(0), filter, 1, 20);
        check(first.rows().size() == 20 && first.totalRows() > 20, "Paginación y recuento");
        check(!first.rows().get(0)[0].equals(second.rows().get(0)[0]), "Segunda página independiente");
        check(first.rows().stream().allMatch(row -> row[1].equals("Crédito")), "Selector de crédito");
        check(model.report(company,AppModel.REPORTS.get(0),filter).rows().size() == first.totalRows(), "Exportación completa");
        Master client = new Master("80808080", "O'Brien & Asociados <Oficina>", "", true);
        model.saveMaster("Clientes", client, null, company);
        PostgresRepository otherRepository = new PostgresRepository(gateway);
        AppModel other = new AppModel(otherRepository, otherRepository);
        check(other.name("Clientes",client.id()).equals(client.name()), "Persistencia y escape SQL/XML");
        Master changed = new Master(client.id(), "O'Brien Consultores", "", true);
        model.saveMaster("Clientes", changed, client, company);
        boolean conflict = false;
        try {
            other.saveMaster("Clientes", new Master(client.id(),"Versión anterior","",true),client,company);
        }
        catch (IllegalArgumentException expected) {
            conflict = true;
        }
        check(conflict, "Conflicto de edición entre dos clientes");
        other.reload();
        check(other.name("Clientes",client.id()).equals(changed.name()), "Recuperación después de conflicto");
        Document invoice = new Document(company,"Factura","E998-00000001",LocalDate.now(),"20999999981","PEN", List.of(new Line("S001","Asesoría mensual",new BigDecimal("2"),new BigDecimal("100"))),true);
        model.saveDocument(invoice,null);
        Note note = new Note(company,"Crédito","FC98-00000001",LocalDate.now(),invoice.key(),"Descuento","Ajuste acordado", List.of(new Line("S001","Asesoría mensual",BigDecimal.ONE,new BigDecimal("20"))),true);
        model.saveNote(note,null);
        other.reload();
        Note stored = other.notes(company).stream().filter(item -> item.key().equals(note.key())).findFirst().orElseThrow();
        check(stored.total().compareTo(new BigDecimal("23.60")) == 0, "Nota y total persistidos");
        boolean rejected = false;
        Note bad = new Note(company,"Crédito","FC98-00000002",LocalDate.now(),invoice.key(),"Descuento","Artículo ajeno", List.of(new Line("S002","Otro servicio",BigDecimal.ONE,BigDecimal.ONE)),true);
        try {
            gateway.execute("BEGIN; CALL notasys.ns_documento("+SqlGateway.literal(Json.encode(bad))+"::jsonb,0,'Prueba'); COMMIT;");
        }
        catch (IllegalArgumentException expected) {
            rejected = true;
        }
        check(rejected, "Restricción en PostgreSQL al omitir la interfaz");
        other.deactivateNote(stored,"Revisión final");
        model.reload();
        check(model.notes(company).stream().anyMatch(item -> item.key().equals(note.key()) && !item.active()), "Borrado lógico persistente");
        check(model.audits(company).stream().anyMatch(item -> item.detail().contains("Revisión final")), "Motivo en auditoría");
        System.out.println(checks + " comprobaciones de integración real Java/psql/PostgreSQL correctas.");
    }
}
