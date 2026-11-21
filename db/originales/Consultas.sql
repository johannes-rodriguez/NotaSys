-- Consulta 1. Notas de crédito emitidas en un periodo

SELECT
    n.serie,
    n.correlativo,
    n.fecha_emision,
    c.documento_cliente,
    c.razon_social_cliente,
    n.moneda,
    n.motivo,
    n.serie_factura,
    n.correlativo_factura,
    n.serie_boleta,
    n.correlativo_boleta,
    n.valor_venta,
    n.igv,
    n.importe_total
FROM nota_credito n
JOIN cliente c
    ON c.documento_cliente = n.documento_cliente
WHERE n.fecha_emision >= DATE '2026-09-01'
  AND n.fecha_emision < DATE '2026-11-01'
ORDER BY n.fecha_emision, n.serie, n.correlativo;


-- Consulta 2. Notas de débito emitidas en un periodo

SELECT
    n.serie,
    n.correlativo,
    n.fecha_emision,
    c.documento_cliente,
    c.razon_social_cliente,
    n.moneda,
    n.motivo,
    n.serie_factura,
    n.correlativo_factura,
    n.serie_boleta,
    n.correlativo_boleta,
    n.valor_venta,
    n.igv,
    n.importe_total
FROM nota_debito n
JOIN cliente c
    ON c.documento_cliente = n.documento_cliente
WHERE n.fecha_emision >= DATE '2026-09-01'
  AND n.fecha_emision < DATE '2026-11-01'
ORDER BY n.fecha_emision, n.serie, n.correlativo;


-- Consulta 3. Detalle de una nota de crédito

SELECT
    d.serie,
    d.correlativo,
    n.moneda,
    d.codigo_producto,
    p.descripcion,
    p.unidad_medida,
    d.cantidad,
    d.valor_unitario,
    ROUND(d.cantidad * d.valor_unitario, 2) AS valor_venta_item
FROM detalle_nota_credito d
JOIN nota_credito n
    ON n.serie = d.serie
   AND n.correlativo = d.correlativo
JOIN producto p
    ON p.codigo_producto = d.codigo_producto
WHERE d.serie = 'FC01'
  AND d.correlativo = '00000003'
ORDER BY d.codigo_producto;


-- Consulta 4. Historial de notas de una factura

SELECT
    'CREDITO' AS tipo_nota,
    n.serie,
    n.correlativo,
    n.fecha_emision,
    n.motivo,
    n.moneda,
    n.importe_total
FROM nota_credito n
WHERE n.serie_factura = 'E001'
  AND n.correlativo_factura = '00000005'

UNION ALL

SELECT
    'DEBITO',
    n.serie,
    n.correlativo,
    n.fecha_emision,
    n.motivo,
    n.moneda,
    n.importe_total
FROM nota_debito n
WHERE n.serie_factura = 'E001'
  AND n.correlativo_factura = '00000005'
ORDER BY fecha_emision, tipo_nota, serie, correlativo;


-- Consulta 5. Historial de notas de una boleta

SELECT
    'CREDITO' AS tipo_nota,
    n.serie,
    n.correlativo,
    n.fecha_emision,
    n.motivo,
    n.moneda,
    n.importe_total
FROM nota_credito n
WHERE n.serie_boleta = 'B003'
  AND n.correlativo_boleta = '00000003'

UNION ALL

SELECT
    'DEBITO',
    n.serie,
    n.correlativo,
    n.fecha_emision,
    n.motivo,
    n.moneda,
    n.importe_total
FROM nota_debito n
WHERE n.serie_boleta = 'B003'
  AND n.correlativo_boleta = '00000003'
ORDER BY fecha_emision, tipo_nota, serie, correlativo;


-- Consulta 6. Resumen mensual de notas por tipo y moneda

WITH notas AS (
    SELECT
        'CREDITO' AS tipo_nota,
        fecha_emision,
        moneda,
        valor_venta,
        igv,
        importe_total
    FROM nota_credito
    WHERE fecha_emision >= DATE '2026-09-01'
      AND fecha_emision < DATE '2026-11-01'

    UNION ALL

    SELECT
        'DEBITO',
        fecha_emision,
        moneda,
        valor_venta,
        igv,
        importe_total
    FROM nota_debito
    WHERE fecha_emision >= DATE '2026-09-01'
      AND fecha_emision < DATE '2026-11-01'
)
SELECT
    EXTRACT(YEAR FROM fecha_emision) AS anio,
    EXTRACT(MONTH FROM fecha_emision) AS mes,
    tipo_nota,
    moneda,
    COUNT(*) AS cantidad_notas,
    SUM(valor_venta) AS valor_venta_acumulado,
    SUM(igv) AS igv_acumulado,
    SUM(importe_total) AS importe_total_acumulado
FROM notas
GROUP BY
    EXTRACT(YEAR FROM fecha_emision),
    EXTRACT(MONTH FROM fecha_emision),
    tipo_nota,
    moneda
ORDER BY anio, mes, tipo_nota, moneda;


-- Consulta 7. Clientes con ajustes en el periodo

WITH notas AS (
    SELECT
        'CREDITO' AS tipo_nota,
        documento_cliente,
        moneda,
        importe_total
    FROM nota_credito
    WHERE fecha_emision >= DATE '2026-09-01'
      AND fecha_emision < DATE '2026-11-01'

    UNION ALL

    SELECT
        'DEBITO',
        documento_cliente,
        moneda,
        importe_total
    FROM nota_debito
    WHERE fecha_emision >= DATE '2026-09-01'
      AND fecha_emision < DATE '2026-11-01'
)
SELECT
    c.documento_cliente,
    c.razon_social_cliente,
    n.tipo_nota,
    n.moneda,
    COUNT(*) AS cantidad_notas,
    SUM(n.importe_total) AS importe_total_ajustes
FROM notas n
JOIN cliente c
    ON c.documento_cliente = n.documento_cliente
GROUP BY
    c.documento_cliente,
    c.razon_social_cliente,
    n.tipo_nota,
    n.moneda
ORDER BY
    n.moneda,
    n.tipo_nota,
    importe_total_ajustes DESC,
    c.documento_cliente;


-- Consulta 8. Motivos de emisión más frecuentes

WITH notas AS (
    SELECT
        'CREDITO' AS tipo_nota,
        motivo
    FROM nota_credito
    WHERE fecha_emision >= DATE '2026-09-01'
      AND fecha_emision < DATE '2026-11-01'

    UNION ALL

    SELECT
        'DEBITO',
        motivo
    FROM nota_debito
    WHERE fecha_emision >= DATE '2026-09-01'
      AND fecha_emision < DATE '2026-11-01'
)
SELECT
    tipo_nota,
    motivo,
    COUNT(*) AS cantidad_notas
FROM notas
GROUP BY tipo_nota, motivo
ORDER BY cantidad_notas DESC, tipo_nota, motivo;


-- Consulta 9. Comprobantes del periodo sin notas al cierre

SELECT
    'FACTURA' AS tipo_documento,
    f.serie,
    f.correlativo,
    f.fecha_emision,
    f.tipo_moneda AS moneda,
    f.importe_total
FROM factura f
WHERE f.fecha_emision >= DATE '2026-09-01'
  AND f.fecha_emision < DATE '2026-11-01'
  AND NOT EXISTS (
      SELECT 1
      FROM nota_credito n
      WHERE n.serie_factura = f.serie
        AND n.correlativo_factura = f.correlativo
        AND n.fecha_emision < DATE '2026-11-01'
  )
  AND NOT EXISTS (
      SELECT 1
      FROM nota_debito n
      WHERE n.serie_factura = f.serie
        AND n.correlativo_factura = f.correlativo
        AND n.fecha_emision < DATE '2026-11-01'
  )

UNION ALL

SELECT
    'BOLETA',
    b.serie,
    b.correlativo,
    b.fecha_emision,
    b.tipo_moneda,
    b.importe_total
FROM boleta b
WHERE b.fecha_emision >= DATE '2026-09-01'
  AND b.fecha_emision < DATE '2026-11-01'
  AND NOT EXISTS (
      SELECT 1
      FROM nota_credito n
      WHERE n.serie_boleta = b.serie
        AND n.correlativo_boleta = b.correlativo
        AND n.fecha_emision < DATE '2026-11-01'
  )
  AND NOT EXISTS (
      SELECT 1
      FROM nota_debito n
      WHERE n.serie_boleta = b.serie
        AND n.correlativo_boleta = b.correlativo
        AND n.fecha_emision < DATE '2026-11-01'
  )
ORDER BY fecha_emision, tipo_documento, serie, correlativo;


-- Consulta 10. Resumen diario de documentos emitidos

WITH documentos AS (
    SELECT
        'FACTURA' AS tipo_documento,
        tipo_moneda AS moneda,
        valor_venta,
        igv,
        importe_total
    FROM factura
    WHERE fecha_emision >= DATE '2026-10-12'
      AND fecha_emision < DATE '2026-10-13'

    UNION ALL

    SELECT
        'BOLETA',
        tipo_moneda,
        valor_venta,
        igv,
        importe_total
    FROM boleta
    WHERE fecha_emision >= DATE '2026-10-12'
      AND fecha_emision < DATE '2026-10-13'

    UNION ALL

    SELECT
        'NOTA_CREDITO',
        moneda,
        valor_venta,
        igv,
        importe_total
    FROM nota_credito
    WHERE fecha_emision >= DATE '2026-10-12'
      AND fecha_emision < DATE '2026-10-13'

    UNION ALL

    SELECT
        'NOTA_DEBITO',
        moneda,
        valor_venta,
        igv,
        importe_total
    FROM nota_debito
    WHERE fecha_emision >= DATE '2026-10-12'
      AND fecha_emision < DATE '2026-10-13'
)
SELECT
    tipo_documento,
    moneda,
    COUNT(*) AS cantidad_documentos,
    SUM(valor_venta) AS valor_venta_del_dia,
    SUM(igv) AS igv_del_dia,
    SUM(importe_total) AS importe_total_del_dia
FROM documentos
GROUP BY tipo_documento, moneda
ORDER BY tipo_documento, moneda;


-- Consulta 11. Detalle de una nota de débito

SELECT
    d.serie,
    d.correlativo,
    n.moneda,
    d.codigo_producto,
    p.descripcion,
    p.unidad_medida,
    d.cantidad,
    d.valor_unitario,
    ROUND(d.cantidad * d.valor_unitario, 2) AS valor_venta_item
FROM detalle_nota_debito d
JOIN nota_debito n
    ON n.serie = d.serie
   AND n.correlativo = d.correlativo
JOIN producto p
    ON p.codigo_producto = d.codigo_producto
WHERE d.serie = 'E001'
  AND d.correlativo = '00000004'
ORDER BY d.codigo_producto;


-- Consulta 12. Comprobantes con ajustes reiterados

WITH notas AS (
    SELECT
        'CREDITO' AS tipo_nota,
        serie_factura,
        correlativo_factura,
        serie_boleta,
        correlativo_boleta
    FROM nota_credito
    WHERE fecha_emision >= DATE '2026-09-01'
      AND fecha_emision < DATE '2026-11-01'

    UNION ALL

    SELECT
        'DEBITO',
        serie_factura,
        correlativo_factura,
        serie_boleta,
        correlativo_boleta
    FROM nota_debito
    WHERE fecha_emision >= DATE '2026-09-01'
      AND fecha_emision < DATE '2026-11-01'
),
vinculos AS (
    SELECT
        'FACTURA' AS tipo_documento,
        serie_factura AS serie,
        correlativo_factura AS correlativo,
        tipo_nota
    FROM notas
    WHERE serie_factura IS NOT NULL

    UNION ALL

    SELECT
        'BOLETA',
        serie_boleta,
        correlativo_boleta,
        tipo_nota
    FROM notas
    WHERE serie_boleta IS NOT NULL
)
SELECT
    tipo_documento,
    serie,
    correlativo,
    SUM(
        CASE WHEN tipo_nota = 'CREDITO'
             THEN 1 ELSE 0 END
    ) AS notas_credito,
    SUM(
        CASE WHEN tipo_nota = 'DEBITO'
             THEN 1 ELSE 0 END
    ) AS notas_debito,
    COUNT(*) AS total_notas
FROM vinculos
GROUP BY tipo_documento, serie, correlativo
HAVING COUNT(*) > 1
ORDER BY
    total_notas DESC,
    tipo_documento,
    serie,
    correlativo;


-- Consulta 13. Documentos emitidos a un cliente

SELECT
    'FACTURA' AS tipo_documento,
    serie,
    correlativo,
    fecha_emision,
    tipo_moneda AS moneda,
    valor_venta,
    igv,
    importe_total
FROM factura
WHERE documento_cliente = '20999999981'
  AND fecha_emision >= DATE '2026-09-01'
  AND fecha_emision < DATE '2026-11-01'

UNION ALL

SELECT
    'BOLETA',
    serie,
    correlativo,
    fecha_emision,
    tipo_moneda,
    valor_venta,
    igv,
    importe_total
FROM boleta
WHERE documento_cliente = '20999999981'
  AND fecha_emision >= DATE '2026-09-01'
  AND fecha_emision < DATE '2026-11-01'

UNION ALL

SELECT
    'NOTA_CREDITO',
    serie,
    correlativo,
    fecha_emision,
    moneda,
    valor_venta,
    igv,
    importe_total
FROM nota_credito
WHERE documento_cliente = '20999999981'
  AND fecha_emision >= DATE '2026-09-01'
  AND fecha_emision < DATE '2026-11-01'

UNION ALL

SELECT
    'NOTA_DEBITO',
    serie,
    correlativo,
    fecha_emision,
    moneda,
    valor_venta,
    igv,
    importe_total
FROM nota_debito
WHERE documento_cliente = '20999999981'
  AND fecha_emision >= DATE '2026-09-01'
  AND fecha_emision < DATE '2026-11-01'
ORDER BY fecha_emision, tipo_documento, serie, correlativo;


-- Consulta 14. Productos o servicios incluidos en ajustes

WITH ajustes AS (
    SELECT
        'CREDITO' AS tipo_nota,
        n.moneda,
        d.codigo_producto,
        d.cantidad,
        d.valor_unitario
    FROM nota_credito n
    JOIN detalle_nota_credito d
        ON d.serie = n.serie
       AND d.correlativo = n.correlativo
    WHERE n.fecha_emision >= DATE '2026-09-01'
      AND n.fecha_emision < DATE '2026-11-01'

    UNION ALL

    SELECT
        'DEBITO',
        n.moneda,
        d.codigo_producto,
        d.cantidad,
        d.valor_unitario
    FROM nota_debito n
    JOIN detalle_nota_debito d
        ON d.serie = n.serie
       AND d.correlativo = n.correlativo
    WHERE n.fecha_emision >= DATE '2026-09-01'
      AND n.fecha_emision < DATE '2026-11-01'
)
SELECT
    p.codigo_producto,
    p.descripcion,
    p.unidad_medida,
    a.tipo_nota,
    a.moneda,
    COUNT(*) AS cantidad_notas,
    SUM(a.cantidad) AS cantidad_registrada_en_ajustes,
    SUM(
        ROUND(a.cantidad * a.valor_unitario, 2)
    ) AS valor_venta_items
FROM ajustes a
JOIN producto p
    ON p.codigo_producto = a.codigo_producto
GROUP BY
    p.codigo_producto,
    p.descripcion,
    p.unidad_medida,
    a.tipo_nota,
    a.moneda
ORDER BY
    a.moneda,
    a.tipo_nota,
    cantidad_notas DESC,
    p.codigo_producto;


-- Consulta 15. Notas de crédito con el comprobante que modifican

SELECT
    nc.serie || '-' || nc.correlativo AS nota_credito,
    nc.fecha_emision,
    cl.razon_social_cliente AS cliente,
    CASE
        WHEN nc.serie_factura IS NOT NULL THEN 'Factura'
        WHEN nc.serie_boleta IS NOT NULL THEN 'Boleta'
        ELSE 'Sin vínculo'
    END AS tipo_comprobante,
    COALESCE(
        nc.serie_factura || '-' || nc.correlativo_factura,
        nc.serie_boleta || '-' || nc.correlativo_boleta
    ) AS comprobante_modificado,
    nc.motivo,
    nc.moneda,
    nc.importe_total
FROM nota_credito nc
JOIN cliente cl
    ON cl.documento_cliente = nc.documento_cliente
ORDER BY nc.fecha_emision DESC, nc.serie, nc.correlativo;


-- Consulta 16. Notas de débito con el comprobante que modifican

SELECT
    nd.serie || '-' || nd.correlativo AS nota_debito,
    nd.fecha_emision,
    cl.razon_social_cliente AS cliente,
    CASE
        WHEN nd.serie_factura IS NOT NULL THEN 'Factura'
        WHEN nd.serie_boleta IS NOT NULL THEN 'Boleta'
        ELSE 'Sin vínculo'
    END AS tipo_comprobante,
    COALESCE(
        nd.serie_factura || '-' || nd.correlativo_factura,
        nd.serie_boleta || '-' || nd.correlativo_boleta
    ) AS comprobante_modificado,
    nd.motivo,
    nd.descripcion_ajuste,
    nd.moneda,
    nd.importe_total
FROM nota_debito nd
JOIN cliente cl
    ON cl.documento_cliente = nd.documento_cliente
ORDER BY nd.fecha_emision DESC, nd.serie, nd.correlativo;


-- Consulta 17. Notas de crédito por motivo y por mes

SELECT
    TO_CHAR(fecha_emision, 'YYYY-MM') AS periodo,
    motivo,
    moneda,
    COUNT(*) AS cantidad_notas,
    SUM(importe_total) AS importe_acreditado
FROM nota_credito
GROUP BY
    TO_CHAR(fecha_emision, 'YYYY-MM'),
    motivo,
    moneda
ORDER BY periodo DESC, importe_acreditado DESC;


-- Consulta 18. Facturas con notas de crédito e importe neto después de los ajustes

SELECT
    f.serie || '-' || f.correlativo AS factura,
    f.fecha_emision,
    cl.razon_social_cliente AS cliente,
    f.tipo_moneda,
    f.importe_total AS importe_factura,
    COUNT(*) AS notas_credito,
    SUM(nc.importe_total) AS total_acreditado,
    f.importe_total - SUM(nc.importe_total) AS saldo_neto
FROM factura f
JOIN cliente cl
    ON cl.documento_cliente = f.documento_cliente
JOIN nota_credito nc
    ON nc.serie_factura = f.serie
   AND nc.correlativo_factura = f.correlativo
   AND nc.moneda = f.tipo_moneda
GROUP BY
    f.serie,
    f.correlativo,
    f.fecha_emision,
    cl.razon_social_cliente,
    f.tipo_moneda,
    f.importe_total;
