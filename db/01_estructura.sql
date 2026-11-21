BEGIN;
CREATE SCHEMA notasys;
SET search_path TO notasys, public;
SET default_table_access_method = 'heap';
CREATE TABLE emisor (
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




CREATE TABLE cliente (
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
CREATE TABLE producto (
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
CREATE TABLE factura (
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
        PRIMARY KEY (ruc_emisor, serie, correlativo),
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
CREATE TABLE boleta (
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
        PRIMARY KEY (ruc_emisor, serie, correlativo),
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
CREATE TABLE nota_credito (
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
        PRIMARY KEY (ruc_emisor, serie, correlativo),
    CONSTRAINT fk_nota_credito_emisor
        FOREIGN KEY (ruc_emisor)
        REFERENCES emisor (ruc_emisor),
    CONSTRAINT fk_nota_credito_cliente
        FOREIGN KEY (documento_cliente)
        REFERENCES cliente (documento_cliente),
    CONSTRAINT fk_nota_credito_factura
        FOREIGN KEY (ruc_emisor, serie_factura, correlativo_factura)
        REFERENCES factura (ruc_emisor, serie, correlativo)
        MATCH SIMPLE,
    CONSTRAINT fk_nota_credito_boleta
        FOREIGN KEY (ruc_emisor, serie_boleta, correlativo_boleta)
        REFERENCES boleta (ruc_emisor, serie, correlativo)
        MATCH SIMPLE,
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
CREATE TABLE nota_debito (
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
        PRIMARY KEY (ruc_emisor, serie, correlativo),
    CONSTRAINT fk_nota_debito_emisor
        FOREIGN KEY (ruc_emisor)
        REFERENCES emisor (ruc_emisor),
    CONSTRAINT fk_nota_debito_cliente
        FOREIGN KEY (documento_cliente)
        REFERENCES cliente (documento_cliente),
    CONSTRAINT fk_nota_debito_factura
        FOREIGN KEY (ruc_emisor, serie_factura, correlativo_factura)
        REFERENCES factura (ruc_emisor, serie, correlativo)
        MATCH SIMPLE,
    CONSTRAINT fk_nota_debito_boleta
        FOREIGN KEY (ruc_emisor, serie_boleta, correlativo_boleta)
        REFERENCES boleta (ruc_emisor, serie, correlativo)
        MATCH SIMPLE,
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
CREATE TABLE detalle_factura (
    ruc_emisor VARCHAR(11) NOT NULL,
    descripcion_historica VARCHAR(250) NOT NULL,
    serie VARCHAR(4) NOT NULL,
    correlativo VARCHAR(8) NOT NULL,
    codigo_producto VARCHAR(20) NOT NULL,
    cantidad NUMERIC(12,4) NOT NULL,
    valor_unitario NUMERIC(12,4) NOT NULL,
    CONSTRAINT pk_detalle_factura
        PRIMARY KEY (ruc_emisor, serie, correlativo, codigo_producto),
    CONSTRAINT fk_detalle_factura_factura
        FOREIGN KEY (ruc_emisor, serie, correlativo)
        REFERENCES factura (ruc_emisor, serie, correlativo),
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
CREATE TABLE detalle_boleta (
    ruc_emisor VARCHAR(11) NOT NULL,
    descripcion_historica VARCHAR(250) NOT NULL,
    serie VARCHAR(4) NOT NULL,
    correlativo VARCHAR(8) NOT NULL,
    codigo_producto VARCHAR(20) NOT NULL,
    cantidad NUMERIC(12,4) NOT NULL,
    valor_unitario NUMERIC(12,4) NOT NULL,
    CONSTRAINT pk_detalle_boleta
        PRIMARY KEY (ruc_emisor, serie, correlativo, codigo_producto),
    CONSTRAINT fk_detalle_boleta_boleta
        FOREIGN KEY (ruc_emisor, serie, correlativo)
        REFERENCES boleta (ruc_emisor, serie, correlativo),
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
CREATE TABLE detalle_nota_credito (
    ruc_emisor VARCHAR(11) NOT NULL,
    descripcion_historica VARCHAR(250) NOT NULL,
    serie VARCHAR(4) NOT NULL,
    correlativo VARCHAR(8) NOT NULL,
    codigo_producto VARCHAR(20) NOT NULL,
    cantidad NUMERIC(12,4) NOT NULL,
    valor_unitario NUMERIC(12,4) NOT NULL,
    CONSTRAINT pk_detalle_nota_credito
        PRIMARY KEY (ruc_emisor, serie, correlativo, codigo_producto),
    CONSTRAINT fk_detalle_nota_credito_nota
        FOREIGN KEY (ruc_emisor, serie, correlativo)
        REFERENCES nota_credito (ruc_emisor, serie, correlativo),
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
CREATE TABLE detalle_nota_debito (
    ruc_emisor VARCHAR(11) NOT NULL,
    descripcion_historica VARCHAR(250) NOT NULL,
    serie VARCHAR(4) NOT NULL,
    correlativo VARCHAR(8) NOT NULL,
    codigo_producto VARCHAR(20) NOT NULL,
    cantidad NUMERIC(12,4) NOT NULL,
    valor_unitario NUMERIC(12,4) NOT NULL,
    CONSTRAINT pk_detalle_nota_debito
        PRIMARY KEY (ruc_emisor, serie, correlativo, codigo_producto),
    CONSTRAINT fk_detalle_nota_debito_nota
        FOREIGN KEY (ruc_emisor, serie, correlativo)
        REFERENCES nota_debito (ruc_emisor, serie, correlativo),
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
LANGUAGE plpgsql SET search_path TO notasys, public
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
LANGUAGE plpgsql SET search_path TO notasys, public
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
LANGUAGE plpgsql SET search_path TO notasys, public
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
LANGUAGE plpgsql SET search_path TO notasys, public
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



ALTER TABLE emisor ADD COLUMN activo BOOLEAN NOT NULL DEFAULT TRUE, ADD COLUMN version BIGINT NOT NULL DEFAULT 1;

ALTER TABLE cliente ADD COLUMN activo BOOLEAN NOT NULL DEFAULT TRUE, ADD COLUMN version BIGINT NOT NULL DEFAULT 1;

ALTER TABLE producto ADD COLUMN activo BOOLEAN NOT NULL DEFAULT TRUE, ADD COLUMN version BIGINT NOT NULL DEFAULT 1;

ALTER TABLE factura ADD COLUMN activo BOOLEAN NOT NULL DEFAULT TRUE, ADD COLUMN version BIGINT NOT NULL DEFAULT 1;

ALTER TABLE boleta ADD COLUMN activo BOOLEAN NOT NULL DEFAULT TRUE, ADD COLUMN version BIGINT NOT NULL DEFAULT 1;

ALTER TABLE nota_credito ADD COLUMN activo BOOLEAN NOT NULL DEFAULT TRUE, ADD COLUMN version BIGINT NOT NULL DEFAULT 1;

ALTER TABLE nota_debito ADD COLUMN activo BOOLEAN NOT NULL DEFAULT TRUE, ADD COLUMN version BIGINT NOT NULL DEFAULT 1;
ALTER TABLE factura ADD CONSTRAINT ck_factura_positivo CHECK (correlativo ~ '^[0-9]{8}$' AND correlativo::int > 0);
ALTER TABLE boleta ADD CONSTRAINT ck_boleta_positivo CHECK (correlativo ~ '^[0-9]{8}$' AND correlativo::int > 0);
ALTER TABLE nota_credito ADD CONSTRAINT ck_nota_credito_positivo CHECK (correlativo ~ '^[0-9]{8}$' AND correlativo::int > 0);
ALTER TABLE nota_debito ADD CONSTRAINT ck_nota_debito_positivo CHECK (correlativo ~ '^[0-9]{8}$' AND correlativo::int > 0);
ALTER TABLE nota_credito ADD CONSTRAINT ck_nota_credito_origen CHECK (
        (serie_factura IS NOT NULL AND correlativo_factura IS NOT NULL AND serie_boleta IS NULL AND correlativo_boleta IS NULL)
        OR (serie_boleta IS NOT NULL AND correlativo_boleta IS NOT NULL AND serie_factura IS NULL AND correlativo_factura IS NULL));
ALTER TABLE nota_debito ADD CONSTRAINT ck_nota_debito_origen CHECK (
        (serie_factura IS NOT NULL AND correlativo_factura IS NOT NULL AND serie_boleta IS NULL AND correlativo_boleta IS NULL)
        OR (serie_boleta IS NOT NULL AND correlativo_boleta IS NOT NULL AND serie_factura IS NULL AND correlativo_factura IS NULL));

CREATE TABLE historial_cambios (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fecha TIMESTAMP NOT NULL DEFAULT localtimestamp,
    empresa VARCHAR(11),
    usuario TEXT NOT NULL DEFAULT current_user,
    accion TEXT NOT NULL,
    tabla TEXT NOT NULL,
    clave TEXT NOT NULL,
    motivo TEXT NOT NULL DEFAULT '',
    anterior JSONB,
    nuevo JSONB
);
CREATE INDEX ix_historial_empresa_fecha ON historial_cambios(empresa, fecha DESC);

CREATE FUNCTION ns_auditar() RETURNS trigger LANGUAGE plpgsql SET search_path TO notasys, public AS $$
DECLARE a JSONB; b JSONB;
BEGIN
    a := CASE WHEN TG_OP = 'INSERT' THEN NULL ELSE to_jsonb(OLD) END;
    b := CASE WHEN TG_OP = 'DELETE' THEN NULL ELSE to_jsonb(NEW) END;
    INSERT INTO historial_cambios(empresa, accion, tabla, clave, motivo, anterior, nuevo)
    VALUES (coalesce(b->>'ruc_emisor', a->>'ruc_emisor', nullif(current_setting('notasys.empresa',true),'')),
        TG_OP, TG_TABLE_NAME,
        coalesce(b->>'serie',a->>'serie','') || coalesce('-'||(b->>'correlativo'),'-'||(a->>'correlativo'), '') ||
        coalesce(b->>'documento_cliente',a->>'documento_cliente',b->>'codigo_producto',a->>'codigo_producto',''),
        coalesce(current_setting('notasys.motivo',true),''), a,b);
    RETURN coalesce(NEW,OLD);
END $$;

CREATE FUNCTION ns_proteger_cabecera() RETURNS trigger LANGUAGE plpgsql SET search_path TO notasys, public AS $$
DECLARE doc RECORD; nt TEXT; oldj JSONB; newj JSONB;
BEGIN
    IF TG_OP = 'DELETE' THEN RAISE EXCEPTION 'Utilice la desactivación; el borrado físico está bloqueado.'; END IF;
    IF NEW.fecha_emision > current_date THEN RAISE EXCEPTION 'La fecha no puede ser futura.'; END IF;
    IF TG_OP = 'UPDATE' THEN
        IF (NEW.ruc_emisor,NEW.serie,NEW.correlativo) IS DISTINCT FROM (OLD.ruc_emisor,OLD.serie,OLD.correlativo)
            THEN RAISE EXCEPTION 'La identidad del documento es inmutable.'; END IF;
        IF NOT OLD.activo THEN RAISE EXCEPTION 'El documento está inactivo.'; END IF;
    END IF;
    IF NEW.activo AND NOT EXISTS(SELECT 1 FROM emisor WHERE ruc_emisor=NEW.ruc_emisor AND activo)
        THEN RAISE EXCEPTION 'El emisor no está activo.'; END IF;
    IF TG_TABLE_NAME IN ('factura','boleta') THEN
        IF TG_TABLE_NAME='factura' AND length(NEW.documento_cliente)<>11 THEN RAISE EXCEPTION 'La factura requiere cliente con RUC de 11 dígitos.'; END IF;
        IF TG_OP='UPDATE' AND (
            EXISTS(SELECT 1 FROM nota_credito WHERE ruc_emisor=NEW.ruc_emisor AND
                ((TG_TABLE_NAME='factura' AND (serie_factura,correlativo_factura)=(NEW.serie,NEW.correlativo)) OR
                 (TG_TABLE_NAME='boleta' AND (serie_boleta,correlativo_boleta)=(NEW.serie,NEW.correlativo))) AND (NEW.activo OR activo)) OR
            EXISTS(SELECT 1 FROM nota_debito WHERE ruc_emisor=NEW.ruc_emisor AND
                ((TG_TABLE_NAME='factura' AND (serie_factura,correlativo_factura)=(NEW.serie,NEW.correlativo)) OR
                 (TG_TABLE_NAME='boleta' AND (serie_boleta,correlativo_boleta)=(NEW.serie,NEW.correlativo))) AND (NEW.activo OR activo)))
            THEN RAISE EXCEPTION 'El comprobante tiene notas vinculadas; no se permite esta modificación.'; END IF;
    ELSE
        nt := CASE WHEN NEW.serie_factura IS NOT NULL THEN 'factura' ELSE 'boleta' END;
        EXECUTE format('SELECT * FROM notasys.%I WHERE ruc_emisor=$1 AND serie=$2 AND correlativo=$3 FOR UPDATE',nt)
            INTO doc USING NEW.ruc_emisor,coalesce(NEW.serie_factura,NEW.serie_boleta),coalesce(NEW.correlativo_factura,NEW.correlativo_boleta);
        IF doc IS NULL OR NOT doc.activo THEN RAISE EXCEPTION 'El comprobante original no existe o está inactivo.'; END IF;
        IF NEW.fecha_emision < doc.fecha_emision OR NEW.moneda<>doc.tipo_moneda OR NEW.documento_cliente IS DISTINCT FROM doc.documento_cliente
            THEN RAISE EXCEPTION 'Fecha, cliente o moneda no corresponden al comprobante original.'; END IF;
        IF TG_OP='UPDATE' AND (NEW.serie_factura,NEW.correlativo_factura,NEW.serie_boleta,NEW.correlativo_boleta)
            IS DISTINCT FROM (OLD.serie_factura,OLD.correlativo_factura,OLD.serie_boleta,OLD.correlativo_boleta)
            THEN RAISE EXCEPTION 'No puede cambiarse el comprobante de una nota existente.'; END IF;
    END IF;
    IF NEW.activo AND NEW.documento_cliente IS NOT NULL AND NOT EXISTS(SELECT 1 FROM cliente WHERE documento_cliente=NEW.documento_cliente AND activo)
        THEN RAISE EXCEPTION 'El cliente no está activo.'; END IF;
    RETURN NEW;
END $$;

-- Deferred validation checks the complete header/detail transaction, never a partial form.
CREATE FUNCTION ns_validar_documento() RETURNS trigger LANGUAGE plpgsql SET search_path TO notasys, public AS $$
DECLARE t TEXT; h RECORD; l RECORD; orig RECORD; base NUMERIC; tax NUMERIC; used NUMERIC; returned NUMERIC; max_total NUMERIC; src TEXT; target RECORD;
BEGIN
    target:=CASE WHEN TG_OP='DELETE' THEN OLD ELSE NEW END;
    t := replace(TG_TABLE_NAME,'detalle_','');
    EXECUTE format('SELECT * FROM notasys.%I WHERE ruc_emisor=$1 AND serie=$2 AND correlativo=$3',t)
        INTO h USING target.ruc_emisor,target.serie,target.correlativo;
    IF h IS NULL THEN RETURN NULL; END IF;
    EXECUTE format('SELECT sum(round(cantidad*valor_unitario,2)) FROM notasys.detalle_%I WHERE ruc_emisor=$1 AND serie=$2 AND correlativo=$3',t)
        INTO base USING h.ruc_emisor,h.serie,h.correlativo;
    IF base IS NULL OR base<=0 OR h.valor_venta<>base OR h.importe_total<>h.valor_venta+h.igv
        THEN RAISE EXCEPTION 'Cabecera y detalle inconsistentes, vacíos o sin importe positivo.'; END IF;
    IF t IN ('nota_credito','nota_debito') THEN
        src := CASE WHEN h.serie_factura IS NOT NULL THEN 'factura' ELSE 'boleta' END;
        EXECUTE format('SELECT * FROM notasys.%I WHERE ruc_emisor=$1 AND serie=$2 AND correlativo=$3 FOR UPDATE',src)
            INTO orig USING h.ruc_emisor,coalesce(h.serie_factura,h.serie_boleta),coalesce(h.correlativo_factura,h.correlativo_boleta);
        -- Preserve the original effective tax rate instead of reading today's catalog.
        max_total:=orig.importe_total;
        tax := round(base * orig.igv / nullif(orig.valor_venta,0),2);
        IF h.igv IS DISTINCT FROM tax THEN RAISE EXCEPTION 'El IGV de la nota no corresponde al comprobante original.'; END IF;
        FOR l IN EXECUTE format('SELECT * FROM notasys.detalle_%I WHERE ruc_emisor=$1 AND serie=$2 AND correlativo=$3',t)
            USING h.ruc_emisor,h.serie,h.correlativo LOOP
            EXECUTE format('SELECT * FROM notasys.detalle_%I WHERE ruc_emisor=$1 AND serie=$2 AND correlativo=$3 AND codigo_producto=$4',src)
                INTO orig USING h.ruc_emisor,coalesce(h.serie_factura,h.serie_boleta),coalesce(h.correlativo_factura,h.correlativo_boleta),l.codigo_producto;
            IF orig IS NULL THEN RAISE EXCEPTION 'El producto % no pertenece al comprobante original.',l.codigo_producto; END IF;
            IF t='nota_credito' AND h.activo THEN
                SELECT coalesce(sum(round(d.cantidad*d.valor_unitario,2)),0),
                    coalesce(sum(CASE WHEN n.motivo IN ('Devolución parcial','Anulación total') THEN d.cantidad ELSE 0 END),0)
                    INTO used,returned FROM nota_credito n JOIN detalle_nota_credito d USING(ruc_emisor,serie,correlativo)
                    WHERE n.ruc_emisor=h.ruc_emisor AND n.activo AND d.codigo_producto=l.codigo_producto
                    AND n.serie_factura IS NOT DISTINCT FROM h.serie_factura AND n.correlativo_factura IS NOT DISTINCT FROM h.correlativo_factura
                    AND n.serie_boleta IS NOT DISTINCT FROM h.serie_boleta AND n.correlativo_boleta IS NOT DISTINCT FROM h.correlativo_boleta;
                IF used>round(orig.cantidad*orig.valor_unitario,2) OR l.cantidad>orig.cantidad OR returned>orig.cantidad
                    THEN RAISE EXCEPTION 'Se supera el saldo o cantidad del artículo %.',l.codigo_producto; END IF;
            END IF;
        END LOOP;
        IF t='nota_credito' AND h.activo THEN
            SELECT coalesce(sum(importe_total),0) INTO used FROM nota_credito n WHERE n.ruc_emisor=h.ruc_emisor AND n.activo
                AND n.serie_factura IS NOT DISTINCT FROM h.serie_factura AND n.correlativo_factura IS NOT DISTINCT FROM h.correlativo_factura
                AND n.serie_boleta IS NOT DISTINCT FROM h.serie_boleta AND n.correlativo_boleta IS NOT DISTINCT FROM h.correlativo_boleta;
            IF used>max_total THEN RAISE EXCEPTION 'El crédito acumulado supera el total original.'; END IF;
        END IF;
    END IF;
    RETURN NULL;
END $$;
CREATE TRIGGER tr_emisor_audit AFTER INSERT OR UPDATE OR DELETE ON emisor FOR EACH ROW EXECUTE FUNCTION ns_auditar();
CREATE TRIGGER tr_cliente_audit AFTER INSERT OR UPDATE OR DELETE ON cliente FOR EACH ROW EXECUTE FUNCTION ns_auditar();
CREATE TRIGGER tr_producto_audit AFTER INSERT OR UPDATE OR DELETE ON producto FOR EACH ROW EXECUTE FUNCTION ns_auditar();
CREATE TRIGGER tr_factura_audit AFTER INSERT OR UPDATE OR DELETE ON factura FOR EACH ROW EXECUTE FUNCTION ns_auditar();
CREATE TRIGGER tr_boleta_audit AFTER INSERT OR UPDATE OR DELETE ON boleta FOR EACH ROW EXECUTE FUNCTION ns_auditar();
CREATE TRIGGER tr_nota_credito_audit AFTER INSERT OR UPDATE OR DELETE ON nota_credito FOR EACH ROW EXECUTE FUNCTION ns_auditar();
CREATE TRIGGER tr_nota_debito_audit AFTER INSERT OR UPDATE OR DELETE ON nota_debito FOR EACH ROW EXECUTE FUNCTION ns_auditar();
CREATE TRIGGER tr_factura_proteccion BEFORE INSERT OR UPDATE OR DELETE ON factura FOR EACH ROW EXECUTE FUNCTION ns_proteger_cabecera();
CREATE CONSTRAINT TRIGGER tr_factura_consistencia AFTER INSERT OR UPDATE ON factura DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION ns_validar_documento();
CREATE CONSTRAINT TRIGGER tr_detalle_factura_consistencia AFTER INSERT OR UPDATE OR DELETE ON detalle_factura DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION ns_validar_documento();
CREATE TRIGGER tr_detalle_factura_audit AFTER INSERT OR UPDATE OR DELETE ON detalle_factura FOR EACH ROW EXECUTE FUNCTION ns_auditar();
CREATE TRIGGER tr_boleta_proteccion BEFORE INSERT OR UPDATE OR DELETE ON boleta FOR EACH ROW EXECUTE FUNCTION ns_proteger_cabecera();
CREATE CONSTRAINT TRIGGER tr_boleta_consistencia AFTER INSERT OR UPDATE ON boleta DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION ns_validar_documento();
CREATE CONSTRAINT TRIGGER tr_detalle_boleta_consistencia AFTER INSERT OR UPDATE OR DELETE ON detalle_boleta DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION ns_validar_documento();
CREATE TRIGGER tr_detalle_boleta_audit AFTER INSERT OR UPDATE OR DELETE ON detalle_boleta FOR EACH ROW EXECUTE FUNCTION ns_auditar();
CREATE TRIGGER tr_nota_credito_proteccion BEFORE INSERT OR UPDATE OR DELETE ON nota_credito FOR EACH ROW EXECUTE FUNCTION ns_proteger_cabecera();
CREATE CONSTRAINT TRIGGER tr_nota_credito_consistencia AFTER INSERT OR UPDATE ON nota_credito DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION ns_validar_documento();
CREATE CONSTRAINT TRIGGER tr_detalle_nota_credito_consistencia AFTER INSERT OR UPDATE OR DELETE ON detalle_nota_credito DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION ns_validar_documento();
CREATE TRIGGER tr_detalle_nota_credito_audit AFTER INSERT OR UPDATE OR DELETE ON detalle_nota_credito FOR EACH ROW EXECUTE FUNCTION ns_auditar();
CREATE TRIGGER tr_nota_debito_proteccion BEFORE INSERT OR UPDATE OR DELETE ON nota_debito FOR EACH ROW EXECUTE FUNCTION ns_proteger_cabecera();
CREATE CONSTRAINT TRIGGER tr_nota_debito_consistencia AFTER INSERT OR UPDATE ON nota_debito DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION ns_validar_documento();
CREATE CONSTRAINT TRIGGER tr_detalle_nota_debito_consistencia AFTER INSERT OR UPDATE OR DELETE ON detalle_nota_debito DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION ns_validar_documento();
CREATE TRIGGER tr_detalle_nota_debito_audit AFTER INSERT OR UPDATE OR DELETE ON detalle_nota_debito FOR EACH ROW EXECUTE FUNCTION ns_auditar();

COMMIT;
