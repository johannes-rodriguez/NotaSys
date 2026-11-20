package model;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

/** Modelo de demostración, independiente de Swing. No simula una conexión SQL.
 * En la siguiente etapa sus operaciones se conectarán a procedimientos vía JDBC.
 * El estado vive en memoria y se reinicia al cerrar la aplicación.
 */
public final class AppModel {
    public static final LocalDate DEMO_DATE = LocalDate.of(2026, 11, 19);
    public record Master(String id, String name, String extra, boolean active) {
        @Override public String toString() { return name + " · " + id; }
    }
    public record Line(String productId, String description, BigDecimal quantity, BigDecimal price) {
        public BigDecimal amount() { return quantity.multiply(price).setScale(2, RoundingMode.HALF_UP); }
    }
    public record Document(String company, String type, String number, LocalDate date,
                           String client, String currency, List<Line> lines, boolean active) {
        public Document { lines = List.copyOf(lines); }
        public BigDecimal base() { return sum(lines); }
        public BigDecimal tax() { return base().multiply(new BigDecimal("0.18")).setScale(2, RoundingMode.HALF_UP); }
        public BigDecimal total() { return base().add(tax()); }
        public String key() { return company + "/" + type + "/" + number; }
        @Override public String toString() { return type + " " + number; }
    }
    public record Note(String company, String type, String number, LocalDate date, String documentKey,
                       String reason, String description, List<Line> lines, boolean active) {
        public Note { lines = List.copyOf(lines); }
        public BigDecimal base() { return sum(lines); }
        public BigDecimal tax() { return base().multiply(new BigDecimal("0.18")).setScale(2, RoundingMode.HALF_UP); }
        public BigDecimal total() { return base().add(tax()); }
        public String key() { return company + "/" + type + "/" + number; }
        @Override public String toString() { return type + " " + number; }
    }
    public record Audit(String company, LocalDateTime time, String action, String record, String detail) {}
    public record ReportSpec(int id, String title, String description, String documentType, String noteType) {
        @Override public String toString() { return String.format("%02d   %s", id, title); }
    }
    public record Filter(LocalDate from, LocalDate to, String client, String currency, String state, String target) {
        public Filter {
            Objects.requireNonNull(from); Objects.requireNonNull(to);
            if (from.isAfter(to)) throw new IllegalArgumentException("La fecha Desde no puede ser posterior a Hasta.");
        }
    }
    public record ReportData(String[] columns, List<Object[]> rows) {}
    public static final List<ReportSpec> REPORTS = List.of(
        new ReportSpec(1, "Créditos por periodo", "Notas de crédito, cliente e importes.", "", ""),
        new ReportSpec(2, "Débitos por periodo", "Notas de débito, cliente e importes.", "", ""),
        new ReportSpec(3, "Detalle de nota de crédito", "Ítems, cantidades y valores de una nota.", "", "Crédito"),
        new ReportSpec(4, "Detalle de nota de débito", "Ítems, cantidades y valores de una nota.", "", "Débito"),
        new ReportSpec(5, "Historial de una factura", "Ajustes vinculados a la factura seleccionada.", "Factura", ""),
        new ReportSpec(6, "Historial de una boleta", "Ajustes vinculados a la boleta seleccionada.", "Boleta", ""),
        new ReportSpec(7, "Clientes con ajustes", "Cantidad e importes por cliente, tipo y moneda.", "", ""),
        new ReportSpec(8, "Productos y servicios ajustados", "Valores de ítems agrupados por producto, tipo y moneda.", "", ""),
        new ReportSpec(9, "Resumen mensual por moneda", "Cantidad, base, IGV y total por mes, tipo y moneda.", "", ""),
        new ReportSpec(10, "Créditos y comprobante original", "Relación entre cada nota de crédito y su comprobante.", "", "")
    );
    private final Map<String, List<Master>> masters = new LinkedHashMap<>();
    private final List<Document> documents = new ArrayList<>();
    private final List<Note> notes = new ArrayList<>();
    private final List<Audit> audits = new ArrayList<>();

    public AppModel() {
        masters.put("Emisores", new ArrayList<>(List.of(new Master("20000000001", "Empresa demo A", "", true), new Master("20000000002", "Empresa demo B", "", true))));
        masters.put("Clientes", new ArrayList<>());
        for (int i=1;i<=8;i++) masters.get("Clientes").add(new Master(String.format("%08d",i), "Cliente de prueba " + i, "", true));
        masters.put("Productos y servicios", new ArrayList<>(List.of(new Master("S001", "Asesoría contable", "SERVICIO", true), new Master("S002", "Revisión documental", "HORA", true))));
        for (Master company : masters.get("Emisores")) {
            for (int i=1;i<=72;i++) {
                String type=i%3==0?"Boleta":"Factura";
                Document doc=new Document(company.id(),type,(type.equals("Factura")?"E001-":"B001-")+String.format("%08d",i),DEMO_DATE.withDayOfMonth(1+(i%18)),String.format("%08d",1+(i%8)),i%5==0?"USD":"PEN",List.of(new Line("S001","Asesoría contable",BigDecimal.ONE,new BigDecimal("1000.00"))),true);
                documents.add(doc);
                if (i%4!=0) {
                    String nt=i%2==0?"Débito":"Crédito";
                    notes.add(new Note(company.id(),nt,(nt.equals("Crédito")?"FC01-":"ND01-")+String.format("%08d",i),doc.date().plusDays(1),doc.key(),nt.equals("Crédito")?"Descuento":"Cargo adicional","Ejemplo académico",List.of(new Line("S001","Asesoría contable",BigDecimal.ONE,new BigDecimal(nt.equals("Crédito")?"100":"50"))),true));
                }
            }
        }
    }
    private static BigDecimal sum(List<Line> lines) { return lines.stream().map(Line::amount).reduce(new BigDecimal("0.00"),BigDecimal::add); }
    public synchronized List<Master> masters(String catalog) { return List.copyOf(masters.get(catalog)); }
    public synchronized List<Document> documents(String company) { return documents.stream().filter(d->d.company().equals(company)).toList(); }
    public synchronized List<Note> notes(String company) { return notes.stream().filter(n->n.company().equals(company)).toList(); }
    public synchronized List<Audit> audits(String company) { return audits.stream().filter(a->a.company().equals(company)).sorted(Comparator.comparing(Audit::time).reversed()).toList(); }
    public synchronized String name(String catalog, String id) { return masters.get(catalog).stream().filter(m->m.id().equals(id)).map(Master::name).findFirst().orElse(id); }
    public synchronized Document document(String key) { return documents.stream().filter(d->d.key().equals(key)).findFirst().orElseThrow(()->new IllegalArgumentException("No se encontró el comprobante.")); }
    private boolean activeMaster(String catalog,String id) { return masters.get(catalog).stream().anyMatch(m->m.id().equals(id)&&m.active()); }
    private void audit(String company,String action,String record,String detail) { audits.add(new Audit(company,LocalDateTime.now(),action,record,detail)); }
    public synchronized void saveMaster(String catalog,Master value,Master old,String company) {
        String id=value.id().trim(),name=value.name().trim(),extra=value.extra().trim();
        if (name.isEmpty()||id.isEmpty()) throw new IllegalArgumentException("Completa el código o documento y el nombre.");
        if (catalog.equals("Emisores")&&!id.matches("\\d{11}")) throw new IllegalArgumentException("El RUC debe tener 11 dígitos.");
        if (catalog.equals("Clientes")&&!id.matches("(?:\\d{8}|\\d{11})")) throw new IllegalArgumentException("El documento debe tener 8 u 11 dígitos.");
        if (catalog.equals("Productos y servicios")&&extra.isEmpty()) throw new IllegalArgumentException("Indica la unidad de medida.");
        if (old!=null&&!old.id().equals(id)) throw new IllegalArgumentException("El identificador no se modifica.");
        List<Master> list=masters.get(catalog);
        if (old==null&&list.stream().anyMatch(m->m.id().equals(id))) throw new IllegalArgumentException("Ese identificador ya existe, incluso entre los inactivos.");
        Master normalized=new Master(id,name,extra,old==null||old.active());
        if(old==null) list.add(normalized); else {int ix=list.indexOf(old);if(ix<0)throw new IllegalArgumentException("El registro cambió. Abre de nuevo el formulario.");list.set(ix,normalized);}
        audit(company,old==null?"Alta":"Modificación",catalog+" · "+id,old==null?name:old.name()+" → "+name);
    }
    public synchronized void deactivateMaster(String catalog,Master old,String reason,String company) {
        checkReason(reason); if(!old.active())throw new IllegalArgumentException("El registro ya está inactivo.");
        if(catalog.equals("Emisores")&&masters.get(catalog).stream().filter(Master::active).count()==1)throw new IllegalArgumentException("Debe quedar al menos un emisor activo.");
        List<Master> list=masters.get(catalog);int ix=list.indexOf(old);
        if(ix<0)throw new IllegalArgumentException("El registro cambió. Actualiza el listado.");
        list.set(ix,new Master(old.id(),old.name(),old.extra(),false));audit(company,"Desactivación",catalog+" · "+old.id(),reason);
    }
    private static void validateLines(List<Line> lines) {
        if(lines.isEmpty())throw new IllegalArgumentException("Agrega al menos un ítem.");
        Set<String> codes=new HashSet<>();
        for(Line line:lines){if(line.quantity().signum()<=0||line.price().signum()<0)throw new IllegalArgumentException("La cantidad debe ser positiva y el valor no negativo.");if(!codes.add(line.productId()))throw new IllegalArgumentException("Agrupa el mismo producto en una sola línea.");}
    }
    private static void validateNumber(String number){if(!number.matches("[A-Z0-9]{4}-\\d{1,8}"))throw new IllegalArgumentException("Usa una serie de 4 caracteres y un número de hasta 8 dígitos: E001-00000001.");}
    private void validateActiveLines(List<Line> lines){for(Line l:lines)if(!activeMaster("Productos y servicios",l.productId()))throw new IllegalArgumentException("Selecciona productos o servicios activos.");}
    public synchronized void saveDocument(Document value,Document old) {
        validateNumber(value.number());validateLines(value.lines());validateActiveLines(value.lines());
        if(!activeMaster("Emisores",value.company())||!activeMaster("Clientes",value.client()))throw new IllegalArgumentException("Selecciona un emisor y cliente activos.");
        if(!List.of("Factura","Boleta").contains(value.type())||!List.of("PEN","USD").contains(value.currency()))throw new IllegalArgumentException("Tipo o moneda inválidos.");
        if(old==null&&documents.stream().anyMatch(d->d.key().equals(value.key())))throw new IllegalArgumentException("Ya existe ese comprobante para el emisor.");
        if(old!=null){if(!old.active()||!old.key().equals(value.key()))throw new IllegalArgumentException("No puedes cambiar la identidad ni editar un registro inactivo.");if(notes.stream().anyMatch(n->n.documentKey().equals(old.key())))throw new IllegalArgumentException("El comprobante tiene notas vinculadas. En esta versión se conserva sin edición.");documents.set(documents.indexOf(old),value);}else documents.add(value);
        audit(value.company(),old==null?"Alta":"Modificación",value.type()+" "+value.number(),old==null?"Comprobante registrado":"Total "+old.total()+" → "+value.total());
    }
    public synchronized void saveNote(Note value,Note old) {
        validateNumber(value.number());validateLines(value.lines());validateActiveLines(value.lines());
        Document doc=document(value.documentKey());
        if(!doc.active()||!doc.company().equals(value.company())||!activeMaster("Emisores",value.company()))throw new IllegalArgumentException("Selecciona un comprobante activo del mismo emisor.");
        if(!List.of("Crédito","Débito").contains(value.type()))throw new IllegalArgumentException("Tipo de nota inválido.");
        if(value.reason().isBlank()||value.description().isBlank())throw new IllegalArgumentException("Completa motivo y descripción del ajuste.");
        if(value.date().isBefore(doc.date()))throw new IllegalArgumentException("La nota no puede ser anterior al comprobante.");
        if(value.total().signum()<=0)throw new IllegalArgumentException("El importe del ajuste debe ser mayor que cero.");
        if(old==null&&notes.stream().anyMatch(n->n.key().equals(value.key())))throw new IllegalArgumentException("Ya existe esa nota para el emisor.");
        if(old!=null&&(!old.active()||!old.key().equals(value.key())||!old.documentKey().equals(value.documentKey())))throw new IllegalArgumentException("No se puede cambiar la identidad ni el vínculo de una nota existente.");
        if(value.type().equals("Crédito")) {
            BigDecimal credits=notes.stream().filter(n->n.active()&&n.type().equals("Crédito")&&n.documentKey().equals(doc.key())&&(old==null||!n.key().equals(old.key()))).map(Note::total).reduce(BigDecimal.ZERO,BigDecimal::add);
            if(credits.add(value.total()).compareTo(doc.total())>0)throw new IllegalArgumentException("En esta demo los créditos acumulados no pueden superar el total original.");
        }
        if(old==null)notes.add(value);else notes.set(notes.indexOf(old),value);
        audit(value.company(),old==null?"Alta":"Modificación",value.type()+" "+value.number(),old==null?"Nota registrada":"Total "+old.total()+" → "+value.total());
    }
    public synchronized void deactivateDocument(Document old,String reason){checkReason(reason);if(!old.active())throw new IllegalArgumentException("El comprobante ya está inactivo.");if(notes.stream().anyMatch(n->n.active()&&n.documentKey().equals(old.key())))throw new IllegalArgumentException("Hay notas activas vinculadas. No se puede desactivar el comprobante.");documents.set(documents.indexOf(old),new Document(old.company(),old.type(),old.number(),old.date(),old.client(),old.currency(),old.lines(),false));audit(old.company(),"Desactivación",old.toString(),reason);}
    public synchronized void deactivateNote(Note old,String reason){checkReason(reason);if(!old.active())throw new IllegalArgumentException("La nota ya está inactiva.");notes.set(notes.indexOf(old),new Note(old.company(),old.type(),old.number(),old.date(),old.documentKey(),old.reason(),old.description(),old.lines(),false));audit(old.company(),"Desactivación",old.toString(),reason);}
    private static void checkReason(String reason){if(reason==null||reason.isBlank())throw new IllegalArgumentException("Indica el motivo de desactivación.");}
    public synchronized String nextNumber(String company,String type,boolean note){String prefix=note?(type.equals("Crédito")?"FC01":"ND01"):(type.equals("Factura")?"E001":"B001");int max=0;List<String> numbers=note?notes(company).stream().filter(n->n.type().equals(type)).map(Note::number).toList():documents(company).stream().filter(d->d.type().equals(type)).map(Document::number).toList();for(String s:numbers)if(s.startsWith(prefix+"-"))max=Math.max(max,Integer.parseInt(s.substring(5)));if(max>=99999999)throw new IllegalArgumentException("Serie agotada.");return prefix+"-"+String.format("%08d",max+1);}
    public static String money(BigDecimal amount){return String.format(Locale.US,"%,.2f",amount);}
    public static boolean matchesState(boolean active,String state){return state.equals("Todos")||active==state.equals("Activos");}
    public synchronized ReportData report(String company,ReportSpec spec,Filter f) {
        if(spec.id()<1||spec.id()>10)throw new IllegalArgumentException("Reporte no disponible.");
        if((!spec.noteType().isEmpty()||!spec.documentType().isEmpty())&&(f.target()==null||f.target().isEmpty()))throw new IllegalArgumentException("Selecciona el documento o la nota del reporte.");
        List<Note> selected=notes.stream().filter(n->{Document d=document(n.documentKey());return n.company().equals(company)&&!n.date().isBefore(f.from())&&!n.date().isAfter(f.to())&&matchesState(n.active(),f.state())&&(f.client().isEmpty()||d.client().equals(f.client()))&&(f.currency().equals("Todas")||d.currency().equals(f.currency()));}).sorted(Comparator.comparing(Note::date).thenComparing(Note::number)).toList();
        List<Object[]> rows=new ArrayList<>();String[] columns;
        int id=spec.id();
        if(id==3||id==4){columns=new String[]{"Nota","Producto","Descripción","Cantidad","Valor unitario","Valor de venta","Moneda"};for(Note n:selected)if(n.key().equals(f.target())&&n.type().equals(spec.noteType()))for(Line l:n.lines())rows.add(new Object[]{n.number(),l.productId(),l.description(),l.quantity(),l.price(),l.amount(),document(n.documentKey()).currency()});}
        else if(id==7||id==8||id==9){
            Map<String,BigDecimal[]> totals=new TreeMap<>();Map<String,Object[]> labels=new HashMap<>();
            for(Note n:selected){Document d=document(n.documentKey());if(id==8){for(Line l:n.lines()){String k=l.productId()+"/"+n.type()+"/"+d.currency();labels.put(k,new Object[]{l.productId(),l.description(),n.type(),d.currency()});BigDecimal[] t=totals.computeIfAbsent(k,z->new BigDecimal[]{BigDecimal.ZERO,BigDecimal.ZERO,BigDecimal.ZERO});t[0]=t[0].add(BigDecimal.ONE);t[1]=t[1].add(l.quantity());t[2]=t[2].add(l.amount());}}
                else{String label=id==7?d.client():n.date().format(DateTimeFormatter.ofPattern("yyyy-MM"));String k=label+"/"+n.type()+"/"+d.currency();labels.put(k,id==7?new Object[]{d.client(),name("Clientes",d.client()),n.type(),d.currency()}:new Object[]{label,n.type(),d.currency()});BigDecimal[] t=totals.computeIfAbsent(k,z->new BigDecimal[]{BigDecimal.ZERO,BigDecimal.ZERO,BigDecimal.ZERO,BigDecimal.ZERO});t[0]=t[0].add(BigDecimal.ONE);t[1]=t[1].add(n.base());t[2]=t[2].add(n.tax());t[3]=t[3].add(n.total());}}
            if(id==7)columns=new String[]{"Documento cliente","Cliente","Tipo","Moneda","Notas","Valor de venta","IGV","Total"};else if(id==8)columns=new String[]{"Código","Producto / servicio","Tipo","Moneda","Notas","Cantidad","Valor de venta"};else columns=new String[]{"Mes","Tipo","Moneda","Notas","Valor de venta","IGV","Total"};
            for(String k:totals.keySet()){List<Object> r=new ArrayList<>(Arrays.asList(labels.get(k)));r.addAll(Arrays.asList(totals.get(k)));rows.add(r.toArray());}
        }else{
            columns=new String[]{"Nota","Tipo","Fecha","Cliente","Comprobante","Moneda","Valor de venta","IGV","Total","Estado"};
            for(Note n:selected){Document d=document(n.documentKey());if((id==1||id==10)&&!n.type().equals("Crédito"))continue;if(id==2&&!n.type().equals("Débito"))continue;if((id==5||id==6)&&(!n.documentKey().equals(f.target())||!d.type().equals(spec.documentType())))continue;rows.add(new Object[]{n.number(),n.type(),n.date(),name("Clientes",d.client()),d.toString(),d.currency(),n.base(),n.tax(),n.total(),n.active()?"Activo":"Inactivo"});}
        }
        return new ReportData(columns,List.copyOf(rows));
    }
    /** Página en memoria para la demo; JDBC deberá paginar en PostgreSQL. */
    public static List<Object[]> page(ReportData data,int page,int size){if(size<1||page<0)throw new IllegalArgumentException("Página inválida.");int from=Math.min(data.rows().size(),page*size);return data.rows().subList(from,Math.min(data.rows().size(),from+size));}
    public static String csv(ReportData data){StringBuilder out=new StringBuilder("\ufeff");out.append(Arrays.stream(data.columns()).map(AppModel::csvCell).collect(Collectors.joining(";"))).append("\r\n");for(Object[] row:data.rows())out.append(Arrays.stream(row).map(AppModel::csvCell).collect(Collectors.joining(";"))).append("\r\n");return out.toString();}
    private static String csvCell(Object value){String s=String.valueOf(value);if(value instanceof String&&!s.isEmpty()&&"=+-@\t\r\n".indexOf(s.charAt(0))>=0)s="'"+s;return "\""+s.replace("\"","\"\"")+"\"";}
}
