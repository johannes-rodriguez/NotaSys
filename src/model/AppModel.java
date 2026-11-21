package model;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;
/** Application service: business rules, independent of Swing and SQL transport. */
public final class AppModel {
    public static final LocalDate TODAY = LocalDate.now();
    public record Master(String id, String name, String extra, boolean active) {
        @Override public String toString() {
            return name + " · " + id;
        }
    }
    public record Line(String productId, String description, BigDecimal quantity, BigDecimal price) {
        public BigDecimal amount() {
            return quantity.multiply(price).setScale(2, RoundingMode.HALF_UP);
        }
    }
    public record Document(String company, String type, String number, LocalDate date, String client, String currency, List<Line> lines, boolean active, BigDecimal storedBase, BigDecimal storedTax) {
        public Document {
            lines = List.copyOf(lines);
        }
        public Document(String company, String type, String number, LocalDate date, String client, String currency, List<Line> lines, boolean active) {
            this(company,type,number,date,client,currency,lines,active,null,null);
        }
        public BigDecimal base() {
            return storedBase == null ? sum(lines) : storedBase;
        }
        public BigDecimal tax() {
            return storedTax == null ? base().multiply(new BigDecimal("0.18")).setScale(2, RoundingMode.HALF_UP) : storedTax;
        }
        public BigDecimal total() {
            return base().add(tax());
        }
        public String key() {
            return company + "/" + type + "/" + number;
        }
        @Override public String toString() {
            return type + " " + number;
        }
    }
    public record Note(String company, String type, String number, LocalDate date, String documentKey, String reason, String description, List<Line> lines, boolean active, BigDecimal storedBase, BigDecimal storedTax) {
        public Note {
            lines = List.copyOf(lines);
        }
        public Note(String company, String type, String number, LocalDate date, String documentKey, String reason, String description, List<Line> lines, boolean active) {
            this(company,type,number,date,documentKey,reason,description,lines,active,null,null);
        }
        public BigDecimal base() {
            return storedBase == null ? sum(lines) : storedBase;
        }
        public BigDecimal tax() {
            return storedTax == null ? base().multiply(new BigDecimal("0.18")).setScale(2, RoundingMode.HALF_UP) : storedTax;
        }
        public BigDecimal total() {
            return base().add(tax());
        }
        public String key() {
            return company + "/" + type + "/" + number;
        }
        @Override public String toString() {
            return type + " " + number;
        }
    }
    public record Audit(String company, LocalDateTime time, String action, String record, String detail) {
    }
    public record ReportSpec(int id, String title, String description, String documentType, String noteType) {
        @Override public String toString() {
            return String.format("%02d   %s", id, title);
        }
    }
    public record Filter(LocalDate from, LocalDate to, String client, String currency, String state, String target, String noteType) {
        public Filter(LocalDate from, LocalDate to, String client, String currency, String state, String target) {
            this(from,to,client,currency,state,target,"Todos");
        }
        public Filter {
            Objects.requireNonNull(from);
            Objects.requireNonNull(to);
            if (from.isAfter(to)) throw new IllegalArgumentException("La fecha Desde no puede ser posterior a Hasta.");
        }
    }
    public record ReportData(String[] columns, List<Object[]> rows, int totalRows, boolean paged) {
        public ReportData(String[] columns,List<Object[]> rows) {
            this(columns,rows,rows.size(),false);
        }
    }
    public static final List<ReportSpec> REPORTS = List.of( new ReportSpec(1, "Notas por período", "selecciona crédito, débito o ambos.", "", ""), new ReportSpec(2, "Detalle de una nota", "productos, cantidades e importes.", "", "*"), new ReportSpec(3, "Historial de una factura", "notas vinculadas a la factura.", "Factura", ""), new ReportSpec(4, "Historial de una boleta", "notas vinculadas a la boleta.", "Boleta", ""), new ReportSpec(5, "Resumen mensual por moneda", "importes agrupados por mes y tipo.", "", ""), new ReportSpec(6, "Clientes con ajustes", "ajustes e importes por cliente.", "", ""), new ReportSpec(7, "Motivos más frecuentes", "frecuencia de los motivos de ajuste.", "", ""), new ReportSpec(8, "Comprobantes sin notas al cierre", "documentos sin ajustes hasta la fecha.", "", ""), new ReportSpec(9, "Resumen diario de documentos", "emisión diaria por tipo y moneda.", "", ""), new ReportSpec(10, "Comprobantes con ajustes reiterados", "documentos con más de una nota.", "", ""), new ReportSpec(11, "Documentos de un cliente", "comprobantes y notas del cliente.", "", ""), new ReportSpec(12, "Productos y servicios ajustados", "detalle agregado de los ajustes.", "", ""), new ReportSpec(13, "Notas y comprobante original", "origen y descripción del ajuste.", "", ""), new ReportSpec(14, "Notas por motivo y mes", "incluye selector de crédito y débito.", "", ""), new ReportSpec(15, "Facturas e importe neto ajustado", "total original, créditos y neto documental.", "", "") );
    private final Map<String, List<Master>> masters = new LinkedHashMap<>();
    private final List<Document> documents = new ArrayList<>();
    private final List<Note> notes = new ArrayList<>();
    private final List<Audit> audits = new ArrayList<>();
    private final DataRepository repository;
    private final ReportProvider reportProvider;
    private DataRepository.Snapshot baseline;
    public AppModel(DataRepository repository, ReportProvider reports) {
        this.repository = Objects.requireNonNull(repository);
        this.reportProvider = Objects.requireNonNull(reports);
        reload();
    }
    public synchronized void reload() {
        restore(repository.load());
    }
    private void restore(DataRepository.Snapshot state) {
        masters.clear();
        state.masters().forEach((key,value) -> masters.put(key,new ArrayList<>(value)));
        documents.clear();
        documents.addAll(state.documents());
        notes.clear();
        notes.addAll(state.notes());
        audits.clear();
        audits.addAll(state.audits());
        baseline=state;
    }
    private DataRepository.Snapshot snapshot() {
        return new DataRepository.Snapshot(masters,documents,notes,audits);
    }
    private static BigDecimal sum(List<Line> lines) {
        return lines.stream().map(Line::amount).reduce(new BigDecimal("0.00"),BigDecimal::add);
    }
    public synchronized List<Master> masters(String catalog) {
        return List.copyOf(masters.get(catalog));
    }
    public synchronized List<Document> documents(String company) {
        return documents.stream().filter(d->d.company().equals(company)).toList();
    }
    public synchronized List<Note> notes(String company) {
        return notes.stream().filter(n->n.company().equals(company)).toList();
    }
    public synchronized List<Audit> audits(String company) {
        return audits.stream().filter(a->a.company().equals(company)).sorted(Comparator.comparing(Audit::time).reversed()).toList();
    }
    public synchronized String name(String catalog, String id) {
        return masters.get(catalog).stream().filter(m->m.id().equals(id)).map(Master::name).findFirst().orElse(id);
    }
    public synchronized Document document(String key) {
        return documents.stream().filter(d->d.key().equals(key)).findFirst().orElseThrow(()->new IllegalArgumentException("No se encontró el comprobante."));
    }
    private boolean activeMaster(String catalog,String id) {
        return masters.get(catalog).stream().anyMatch(m->m.id().equals(id)&&m.active());
    }
    private void audit(String company,String action,String record,String detail) {
        audits.add(new Audit(company,LocalDateTime.now(),action,record,detail));
        try {
            repository.save(baseline,snapshot());
        }
        catch (RuntimeException error) {
            restore(baseline);
            throw error;
        }
        // A committed operation is never reported as rolled back if refreshing fails.
        baseline=snapshot();
        try {
            reload();
        }
        catch (RuntimeException error) {
            throw new IllegalArgumentException("Guardado confirmado, pero no se pudo actualizar la vista. Pulsa Actualizar antes de continuar.",error);
        }
    }
    public synchronized void saveMaster(String catalog,Master value,Master old,String company) {
        String id=value.id().trim(),name=value.name().trim(),extra=value.extra().trim();
        if (name.isEmpty()||id.isEmpty()) throw new IllegalArgumentException("Completa el código o documento y el nombre.");
        if (catalog.equals("Emisores")&&!id.matches("\\d{11}")) throw new IllegalArgumentException("El RUC debe tener 11 dígitos.");
        if (catalog.equals("Clientes")&&!id.matches("(?:\\d{8}|\\d{11})")) throw new IllegalArgumentException("El documento debe tener 8 u 11 dígitos.");
        if (catalog.equals("Productos y servicios")&&extra.isEmpty()) throw new IllegalArgumentException("Indica la unidad de medida.");
        if (name.length()>(catalog.equals("Productos y servicios")?250:150)||extra.length()>20||id.length()>(catalog.equals("Productos y servicios")?20:11)) throw new IllegalArgumentException("Texto demasiado largo para el catálogo.");
        if (old!=null&&!old.active()) throw new IllegalArgumentException("No se editan registros inactivos.");
        if (old!=null&&!old.id().equals(id)) throw new IllegalArgumentException("El identificador no se modifica.");
        List<Master> list=masters.get(catalog);
        if (old==null&&list.stream().anyMatch(m->m.id().equals(id))) throw new IllegalArgumentException("Ese identificador ya existe, incluso entre los inactivos.");
        Master normalized=new Master(id,name,extra,old==null||old.active());
        if(old==null) list.add(normalized);
        else {
            int ix=list.indexOf(old);
            if(ix<0)throw new IllegalArgumentException("El registro cambió. Abre de nuevo el formulario.");
            list.set(ix,normalized);
        }
        audit(company,old==null?"Alta":"Modificación",catalog+" · "+id,old==null?name:old.name()+" → "+name);
    }
    public synchronized void deactivateMaster(String catalog,Master old,String reason,String company) {
        checkReason(reason);
        if(!old.active())throw new IllegalArgumentException("El registro ya está inactivo.");
        if(catalog.equals("Emisores")&&masters.get(catalog).stream().filter(Master::active).count()==1)throw new IllegalArgumentException("Debe quedar al menos un emisor activo.");
        List<Master> list=masters.get(catalog);
        int ix=list.indexOf(old);
        if(ix<0)throw new IllegalArgumentException("El registro cambió. Actualiza el listado.");
        list.set(ix,new Master(old.id(),old.name(),old.extra(),false));
        audit(company,"Desactivación",catalog+" · "+old.id(),reason);
    }
    private static void validateLines(List<Line> lines) {
        if(lines==null||lines.isEmpty()||lines.size()>200)throw new IllegalArgumentException("Agrega al menos un ítem.");
        Set<String> codes=new HashSet<>();
        for(Line line:lines) {
            if(line.quantity()==null||line.price()==null||line.quantity().scale()>4||line.price().scale()>4||line.quantity().abs().compareTo(new BigDecimal("99999999.9999"))>0||line.price().abs().compareTo(new BigDecimal("99999999.9999"))>0)throw new IllegalArgumentException("Cantidad y valor: máximo 8 enteros y 4 decimales.");
            if(line.quantity().signum()<=0||line.price().signum()<0)throw new IllegalArgumentException("La cantidad debe ser positiva y el valor no negativo.");
            if(!codes.add(line.productId()))throw new IllegalArgumentException("Agrupa el mismo producto en una sola línea.");
        }
    }
    private static void validateNumber(String number) {
        if(!number.matches("[A-Z0-9]{4}-\\d{8}"))throw new IllegalArgumentException("Usa una serie de 4 caracteres y un número de hasta 8 dígitos: E001-00000001.");
    }
    private void validateActiveLines(List<Line> lines) {
        for(Line l:lines)if(!activeMaster("Productos y servicios",l.productId()))throw new IllegalArgumentException("Selecciona productos o servicios activos.");
    }
    public synchronized void saveDocument(Document value,Document old) {
        validateNumber(value.number());
        validateLines(value.lines());
        validateActiveLines(value.lines());
        validateDateAndTotal(value.date(),value.total());
        if(!value.number().startsWith(value.type().equals("Factura")?"E":"B")||Integer.parseInt(value.number().substring(5))==0) throw new IllegalArgumentException("Factura: serie E; boleta: serie B. Correlativo mayor a cero.");
        if(value.type().equals("Factura")&&!value.client().matches("\\d{11}")) throw new IllegalArgumentException("La factura requiere cliente con RUC de 11 dígitos.");
        if(!activeMaster("Emisores",value.company())||!activeMaster("Clientes",value.client()))throw new IllegalArgumentException("Selecciona un emisor y cliente activos.");
        if(!List.of("Factura","Boleta").contains(value.type())||!List.of("PEN","USD").contains(value.currency()))throw new IllegalArgumentException("Tipo o moneda inválidos.");
        if(old==null&&documents.stream().anyMatch(d->d.key().equals(value.key())))throw new IllegalArgumentException("Ya existe ese comprobante para el emisor.");
        if(old!=null) {
            if(!old.active()||!old.key().equals(value.key()))throw new IllegalArgumentException("No puedes cambiar la identidad ni editar un registro inactivo.");
            if(notes.stream().anyMatch(n->n.documentKey().equals(old.key())))throw new IllegalArgumentException("El comprobante tiene notas vinculadas. En esta versión se conserva sin edición.");
            if(!documents.contains(old))throw new IllegalArgumentException("El comprobante cambió. Actualiza el listado.");
            documents.set(documents.indexOf(old),value);
        }
        else documents.add(value);
        audit(value.company(),old==null?"Alta":"Modificación",value.type()+" "+value.number(),old==null?"Comprobante registrado":"Total "+old.total()+" → "+value.total());
    }
    public synchronized void saveNote(Note value,Note old) {
        validateNumber(value.number());
        validateLines(value.lines());
        validateDateAndTotal(value.date(),value.total());
        if(Integer.parseInt(value.number().substring(5))==0 || (value.type().equals("Débito")&&!value.number().startsWith("E"))) throw new IllegalArgumentException("Serie o correlativo no permitido para la nota.");
        Document doc=document(value.documentKey());
        if(!doc.active()||!doc.company().equals(value.company())||!activeMaster("Emisores",value.company()))throw new IllegalArgumentException("Selecciona un comprobante activo del mismo emisor.");
        if(!List.of("Crédito","Débito").contains(value.type()))throw new IllegalArgumentException("Tipo de nota inválido.");
        if(value.reason().isBlank()||value.description().isBlank()||value.reason().length()>200||value.description().length()>500)throw new IllegalArgumentException("Completa motivo y descripción del ajuste.");
        if(value.date().isBefore(doc.date()))throw new IllegalArgumentException("La nota no puede ser anterior al comprobante.");
        if(value.total().signum()<=0)throw new IllegalArgumentException("El importe del ajuste debe ser mayor que cero.");
        if(old==null&&notes.stream().anyMatch(n->n.key().equals(value.key())))throw new IllegalArgumentException("Ya existe esa nota para el emisor.");
        if(old!=null&&(!old.active()||!old.key().equals(value.key())||!old.documentKey().equals(value.documentKey())))throw new IllegalArgumentException("No se puede cambiar la identidad ni el vínculo de una nota existente.");
        if(doc.client().isBlank()) throw new IllegalArgumentException("Identifica primero al cliente de la boleta para registrar una nota.");
        if(old!=null&&!notes.contains(old)) throw new IllegalArgumentException("La nota cambió. Actualiza el listado.");
        for(Line line:value.lines()) {
            Line source=doc.lines().stream().filter(item->item.productId().equals(line.productId())).findFirst() .orElseThrow(()->new IllegalArgumentException("El artículo no pertenece al comprobante original."));
            if(value.type().equals("Crédito")) {
                BigDecimal used=notes.stream().filter(n->n.active()&&n.type().equals("Crédito")&&n.documentKey().equals(doc.key())&&(old==null||!n.key().equals(old.key()))) .flatMap(n->n.lines().stream()).filter(item->item.productId().equals(line.productId())).map(Line::amount).reduce(BigDecimal.ZERO,BigDecimal::add);
                BigDecimal returned=notes.stream().filter(n->n.active()&&n.type().equals("Crédito")&&n.documentKey().equals(doc.key())&&(old==null||!n.key().equals(old.key()))&&List.of("Devolución parcial","Anulación total").contains(n.reason())) .flatMap(n->n.lines().stream()).filter(item->item.productId().equals(line.productId())).map(Line::quantity).reduce(BigDecimal.ZERO,BigDecimal::add);
                if(line.quantity().compareTo(source.quantity())>0||used.add(line.amount()).compareTo(source.amount())>0) throw new IllegalArgumentException("El ajuste supera la cantidad o el importe disponible de "+source.description()+".");
                if(List.of("Devolución parcial","Anulación total").contains(value.reason())&&returned.add(line.quantity()).compareTo(source.quantity())>0) throw new IllegalArgumentException("La cantidad ya fue devuelta en notas anteriores.");
            }
        }
        if(value.type().equals("Crédito")) {
            BigDecimal credits=notes.stream().filter(n->n.active()&&n.type().equals("Crédito")&&n.documentKey().equals(doc.key())&&(old==null||!n.key().equals(old.key()))).map(Note::total).reduce(BigDecimal.ZERO,BigDecimal::add);
            if(credits.add(value.base().add(value.base().multiply(doc.tax()).divide(doc.base(),2,RoundingMode.HALF_UP))).compareTo(doc.total())>0)throw new IllegalArgumentException("Los créditos acumulados no pueden superar el total original.");
        }
        BigDecimal calculatedTax=value.base().multiply(doc.tax()).divide(doc.base(),2,RoundingMode.HALF_UP);
        Note normalized=new Note(value.company(),value.type(),value.number(),value.date(),value.documentKey(),value.reason(),value.description(),value.lines(),value.active(),value.base(),calculatedTax);
        if(old==null)notes.add(normalized);
        else notes.set(notes.indexOf(old),normalized);
        audit(value.company(),old==null?"Alta":"Modificación",value.type()+" "+value.number(),old==null?"Nota registrada":"Total "+old.total()+" → "+value.total());
    }
    public synchronized void deactivateDocument(Document old,String reason) {
        checkReason(reason);
        if(!documents.contains(old))throw new IllegalArgumentException("El comprobante cambió. Actualiza el listado.");
        if(!old.active())throw new IllegalArgumentException("El comprobante ya está inactivo.");
        if(notes.stream().anyMatch(n->n.active()&&n.documentKey().equals(old.key())))throw new IllegalArgumentException("Hay notas activas vinculadas. No se puede desactivar el comprobante.");
        documents.set(documents.indexOf(old),new Document(old.company(),old.type(),old.number(),old.date(),old.client(),old.currency(),old.lines(),false));
        audit(old.company(),"Desactivación",old.toString(),reason);
    }
    public synchronized void deactivateNote(Note old,String reason) {
        checkReason(reason);
        if(!notes.contains(old))throw new IllegalArgumentException("La nota cambió. Actualiza el listado.");
        if(!old.active())throw new IllegalArgumentException("La nota ya está inactiva.");
        notes.set(notes.indexOf(old),new Note(old.company(),old.type(),old.number(),old.date(),old.documentKey(),old.reason(),old.description(),old.lines(),false));
        audit(old.company(),"Desactivación",old.toString(),reason);
    }
    private static void checkReason(String reason) {
        if(reason==null||reason.isBlank()||reason.length()>500)throw new IllegalArgumentException("Indica el motivo de desactivación.");
    }
    public synchronized String nextNumber(String company,String type,boolean note) {
        String prefix=note?(type.equals("Crédito")?"FC01":"E001"):(type.equals("Factura")?"E001":"B001");
        int max=0;
        List<String> numbers=note?notes(company).stream().filter(n->n.type().equals(type)).map(Note::number).toList():documents(company).stream().filter(d->d.type().equals(type)).map(Document::number).toList();
        for(String s:numbers)if(s.startsWith(prefix+"-"))max=Math.max(max,Integer.parseInt(s.substring(5)));
        if(max>=99999999)throw new IllegalArgumentException("Serie agotada.");
        return prefix+"-"+String.format("%08d",max+1);
    }
    public static String money(BigDecimal amount) {
        return String.format(Locale.US,"%,.2f",amount);
    }
    public static boolean matchesState(boolean active,String state) {
        return state.equals("Todos")||active==state.equals("Activos");
    }
    public synchronized ReportData report(String company,ReportSpec spec,Filter filter) {
        return reportProvider.query(company,spec,filter);
    }
    public synchronized ReportData reportPage(String company,ReportSpec spec,Filter filter,int page,int size) {
        return reportProvider.page(company,spec,filter,Math.multiplyExact(page,size),size);
    }
    private static void validateDateAndTotal(LocalDate date,BigDecimal total) {
        if(date==null||date.isAfter(LocalDate.now())||date.getYear()<1||date.getYear()>9999) throw new IllegalArgumentException("La fecha no puede ser futura y debe ser válida.");
        if(total.signum()<=0||total.compareTo(new BigDecimal("9999999999.99"))>0) throw new IllegalArgumentException("El total debe ser positivo y respetar el límite de 12 dígitos.");
    }
    public static List<Object[]> page(ReportData data,int page,int size) {
        if(size<1||page<0)throw new IllegalArgumentException("Página inválida.");
        int from=Math.min(data.rows().size(),page*size);
        return data.rows().subList(from,Math.min(data.rows().size(),from+size));
    }
    public static String csv(ReportData data) {
        StringBuilder out=new StringBuilder("\ufeff");
        out.append(Arrays.stream(data.columns()).map(AppModel::csvCell).collect(Collectors.joining(";"))).append("\r\n");
        for(Object[] row:data.rows())out.append(Arrays.stream(row).map(AppModel::csvCell).collect(Collectors.joining(";"))).append("\r\n");
        return out.toString();
    }
    private static String csvCell(Object value) {
        String s=String.valueOf(value);
        if(value instanceof String&&!s.isEmpty()&&"=+-@\t\r\n".indexOf(s.charAt(0))>=0)s="'"+s;
        return "\""+s.replace("\"","\"\"")+"\"";
    }
}
