BEGIN;
SET search_path TO public;
SET default_table_access_method = 'heap';
CREATE TABLE IF NOT EXISTS emisor (
    ruc_emisor VARCHAR(11) NOT NULL,
    razon_social_emisor VARCHAR(150) NOT NULL,
    CONSTRAINT pk_emisor
        PRIMARY KEY (ruc_emisor),
    CONSTRAINT ck_emisor_ruc
        CHECK (
            char_length(ruc_emisor) = 11
            AND ruc_emisor !~ '[^0-9]'
        ),
    CONSTRAINT ck_emisor_razon_social
        CHECK (btrim(razon_social_emisor) <> '')
);




CREATE TABLE IF NOT EXISTS cliente (
    documento_cliente VARCHAR(11) NOT NULL,
    razon_social_cliente VARCHAR(150),
    CONSTRAINT pk_cliente
        PRIMARY KEY (documento_cliente),
    CONSTRAINT ck_cliente_documento
        CHECK (
            char_length(documento_cliente) IN (8, 11)
            AND documento_cliente !~ '[^0-9]'
        ),
    CONSTRAINT ck_cliente_razon_social
        CHECK (
            razon_social_cliente IS NULL
            OR btrim(razon_social_cliente) <> ''
        )
);
CREATE TABLE IF NOT EXISTS producto (
    codigo_producto VARCHAR(20) NOT NULL,
    descripcion VARCHAR(250) NOT NULL,
    unidad_medida VARCHAR(20),
    CONSTRAINT pk_producto
        PRIMARY KEY (codigo_producto),
    CONSTRAINT ck_producto_codigo
        CHECK (btrim(codigo_producto) <> ''),
    CONSTRAINT ck_producto_descripcion
        CHECK (btrim(descripcion) <> ''),
    CONSTRAINT ck_producto_unidad_medida
        CHECK (
            unidad_medida IS NULL
            OR btrim(unidad_medida) <> ''
        )
);
CREATE TABLE IF NOT EXISTS factura (
    serie VARCHAR(4) NOT NULL,
    correlativo VARCHAR(8) NOT NULL,
    ruc_emisor VARCHAR(11) NOT NULL,
    fecha_emision DATE NOT NULL,
    documento_cliente VARCHAR(11) NOT NULL,
    tipo_moneda VARCHAR(3) NOT NULL,
    valor_venta NUMERIC(12,2) NOT NULL,
    igv NUMERIC(12,2) NOT NULL,
    importe_total NUMERIC(12,2) NOT NULL,
    CONSTRAINT pk_factura
        PRIMARY KEY (serie, correlativo),
    CONSTRAINT fk_factura_emisor
        FOREIGN KEY (ruc_emisor)
        REFERENCES emisor (ruc_emisor),
    CONSTRAINT fk_factura_cliente
        FOREIGN KEY (documento_cliente)
        REFERENCES cliente (documento_cliente),
    CONSTRAINT ck_factura_serie
        CHECK (
            char_length(serie) = 4
            AND serie ~ '^E[A-Z0-9]{3}$'
        ),
    CONSTRAINT ck_factura_correlativo
        CHECK (
            char_length(correlativo) BETWEEN 1 AND 8
            AND correlativo !~ '[^0-9]'
        ),
    CONSTRAINT ck_factura_fecha_emision
        CHECK (
            fecha_emision BETWEEN
            DATE '0001-01-01' AND DATE '9999-12-31'
        ),
    CONSTRAINT ck_factura_tipo_moneda
        CHECK (tipo_moneda IN ('PEN', 'USD')),
    CONSTRAINT ck_factura_valor_venta
        CHECK (
            valor_venta BETWEEN 0 AND 9999999999.99
        ),




    CONSTRAINT ck_factura_igv
        CHECK (
            igv BETWEEN 0 AND 9999999999.99
        ),
    CONSTRAINT ck_factura_importe_total
        CHECK (
            importe_total BETWEEN 0 AND 9999999999.99
            AND importe_total = valor_venta + igv
        )
);
CREATE TABLE IF NOT EXISTS boleta (
    serie VARCHAR(4) NOT NULL,
    correlativo VARCHAR(8) NOT NULL,
    ruc_emisor VARCHAR(11) NOT NULL,
    fecha_emision DATE NOT NULL,
    documento_cliente VARCHAR(11),
    tipo_moneda VARCHAR(3) NOT NULL,
    valor_venta NUMERIC(12,2) NOT NULL,
    igv NUMERIC(12,2) NOT NULL,
    importe_total NUMERIC(12,2) NOT NULL,
    CONSTRAINT pk_boleta
        PRIMARY KEY (serie, correlativo),
    CONSTRAINT fk_boleta_emisor
        FOREIGN KEY (ruc_emisor)
        REFERENCES emisor (ruc_emisor),
    CONSTRAINT fk_boleta_cliente
        FOREIGN KEY (documento_cliente)
        REFERENCES cliente (documento_cliente),
    CONSTRAINT ck_boleta_serie
        CHECK (
            char_length(serie) = 4
            AND serie ~ '^B[A-Z0-9]{3}$'
        ),
    CONSTRAINT ck_boleta_correlativo
        CHECK (
            char_length(correlativo) BETWEEN 1 AND 8
            AND correlativo !~ '[^0-9]'
        ),
    CONSTRAINT ck_boleta_fecha_emision
        CHECK (
            fecha_emision BETWEEN
            DATE '0001-01-01' AND DATE '9999-12-31'
        ),
    CONSTRAINT ck_boleta_tipo_moneda
        CHECK (tipo_moneda IN ('PEN', 'USD')),
    CONSTRAINT ck_boleta_valor_venta
        CHECK (
            valor_venta BETWEEN 0 AND 9999999999.99
        ),
    CONSTRAINT ck_boleta_igv
        CHECK (
            igv BETWEEN 0 AND 9999999999.99
        ),




    CONSTRAINT ck_boleta_importe_total
        CHECK (
            importe_total BETWEEN 0 AND 9999999999.99
            AND importe_total = valor_venta + igv
        )
);
CREATE TABLE IF NOT EXISTS nota_credito (
    serie VARCHAR(4) NOT NULL,
    correlativo VARCHAR(8) NOT NULL,
    ruc_emisor VARCHAR(11) NOT NULL,
    fecha_emision DATE NOT NULL,
    documento_cliente VARCHAR(11) NOT NULL,
    moneda VARCHAR(3) NOT NULL,
    motivo VARCHAR(200) NOT NULL,
    descripcion_ajuste VARCHAR(500) NOT NULL,
    serie_factura VARCHAR(4),
    correlativo_factura VARCHAR(8),
    serie_boleta VARCHAR(4),
    correlativo_boleta VARCHAR(8),
    valor_venta NUMERIC(12,2) NOT NULL,
    igv NUMERIC(12,2) NOT NULL,
    importe_total NUMERIC(12,2) NOT NULL,
    CONSTRAINT pk_nota_credito
        PRIMARY KEY (serie, correlativo),
    CONSTRAINT fk_nota_credito_emisor
        FOREIGN KEY (ruc_emisor)
        REFERENCES emisor (ruc_emisor),
    CONSTRAINT fk_nota_credito_cliente
        FOREIGN KEY (documento_cliente)
        REFERENCES cliente (documento_cliente),
    CONSTRAINT fk_nota_credito_factura
        FOREIGN KEY (serie_factura, correlativo_factura)
        REFERENCES factura (serie, correlativo)
        MATCH FULL,
    CONSTRAINT fk_nota_credito_boleta
        FOREIGN KEY (serie_boleta, correlativo_boleta)
        REFERENCES boleta (serie, correlativo)
        MATCH FULL,
    CONSTRAINT ck_nota_credito_serie
        CHECK (
            char_length(serie) = 4
            AND btrim(serie) <> ''
        ),
    CONSTRAINT ck_nota_credito_correlativo
        CHECK (
            char_length(correlativo) BETWEEN 1 AND 8
            AND correlativo !~ '[^0-9]'
        ),
    CONSTRAINT ck_nota_credito_fecha_emision
        CHECK (
            fecha_emision BETWEEN
            DATE '0001-01-01' AND DATE '9999-12-31'
        ),
    CONSTRAINT ck_nota_credito_moneda
        CHECK (moneda IN ('PEN', 'USD')),
    CONSTRAINT ck_nota_credito_motivo
        CHECK (btrim(motivo) <> ''),
    CONSTRAINT ck_nota_credito_descripcion_ajuste
        CHECK (btrim(descripcion_ajuste) <> ''),
    CONSTRAINT ck_nota_credito_valor_venta
        CHECK (
            valor_venta BETWEEN 0 AND 9999999999.99
        ),
    CONSTRAINT ck_nota_credito_igv
        CHECK (
            igv BETWEEN 0 AND 9999999999.99
        ),
    CONSTRAINT ck_nota_credito_importe_total
        CHECK (
            importe_total BETWEEN 0 AND 9999999999.99
            AND importe_total = valor_venta + igv
        )
);
CREATE TABLE IF NOT EXISTS nota_debito (
    serie VARCHAR(4) NOT NULL,
    correlativo VARCHAR(8) NOT NULL,
    ruc_emisor VARCHAR(11) NOT NULL,
    fecha_emision DATE NOT NULL,
    documento_cliente VARCHAR(11) NOT NULL,
    moneda VARCHAR(5) NOT NULL,
    motivo VARCHAR(200) NOT NULL,
    descripcion_ajuste VARCHAR(500) NOT NULL,
    serie_factura VARCHAR(4),
    correlativo_factura VARCHAR(8),
    serie_boleta VARCHAR(4),
    correlativo_boleta VARCHAR(8),
    valor_venta NUMERIC(12,2) NOT NULL,
    igv NUMERIC(12,2) NOT NULL,
    importe_total NUMERIC(12,2) NOT NULL,
    CONSTRAINT pk_nota_debito
        PRIMARY KEY (serie, correlativo),
    CONSTRAINT fk_nota_debito_emisor
        FOREIGN KEY (ruc_emisor)
        REFERENCES emisor (ruc_emisor),
    CONSTRAINT fk_nota_debito_cliente
        FOREIGN KEY (documento_cliente)
        REFERENCES cliente (documento_cliente),
    CONSTRAINT fk_nota_debito_factura
        FOREIGN KEY (serie_factura, correlativo_factura)
        REFERENCES factura (serie, correlativo)
        MATCH FULL,
    CONSTRAINT fk_nota_debito_boleta
        FOREIGN KEY (serie_boleta, correlativo_boleta)
        REFERENCES boleta (serie, correlativo)
        MATCH FULL,
    CONSTRAINT ck_nota_debito_serie
        CHECK (
            char_length(serie) = 4
            AND serie ~ '^E[A-Z0-9]{3}$'
        ),
    CONSTRAINT ck_nota_debito_correlativo
        CHECK (
            char_length(correlativo) BETWEEN 1 AND 8
            AND correlativo !~ '[^0-9]'
        ),
    CONSTRAINT ck_nota_debito_fecha_emision
        CHECK (
            fecha_emision BETWEEN
            DATE '0001-01-01' AND DATE '9999-12-31'
        ),
    CONSTRAINT ck_nota_debito_moneda
        CHECK (moneda IN ('PEN', 'USD')),
    CONSTRAINT ck_nota_debito_motivo
        CHECK (btrim(motivo) <> ''),
    CONSTRAINT ck_nota_debito_descripcion_ajuste
        CHECK (btrim(descripcion_ajuste) <> ''),
    CONSTRAINT ck_nota_debito_valor_venta
        CHECK (
            valor_venta BETWEEN 0 AND 9999999999.99
        ),
    CONSTRAINT ck_nota_debito_igv
        CHECK (
            igv BETWEEN 0 AND 9999999999.99
        ),
    CONSTRAINT ck_nota_debito_importe_total
        CHECK (
            importe_total BETWEEN 0 AND 9999999999.99
            AND importe_total = valor_venta + igv
        )
);
CREATE TABLE IF NOT EXISTS detalle_factura (
    serie VARCHAR(4) NOT NULL,
    correlativo VARCHAR(8) NOT NULL,
    codigo_producto VARCHAR(20) NOT NULL,
    cantidad NUMERIC(12,4) NOT NULL,
    valor_unitario NUMERIC(12,4) NOT NULL,
    CONSTRAINT pk_detalle_factura
        PRIMARY KEY (serie, correlativo, codigo_producto),
    CONSTRAINT fk_detalle_factura_factura
        FOREIGN KEY (serie, correlativo)
        REFERENCES factura (serie, correlativo),
    CONSTRAINT fk_detalle_factura_producto
        FOREIGN KEY (codigo_producto)
        REFERENCES producto (codigo_producto),
    CONSTRAINT ck_detalle_factura_cantidad
        CHECK (
            cantidad > 0
            AND cantidad <= 99999999.9999
        ),
    CONSTRAINT ck_detalle_factura_valor_unitario
        CHECK (
            valor_unitario >= 0
            AND valor_unitario <= 99999999.9999
        )
);
CREATE TABLE IF NOT EXISTS detalle_boleta (
    serie VARCHAR(4) NOT NULL,
    correlativo VARCHAR(8) NOT NULL,
    codigo_producto VARCHAR(20) NOT NULL,
    cantidad NUMERIC(12,4) NOT NULL,
    valor_unitario NUMERIC(12,4) NOT NULL,
    CONSTRAINT pk_detalle_boleta
        PRIMARY KEY (serie, correlativo, codigo_producto),
    CONSTRAINT fk_detalle_boleta_boleta
        FOREIGN KEY (serie, correlativo)
        REFERENCES boleta (serie, correlativo),
    CONSTRAINT fk_detalle_boleta_producto
        FOREIGN KEY (codigo_producto)
        REFERENCES producto (codigo_producto),
    CONSTRAINT ck_detalle_boleta_cantidad
        CHECK (
            cantidad > 0
            AND cantidad <= 99999999.9999
        ),
    CONSTRAINT ck_detalle_boleta_valor_unitario
        CHECK (
            valor_unitario >= 0
            AND valor_unitario <= 99999999.9999
        )
);
CREATE TABLE IF NOT EXISTS detalle_nota_credito (
    serie VARCHAR(4) NOT NULL,
    correlativo VARCHAR(8) NOT NULL,
    codigo_producto VARCHAR(20) NOT NULL,
    cantidad NUMERIC(12,4) NOT NULL,
    valor_unitario NUMERIC(12,4) NOT NULL,
    CONSTRAINT pk_detalle_nota_credito
        PRIMARY KEY (serie, correlativo, codigo_producto),
    CONSTRAINT fk_detalle_nota_credito_nota
        FOREIGN KEY (serie, correlativo)
        REFERENCES nota_credito (serie, correlativo),
    CONSTRAINT fk_detalle_nota_credito_producto
        FOREIGN KEY (codigo_producto)
        REFERENCES producto (codigo_producto),
    CONSTRAINT ck_detalle_nota_credito_cantidad
        CHECK (
            cantidad > 0
            AND cantidad <= 99999999.9999
        ),
    CONSTRAINT ck_detalle_nota_credito_valor_unitario
        CHECK (
            valor_unitario >= 0
            AND valor_unitario <= 99999999.9999
        )
);
CREATE TABLE IF NOT EXISTS detalle_nota_debito (
    serie VARCHAR(4) NOT NULL,
    correlativo VARCHAR(8) NOT NULL,
    codigo_producto VARCHAR(20) NOT NULL,
    cantidad NUMERIC(12,4) NOT NULL,
    valor_unitario NUMERIC(12,4) NOT NULL,
    CONSTRAINT pk_detalle_nota_debito
        PRIMARY KEY (serie, correlativo, codigo_producto),
    CONSTRAINT fk_detalle_nota_debito_nota
        FOREIGN KEY (serie, correlativo)
        REFERENCES nota_debito (serie, correlativo),
    CONSTRAINT fk_detalle_nota_debito_producto
        FOREIGN KEY (codigo_producto)
        REFERENCES producto (codigo_producto),
    CONSTRAINT ck_detalle_nota_debito_cantidad
        CHECK (
            cantidad > 0
            AND cantidad <= 99999999.9999
        ),
    CONSTRAINT ck_detalle_nota_debito_valor_unitario
        CHECK (
            valor_unitario >= 0
            AND valor_unitario <= 99999999.9999
        )
);


CREATE OR REPLACE FUNCTION validar_nombre_cliente()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
    nombre VARCHAR(150);
BEGIN
    SELECT razon_social_cliente
    INTO nombre
    FROM cliente
    WHERE documento_cliente = NEW.documento_cliente
    FOR SHARE;
    IF nombre IS NULL OR btrim(nombre) = '' THEN
        RAISE EXCEPTION
            'El cliente debe tener nombre para usarse en facturas o notas.';
    END IF;
    RETURN NEW;
END;
$$;


CREATE OR REPLACE TRIGGER tr_factura_nombre
BEFORE INSERT OR UPDATE ON factura
FOR EACH ROW
EXECUTE FUNCTION validar_nombre_cliente();


CREATE OR REPLACE TRIGGER tr_nc_nombre
BEFORE INSERT OR UPDATE ON nota_credito
FOR EACH ROW
EXECUTE FUNCTION validar_nombre_cliente();
CREATE OR REPLACE TRIGGER tr_nd_nombre
BEFORE INSERT OR UPDATE ON nota_debito
FOR EACH ROW
EXECUTE FUNCTION validar_nombre_cliente();
CREATE OR REPLACE FUNCTION proteger_nombre_cliente()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.razon_social_cliente IS NULL
       OR btrim(NEW.razon_social_cliente) = '' THEN
        IF EXISTS (
            SELECT 1
            FROM factura
            WHERE documento_cliente = OLD.documento_cliente
        )
        OR EXISTS (
            SELECT 1
            FROM nota_credito
            WHERE documento_cliente = OLD.documento_cliente
        )
        OR EXISTS (
            SELECT 1
            FROM nota_debito
            WHERE documento_cliente = OLD.documento_cliente
        ) THEN
            RAISE EXCEPTION
                'No se puede quitar el nombre de un cliente usado en facturas o notas.';
        END IF;
    END IF;
    RETURN NEW;
END;
$$;




CREATE OR REPLACE TRIGGER tr_cliente_nombre
BEFORE UPDATE ON cliente
FOR EACH ROW
EXECUTE FUNCTION proteger_nombre_cliente();
CREATE OR REPLACE FUNCTION validar_unidad_producto()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
    unidad VARCHAR(20);
BEGIN
    SELECT unidad_medida
    INTO unidad
    FROM producto
    WHERE codigo_producto = NEW.codigo_producto
    FOR SHARE;


    IF unidad IS NULL OR btrim(unidad) = '' THEN
        RAISE EXCEPTION
            'El producto debe tener unidad de medida para usarse en notas.';
    END IF;


    RETURN NEW;
END;
$$;


CREATE OR REPLACE TRIGGER tr_dnc_unidad
BEFORE INSERT OR UPDATE ON detalle_nota_credito
FOR EACH ROW
EXECUTE FUNCTION validar_unidad_producto();


CREATE OR REPLACE TRIGGER tr_dnd_unidad
BEFORE INSERT OR UPDATE ON detalle_nota_debito
FOR EACH ROW
EXECUTE FUNCTION validar_unidad_producto();


CREATE OR REPLACE FUNCTION proteger_unidad_producto()
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.unidad_medida IS NULL
       OR btrim(NEW.unidad_medida) = '' THEN


        IF EXISTS (
            SELECT 1
            FROM detalle_nota_credito
            WHERE codigo_producto = OLD.codigo_producto
        )
        OR EXISTS (
            SELECT 1
            FROM detalle_nota_debito
            WHERE codigo_producto = OLD.codigo_producto
        ) THEN
            RAISE EXCEPTION
                'No se puede quitar la unidad de un producto usado en notas.';
        END IF;
    END IF;
    RETURN NEW;
END;
$$;


CREATE OR REPLACE TRIGGER tr_producto_unidad
BEFORE UPDATE ON producto
FOR EACH ROW
EXECUTE FUNCTION proteger_unidad_producto();


CREATE INDEX IF NOT EXISTS idx_nc_factura
    ON nota_credito USING btree (
        serie_factura,
        correlativo_factura
    );


CREATE INDEX IF NOT EXISTS idx_nc_boleta
    ON nota_credito USING btree (
        serie_boleta,
        correlativo_boleta
    );


CREATE INDEX IF NOT EXISTS idx_nd_factura
    ON nota_debito USING btree (
        serie_factura,
        correlativo_factura
    );


CREATE INDEX IF NOT EXISTS idx_nd_boleta
    ON nota_debito USING btree (
        serie_boleta,
        correlativo_boleta
    );


CREATE INDEX IF NOT EXISTS idx_nc_fecha_emision
    ON nota_credito USING btree (
        fecha_emision
    );


CREATE INDEX IF NOT EXISTS idx_nd_fecha_emision
    ON nota_debito USING btree (
        fecha_emision
    );


ALTER TABLE emisor
    CLUSTER ON pk_emisor;
ALTER TABLE cliente
    CLUSTER ON pk_cliente;
ALTER TABLE producto
    CLUSTER ON pk_producto;
COMMIT;

