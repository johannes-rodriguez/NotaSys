BEGIN;
INSERT INTO emisor (
    ruc_emisor,
    razon_social_emisor
)
VALUES
    ('20999999991', 'M&Zuel Contadores - emisor simulado');


INSERT INTO cliente (
    documento_cliente,
    razon_social_cliente
)
VALUES
    ('20999999981', 'Comercial Valle Sur S.A.C.'),
    ('20999999982', 'Transportes Ruta Andina S.A.C.'),
    ('20999999983', 'Servicios Turisticos Misti S.A.C.'),
    ('20999999984', 'Inversiones Costa Azul E.I.R.L.'),
    ('70999991', 'Elena Ramos Flores'),
    ('70999992', 'Luis Paredes Soto');


INSERT INTO producto (
    codigo_producto,
    descripcion,
    unidad_medida
)
VALUES
    ('S001', 'Asesoria contable mensual', 'MES'),
    ('S002', 'Regularizacion de registros contables', 'SERVICIO'),
    ('S003', 'Elaboracion de estados financieros', 'SERVICIO'),
    ('S004', 'Asesoria tributaria', 'HORA'),
    ('S005', 'Gestion de planillas', 'MES'),
    ('S006', 'Revision de comprobantes', 'UNIDAD'),
    ('S007', 'Asistencia para una declaracion', 'SERVICIO'),
    ('S008', 'Capacitacion contable', 'HORA');


INSERT INTO factura (
    serie,
    correlativo,
    ruc_emisor,
    fecha_emision,
    documento_cliente,
    tipo_moneda,
    valor_venta,
    igv,
    importe_total
)
VALUES
    (
        'E001', '00000001', '20999999991', '2026-09-05',
        '20999999981', 'PEN', 630.00, 113.40, 743.40
    ),
    (
        'E001', '00000002', '20999999991', '2026-09-10',
        '20999999982', 'PEN', 760.00, 136.80, 896.80
    ),
    (
        'E001', '00000003', '20999999991', '2026-09-18',
        '20999999983', 'USD', 320.00, 57.60, 377.60
    ),
    (
        'E001', '00000004', '20999999991', '2026-09-25',
        '20999999984', 'PEN', 270.00, 48.60, 318.60
    ),
    (
        'E001', '00000005', '20999999991', '2026-10-02',
        '20999999981', 'PEN', 630.00, 113.40, 743.40
    ),
    (
        'E001', '00000006', '20999999991', '2026-10-08',
        '20999999982', 'PEN', 1080.00, 194.40, 1274.40
    ),
    (
        'E001', '00000007', '20999999991', '2026-10-12',
        '20999999983', 'USD', 380.00, 68.40, 448.40
    ),
    (
        'E001', '00000008', '20999999991', '2026-10-15',
        '20999999984', 'PEN', 270.00, 48.60, 318.60
    );


INSERT INTO boleta (
    serie,
    correlativo,
    ruc_emisor,
    fecha_emision,
    documento_cliente,
    tipo_moneda,
    valor_venta,
    igv,
    importe_total
)
VALUES
    (
        'B003', '00000001', '20999999991', '2026-09-07',
        NULL, 'PEN', 150.00, 27.00, 177.00
    ),
    (
        'B003', '00000002', '20999999991', '2026-09-22',
        '70999991', 'PEN', 130.00, 23.40, 153.40
    ),
    (
        'B003', '00000003', '20999999991', '2026-10-05',
        '70999992', 'PEN', 185.00, 33.30, 218.30
    ),
    (
        'B003', '00000004', '20999999991', '2026-10-10',
        '70999991', 'PEN', 130.00, 23.40, 153.40
    );


INSERT INTO nota_credito (
    serie,
    correlativo,
    ruc_emisor,
    fecha_emision,
    documento_cliente,
    moneda,
    motivo,
    descripcion_ajuste,
    serie_factura,
    correlativo_factura,
    serie_boleta,
    correlativo_boleta,
    valor_venta,
    igv,
    importe_total
)
VALUES
    (
        'FC01', '00000001', '20999999991', '2026-09-12',
        '20999999981', 'PEN', 'Descuento parcial',
        'Reduccion acordada de honorarios del servicio mensual.',
        'E001', '00000001', NULL, NULL,
        50.00, 9.00, 59.00
    ),
    (
        'FC01', '00000002', '20999999991', '2026-09-22',
        '20999999983', 'USD', 'Anulacion parcial',
        'Una hora de asesoria no fue prestada.',
        'E001', '00000003', NULL, NULL,
        35.00, 6.30, 41.30
    ),
    (
        'FC01', '00000003', '20999999991', '2026-10-06',
        '20999999981', 'PEN', 'Descuento parcial',
        'Ajuste de honorarios de contabilidad y planillas.',
        'E001', '00000005', NULL, NULL,
        50.00, 9.00, 59.00
    ),
    (
        'BC01', '00000001', '20999999991', '2026-10-12',
        '70999992', 'PEN', 'Correccion de cantidad',
        'Se registraron dos comprobantes de revision de mas.',
        NULL, NULL, 'B003', '00000003',
        10.00, 1.80, 11.80
    ),
    (
        'FC01', '00000004', '20999999991', '2026-10-18',
        '20999999984', 'PEN', 'Anulacion parcial',
        'Cuatro revisiones de comprobantes no fueron realizadas.',
        'E001', '00000008', NULL, NULL,
        20.00, 3.60, 23.60
    ),
    (
        'BC01', '00000002', '20999999991', '2026-10-20',
        '70999991', 'PEN', 'Anulacion parcial',
        'Se anula una hora de capacitacion no realizada.',
        NULL, NULL, 'B003', '00000004',
        30.00, 5.40, 35.40
    );


INSERT INTO nota_debito (
    serie,
    correlativo,
    ruc_emisor,
    fecha_emision,
    documento_cliente,
    moneda,
    motivo,
    descripcion_ajuste,
    serie_factura,
    correlativo_factura,
    serie_boleta,
    correlativo_boleta,
    valor_venta,
    igv,
    importe_total
)
VALUES
    (
        'E001', '00000001', '20999999991', '2026-09-15',
        '20999999982', 'PEN', 'Aumento de valor',
        'Diferencia en el importe del servicio contratado.',
        'E001', '00000002', NULL, NULL,
        30.00, 5.40, 35.40
    ),
    (
        'E001', '00000002', '20999999991', '2026-09-28',
        '20999999984', 'PEN', 'Aumento de valor',
        'Ajuste del importe correspondiente a planillas.',
        'E001', '00000004', NULL, NULL,
        20.00, 3.60, 23.60
    ),
    (
        'E001', '00000003', '20999999991', '2026-10-11',
        '20999999982', 'PEN', 'Aumento de valor',
        'Una hora adicional de asesoria tributaria.',
        'E001', '00000006', NULL, NULL,
        80.00, 14.40, 94.40
    ),
    (
        'E001', '00000004', '20999999991', '2026-10-16',
        '70999992', 'PEN', 'Aumento de valor',
        'Diferencia en el importe de asesoria brindada.',
        NULL, NULL, 'B003', '00000003',
        15.00, 2.70, 17.70
    );


INSERT INTO detalle_factura (
    serie,
    correlativo,
    codigo_producto,
    cantidad,
    valor_unitario
)
VALUES
    ('E001', '00000001', 'S001', 1, 450),
    ('E001', '00000001', 'S005', 1, 180),
    ('E001', '00000002', 'S002', 1, 600),
    ('E001', '00000002', 'S004', 2, 80),
    ('E001', '00000003', 'S003', 1, 250),
    ('E001', '00000003', 'S004', 2, 35),
    ('E001', '00000004', 'S005', 1, 220),
    ('E001', '00000004', 'S006', 10, 5),
    ('E001', '00000005', 'S001', 1, 450),
    ('E001', '00000005', 'S005', 1, 180),
    ('E001', '00000006', 'S002', 1, 800),
    ('E001', '00000006', 'S004', 3.5, 80),
    ('E001', '00000007', 'S003', 1, 300),
    ('E001', '00000007', 'S008', 2, 40),
    ('E001', '00000008', 'S005', 1, 220),
    ('E001', '00000008', 'S006', 10, 5);


INSERT INTO detalle_boleta (
    serie,
    correlativo,
    codigo_producto,
    cantidad,
    valor_unitario
)
VALUES
    ('B003', '00000001', 'S007', 1, 70),
    ('B003', '00000001', 'S004', 1, 80),
    ('B003', '00000002', 'S007', 1, 70),
    ('B003', '00000002', 'S008', 2, 30),
    ('B003', '00000003', 'S004', 2, 80),
    ('B003', '00000003', 'S006', 5, 5),
    ('B003', '00000004', 'S008', 2, 30),
    ('B003', '00000004', 'S007', 1, 70);


INSERT INTO detalle_nota_credito (
    serie,
    correlativo,
    codigo_producto,
    cantidad,
    valor_unitario
)
VALUES
    ('FC01', '00000001', 'S001', 1, 50),
    ('FC01', '00000002', 'S004', 1, 35),
    ('FC01', '00000003', 'S001', 1, 40),
    ('FC01', '00000003', 'S005', 1, 10),
    ('BC01', '00000001', 'S006', 2, 5),
    ('FC01', '00000004', 'S006', 4, 5),
    ('BC01', '00000002', 'S008', 1, 30);


INSERT INTO detalle_nota_debito (
    serie,
    correlativo,
    codigo_producto,
    cantidad,
    valor_unitario
)
VALUES
    ('E001', '00000001', 'S002', 1, 30),
    ('E001', '00000002', 'S005', 1, 20),
    ('E001', '00000003', 'S004', 1, 80),
    ('E001', '00000004', 'S004', 1, 15);




COMMIT;
