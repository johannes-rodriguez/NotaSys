BEGIN;
SET search_path TO notasys, public;

-- Small API: all application reads and writes enter through procedures.
CREATE PROCEDURE ns_catalogo(p_catalogo TEXT, p JSONB, p_version BIGINT, p_empresa TEXT, p_motivo TEXT)
LANGUAGE plpgsql SET search_path TO notasys, public AS $$
DECLARE t TEXT; k TEXT; n TEXT; found_version BIGINT;
BEGIN
    PERFORM set_config('notasys.empresa', p_empresa, true);
    PERFORM set_config('notasys.motivo', p_motivo, true);
    CASE p_catalogo
        WHEN 'Emisores' THEN t:='emisor'; k:='ruc_emisor'; n:='razon_social_emisor';
        WHEN 'Clientes' THEN t:='cliente'; k:='documento_cliente'; n:='razon_social_cliente';
        WHEN 'Productos y servicios' THEN t:='producto'; k:='codigo_producto'; n:='descripcion';
        ELSE RAISE EXCEPTION 'Catálogo desconocido.';
    END CASE;
    IF btrim(p->>'name')='' THEN RAISE EXCEPTION 'El nombre es obligatorio.'; END IF;
    IF p_version=0 THEN
        IF t='producto' THEN
            INSERT INTO producto(codigo_producto,descripcion,unidad_medida) VALUES(p->>'id',p->>'name',p->>'extra');
        ELSE
            EXECUTE format('INSERT INTO %I(%I,%I) VALUES($1,$2)',t,k,n) USING p->>'id',p->>'name';
        END IF;
    ELSE
        EXECUTE format('SELECT version FROM %I WHERE %I=$1 AND activo FOR UPDATE',t,k) INTO found_version USING p->>'id';
        IF found_version IS DISTINCT FROM p_version THEN RAISE EXCEPTION 'Otro usuario modificó el registro. Actualice la información.'; END IF;
        IF t='emisor' AND NOT (p->>'active')::boolean THEN
            PERFORM pg_advisory_xact_lock(794215);
            IF (SELECT count(*) FROM emisor WHERE activo)<=1 THEN RAISE EXCEPTION 'Debe quedar un emisor activo.'; END IF;
        END IF;
        EXECUTE format('UPDATE %I SET %I=$1, activo=$2, version=version+1 WHERE %I=$3',t,n,k)
            USING p->>'name',(p->>'active')::boolean,p->>'id';
        IF t='producto' THEN UPDATE producto SET unidad_medida=p->>'extra' WHERE codigo_producto=p->>'id'; END IF;
    END IF;
END $$;

CREATE PROCEDURE ns_documento(p JSONB, p_version BIGINT, p_motivo TEXT)
LANGUAGE plpgsql SET search_path TO notasys, public AS $$
DECLARE t TEXT; src TEXT; c TEXT; s TEXT; num TEXT; doc RECORD; oldrow RECORD; l JSONB;
    base NUMERIC; tax NUMERIC; cli TEXT; mon TEXT; sf TEXT; cf TEXT; sb TEXT; cb TEXT; active BOOLEAN;
BEGIN
    t:=CASE p->>'type' WHEN 'Factura' THEN 'factura' WHEN 'Boleta' THEN 'boleta'
        WHEN 'Crédito' THEN 'nota_credito' WHEN 'Débito' THEN 'nota_debito' END;
    IF t IS NULL THEN RAISE EXCEPTION 'Tipo no permitido.'; END IF;
    SET CONSTRAINTS ALL DEFERRED;
    c:=p->>'company'; s:=split_part(p->>'number','-',1); num:=split_part(p->>'number','-',2);
    active:=(p->>'active')::boolean;
    PERFORM set_config('notasys.empresa',c,true);
    PERFORM set_config('notasys.motivo',p_motivo,true);
    -- Lock source before the note to serialize credit balances, even across clients.
    IF t LIKE 'nota_%' THEN
        IF split_part(p->>'documentKey','/',1)<>c THEN RAISE EXCEPTION 'El emisor no corresponde al comprobante.'; END IF;
        src:=CASE split_part(p->>'documentKey','/',2) WHEN 'Factura' THEN 'factura' WHEN 'Boleta' THEN 'boleta' END;
        IF src IS NULL THEN RAISE EXCEPTION 'Comprobante original inválido.'; END IF;
        sf:=split_part(split_part(p->>'documentKey','/',3),'-',1);
        cf:=split_part(split_part(p->>'documentKey','/',3),'-',2);
        EXECUTE format('SELECT * FROM %I WHERE ruc_emisor=$1 AND serie=$2 AND correlativo=$3 FOR UPDATE',src)
            INTO doc USING c,sf,cf;
        IF doc IS NULL OR NOT doc.activo THEN RAISE EXCEPTION 'El comprobante no existe o está inactivo.'; END IF;
        IF src='boleta' THEN sb:=sf; cb:=cf; sf:=NULL; cf:=NULL; END IF;
        cli:=doc.documento_cliente; mon:=doc.tipo_moneda;
    ELSE cli:=nullif(p->>'client',''); mon:=p->>'currency';
    END IF;
    IF p_version>0 THEN
        EXECUTE format('SELECT * FROM %I WHERE ruc_emisor=$1 AND serie=$2 AND correlativo=$3 FOR UPDATE',t)
            INTO oldrow USING c,s,num;
        IF oldrow IS NULL OR oldrow.version<>p_version THEN RAISE EXCEPTION 'El documento cambió. Actualice antes de guardar.'; END IF;
        IF NOT active THEN
            IF btrim(p_motivo)='' THEN RAISE EXCEPTION 'Indique el motivo de desactivación.'; END IF;
            EXECUTE format('UPDATE %I SET activo=false,version=version+1 WHERE ruc_emisor=$1 AND serie=$2 AND correlativo=$3',t) USING c,s,num;
            RETURN;
        END IF;
    END IF;
    IF jsonb_typeof(p->'lines')<>'array' OR jsonb_array_length(p->'lines')=0 THEN RAISE EXCEPTION 'Agregue al menos un detalle.'; END IF;
    FOR l IN SELECT value FROM jsonb_array_elements(p->'lines') LOOP
        IF (l->>'quantity')::numeric<=0 OR (l->>'price')::numeric<0 OR
            scale((l->>'quantity')::numeric)>4 OR scale((l->>'price')::numeric)>4 THEN RAISE EXCEPTION 'Cantidad o valor inválidos.'; END IF;
        IF t NOT LIKE 'nota_%' AND NOT EXISTS(SELECT 1 FROM producto WHERE codigo_producto=l->>'productId' AND activo)
            THEN RAISE EXCEPTION 'Producto inactivo o inexistente.'; END IF;
    END LOOP;
    SELECT sum(round((value->>'quantity')::numeric*(value->>'price')::numeric,2)) INTO base FROM jsonb_array_elements(p->'lines');
    IF t LIKE 'nota_%' THEN
        tax:=round(base*doc.igv/nullif(doc.valor_venta,0),2);
    ELSE
        tax:=round(base*0.18,2);
    END IF;
    IF t IN ('factura','boleta') THEN
        IF p_version=0 THEN
            EXECUTE format('INSERT INTO %I(ruc_emisor,serie,correlativo,fecha_emision,documento_cliente,tipo_moneda,valor_venta,igv,importe_total) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$7+$8)',t)
                USING c,s,num,(p->>'date')::date,cli,mon,base,tax;
        ELSE
            EXECUTE format('UPDATE %I SET fecha_emision=$4,documento_cliente=$5,tipo_moneda=$6,valor_venta=$7,igv=$8,importe_total=$7+$8,version=version+1 WHERE ruc_emisor=$1 AND serie=$2 AND correlativo=$3',t)
                USING c,s,num,(p->>'date')::date,cli,mon,base,tax;
        END IF;
    ELSE
        IF p_version=0 THEN
            EXECUTE format('INSERT INTO %I(ruc_emisor,serie,correlativo,fecha_emision,documento_cliente,moneda,valor_venta,igv,importe_total,motivo,descripcion_ajuste,serie_factura,correlativo_factura,serie_boleta,correlativo_boleta) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$7+$8,$9,$10,$11,$12,$13,$14)',t)
                USING c,s,num,(p->>'date')::date,cli,mon,base,tax,p->>'reason',p->>'description',sf,cf,sb,cb;
        ELSE
            EXECUTE format('UPDATE %I SET fecha_emision=$4,valor_venta=$5,igv=$6,importe_total=$5+$6,motivo=$7,descripcion_ajuste=$8,version=version+1 WHERE ruc_emisor=$1 AND serie=$2 AND correlativo=$3',t)
                USING c,s,num,(p->>'date')::date,base,tax,p->>'reason',p->>'description';
        END IF;
    END IF;
    IF p_version>0 THEN EXECUTE format('DELETE FROM detalle_%I WHERE ruc_emisor=$1 AND serie=$2 AND correlativo=$3',t) USING c,s,num; END IF;
    FOR l IN SELECT value FROM jsonb_array_elements(p->'lines') LOOP
        EXECUTE format('INSERT INTO detalle_%I(ruc_emisor,serie,correlativo,codigo_producto,descripcion_historica,cantidad,valor_unitario) VALUES($1,$2,$3,$4,$5,$6,$7)',t)
            USING c,s,num,l->>'productId',l->>'description',(l->>'quantity')::numeric,(l->>'price')::numeric;
    END LOOP;
    SET CONSTRAINTS ALL IMMEDIATE;
    SET CONSTRAINTS ALL DEFERRED;
END $$;

CREATE PROCEDURE ns_leer(INOUT resultado XML DEFAULT NULL)
LANGUAGE plpgsql SET search_path TO notasys, public AS $$
DECLARE t TEXT; fragment XML; payload XML := '<datos/>';
BEGIN
    resultado := '<inicio/>';
    FOREACH t IN ARRAY ARRAY['emisor','cliente','producto','factura','boleta','nota_credito','nota_debito',
        'detalle_factura','detalle_boleta','detalle_nota_credito','detalle_nota_debito','historial_cambios'] LOOP
        fragment := query_to_xml(format('SELECT * FROM %I ORDER BY 1,2',t),true,false,'');
        resultado := xmlconcat(resultado, xmlelement(name conjunto,xmlattributes(t AS tabla),fragment));
    END LOOP;
    resultado:=xmlelement(name datos,resultado);
END $$;

CREATE VIEW v_comprobantes AS
    SELECT ruc_emisor, 'Factura'::text tipo, serie, correlativo, fecha_emision,documento_cliente,tipo_moneda,valor_venta,igv,importe_total,activo FROM factura
    UNION ALL
    SELECT ruc_emisor, 'Boleta',serie,correlativo,fecha_emision,documento_cliente,tipo_moneda,valor_venta,igv,importe_total,activo FROM boleta;
CREATE VIEW v_notas AS
    SELECT ruc_emisor,'Crédito'::text tipo,serie,correlativo,fecha_emision,documento_cliente,moneda,motivo,descripcion_ajuste,
        CASE WHEN serie_factura IS NOT NULL THEN 'Factura' ELSE 'Boleta' END tipo_original,
        coalesce(serie_factura,serie_boleta) serie_original,coalesce(correlativo_factura,correlativo_boleta) numero_original,valor_venta,igv,importe_total,activo FROM nota_credito
    UNION ALL
    SELECT ruc_emisor,'Débito',serie,correlativo,fecha_emision,documento_cliente,moneda,motivo,descripcion_ajuste,
        CASE WHEN serie_factura IS NOT NULL THEN 'Factura' ELSE 'Boleta' END,
        coalesce(serie_factura,serie_boleta),coalesce(correlativo_factura,correlativo_boleta),valor_venta,igv,importe_total,activo FROM nota_debito;
CREATE VIEW v_detalles_notas AS
    SELECT 'Crédito'::text tipo,ruc_emisor,serie,correlativo,codigo_producto,descripcion_historica,cantidad,valor_unitario FROM detalle_nota_credito
    UNION ALL
    SELECT 'Débito',ruc_emisor,serie,correlativo,codigo_producto,descripcion_historica,cantidad,valor_unitario FROM detalle_nota_debito;

COMMIT;
