package model;
import model.AppModel.*;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.ByteArrayInputStream;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.time.*;
import java.util.*;
import static model.SqlGateway.literal;
/** PostgreSQL mapping for the eleven original tables and the audit extension. */
public final class PostgresRepository implements DataRepository, ReportProvider {
    private final SqlGateway gateway;
    private final Map<String, Long> versions = new HashMap<>();
    public PostgresRepository(SqlGateway gateway) {
        this.gateway = gateway;
    }
    @Override
    public synchronized Snapshot load() {
        Element root = xml(gateway.execute("CALL notasys.ns_leer(NULL);"));
        Map<String, List<Map<String, String>>> tables = new HashMap<>();
        for (Element set : children(root)) tables.put(set.getAttribute("tabla"), rows(set));
        Map<String, List<Master>> masters = new LinkedHashMap<>();
        versions.clear();
        String[][] catalogs = {
            {
                "Emisores", "emisor", "ruc_emisor", "razon_social_emisor"
            }
            , {
                "Clientes", "cliente", "documento_cliente", "razon_social_cliente"
            }
            , {
                "Productos y servicios", "producto", "codigo_producto", "descripcion"
            }
        };
        for (String[] mapping : catalogs) {
            List<Master> values = new ArrayList<>();
            for (Map<String, String> row : tables.getOrDefault(mapping[1], List.of())) {
                Master value = new Master(row.get(mapping[2]), row.get(mapping[3]), row.getOrDefault("unidad_medida", ""), active(row));
                values.add(value);
                versions.put(mapping[0] + "/" + value.id(), Long.parseLong(row.get("version")));
            }
            masters.put(mapping[0], values);
        }
        List<Document> documents = new ArrayList<>();
        List<Note> notes = new ArrayList<>();
        for (String table : List.of("factura", "boleta", "nota_credito", "nota_debito")) {
            String type = switch (table) {
                case "factura" -> "Factura";
                case "boleta" -> "Boleta";
                case "nota_credito" -> "Crédito";
                default -> "Débito";
            };
            for (Map<String, String> row : tables.getOrDefault(table, List.of())) {
                String company = row.get("ruc_emisor"), number = row.get("serie") + "-" + row.get("correlativo");
                List<Line> lines = tables.getOrDefault("detalle_" + table, List.of()).stream() .filter(detail -> detail.get("ruc_emisor").equals(company) && detail.get("serie").equals(row.get("serie")) && detail.get("correlativo").equals(row.get("correlativo"))) .map(detail -> new Line(detail.get("codigo_producto"), detail.get("descripcion_historica"), decimal(detail,"cantidad"), decimal(detail,"valor_unitario"))).toList();
                String key = company + "/" + type + "/" + number;
                versions.put(key, Long.parseLong(row.get("version")));
                LocalDate date = LocalDate.parse(row.get("fecha_emision"));
                if (table.startsWith("nota_")) {
                    boolean invoice = !row.getOrDefault("serie_factura", "").isEmpty();
                    String original = company + "/" + (invoice ? "Factura" : "Boleta") + "/" + row.get(invoice ? "serie_factura" : "serie_boleta") + "-" + row.get(invoice ? "correlativo_factura" : "correlativo_boleta");
                    notes.add(new Note(company,type,number,date,original,row.get("motivo"),row.get("descripcion_ajuste"),lines,active(row),decimal(row,"valor_venta"),decimal(row,"igv")));
                }
                else {
                    documents.add(new Document(company,type,number,date,row.getOrDefault("documento_cliente", ""),row.get("tipo_moneda"),lines,active(row),decimal(row,"valor_venta"),decimal(row,"igv")));
                }
            }
        }
        List<Audit> audits = tables.getOrDefault("historial_cambios", List.of()).stream().map(row -> new Audit( row.getOrDefault("empresa", ""), LocalDateTime.parse(row.get("fecha")), row.get("accion"), row.get("tabla") + " " + row.get("clave"), "Usuario: " + row.get("usuario") + "\nMotivo: " + row.get("motivo") + "\nAntes: " + row.get("anterior") + "\nDespués: " + row.get("nuevo"))).toList();
        return new Snapshot(masters,documents,notes,audits);
    }
    @Override
    public synchronized void save(Snapshot before, Snapshot after) {
        Audit audit = after.audits().get(after.audits().size()-1);
        List<String> commands = new ArrayList<>();
        for (String catalog : after.masters().keySet()) {
            for (Master item : after.masters().get(catalog)) {
                if (before.masters().get(catalog).contains(item)) continue;
                commands.add("CALL notasys.ns_catalogo(" + literal(catalog) + "," + literal(Json.encode(item)) + "::jsonb," + versions.getOrDefault(catalog+"/"+item.id(),0L) + "," + literal(audit.company()) + "," + literal(audit.detail()) + ");");
            }
        }
        for (Document item : after.documents()) if (!before.documents().contains(item)) commands.add(command(item,item.key(),audit.detail()));
        for (Note item : after.notes()) if (!before.notes().contains(item)) commands.add(command(item,item.key(),audit.detail()));
        if (commands.isEmpty()) return;
        gateway.execute("BEGIN;\n" + String.join("\n", commands) + "\nCOMMIT;");
    }
    private String command(Object item, String key, String reason) {
        return "CALL notasys.ns_documento(" + literal(Json.encode(item)) + "::jsonb," + versions.getOrDefault(key,0L) + "," + literal(reason) + ");";
    }
    @Override
    public ReportData query(String company, ReportSpec report, Filter filter) {
        return fetch(company,report,filter,0,-1);
    }
    @Override
    public ReportData page(String company, ReportSpec report, Filter filter, int offset, int limit) {
        return fetch(company,report,filter,offset,limit);
    }
    private ReportData fetch(String company, ReportSpec report, Filter filter, int offset, int limit) {
        String sql = "CALL notasys.ns_reporte(" + report.id() + "," + literal(company) + "," + literal(filter.from().toString()) + "," + literal(filter.to().toString()) + "," + literal(filter.client()) + "," + literal(filter.currency()) + "," + literal(filter.state()) + "," + literal(filter.target()) + "," + literal(filter.noteType()) + ","+offset+","+limit+",NULL);";
        Element root=xml(gateway.execute(sql));
        List<Map<String,String>> data = rows(root);
        int total=Integer.parseInt(root.getAttribute("total"));
        if (data.isEmpty()) return new ReportData(new String[] {
            "Sin resultados"
        }
        , List.of(),total,limit>0);
        String[] columns = data.get(0).keySet().stream().map(key -> key.substring(0,1).toUpperCase(Locale.ROOT) + key.substring(1).replace('_',' ')).toArray(String[]::new);
        return new ReportData(columns, data.stream().map(row -> row.values().toArray()).toList(),total,limit>0);
    }
    private static boolean active(Map<String,String> row) {
        return Boolean.parseBoolean(row.get("activo"));
    }
    private static BigDecimal decimal(Map<String,String> row, String column) {
        return new BigDecimal(row.get(column));
    }
    public static Element xml(String text) {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            factory.setFeature("http://apache.org/xml/features/disallow-doctype-decl",true);
            factory.setFeature("http://xml.org/sax/features/external-general-entities",false);
            factory.setFeature("http://xml.org/sax/features/external-parameter-entities",false);
            return factory.newDocumentBuilder().parse(new ByteArrayInputStream(text.getBytes(StandardCharsets.UTF_8))).getDocumentElement();
        }
        catch (Exception ex) {
            throw new IllegalArgumentException("Respuesta de PostgreSQL inválida o esquema no instalado.",ex);
        }
    }
    private static List<Element> children(Element parent) {
        List<Element> elements = new ArrayList<>();
        for (Node node=parent.getFirstChild(); node!=null; node=node.getNextSibling()) if (node instanceof Element element) elements.add(element);
        return elements;
    }
    public static List<Map<String,String>> rows(Element root) {
        List<Map<String,String>> result = new ArrayList<>();
        var nodes = root.getElementsByTagName("row");
        for (int i=0; i<nodes.getLength(); i++) {
            Map<String,String> row = new LinkedHashMap<>();
            for (Element field : children((Element)nodes.item(i))) row.put(field.getTagName(),field.getTextContent());
            result.add(row);
        }
        return result;
    }
}
