package model;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

/** Prepares a new database once; existing NotaSys schemas are never overwritten. */
public final class DatabaseInitializer {
    private final SqlGateway maintenance;
    private final SqlGateway target;

    public DatabaseInitializer(SqlGateway maintenance, SqlGateway target) {
        this.maintenance = maintenance;
        this.target = target;
    }

    public void initialize(String database) {
        if (!database.matches("[a-zA-Z_][a-zA-Z0-9_]{0,62}")) {
            throw new IllegalArgumentException("Nombre de base inválido: usa letras, números y guion bajo.");
        }
        String exists = maintenance.execute(
            "SELECT EXISTS (SELECT 1 FROM pg_database WHERE datname='" + database + "');");
        if (!exists.equals("t")) {
            try {
                maintenance.execute("CREATE DATABASE \"" + database + "\";");
            } catch (IllegalArgumentException error) {
                if (!maintenance.execute("SELECT EXISTS (SELECT 1 FROM pg_database WHERE datname='"
                    + database + "');").equals("t")) {
                    throw error;
                }
            }
        }
        if (target.execute("SELECT EXISTS (SELECT 1 FROM pg_namespace WHERE nspname='notasys');").equals("t")) {
            return;
        }
        boolean originals = target.execute("SELECT to_regclass('public.emisor') IS NOT NULL;").equals("t");
        StringBuilder sql = new StringBuilder("BEGIN;\nSET LOCAL statement_timeout='120s';\n");
        for (String file : new String[] {"01_estructura.sql", "02_procedimientos.sql", "03_reportes.sql",
                originals ? "05_importar_entrega4.sql" : "04_datos.sql"}) {
            sql.append(script(file)).append('\n');
        }
        sql.append("COMMIT;\n");
        target.execute(sql.toString());
    }

    private String script(String name) {
        try (var input = DatabaseInitializer.class.getResourceAsStream("/db/" + name)) {
            if (input == null) {
                throw new IllegalArgumentException("Falta el recurso de instalación: " + name);
            }
            // Wrap every installation step in one transaction; preserve PL/pgSQL BEGIN blocks.
            return new String(input.readAllBytes(), StandardCharsets.UTF_8)
                .replaceAll("(?m)^BEGIN;\\s*$", "")
                .replaceAll("(?m)^COMMIT;\\s*$", "");
        } catch (IOException error) {
            throw new IllegalArgumentException("No se pudo leer el instalador de la base.", error);
        }
    }
}
