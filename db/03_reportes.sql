BEGIN;
SET search_path TO notasys, public;

-- 15 parameterized reports cover the 18 queries supplied in Entrega 4.
-- Pairs 1/2, 3/11 and 15/16 share a credit/debit selector.
CREATE PROCEDURE ns_reporte(p_id INT,p_empresa TEXT,p_desde DATE,p_hasta DATE,p_cliente TEXT,
    p_moneda TEXT,p_estado TEXT,p_objetivo TEXT,p_tipo TEXT,p_offset INT,p_limit INT,INOUT resultado XML DEFAULT NULL)
LANGUAGE plpgsql SET search_path TO notasys, public AS $$
DECLARE q TEXT; w TEXT; wd TEXT; joins TEXT; total BIGINT; payload XML;
BEGIN
    IF p_id NOT BETWEEN 1 AND 15 OR p_desde>p_hasta OR p_tipo NOT IN ('Todos','Crédito','Débito')
        THEN RAISE EXCEPTION 'Reporte o filtros inválidos.'; END IF;
    IF p_id IN (2,3,4) AND coalesce(p_objetivo,'')='' THEN RAISE EXCEPTION 'Seleccione el documento.'; END IF;
    IF p_id=11 AND coalesce(p_cliente,'')='' THEN RAISE EXCEPTION 'Seleccione el cliente del reporte.'; END IF;
    w:=format(' WHERE n.ruc_emisor=%L AND n.fecha_emision BETWEEN %L AND %L',p_empresa,p_desde,p_hasta);
    wd:=format(' WHERE o.ruc_emisor=%L AND o.fecha_emision BETWEEN %L AND %L',p_empresa,p_desde,p_hasta);
    IF p_cliente<>'' THEN
        w:=w||format(' AND n.documento_cliente=%L',p_cliente);
        wd:=wd||format(' AND o.documento_cliente=%L',p_cliente);
    END IF;
    IF p_moneda<>'Todas' THEN
        w:=w||format(' AND n.moneda=%L',p_moneda);
        wd:=wd||format(' AND o.tipo_moneda=%L',p_moneda);
    END IF;
    IF p_estado<>'Todos' THEN
        w:=w||format(' AND n.activo=%L',p_estado='Activos');
        wd:=wd||format(' AND o.activo=%L',p_estado='Activos');
    END IF;
    IF p_tipo<>'Todos' THEN w:=w||format(' AND n.tipo=%L',p_tipo); END IF;
    joins:=' FROM v_notas n JOIN cliente c ON c.documento_cliente=n.documento_cliente JOIN v_comprobantes o ON (o.ruc_emisor,o.tipo,o.serie,o.correlativo)=(n.ruc_emisor,n.tipo_original,n.serie_original,n.numero_original)';
    CASE p_id
        WHEN 2 THEN
            w:=w||format(' AND n.ruc_emisor||''/''||n.tipo||''/''||n.serie||''-''||n.correlativo=%L',p_objetivo);
            q:='SELECT n.serie||''-''||n.correlativo AS nota,n.tipo,d.codigo_producto AS producto,d.descripcion_historica AS descripcion,p.unidad_medida,d.cantidad,d.valor_unitario,round(d.cantidad*d.valor_unitario,2) AS valor_venta,n.moneda FROM v_notas n JOIN v_detalles_notas d USING(ruc_emisor,tipo,serie,correlativo) JOIN producto p ON p.codigo_producto=d.codigo_producto'||w||' ORDER BY nota,producto';
        WHEN 5 THEN
            q:='SELECT to_char(n.fecha_emision,''YYYY-MM'') AS mes,n.tipo,n.moneda,count(*) AS notas,sum(n.valor_venta) AS valor_venta,sum(n.igv) AS igv,sum(n.importe_total) AS total FROM v_notas n'||w||' GROUP BY 1,2,3 ORDER BY 1,2,3';
        WHEN 6 THEN
            q:='SELECT c.documento_cliente,c.razon_social_cliente AS cliente,n.tipo,n.moneda,count(*) AS notas,sum(n.valor_venta) AS valor_venta,sum(n.igv) AS igv,sum(n.importe_total) AS total'||joins||w||' GROUP BY 1,2,3,4 ORDER BY 2,3,4';
        WHEN 7 THEN
            q:='SELECT n.tipo,n.motivo,count(*) AS notas FROM v_notas n'||w||' GROUP BY 1,2 ORDER BY 3 DESC,1,2';
        WHEN 8 THEN
            q:='SELECT o.tipo,o.serie||''-''||o.correlativo AS comprobante,o.fecha_emision AS fecha,coalesce(c.razon_social_cliente,''Sin identificar'') AS cliente,o.tipo_moneda AS moneda,o.importe_total AS total FROM v_comprobantes o LEFT JOIN cliente c ON c.documento_cliente=o.documento_cliente'||wd||format(' AND NOT EXISTS(SELECT 1 FROM v_notas n WHERE (n.ruc_emisor,n.tipo_original,n.serie_original,n.numero_original)=(o.ruc_emisor,o.tipo,o.serie,o.correlativo) AND n.activo AND n.fecha_emision<=%L) ORDER BY o.fecha_emision,o.tipo,o.serie,o.correlativo',p_hasta);
        WHEN 9 THEN
            q:='WITH documentos AS (SELECT o.fecha_emision,o.tipo,o.tipo_moneda AS moneda,o.valor_venta,o.igv,o.importe_total FROM v_comprobantes o'||wd||' UNION ALL SELECT n.fecha_emision,n.tipo,n.moneda,n.valor_venta,n.igv,n.importe_total FROM v_notas n'||w||') SELECT fecha_emision AS fecha,tipo,moneda,count(*) AS documentos,sum(valor_venta) AS valor_venta,sum(igv) AS igv,sum(importe_total) AS total FROM documentos GROUP BY 1,2,3 ORDER BY 1,2,3';
        WHEN 10 THEN
            q:='SELECT o.tipo,o.serie||''-''||o.correlativo AS comprobante,c.razon_social_cliente AS cliente,n.moneda,count(*) FILTER(WHERE n.tipo=''Crédito'') AS creditos,count(*) FILTER(WHERE n.tipo=''Débito'') AS debitos,count(*) AS total_notas'||joins||w||' GROUP BY 1,2,3,4 HAVING count(*)>1 ORDER BY 7 DESC,2';
        WHEN 11 THEN
            q:='SELECT o.tipo,o.serie||''-''||o.correlativo AS documento,o.fecha_emision AS fecha,c.razon_social_cliente AS cliente,o.tipo_moneda AS moneda,o.valor_venta,o.igv,o.importe_total AS total FROM v_comprobantes o JOIN cliente c ON c.documento_cliente=o.documento_cliente'||wd||' UNION ALL SELECT n.tipo,n.serie||''-''||n.correlativo,n.fecha_emision,c.razon_social_cliente,n.moneda,n.valor_venta,n.igv,n.importe_total'||joins||w||' ORDER BY 3,1,2';
        WHEN 12 THEN
            q:='SELECT d.codigo_producto AS codigo,p.descripcion AS producto,p.unidad_medida,n.tipo,n.moneda,count(*) AS notas,sum(d.cantidad) AS cantidad,sum(round(d.cantidad*d.valor_unitario,2)) AS valor_venta FROM v_notas n JOIN v_detalles_notas d USING(ruc_emisor,tipo,serie,correlativo) JOIN producto p ON p.codigo_producto=d.codigo_producto'||w||' GROUP BY 1,2,3,4,5 ORDER BY 1,4,5';
        WHEN 14 THEN
            q:='SELECT to_char(n.fecha_emision,''YYYY-MM'') AS periodo,n.tipo,n.motivo,n.moneda,count(*) AS notas,sum(n.importe_total) AS importe_ajustado FROM v_notas n'||w||' GROUP BY 1,2,3,4 ORDER BY 1,6 DESC';
        WHEN 15 THEN
            q:='SELECT o.serie||''-''||o.correlativo AS factura,o.fecha_emision AS fecha,c.razon_social_cliente AS cliente,o.tipo_moneda AS moneda,o.importe_total AS importe_factura,count(n.serie) AS notas_credito,coalesce(sum(n.importe_total),0) AS total_acreditado,o.importe_total-coalesce(sum(n.importe_total),0) AS neto_documental FROM v_comprobantes o JOIN cliente c ON c.documento_cliente=o.documento_cliente LEFT JOIN v_notas n ON (n.ruc_emisor,n.tipo_original,n.serie_original,n.numero_original)=(o.ruc_emisor,o.tipo,o.serie,o.correlativo) AND n.tipo=''Crédito'' AND n.activo AND n.fecha_emision<='||quote_literal(p_hasta)||wd||' AND o.tipo=''Factura'' GROUP BY o.ruc_emisor,o.serie,o.correlativo,o.fecha_emision,c.razon_social_cliente,o.tipo_moneda,o.importe_total ORDER BY o.fecha_emision,o.serie,o.correlativo';
        ELSE
            IF p_id IN (3,4) THEN
                w:=w||format(' AND n.ruc_emisor||''/''||n.tipo_original||''/''||n.serie_original||''-''||n.numero_original=%L AND n.tipo_original=%L',p_objetivo,CASE WHEN p_id=3 THEN 'Factura' ELSE 'Boleta' END);
            END IF;
            q:='SELECT n.serie||''-''||n.correlativo AS nota,n.tipo,n.fecha_emision AS fecha,c.razon_social_cliente AS cliente,n.tipo_original||'' ''||n.serie_original||''-''||n.numero_original AS comprobante,n.motivo,n.descripcion_ajuste AS descripcion,n.moneda,n.valor_venta,n.igv,n.importe_total AS total,CASE WHEN n.activo THEN ''Activo'' ELSE ''Inactivo'' END AS estado'||joins||w||' ORDER BY n.fecha_emision,n.serie,n.correlativo';
    END CASE;
    IF p_offset<0 OR (p_limit<>-1 AND p_limit NOT BETWEEN 1 AND 1000) THEN RAISE EXCEPTION 'Paginación inválida.'; END IF;
    EXECUTE 'SELECT count(*) FROM ('||q||') resultados' INTO total;
    IF p_limit<>-1 THEN q:=q||format(' LIMIT %s OFFSET %s',p_limit,p_offset); END IF;
    payload:=query_to_xml(q,true,false,'');
    resultado:=xmlelement(name reporte,xmlattributes(total AS total,p_offset AS desplazamiento),payload);
END $$;
-- Compatibility entry point for complete export and direct SQL use.
CREATE PROCEDURE ns_reporte(p_id INT,p_empresa TEXT,p_desde DATE,p_hasta DATE,p_cliente TEXT,
    p_moneda TEXT,p_estado TEXT,p_objetivo TEXT,p_tipo TEXT,INOUT resultado XML DEFAULT NULL)
LANGUAGE plpgsql SET search_path TO notasys, public AS $$
BEGIN
    CALL ns_reporte(p_id,p_empresa,p_desde,p_hasta,p_cliente,p_moneda,p_estado,p_objetivo,p_tipo,0,-1,resultado);
END $$;
COMMIT;
