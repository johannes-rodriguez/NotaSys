package model;
/** Transport boundary; implemented with PostgreSQL's native client. */
public interface SqlGateway {
    String execute(String sql);
    static String literal(String value) {
        if (value == null) return "NULL";
        if (value.indexOf(0) >= 0) throw new IllegalArgumentException("El texto contiene caracteres no permitidos.");
        return "'" + value.replace("'", "''") + "'";
    }
}
