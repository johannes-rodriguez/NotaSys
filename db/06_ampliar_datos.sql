-- Expansión sintética para pruebas; conserva los datos importados de la entrega 4.
BEGIN;
DO $$ BEGIN IF EXISTS(SELECT 1 FROM notasys.factura WHERE serie='E002') OR EXISTS(SELECT 1 FROM notasys.nota_credito WHERE serie='FC02') THEN RAISE EXCEPTION 'Las series de ampliación ya existen; no se insertó nada.'; END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.emisor WHERE ruc_emisor='20999999991') THEN CALL notasys.ns_catalogo(
    'Emisores','{"id": "20999999991", "name": "M&Zuel Contadores & Auditores S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.emisor WHERE ruc_emisor='20999999992') THEN CALL notasys.ns_catalogo(
    'Emisores','{"id": "20999999992", "name": "Estudio Contable Valle Sur S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999981') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999981", "name": "Comercial Valle Sur S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999980') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999980", "name": "Transportes Ruta Andina S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999979') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999979", "name": "Servicios Turísticos Misti S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999978') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999978", "name": "Inversiones Costa Azul E.I.R.L.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999977') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999977", "name": "Distribuidora Los Portales S.R.L.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999976') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999976", "name": "Constructora Río Blanco S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999975') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999975", "name": "Clínica Veterinaria Los Álamos S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999974') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999974", "name": "Agroexportadora Valle Verde S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999973') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999973", "name": "Restaurantes La Campiña S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999972') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999972", "name": "Tecnología Integral del Sur E.I.R.L.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999971') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999971", "name": "Servicios Logísticos Santa Marta S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999970') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999970", "name": "Panificadora El Molino S.R.L.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999969') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999969", "name": "Textiles Altiplano S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999968') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999968", "name": "Ferretería San Gabriel E.I.R.L.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999967') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999967", "name": "Importaciones Costa Pacífica S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999966') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999966", "name": "Operador Turístico Rutas del Colca S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999965') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999965", "name": "Inmobiliaria Jardines del Valle S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999964') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999964", "name": "Servicios Industriales La Joya S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999963') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999963", "name": "Comercializadora Puente Viejo S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999962') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999962", "name": "Consultores Empresariales Amanecer S.R.L.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999961') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999961", "name": "Servicios Médicos Alameda S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999960') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999960", "name": "Alimentos La Estancia E.I.R.L.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999959') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999959", "name": "Transportes Nuevo Horizonte S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='20999999958') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "20999999958", "name": "Distribuciones La Merced S.A.C.", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='70999991') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "70999991", "name": "Elena Ramos Flores", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='70999990') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "70999990", "name": "Luis Paredes Soto", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='70999989') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "70999989", "name": "María Valdivia Cáceres", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='70999988') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "70999988", "name": "Carlos Medina Quispe", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='70999987') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "70999987", "name": "Lucía Torres Salas", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='70999986') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "70999986", "name": "Jorge Rojas Huamán", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='70999985') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "70999985", "name": "Patricia Salazar Núñez", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.cliente WHERE documento_cliente='70999984') THEN CALL notasys.ns_catalogo(
    'Clientes','{"id": "70999984", "name": "Diego Vargas Ponce", "extra": "", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S001') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S001", "name": "Asesoría contable mensual", "extra": "MES", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S002') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S002", "name": "Regularización de registros contables", "extra": "SERVICIO", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S003') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S003", "name": "Elaboración de estados financieros", "extra": "SERVICIO", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S004') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S004", "name": "Asesoría tributaria", "extra": "HORA", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S005') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S005", "name": "Gestión de planillas", "extra": "MES", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S006') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S006", "name": "Revisión de comprobantes", "extra": "UNIDAD", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S007') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S007", "name": "Asistencia para una declaración", "extra": "SERVICIO", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S008') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S008", "name": "Capacitación contable", "extra": "HORA", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S009') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S009", "name": "Conciliación bancaria", "extra": "SERVICIO", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S010') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S010", "name": "Inventario y conciliación de activos", "extra": "SERVICIO", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S011') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S011", "name": "Revisión de costos de producción", "extra": "SERVICIO", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S012') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S012", "name": "Implementación de controles internos", "extra": "SERVICIO", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S013') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S013", "name": "Análisis de cuentas por cobrar", "extra": "SERVICIO", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S014') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S014", "name": "Revisión de obligaciones laborales", "extra": "HORA", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S015') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S015", "name": "Preparación de libros contables", "extra": "MES", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S016') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S016", "name": "Asistencia en cierre contable", "extra": "SERVICIO", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S017') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S017", "name": "Evaluación de procesos administrativos", "extra": "HORA", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S018') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S018", "name": "Revisión de operaciones en moneda extranjera", "extra": "SERVICIO", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S019') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S019", "name": "Digitalización de documentación", "extra": "UNIDAD", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
DO $$ BEGIN IF NOT EXISTS(SELECT 1 FROM notasys.producto WHERE codigo_producto='S020') THEN CALL notasys.ns_catalogo(
    'Productos y servicios','{"id": "S020", "name": "Asesoría en gestión financiera", "extra": "HORA", "active": true}'::jsonb,
    0, '20999999991','Carga inicial'); END IF; END $$;
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000001", "date": "2026-01-22", "client": "20999999980", "currency": "PEN", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 228.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 902.5}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 12, "price": 114.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000001", "date": "2026-01-24", "documentKey": "20999999991/Factura/E002-00000001", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 18.24}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000002", "date": "2026-02-08", "client": "20999999979", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 6, "price": 110.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 12, "price": 120.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 950.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 90.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000002", "date": "2026-02-10", "documentKey": "20999999991/Factura/E002-00000002", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 6, "price": 8.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000003", "date": "2026-02-25", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000001", "date": "2026-02-27", "documentKey": "20999999991/Factura/E002-00000003", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 71.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000003", "date": "2026-02-28", "documentKey": "20999999991/Factura/E002-00000003", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 119.7}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000004", "date": "2026-03-14", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 104.5}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 495.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 99.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000004", "date": "2026-03-16", "documentKey": "20999999991/Boleta/B004-00000004", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 8.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000005", "date": "2026-03-31", "client": "20999999976", "currency": "USD", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 204.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 26.4}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 6, "price": 20.4}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000006", "date": "2026-04-17", "client": "20999999975", "currency": "PEN", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 4, "price": 4.75}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 2.38}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000002", "date": "2026-04-19", "documentKey": "20999999991/Factura/E002-00000006", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 4, "price": 0.38}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000005", "date": "2026-04-20", "documentKey": "20999999991/Factura/E002-00000006", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.29}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000007", "date": "2026-05-04", "client": "20999999974", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 110.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 600.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 180.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000006", "date": "2026-05-06", "documentKey": "20999999991/Factura/E002-00000007", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 8.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000008", "date": "2026-05-21", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 231.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000007", "date": "2026-05-23", "documentKey": "20999999991/Boleta/B004-00000008", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 15.12}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000009", "date": "2026-06-07", "client": "20999999972", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 3, "price": 132.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 2.75}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000003", "date": "2026-06-09", "documentKey": "20999999991/Factura/E002-00000009", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 3, "price": 10.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000008", "date": "2026-06-10", "documentKey": "20999999991/Factura/E002-00000009", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.33}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000010", "date": "2026-06-24", "client": "20999999971", "currency": "USD", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 0.6}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000010", "date": "2026-06-24", "client": "20999999971", "currency": "USD", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 0.6}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000011", "date": "2026-07-11", "client": "20999999970", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 228.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000009", "date": "2026-07-13", "documentKey": "20999999991/Factura/E002-00000011", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 21.28}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000012", "date": "2026-07-28", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 950.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000004", "date": "2026-07-30", "documentKey": "20999999991/Boleta/B004-00000012", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 22.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000010", "date": "2026-07-31", "documentKey": "20999999991/Boleta/B004-00000012", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 114.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000013", "date": "2026-08-14", "client": "20999999968", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 63.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 6, "price": 89.25}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000011", "date": "2026-08-16", "documentKey": "20999999991/Factura/E002-00000013", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 5.04}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000014", "date": "2026-08-31", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 2.75}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 495.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 20, "price": 93.5}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1375.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000012", "date": "2026-09-02", "documentKey": "20999999991/Factura/E002-00000014", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 0.22}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000015", "date": "2026-09-17", "client": "20999999966", "currency": "USD", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 12, "price": 26.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000016", "date": "2026-10-04", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1187.5}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 722.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000013", "date": "2026-10-06", "documentKey": "20999999991/Boleta/B004-00000016", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 95.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000017", "date": "2026-10-21", "client": "20999999964", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 110.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 760.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 85.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 950.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000014", "date": "2026-10-23", "documentKey": "20999999991/Factura/E002-00000017", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 8.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000014", "date": "2026-10-23", "documentKey": "20999999991/Factura/E002-00000017", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 8.8}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000018", "date": "2026-11-07", "client": "20999999963", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 94.5}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000005", "date": "2026-11-09", "documentKey": "20999999991/Factura/E002-00000018", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 7.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000015", "date": "2026-11-10", "documentKey": "20999999991/Factura/E002-00000018", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 85.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000019", "date": "2026-01-17", "client": "20999999962", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 104.5}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 352.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 264.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000016", "date": "2026-01-19", "documentKey": "20999999991/Factura/E002-00000019", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 8.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000020", "date": "2026-02-03", "client": "70999987", "currency": "USD", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 0.6}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 1.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000020", "date": "2026-02-03", "client": "70999987", "currency": "USD", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 0.6}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 1.2}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000021", "date": "2026-02-20", "client": "20999999960", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 902.5}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 171.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000006", "date": "2026-02-22", "documentKey": "20999999991/Factura/E002-00000021", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 72.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000017", "date": "2026-02-23", "documentKey": "20999999991/Factura/E002-00000021", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 20.52}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000022", "date": "2026-03-09", "client": "20999999959", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 5.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000018", "date": "2026-03-11", "documentKey": "20999999991/Factura/E002-00000022", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 100.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000023", "date": "2026-03-26", "client": "20999999958", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 89.25}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000019", "date": "2026-03-28", "documentKey": "20999999991/Factura/E002-00000023", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 26.88}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000024", "date": "2026-04-12", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 132.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 2.75}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000007", "date": "2026-04-14", "documentKey": "20999999991/Boleta/B004-00000024", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 10.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000020", "date": "2026-04-15", "documentKey": "20999999991/Boleta/B004-00000024", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 0.33}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000025", "date": "2026-04-29", "client": "20999999980", "currency": "USD", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 6, "price": 20.4}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 2, "price": 0.6}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000026", "date": "2026-05-16", "client": "20999999979", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 2, "price": 114.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 171.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 4.75}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 722.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000021", "date": "2026-05-18", "documentKey": "20999999991/Factura/E002-00000026", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 2, "price": 9.12}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000027", "date": "2026-06-02", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 90.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000008", "date": "2026-06-04", "documentKey": "20999999991/Factura/E002-00000027", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 7.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000022", "date": "2026-06-05", "documentKey": "20999999991/Factura/E002-00000027", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 81.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000028", "date": "2026-06-19", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 231.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 115.5}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000023", "date": "2026-06-21", "documentKey": "20999999991/Boleta/B004-00000028", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 18.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000029", "date": "2026-07-06", "client": "20999999976", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 3, "price": 93.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 66.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 2, "price": 132.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 308.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000024", "date": "2026-07-08", "documentKey": "20999999991/Factura/E002-00000029", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 3, "price": 7.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000030", "date": "2026-07-23", "client": "20999999975", "currency": "USD", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 4, "price": 1.2}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 20.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000030", "date": "2026-07-23", "client": "20999999975", "currency": "USD", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 4, "price": 1.2}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 20.4}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000031", "date": "2026-08-09", "client": "20999999974", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 646.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 20, "price": 114.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000025", "date": "2026-08-11", "documentKey": "20999999991/Factura/E002-00000031", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 51.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000032", "date": "2026-08-26", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 95.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 4, "price": 85.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 180.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 20, "price": 110.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000026", "date": "2026-08-28", "documentKey": "20999999991/Boleta/B004-00000032", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 7.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000033", "date": "2026-09-12", "client": "20999999972", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 2.62}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000009", "date": "2026-09-14", "documentKey": "20999999991/Factura/E002-00000033", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 23.52}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000027", "date": "2026-09-15", "documentKey": "20999999991/Factura/E002-00000033", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 0.31}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000034", "date": "2026-09-29", "client": "20999999971", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 99.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 66.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000028", "date": "2026-10-01", "documentKey": "20999999991/Factura/E002-00000034", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 7.92}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000028", "date": "2026-10-01", "documentKey": "20999999991/Factura/E002-00000034", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 7.92}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000035", "date": "2026-10-16", "client": "20999999970", "currency": "USD", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 14.4}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000036", "date": "2026-11-02", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 722.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000010", "date": "2026-11-04", "documentKey": "20999999991/Boleta/B004-00000036", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 21.28}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000029", "date": "2026-11-05", "documentKey": "20999999991/Boleta/B004-00000036", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 86.64}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000037", "date": "2026-01-12", "client": "20999999968", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 12, "price": 120.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 95.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 600.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000030", "date": "2026-01-14", "documentKey": "20999999991/Factura/E002-00000037", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 12, "price": 9.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000038", "date": "2026-01-29", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 231.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 2.62}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1312.5}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 472.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000031", "date": "2026-01-31", "documentKey": "20999999991/Factura/E002-00000038", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 18.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000039", "date": "2026-02-15", "client": "20999999966", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1375.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 6, "price": 132.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000011", "date": "2026-02-17", "documentKey": "20999999991/Factura/E002-00000039", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 110.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000032", "date": "2026-02-18", "documentKey": "20999999991/Factura/E002-00000039", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 6, "price": 15.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000040", "date": "2026-03-04", "client": "70999991", "currency": "USD", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 21.6}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000040", "date": "2026-03-04", "client": "70999991", "currency": "USD", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 21.6}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000041", "date": "2026-03-21", "client": "20999999964", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 20, "price": 104.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 12, "price": 57.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 570.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 171.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000033", "date": "2026-03-23", "documentKey": "20999999991/Factura/E002-00000041", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 20, "price": 8.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000042", "date": "2026-04-07", "client": "20999999963", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 12, "price": 120.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 180.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000012", "date": "2026-04-09", "documentKey": "20999999991/Factura/E002-00000042", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 12, "price": 9.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000034", "date": "2026-04-10", "documentKey": "20999999991/Factura/E002-00000042", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 21.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000043", "date": "2026-04-24", "client": "20999999962", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 6, "price": 63.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 472.5}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 798.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000035", "date": "2026-04-26", "documentKey": "20999999991/Factura/E002-00000043", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 6, "price": 5.04}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000044", "date": "2026-05-11", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 5.5}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 99.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 93.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000036", "date": "2026-05-13", "documentKey": "20999999991/Boleta/B004-00000044", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 19.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000045", "date": "2026-05-28", "client": "20999999960", "currency": "USD", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 14.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000046", "date": "2026-06-14", "client": "20999999959", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 80.75}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 570.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000037", "date": "2026-06-16", "documentKey": "20999999991/Factura/E002-00000046", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 6.46}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000047", "date": "2026-07-01", "client": "20999999958", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 240.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 180.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000038", "date": "2026-07-03", "documentKey": "20999999991/Factura/E002-00000047", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 68.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000048", "date": "2026-07-18", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 63.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000013", "date": "2026-07-20", "documentKey": "20999999991/Boleta/B004-00000048", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 5.04}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000039", "date": "2026-07-21", "documentKey": "20999999991/Boleta/B004-00000048", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 107.1}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000049", "date": "2026-08-04", "client": "20999999980", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 308.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 12, "price": 132.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000040", "date": "2026-08-06", "documentKey": "20999999991/Factura/E002-00000049", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 24.64}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000050", "date": "2026-08-21", "client": "20999999979", "currency": "USD", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 2, "price": 0.6}, {"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 14.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000050", "date": "2026-08-21", "client": "20999999979", "currency": "USD", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 2, "price": 0.6}, {"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 14.4}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000051", "date": "2026-09-07", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 228.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 807.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000014", "date": "2026-09-09", "documentKey": "20999999991/Factura/E002-00000051", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 18.24}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000014", "date": "2026-09-09", "documentKey": "20999999991/Factura/E002-00000051", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 18.24}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000041", "date": "2026-09-10", "documentKey": "20999999991/Factura/E002-00000051", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 96.9}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000041", "date": "2026-09-10", "documentKey": "20999999991/Factura/E002-00000051", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 96.9}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000052", "date": "2026-09-24", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 240.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 450.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000042", "date": "2026-09-26", "documentKey": "20999999991/Boleta/B004-00000052", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 19.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000053", "date": "2026-10-11", "client": "20999999976", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 94.5}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1312.5}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 5.25}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 798.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000043", "date": "2026-10-13", "documentKey": "20999999991/Factura/E002-00000053", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 7.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000054", "date": "2026-10-28", "client": "20999999975", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 12, "price": 66.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 935.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000015", "date": "2026-10-30", "documentKey": "20999999991/Factura/E002-00000054", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 12, "price": 5.28}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000044", "date": "2026-10-31", "documentKey": "20999999991/Factura/E002-00000054", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 112.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000055", "date": "2026-01-07", "client": "20999999974", "currency": "USD", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000056", "date": "2026-01-24", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 4.75}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 85.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000045", "date": "2026-01-26", "documentKey": "20999999991/Boleta/B004-00000056", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 24.32}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000057", "date": "2026-02-10", "client": "20999999972", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 95.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000016", "date": "2026-02-12", "documentKey": "20999999991/Factura/E002-00000057", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 7.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000046", "date": "2026-02-13", "documentKey": "20999999991/Factura/E002-00000057", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 150.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000058", "date": "2026-02-27", "client": "20999999971", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 115.5}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 89.25}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000047", "date": "2026-03-01", "documentKey": "20999999991/Factura/E002-00000058", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 9.24}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000059", "date": "2026-03-16", "client": "20999999970", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 93.5}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 935.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 836.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 352.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000048", "date": "2026-03-18", "documentKey": "20999999991/Factura/E002-00000059", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 7.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000060", "date": "2026-04-02", "client": "70999987", "currency": "USD", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 21.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000060", "date": "2026-04-02", "client": "70999987", "currency": "USD", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 21.6}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000061", "date": "2026-04-19", "client": "20999999968", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 209.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 2, "price": 114.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 85.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000049", "date": "2026-04-21", "documentKey": "20999999991/Factura/E002-00000061", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 16.72}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000062", "date": "2026-05-06", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 240.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 220.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000050", "date": "2026-05-08", "documentKey": "20999999991/Factura/E002-00000062", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 19.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000063", "date": "2026-05-23", "client": "20999999966", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1312.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000017", "date": "2026-05-25", "documentKey": "20999999991/Factura/E002-00000063", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 71.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000051", "date": "2026-05-26", "documentKey": "20999999991/Factura/E002-00000063", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 157.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000064", "date": "2026-06-09", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 121.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1375.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 99.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000052", "date": "2026-06-11", "documentKey": "20999999991/Boleta/B004-00000064", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 9.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000065", "date": "2026-06-26", "client": "20999999964", "currency": "USD", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 21.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000066", "date": "2026-07-13", "client": "20999999963", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 90.25}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000018", "date": "2026-07-15", "documentKey": "20999999991/Factura/E002-00000066", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 7.22}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000053", "date": "2026-07-16", "documentKey": "20999999991/Factura/E002-00000066", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 36.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000067", "date": "2026-07-30", "client": "20999999962", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 20, "price": 85.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 240.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 180.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000054", "date": "2026-08-01", "documentKey": "20999999991/Factura/E002-00000067", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 20, "price": 6.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000068", "date": "2026-08-16", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 252.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 115.5}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 2, "price": 5.25}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000055", "date": "2026-08-18", "documentKey": "20999999991/Boleta/B004-00000068", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 20.16}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000055", "date": "2026-08-18", "documentKey": "20999999991/Boleta/B004-00000068", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 20.16}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000069", "date": "2026-09-02", "client": "20999999960", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 352.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 99.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000019", "date": "2026-09-04", "documentKey": "20999999991/Factura/E002-00000069", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 28.16}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000056", "date": "2026-09-05", "documentKey": "20999999991/Factura/E002-00000069", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 11.88}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000070", "date": "2026-09-19", "client": "20999999959", "currency": "USD", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 21.6}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000070", "date": "2026-09-19", "client": "20999999959", "currency": "USD", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 21.6}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000071", "date": "2026-10-06", "client": "20999999958", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 3, "price": 114.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 171.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 722.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000057", "date": "2026-10-08", "documentKey": "20999999991/Factura/E002-00000071", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 3, "price": 9.12}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000072", "date": "2026-10-23", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 450.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 220.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000020", "date": "2026-10-25", "documentKey": "20999999991/Boleta/B004-00000072", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 36.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000058", "date": "2026-10-26", "documentKey": "20999999991/Boleta/B004-00000072", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 26.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000073", "date": "2026-11-09", "client": "20999999980", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1312.5}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 6, "price": 115.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000059", "date": "2026-11-11", "documentKey": "20999999991/Factura/E002-00000073", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 79.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000074", "date": "2026-01-19", "client": "20999999979", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 2.75}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 99.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 66.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 264.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000060", "date": "2026-01-21", "documentKey": "20999999991/Factura/E002-00000074", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.22}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000075", "date": "2026-02-05", "client": "20999999978", "currency": "USD", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000076", "date": "2026-02-22", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 807.5}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000061", "date": "2026-02-24", "documentKey": "20999999991/Boleta/B004-00000076", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 34.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000077", "date": "2026-03-11", "client": "20999999976", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 950.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000062", "date": "2026-03-13", "documentKey": "20999999991/Factura/E002-00000077", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 100.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000078", "date": "2026-03-28", "client": "20999999975", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1312.5}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000021", "date": "2026-03-30", "documentKey": "20999999991/Factura/E002-00000078", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 105.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000063", "date": "2026-03-31", "documentKey": "20999999991/Factura/E002-00000078", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 35.28}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000079", "date": "2026-04-14", "client": "20999999974", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 748.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 198.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 121.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000064", "date": "2026-04-16", "documentKey": "20999999991/Factura/E002-00000079", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 59.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000080", "date": "2026-05-01", "client": "70999991", "currency": "USD", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 21.6}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000080", "date": "2026-05-01", "client": "70999991", "currency": "USD", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 21.6}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000081", "date": "2026-05-18", "client": "20999999972", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 12, "price": 57.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000022", "date": "2026-05-20", "documentKey": "20999999991/Factura/E002-00000081", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 34.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000065", "date": "2026-05-21", "documentKey": "20999999991/Factura/E002-00000081", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 12, "price": 6.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000082", "date": "2026-06-04", "client": "20999999971", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 90.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 6, "price": 110.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 220.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000066", "date": "2026-06-06", "documentKey": "20999999991/Factura/E002-00000082", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 7.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000083", "date": "2026-06-21", "client": "20999999970", "currency": "PEN", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 630.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 2.62}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 798.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 99.75}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000067", "date": "2026-06-23", "documentKey": "20999999991/Factura/E002-00000083", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 50.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000084", "date": "2026-07-08", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 935.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 660.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000023", "date": "2026-07-10", "documentKey": "20999999991/Boleta/B004-00000084", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 74.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000068", "date": "2026-07-11", "documentKey": "20999999991/Boleta/B004-00000084", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 79.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000085", "date": "2026-07-25", "client": "20999999968", "currency": "USD", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000086", "date": "2026-08-11", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 646.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1187.5}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 2.38}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000069", "date": "2026-08-13", "documentKey": "20999999991/Factura/E002-00000086", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 51.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000087", "date": "2026-08-28", "client": "20999999966", "currency": "PEN", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 2, "price": 5.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 95.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000024", "date": "2026-08-30", "documentKey": "20999999991/Factura/E002-00000087", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 2, "price": 0.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000070", "date": "2026-08-31", "documentKey": "20999999991/Factura/E002-00000087", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 11.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000088", "date": "2026-09-14", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1312.5}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 94.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000071", "date": "2026-09-16", "documentKey": "20999999991/Boleta/B004-00000088", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 57.12}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000089", "date": "2026-10-01", "client": "20999999964", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 308.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 748.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 264.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 935.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000072", "date": "2026-10-03", "documentKey": "20999999991/Factura/E002-00000089", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 24.64}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000090", "date": "2026-10-18", "client": "20999999963", "currency": "USD", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 21.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000090", "date": "2026-10-18", "client": "20999999963", "currency": "USD", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 21.6}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000091", "date": "2026-11-04", "client": "20999999962", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1187.5}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 228.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 209.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000073", "date": "2026-11-06", "documentKey": "20999999991/Factura/E002-00000091", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 95.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000092", "date": "2026-01-14", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 950.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 220.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 450.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 180.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000074", "date": "2026-01-16", "documentKey": "20999999991/Boleta/B004-00000092", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 76.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000093", "date": "2026-01-31", "client": "20999999960", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000025", "date": "2026-02-02", "documentKey": "20999999991/Factura/E002-00000093", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 79.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000075", "date": "2026-02-03", "documentKey": "20999999991/Factura/E002-00000093", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 35.28}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000094", "date": "2026-02-17", "client": "20999999959", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 495.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 352.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 660.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000076", "date": "2026-02-19", "documentKey": "20999999991/Factura/E002-00000094", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 39.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000095", "date": "2026-03-06", "client": "20999999958", "currency": "USD", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 6, "price": 28.8}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 204.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000096", "date": "2026-03-23", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 902.5}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000026", "date": "2026-03-25", "documentKey": "20999999991/Boleta/B004-00000096", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 72.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000077", "date": "2026-03-26", "documentKey": "20999999991/Boleta/B004-00000096", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 51.3}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000097", "date": "2026-04-09", "client": "20999999980", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 760.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000078", "date": "2026-04-11", "documentKey": "20999999991/Factura/E002-00000097", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 100.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000098", "date": "2026-04-26", "client": "20999999979", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 6, "price": 126.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 5.25}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000079", "date": "2026-04-28", "documentKey": "20999999991/Factura/E002-00000098", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 6, "price": 10.08}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000099", "date": "2026-05-13", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 748.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 5.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000027", "date": "2026-05-15", "documentKey": "20999999991/Factura/E002-00000099", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 59.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000080", "date": "2026-05-16", "documentKey": "20999999991/Factura/E002-00000099", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 0.66}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000100", "date": "2026-05-30", "client": "70999987", "currency": "USD", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 1.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000100", "date": "2026-05-30", "client": "70999987", "currency": "USD", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 1.2}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000101", "date": "2026-06-16", "client": "20999999976", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 209.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 570.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000081", "date": "2026-06-18", "documentKey": "20999999991/Factura/E002-00000101", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 16.72}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000102", "date": "2026-07-03", "client": "20999999975", "currency": "PEN", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 5.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000028", "date": "2026-07-05", "documentKey": "20999999991/Factura/E002-00000102", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 0.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000028", "date": "2026-07-05", "documentKey": "20999999991/Factura/E002-00000102", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 0.4}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000082", "date": "2026-07-06", "documentKey": "20999999991/Factura/E002-00000102", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 33.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000082", "date": "2026-07-06", "documentKey": "20999999991/Factura/E002-00000102", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 33.6}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000103", "date": "2026-07-20", "client": "20999999974", "currency": "PEN", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 6, "price": 126.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 252.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000083", "date": "2026-07-22", "documentKey": "20999999991/Factura/E002-00000103", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 15.12}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000104", "date": "2026-08-06", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 495.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 308.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 104.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 66.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000084", "date": "2026-08-08", "documentKey": "20999999991/Boleta/B004-00000104", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 39.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000105", "date": "2026-08-23", "client": "20999999972", "currency": "USD", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000106", "date": "2026-09-09", "client": "20999999971", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 90.25}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 807.5}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 228.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000085", "date": "2026-09-11", "documentKey": "20999999991/Factura/E002-00000106", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 7.22}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000107", "date": "2026-09-26", "client": "20999999970", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 95.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 180.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000086", "date": "2026-09-28", "documentKey": "20999999991/Factura/E002-00000107", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 22.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000108", "date": "2026-10-13", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 2.62}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000029", "date": "2026-10-15", "documentKey": "20999999991/Boleta/B004-00000108", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 79.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000087", "date": "2026-10-16", "documentKey": "20999999991/Boleta/B004-00000108", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 0.31}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000109", "date": "2026-10-30", "client": "20999999968", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 748.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 121.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 104.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000088", "date": "2026-11-01", "documentKey": "20999999991/Factura/E002-00000109", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 59.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000110", "date": "2026-01-09", "client": "20999999967", "currency": "USD", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 26.4}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 28.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000110", "date": "2026-01-09", "client": "20999999967", "currency": "USD", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 26.4}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 28.8}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000111", "date": "2026-01-26", "client": "20999999966", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 6, "price": 114.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000030", "date": "2026-01-28", "documentKey": "20999999991/Factura/E002-00000111", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 6, "price": 9.12}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000089", "date": "2026-01-29", "documentKey": "20999999991/Factura/E002-00000111", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 51.3}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000112", "date": "2026-02-12", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 450.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 600.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000090", "date": "2026-02-14", "documentKey": "20999999991/Boleta/B004-00000112", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 68.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000113", "date": "2026-03-01", "client": "20999999964", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 2.62}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 231.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 63.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 2, "price": 5.25}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000091", "date": "2026-03-03", "documentKey": "20999999991/Factura/E002-00000113", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 0.21}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000114", "date": "2026-03-18", "client": "20999999963", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 121.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 660.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000031", "date": "2026-03-20", "documentKey": "20999999991/Factura/E002-00000114", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 9.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000092", "date": "2026-03-21", "documentKey": "20999999991/Factura/E002-00000114", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 79.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000115", "date": "2026-04-04", "client": "20999999962", "currency": "USD", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 3, "price": 28.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000116", "date": "2026-04-21", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 4.75}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 570.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 85.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000093", "date": "2026-04-23", "documentKey": "20999999991/Boleta/B004-00000116", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 0.38}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000117", "date": "2026-05-08", "client": "20999999960", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 950.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 600.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000032", "date": "2026-05-10", "documentKey": "20999999991/Factura/E002-00000117", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 76.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000094", "date": "2026-05-11", "documentKey": "20999999991/Factura/E002-00000117", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 72.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000118", "date": "2026-05-25", "client": "20999999959", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 231.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000095", "date": "2026-05-27", "documentKey": "20999999991/Factura/E002-00000118", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 71.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000119", "date": "2026-06-11", "client": "20999999958", "currency": "PEN", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 198.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 352.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 935.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 99.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000096", "date": "2026-06-13", "documentKey": "20999999991/Factura/E002-00000119", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 15.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000096", "date": "2026-06-13", "documentKey": "20999999991/Factura/E002-00000119", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 15.84}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000120", "date": "2026-06-28", "client": "70999991", "currency": "USD", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000120", "date": "2026-06-28", "client": "70999991", "currency": "USD", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000121", "date": "2026-07-15", "client": "20999999980", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 3, "price": 80.75}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1187.5}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 4, "price": 104.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000097", "date": "2026-07-17", "documentKey": "20999999991/Factura/E002-00000121", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 3, "price": 6.46}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000122", "date": "2026-08-01", "client": "20999999979", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 90.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 760.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 2, "price": 2.5}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000098", "date": "2026-08-03", "documentKey": "20999999991/Factura/E002-00000122", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 7.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000123", "date": "2026-08-18", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 115.5}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 231.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000033", "date": "2026-08-20", "documentKey": "20999999991/Factura/E002-00000123", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 9.24}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000099", "date": "2026-08-21", "documentKey": "20999999991/Factura/E002-00000123", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 27.72}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000124", "date": "2026-09-04", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 1045.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 935.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 6, "price": 121.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000100", "date": "2026-09-06", "documentKey": "20999999991/Boleta/B004-00000124", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 83.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000125", "date": "2026-09-21", "client": "20999999976", "currency": "USD", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 2, "price": 28.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000126", "date": "2026-10-08", "client": "20999999975", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1187.5}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 209.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000034", "date": "2026-10-10", "documentKey": "20999999991/Factura/E002-00000126", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 95.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000101", "date": "2026-10-11", "documentKey": "20999999991/Factura/E002-00000126", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 25.08}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000127", "date": "2026-10-25", "client": "20999999974", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 760.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000102", "date": "2026-10-27", "documentKey": "20999999991/Factura/E002-00000127", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 68.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000128", "date": "2026-11-11", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 4, "price": 5.25}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 2.62}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000103", "date": "2026-11-13", "documentKey": "20999999991/Boleta/B004-00000128", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 4, "price": 0.42}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000129", "date": "2026-01-21", "client": "20999999972", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 2.75}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 99.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000035", "date": "2026-01-23", "documentKey": "20999999991/Factura/E002-00000129", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 0.22}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000104", "date": "2026-01-24", "documentKey": "20999999991/Factura/E002-00000129", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 11.88}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000130", "date": "2026-02-07", "client": "20999999971", "currency": "USD", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 28.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000130", "date": "2026-02-07", "client": "20999999971", "currency": "USD", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 28.8}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000131", "date": "2026-02-24", "client": "20999999970", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 209.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 4, "price": 80.75}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000105", "date": "2026-02-26", "documentKey": "20999999991/Factura/E002-00000131", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 24.32}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000132", "date": "2026-03-13", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 60.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000036", "date": "2026-03-15", "documentKey": "20999999991/Boleta/B004-00000132", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 4.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000106", "date": "2026-03-16", "documentKey": "20999999991/Boleta/B004-00000132", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 33.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000133", "date": "2026-03-30", "client": "20999999968", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 99.75}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 798.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 115.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000107", "date": "2026-04-01", "documentKey": "20999999991/Factura/E002-00000133", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 7.98}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000134", "date": "2026-04-16", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 495.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 660.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 104.5}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 308.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000108", "date": "2026-04-18", "documentKey": "20999999991/Factura/E002-00000134", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 39.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000135", "date": "2026-05-03", "client": "20999999966", "currency": "USD", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 20, "price": 20.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000136", "date": "2026-05-20", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 2.38}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 646.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000109", "date": "2026-05-22", "documentKey": "20999999991/Boleta/B004-00000136", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.19}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000109", "date": "2026-05-22", "documentKey": "20999999991/Boleta/B004-00000136", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.19}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000137", "date": "2026-06-06", "client": "20999999964", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 450.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 95.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 90.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000110", "date": "2026-06-08", "documentKey": "20999999991/Factura/E002-00000137", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 36.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000138", "date": "2026-06-23", "client": "20999999963", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 89.25}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000037", "date": "2026-06-25", "documentKey": "20999999991/Factura/E002-00000138", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 7.14}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000111", "date": "2026-06-26", "documentKey": "20999999991/Factura/E002-00000138", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 35.28}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000139", "date": "2026-07-10", "client": "20999999962", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 748.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 2.75}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 20, "price": 132.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000112", "date": "2026-07-12", "documentKey": "20999999991/Factura/E002-00000139", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 59.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000140", "date": "2026-07-27", "client": "70999987", "currency": "USD", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 20.4}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000140", "date": "2026-07-27", "client": "70999987", "currency": "USD", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 20.4}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000141", "date": "2026-08-13", "client": "20999999960", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 104.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 57.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000038", "date": "2026-08-15", "documentKey": "20999999991/Factura/E002-00000141", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 8.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000113", "date": "2026-08-16", "documentKey": "20999999991/Factura/E002-00000141", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 6.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000142", "date": "2026-08-30", "client": "20999999959", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 3, "price": 120.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000114", "date": "2026-09-01", "documentKey": "20999999991/Factura/E002-00000142", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 3, "price": 9.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000143", "date": "2026-09-16", "client": "20999999958", "currency": "PEN", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 252.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 6, "price": 115.5}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000115", "date": "2026-09-18", "documentKey": "20999999991/Factura/E002-00000143", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 20.16}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000144", "date": "2026-10-03", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 2.75}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 308.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000039", "date": "2026-10-05", "documentKey": "20999999991/Boleta/B004-00000144", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 0.22}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000116", "date": "2026-10-06", "documentKey": "20999999991/Boleta/B004-00000144", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 36.96}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000145", "date": "2026-10-20", "client": "20999999980", "currency": "USD", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000146", "date": "2026-11-06", "client": "20999999979", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 2, "price": 85.5}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 228.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 20, "price": 114.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 570.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000117", "date": "2026-11-08", "documentKey": "20999999991/Factura/E002-00000146", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 2, "price": 6.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000147", "date": "2026-01-16", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 90.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 4, "price": 110.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000040", "date": "2026-01-18", "documentKey": "20999999991/Factura/E002-00000147", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 7.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000118", "date": "2026-01-19", "documentKey": "20999999991/Factura/E002-00000147", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 4, "price": 13.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000148", "date": "2026-02-02", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 63.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1312.5}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000119", "date": "2026-02-04", "documentKey": "20999999991/Boleta/B004-00000148", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 5.04}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000149", "date": "2026-02-19", "client": "20999999976", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 3, "price": 93.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 66.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 99.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000120", "date": "2026-02-21", "documentKey": "20999999991/Factura/E002-00000149", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 3, "price": 7.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000150", "date": "2026-03-08", "client": "20999999975", "currency": "USD", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 0.6}, {"productId": "S008", "description": "Capacitación contable", "quantity": 6, "price": 14.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000150", "date": "2026-03-08", "client": "20999999975", "currency": "USD", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 0.6}, {"productId": "S008", "description": "Capacitación contable", "quantity": 6, "price": 14.4}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000151", "date": "2026-03-25", "client": "20999999974", "currency": "PEN", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 228.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1187.5}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000121", "date": "2026-03-27", "documentKey": "20999999991/Factura/E002-00000151", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 18.24}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000152", "date": "2026-04-11", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 180.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 90.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 6, "price": 60.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000122", "date": "2026-04-13", "documentKey": "20999999991/Boleta/B004-00000152", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 14.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000153", "date": "2026-04-28", "client": "20999999972", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 798.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 630.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000041", "date": "2026-04-30", "documentKey": "20999999991/Factura/E002-00000153", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 63.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000041", "date": "2026-04-30", "documentKey": "20999999991/Factura/E002-00000153", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 63.84}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000123", "date": "2026-05-01", "documentKey": "20999999991/Factura/E002-00000153", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 75.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000123", "date": "2026-05-01", "documentKey": "20999999991/Factura/E002-00000153", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 75.6}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000154", "date": "2026-05-15", "client": "20999999971", "currency": "PEN", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 660.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 748.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 495.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000124", "date": "2026-05-17", "documentKey": "20999999991/Factura/E002-00000154", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 52.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000155", "date": "2026-06-01", "client": "20999999970", "currency": "USD", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000156", "date": "2026-06-18", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 20, "price": 114.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 4.75}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000042", "date": "2026-06-20", "documentKey": "20999999991/Boleta/B004-00000156", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 20, "price": 9.12}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000125", "date": "2026-06-21", "documentKey": "20999999991/Boleta/B004-00000156", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 0.57}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000157", "date": "2026-07-05", "client": "20999999968", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 90.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000126", "date": "2026-07-07", "documentKey": "20999999991/Factura/E002-00000157", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 7.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000158", "date": "2026-07-22", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 63.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000127", "date": "2026-07-24", "documentKey": "20999999991/Factura/E002-00000158", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 5.04}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000159", "date": "2026-08-08", "client": "20999999966", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 93.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 66.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000043", "date": "2026-08-10", "documentKey": "20999999991/Factura/E002-00000159", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 7.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000128", "date": "2026-08-11", "documentKey": "20999999991/Factura/E002-00000159", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 7.92}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000160", "date": "2026-08-25", "client": "70999991", "currency": "USD", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000160", "date": "2026-08-25", "client": "70999991", "currency": "USD", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000161", "date": "2026-09-11", "client": "20999999964", "currency": "PEN", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 570.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 228.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 722.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000129", "date": "2026-09-13", "documentKey": "20999999991/Factura/E002-00000161", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 45.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000162", "date": "2026-09-28", "client": "20999999963", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 760.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000044", "date": "2026-09-30", "documentKey": "20999999991/Factura/E002-00000162", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 100.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000130", "date": "2026-10-01", "documentKey": "20999999991/Factura/E002-00000162", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 91.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000163", "date": "2026-10-15", "client": "20999999962", "currency": "PEN", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 630.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 94.5}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000131", "date": "2026-10-17", "documentKey": "20999999991/Factura/E002-00000163", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 50.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000164", "date": "2026-11-01", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 20, "price": 121.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 99.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 352.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000132", "date": "2026-11-03", "documentKey": "20999999991/Boleta/B004-00000164", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 20, "price": 9.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000165", "date": "2026-01-11", "client": "20999999960", "currency": "USD", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 1.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000166", "date": "2026-01-28", "client": "20999999959", "currency": "PEN", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 570.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 57.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1187.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000133", "date": "2026-01-30", "documentKey": "20999999991/Factura/E002-00000166", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 45.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000167", "date": "2026-02-14", "client": "20999999958", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 2.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 60.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 450.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000134", "date": "2026-02-16", "documentKey": "20999999991/Factura/E002-00000167", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 22.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000168", "date": "2026-03-03", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1312.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000045", "date": "2026-03-05", "documentKey": "20999999991/Boleta/B004-00000168", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 79.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000135", "date": "2026-03-06", "documentKey": "20999999991/Boleta/B004-00000168", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 157.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000169", "date": "2026-03-20", "client": "20999999980", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1375.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 264.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 2.75}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000136", "date": "2026-03-22", "documentKey": "20999999991/Factura/E002-00000169", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 110.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000170", "date": "2026-04-06", "client": "20999999979", "currency": "USD", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.6}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000170", "date": "2026-04-06", "client": "20999999979", "currency": "USD", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.6}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000171", "date": "2026-04-23", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 902.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000046", "date": "2026-04-25", "documentKey": "20999999991/Factura/E002-00000171", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 34.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000137", "date": "2026-04-26", "documentKey": "20999999991/Factura/E002-00000171", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 108.3}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000172", "date": "2026-05-10", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 90.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000138", "date": "2026-05-12", "documentKey": "20999999991/Boleta/B004-00000172", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 54.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000173", "date": "2026-05-27", "client": "20999999976", "currency": "PEN", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 4, "price": 5.25}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 89.25}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 99.75}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 252.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000139", "date": "2026-05-29", "documentKey": "20999999991/Factura/E002-00000173", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 4, "price": 0.42}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000174", "date": "2026-06-13", "client": "20999999975", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 104.5}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 495.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000047", "date": "2026-06-15", "documentKey": "20999999991/Factura/E002-00000174", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 8.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000140", "date": "2026-06-16", "documentKey": "20999999991/Factura/E002-00000174", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 59.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000175", "date": "2026-06-30", "client": "20999999974", "currency": "USD", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 0.6}, {"productId": "S008", "description": "Capacitación contable", "quantity": 6, "price": 14.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000176", "date": "2026-07-17", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 4, "price": 104.5}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 570.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 85.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000141", "date": "2026-07-19", "documentKey": "20999999991/Boleta/B004-00000176", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 24.32}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000177", "date": "2026-08-03", "client": "20999999972", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 760.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Débito", "number": "E002-00000048", "date": "2026-08-05", "documentKey": "20999999991/Factura/E002-00000177", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 54.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000142", "date": "2026-08-06", "documentKey": "20999999991/Factura/E002-00000177", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 91.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000178", "date": "2026-08-20", "client": "20999999971", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 798.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 2, "price": 94.5}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000143", "date": "2026-08-22", "documentKey": "20999999991/Factura/E002-00000178", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 63.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Factura", "number": "E002-00000179", "date": "2026-09-06", "client": "20999999970", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 93.5}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 308.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 935.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Crédito", "number": "FC02-00000144", "date": "2026-09-08", "documentKey": "20999999991/Factura/E002-00000179", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 19.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000180", "date": "2026-09-23", "client": "70999987", "currency": "USD", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 21.6}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999991", "type": "Boleta", "number": "B004-00000180", "date": "2026-09-23", "client": "70999987", "currency": "USD", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 21.6}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000001", "date": "2026-01-25", "client": "20999999975", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 646.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 722.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000001", "date": "2026-01-27", "documentKey": "20999999992/Factura/E002-00000001", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 51.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000002", "date": "2026-02-11", "client": "20999999974", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 95.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 240.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000002", "date": "2026-02-13", "documentKey": "20999999992/Factura/E002-00000002", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 25.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000003", "date": "2026-02-28", "client": "20999999973", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 252.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000001", "date": "2026-03-02", "documentKey": "20999999992/Factura/E002-00000003", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 71.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000003", "date": "2026-03-03", "documentKey": "20999999992/Factura/E002-00000003", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 30.24}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000004", "date": "2026-03-17", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 20, "price": 2.75}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 99.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 4, "price": 5.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000004", "date": "2026-03-19", "documentKey": "20999999992/Boleta/B004-00000004", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 20, "price": 0.22}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000005", "date": "2026-04-03", "client": "20999999971", "currency": "USD", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 1.2}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 204.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 21.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000006", "date": "2026-04-20", "client": "20999999970", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 209.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 646.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000002", "date": "2026-04-22", "documentKey": "20999999992/Factura/E002-00000006", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 16.72}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000005", "date": "2026-04-23", "documentKey": "20999999992/Factura/E002-00000006", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 77.52}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000007", "date": "2026-05-07", "client": "20999999969", "currency": "PEN", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 2, "price": 5.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 4, "price": 110.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000006", "date": "2026-05-09", "documentKey": "20999999992/Factura/E002-00000007", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 2, "price": 0.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000008", "date": "2026-05-24", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 89.25}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 5.25}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1312.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000007", "date": "2026-05-26", "documentKey": "20999999992/Boleta/B004-00000008", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 23.52}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000009", "date": "2026-06-10", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 2.75}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 1045.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000003", "date": "2026-06-12", "documentKey": "20999999992/Factura/E002-00000009", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.22}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000008", "date": "2026-06-13", "documentKey": "20999999992/Factura/E002-00000009", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 125.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000010", "date": "2026-06-27", "client": "20999999966", "currency": "USD", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 204.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000010", "date": "2026-06-27", "client": "20999999966", "currency": "USD", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 204.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000011", "date": "2026-07-14", "client": "20999999965", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 722.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 4, "price": 4.75}, {"productId": "S008", "description": "Capacitación contable", "quantity": 12, "price": 57.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000009", "date": "2026-07-16", "documentKey": "20999999992/Factura/E002-00000011", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 57.76}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000012", "date": "2026-07-31", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 110.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000004", "date": "2026-08-02", "documentKey": "20999999992/Boleta/B004-00000012", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 8.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000010", "date": "2026-08-03", "documentKey": "20999999992/Boleta/B004-00000012", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 38.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000013", "date": "2026-08-17", "client": "20999999963", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 2.62}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 94.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000011", "date": "2026-08-19", "documentKey": "20999999992/Factura/E002-00000013", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 0.21}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000014", "date": "2026-09-03", "client": "20999999962", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 121.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 264.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 836.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000012", "date": "2026-09-05", "documentKey": "20999999992/Factura/E002-00000014", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 9.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000015", "date": "2026-09-20", "client": "20999999961", "currency": "USD", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000016", "date": "2026-10-07", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 3, "price": 114.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 90.25}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000013", "date": "2026-10-09", "documentKey": "20999999992/Boleta/B004-00000016", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 34.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000017", "date": "2026-10-24", "client": "20999999959", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 760.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 600.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 950.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 2, "price": 90.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000014", "date": "2026-10-26", "documentKey": "20999999992/Factura/E002-00000017", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 60.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000014", "date": "2026-10-26", "documentKey": "20999999992/Factura/E002-00000017", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 60.8}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000018", "date": "2026-11-10", "client": "20999999958", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000005", "date": "2026-11-12", "documentKey": "20999999992/Factura/E002-00000018", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 26.88}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000015", "date": "2026-11-13", "documentKey": "20999999992/Factura/E002-00000018", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 35.28}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000019", "date": "2026-01-20", "client": "20999999981", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 748.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 99.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1375.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000016", "date": "2026-01-22", "documentKey": "20999999992/Factura/E002-00000019", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 59.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000020", "date": "2026-02-06", "client": "70999987", "currency": "USD", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 0.6}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000020", "date": "2026-02-06", "client": "70999987", "currency": "USD", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 0.6}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000021", "date": "2026-02-23", "client": "20999999979", "currency": "PEN", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 171.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 228.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000006", "date": "2026-02-25", "documentKey": "20999999992/Factura/E002-00000021", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 13.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000017", "date": "2026-02-26", "documentKey": "20999999992/Factura/E002-00000021", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 27.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000022", "date": "2026-03-12", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 950.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 600.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000018", "date": "2026-03-14", "documentKey": "20999999992/Factura/E002-00000022", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 68.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000023", "date": "2026-03-29", "client": "20999999977", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 3, "price": 89.25}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1312.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000019", "date": "2026-03-31", "documentKey": "20999999992/Factura/E002-00000023", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 3, "price": 7.14}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000024", "date": "2026-04-15", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 121.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1375.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000007", "date": "2026-04-17", "documentKey": "20999999992/Boleta/B004-00000024", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 9.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000020", "date": "2026-04-18", "documentKey": "20999999992/Boleta/B004-00000024", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 165.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000025", "date": "2026-05-02", "client": "20999999975", "currency": "USD", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}, {"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 14.4}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000026", "date": "2026-05-19", "client": "20999999974", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 902.5}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 4.75}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 85.5}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000021", "date": "2026-05-21", "documentKey": "20999999992/Factura/E002-00000026", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 72.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000027", "date": "2026-06-05", "client": "20999999973", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 90.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000008", "date": "2026-06-07", "documentKey": "20999999992/Factura/E002-00000027", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 100.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000022", "date": "2026-06-08", "documentKey": "20999999992/Factura/E002-00000027", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 10.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000028", "date": "2026-06-22", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 798.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1312.5}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000023", "date": "2026-06-24", "documentKey": "20999999992/Boleta/B004-00000028", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 63.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000029", "date": "2026-07-09", "client": "20999999971", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 2, "price": 132.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 12, "price": 5.5}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 2.75}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 836.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000024", "date": "2026-07-11", "documentKey": "20999999992/Factura/E002-00000029", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 2, "price": 10.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000030", "date": "2026-07-26", "client": "20999999970", "currency": "USD", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 4, "price": 26.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000030", "date": "2026-07-26", "client": "20999999970", "currency": "USD", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 4, "price": 26.4}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000031", "date": "2026-08-12", "client": "20999999969", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 902.5}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 646.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000025", "date": "2026-08-14", "documentKey": "20999999992/Factura/E002-00000031", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 21.28}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000032", "date": "2026-08-29", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 95.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 760.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 110.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000026", "date": "2026-08-31", "documentKey": "20999999992/Boleta/B004-00000032", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 7.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000033", "date": "2026-09-15", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 798.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 89.25}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000009", "date": "2026-09-17", "documentKey": "20999999992/Factura/E002-00000033", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 63.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000027", "date": "2026-09-18", "documentKey": "20999999992/Factura/E002-00000033", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 10.71}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000034", "date": "2026-10-02", "client": "20999999966", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 132.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 352.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000028", "date": "2026-10-04", "documentKey": "20999999992/Factura/E002-00000034", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 10.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000028", "date": "2026-10-04", "documentKey": "20999999992/Factura/E002-00000034", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 10.56}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000035", "date": "2026-10-19", "client": "20999999965", "currency": "USD", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 21.6}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 204.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 1.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000036", "date": "2026-11-05", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 85.5}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 902.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000010", "date": "2026-11-07", "documentKey": "20999999992/Boleta/B004-00000036", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 6.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000029", "date": "2026-11-08", "documentKey": "20999999992/Boleta/B004-00000036", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 108.3}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000037", "date": "2026-01-15", "client": "20999999963", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 450.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 220.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000030", "date": "2026-01-17", "documentKey": "20999999992/Factura/E002-00000037", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 36.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000038", "date": "2026-02-01", "client": "20999999962", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 99.75}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 231.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 94.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000031", "date": "2026-02-03", "documentKey": "20999999992/Factura/E002-00000038", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 7.98}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000039", "date": "2026-02-18", "client": "20999999961", "currency": "PEN", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 198.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 5.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000011", "date": "2026-02-20", "documentKey": "20999999992/Factura/E002-00000039", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 15.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000032", "date": "2026-02-21", "documentKey": "20999999992/Factura/E002-00000039", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 0.66}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000040", "date": "2026-03-07", "client": "70999991", "currency": "USD", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 2, "price": 21.6}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 2, "price": 1.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000040", "date": "2026-03-07", "client": "70999991", "currency": "USD", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 2, "price": 21.6}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 2, "price": 1.2}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000041", "date": "2026-03-24", "client": "20999999959", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 90.25}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 12, "price": 114.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 2.38}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 4, "price": 4.75}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000033", "date": "2026-03-26", "documentKey": "20999999992/Factura/E002-00000041", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 7.22}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000042", "date": "2026-04-10", "client": "20999999958", "currency": "PEN", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 240.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 5.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000012", "date": "2026-04-12", "documentKey": "20999999992/Factura/E002-00000042", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 19.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000034", "date": "2026-04-13", "documentKey": "20999999992/Factura/E002-00000042", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 0.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000043", "date": "2026-04-27", "client": "20999999981", "currency": "PEN", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 231.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000035", "date": "2026-04-29", "documentKey": "20999999992/Factura/E002-00000043", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 15.12}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000044", "date": "2026-05-14", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 935.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 660.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 4, "price": 5.5}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 1045.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000036", "date": "2026-05-16", "documentKey": "20999999992/Boleta/B004-00000044", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 74.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000045", "date": "2026-05-31", "client": "20999999979", "currency": "USD", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000046", "date": "2026-06-17", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 646.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 6, "price": 114.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 722.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000037", "date": "2026-06-19", "documentKey": "20999999992/Factura/E002-00000046", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 51.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000047", "date": "2026-07-04", "client": "20999999977", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 450.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 12, "price": 5.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 95.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000038", "date": "2026-07-06", "documentKey": "20999999992/Factura/E002-00000047", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 54.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000048", "date": "2026-07-21", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 6, "price": 126.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 99.75}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000013", "date": "2026-07-23", "documentKey": "20999999992/Boleta/B004-00000048", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 6, "price": 10.08}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000039", "date": "2026-07-24", "documentKey": "20999999992/Boleta/B004-00000048", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 11.97}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000049", "date": "2026-08-07", "client": "20999999975", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 1045.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 264.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 836.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000040", "date": "2026-08-09", "documentKey": "20999999992/Factura/E002-00000049", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 83.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000050", "date": "2026-08-24", "client": "20999999974", "currency": "USD", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.6}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000050", "date": "2026-08-24", "client": "20999999974", "currency": "USD", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.6}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000051", "date": "2026-09-10", "client": "20999999973", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000014", "date": "2026-09-12", "documentKey": "20999999992/Factura/E002-00000051", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 21.28}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000014", "date": "2026-09-12", "documentKey": "20999999992/Factura/E002-00000051", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 21.28}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000041", "date": "2026-09-13", "documentKey": "20999999992/Factura/E002-00000051", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 51.3}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000041", "date": "2026-09-13", "documentKey": "20999999992/Factura/E002-00000051", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 51.3}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000052", "date": "2026-09-27", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 220.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 760.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000042", "date": "2026-09-29", "documentKey": "20999999992/Boleta/B004-00000052", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 68.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000053", "date": "2026-10-14", "client": "20999999971", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 94.5}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 630.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 252.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000043", "date": "2026-10-16", "documentKey": "20999999992/Factura/E002-00000053", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 7.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000054", "date": "2026-10-31", "client": "20999999970", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 308.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000015", "date": "2026-11-02", "documentKey": "20999999992/Factura/E002-00000054", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 19.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000044", "date": "2026-11-03", "documentKey": "20999999992/Factura/E002-00000054", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 36.96}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000055", "date": "2026-01-10", "client": "20999999969", "currency": "USD", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 20, "price": 28.8}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 2, "price": 1.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000056", "date": "2026-01-27", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 80.75}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 722.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 4.75}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000045", "date": "2026-01-29", "documentKey": "20999999992/Boleta/B004-00000056", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 6.46}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000057", "date": "2026-02-13", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000016", "date": "2026-02-15", "documentKey": "20999999992/Factura/E002-00000057", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 100.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000046", "date": "2026-02-16", "documentKey": "20999999992/Factura/E002-00000057", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 33.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000058", "date": "2026-03-02", "client": "20999999966", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 63.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000047", "date": "2026-03-04", "documentKey": "20999999992/Factura/E002-00000058", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 71.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000059", "date": "2026-03-19", "client": "20999999965", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 1045.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 5.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 66.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 836.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000048", "date": "2026-03-21", "documentKey": "20999999992/Factura/E002-00000059", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 83.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000060", "date": "2026-04-05", "client": "70999987", "currency": "USD", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000060", "date": "2026-04-05", "client": "70999987", "currency": "USD", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000061", "date": "2026-04-22", "client": "20999999963", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 85.5}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 2, "price": 2.38}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000049", "date": "2026-04-24", "documentKey": "20999999992/Factura/E002-00000061", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 6.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000062", "date": "2026-05-09", "client": "20999999962", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 220.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 60.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000050", "date": "2026-05-11", "documentKey": "20999999992/Factura/E002-00000062", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 25.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000063", "date": "2026-05-26", "client": "20999999961", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 20, "price": 115.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 63.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000017", "date": "2026-05-28", "documentKey": "20999999992/Factura/E002-00000063", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 20, "price": 9.24}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000051", "date": "2026-05-29", "documentKey": "20999999992/Factura/E002-00000063", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 7.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000064", "date": "2026-06-12", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 5.5}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 660.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000052", "date": "2026-06-14", "documentKey": "20999999992/Boleta/B004-00000064", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 0.44}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000065", "date": "2026-06-29", "client": "20999999959", "currency": "USD", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 1.2}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 28.8}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000066", "date": "2026-07-16", "client": "20999999958", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 20, "price": 80.75}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 85.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000018", "date": "2026-07-18", "documentKey": "20999999992/Factura/E002-00000066", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 20, "price": 6.46}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000053", "date": "2026-07-19", "documentKey": "20999999992/Factura/E002-00000066", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 10.26}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000067", "date": "2026-08-02", "client": "20999999981", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 450.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 95.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000054", "date": "2026-08-04", "documentKey": "20999999992/Factura/E002-00000067", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 100.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000068", "date": "2026-08-19", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 89.25}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000055", "date": "2026-08-21", "documentKey": "20999999992/Boleta/B004-00000068", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 79.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000055", "date": "2026-08-21", "documentKey": "20999999992/Boleta/B004-00000068", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 79.8}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000069", "date": "2026-09-05", "client": "20999999979", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 748.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 660.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000019", "date": "2026-09-07", "documentKey": "20999999992/Factura/E002-00000069", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 59.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000056", "date": "2026-09-08", "documentKey": "20999999992/Factura/E002-00000069", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 79.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000070", "date": "2026-09-22", "client": "20999999978", "currency": "USD", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 2, "price": 28.8}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000070", "date": "2026-09-22", "client": "20999999978", "currency": "USD", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 2, "price": 28.8}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000071", "date": "2026-10-09", "client": "20999999977", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 12, "price": 57.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 171.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 104.5}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1187.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000057", "date": "2026-10-11", "documentKey": "20999999992/Factura/E002-00000071", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 12, "price": 4.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000072", "date": "2026-10-26", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 600.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 60.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000020", "date": "2026-10-28", "documentKey": "20999999992/Boleta/B004-00000072", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 48.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000058", "date": "2026-10-29", "documentKey": "20999999992/Boleta/B004-00000072", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 7.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000073", "date": "2026-01-05", "client": "20999999975", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 126.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000059", "date": "2026-01-07", "documentKey": "20999999992/Factura/E002-00000073", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 71.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000074", "date": "2026-01-22", "client": "20999999974", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 104.5}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 660.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 5.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000060", "date": "2026-01-24", "documentKey": "20999999992/Factura/E002-00000074", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 8.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000075", "date": "2026-02-08", "client": "20999999973", "currency": "USD", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 43.2}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000076", "date": "2026-02-25", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 3, "price": 80.75}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 90.25}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 2.38}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000061", "date": "2026-02-27", "documentKey": "20999999992/Boleta/B004-00000076", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 3, "price": 6.46}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000077", "date": "2026-03-14", "client": "20999999971", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 6, "price": 120.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 4, "price": 2.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000062", "date": "2026-03-16", "documentKey": "20999999992/Factura/E002-00000077", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 22.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000078", "date": "2026-03-31", "client": "20999999970", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 472.5}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 20, "price": 89.25}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000021", "date": "2026-04-02", "documentKey": "20999999992/Factura/E002-00000078", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 37.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000063", "date": "2026-04-03", "documentKey": "20999999992/Factura/E002-00000078", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 20, "price": 10.71}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000079", "date": "2026-04-17", "client": "20999999969", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 308.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 5.5}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 2, "price": 99.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000064", "date": "2026-04-19", "documentKey": "20999999992/Factura/E002-00000079", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 24.64}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000080", "date": "2026-05-04", "client": "70999991", "currency": "USD", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 204.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 26.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000080", "date": "2026-05-04", "client": "70999991", "currency": "USD", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 204.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 3, "price": 26.4}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000081", "date": "2026-05-21", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 12, "price": 104.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000022", "date": "2026-05-23", "documentKey": "20999999992/Factura/E002-00000081", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 34.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000065", "date": "2026-05-24", "documentKey": "20999999992/Factura/E002-00000081", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 12, "price": 12.54}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000082", "date": "2026-06-07", "client": "20999999966", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 950.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 20, "price": 120.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000066", "date": "2026-06-09", "documentKey": "20999999992/Factura/E002-00000082", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 76.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000083", "date": "2026-06-24", "client": "20999999965", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 472.5}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 12, "price": 5.25}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 6, "price": 63.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000067", "date": "2026-06-26", "documentKey": "20999999992/Factura/E002-00000083", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 37.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000084", "date": "2026-07-11", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1375.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 935.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000023", "date": "2026-07-13", "documentKey": "20999999992/Boleta/B004-00000084", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 110.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000068", "date": "2026-07-14", "documentKey": "20999999992/Boleta/B004-00000084", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 112.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000085", "date": "2026-07-28", "client": "20999999963", "currency": "USD", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 20.4}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 12, "price": 1.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000086", "date": "2026-08-14", "client": "20999999962", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1187.5}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 646.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 570.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000069", "date": "2026-08-16", "documentKey": "20999999992/Factura/E002-00000086", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 95.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000087", "date": "2026-08-31", "client": "20999999961", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000024", "date": "2026-09-02", "documentKey": "20999999992/Factura/E002-00000087", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 68.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000070", "date": "2026-09-03", "documentKey": "20999999992/Factura/E002-00000087", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 33.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000088", "date": "2026-09-17", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 3, "price": 126.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000071", "date": "2026-09-19", "documentKey": "20999999992/Boleta/B004-00000088", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 71.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000089", "date": "2026-10-04", "client": "20999999959", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 4, "price": 93.5}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 1045.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 495.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1375.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000072", "date": "2026-10-06", "documentKey": "20999999992/Factura/E002-00000089", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 4, "price": 7.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000090", "date": "2026-10-21", "client": "20999999958", "currency": "USD", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 1.2}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000090", "date": "2026-10-21", "client": "20999999958", "currency": "USD", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 1.2}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000091", "date": "2026-11-07", "client": "20999999981", "currency": "PEN", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 90.25}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 4.75}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 807.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000073", "date": "2026-11-09", "documentKey": "20999999992/Factura/E002-00000091", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 7.22}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000092", "date": "2026-01-17", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 12, "price": 60.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000074", "date": "2026-01-19", "documentKey": "20999999992/Boleta/B004-00000092", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 12, "price": 4.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000093", "date": "2026-02-03", "client": "20999999979", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 63.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 2, "price": 126.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000025", "date": "2026-02-05", "documentKey": "20999999992/Factura/E002-00000093", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 5.04}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000075", "date": "2026-02-06", "documentKey": "20999999992/Factura/E002-00000093", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 2, "price": 15.12}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000094", "date": "2026-02-20", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 5.5}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 264.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 836.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000076", "date": "2026-02-22", "documentKey": "20999999992/Factura/E002-00000094", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 20, "price": 0.44}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000095", "date": "2026-03-09", "client": "20999999977", "currency": "USD", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 0.6}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 20, "price": 26.4}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 20.4}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000096", "date": "2026-03-26", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 3, "price": 80.75}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000026", "date": "2026-03-28", "documentKey": "20999999992/Boleta/B004-00000096", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 34.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000077", "date": "2026-03-29", "documentKey": "20999999992/Boleta/B004-00000096", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 3, "price": 9.69}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000097", "date": "2026-04-12", "client": "20999999975", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 12, "price": 110.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000078", "date": "2026-04-14", "documentKey": "20999999992/Factura/E002-00000097", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 68.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000098", "date": "2026-04-29", "client": "20999999974", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 472.5}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 63.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000079", "date": "2026-05-01", "documentKey": "20999999992/Factura/E002-00000098", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 26.88}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000099", "date": "2026-05-16", "client": "20999999973", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 748.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 99.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000027", "date": "2026-05-18", "documentKey": "20999999992/Factura/E002-00000099", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 59.84}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000080", "date": "2026-05-19", "documentKey": "20999999992/Factura/E002-00000099", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 11.88}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000100", "date": "2026-06-02", "client": "70999987", "currency": "USD", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 14.4}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000100", "date": "2026-06-02", "client": "70999987", "currency": "USD", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 14.4}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000101", "date": "2026-06-19", "client": "20999999971", "currency": "PEN", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 171.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 4, "price": 80.75}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1187.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 12, "price": 57.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000081", "date": "2026-06-21", "documentKey": "20999999992/Factura/E002-00000101", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 13.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000102", "date": "2026-07-06", "client": "20999999970", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 4, "price": 85.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000028", "date": "2026-07-08", "documentKey": "20999999992/Factura/E002-00000102", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 54.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000028", "date": "2026-07-08", "documentKey": "20999999992/Factura/E002-00000102", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 54.4}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000082", "date": "2026-07-09", "documentKey": "20999999992/Factura/E002-00000102", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 4, "price": 10.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000082", "date": "2026-07-09", "documentKey": "20999999992/Factura/E002-00000102", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 4, "price": 10.2}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000103", "date": "2026-07-23", "client": "20999999969", "currency": "PEN", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 252.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 472.5}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 3, "price": 126.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000083", "date": "2026-07-25", "documentKey": "20999999992/Factura/E002-00000103", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 20.16}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000104", "date": "2026-08-09", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 352.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 99.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 20, "price": 121.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 935.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000084", "date": "2026-08-11", "documentKey": "20999999992/Boleta/B004-00000104", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 28.16}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000105", "date": "2026-08-26", "client": "20999999967", "currency": "USD", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 20, "price": 0.6}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000106", "date": "2026-09-12", "client": "20999999966", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 57.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 209.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 85.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000085", "date": "2026-09-14", "documentKey": "20999999992/Factura/E002-00000106", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 3, "price": 4.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000107", "date": "2026-09-29", "client": "20999999965", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 240.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 5.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000086", "date": "2026-10-01", "documentKey": "20999999992/Factura/E002-00000107", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 100.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000108", "date": "2026-10-16", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 231.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000029", "date": "2026-10-18", "documentKey": "20999999992/Boleta/B004-00000108", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 18.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000087", "date": "2026-10-19", "documentKey": "20999999992/Boleta/B004-00000108", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 85.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000109", "date": "2026-11-02", "client": "20999999963", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 104.5}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 198.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000088", "date": "2026-11-04", "documentKey": "20999999992/Factura/E002-00000109", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 19.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000110", "date": "2026-01-12", "client": "20999999962", "currency": "USD", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 1.2}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000110", "date": "2026-01-12", "client": "20999999962", "currency": "USD", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 1.2}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000111", "date": "2026-01-29", "client": "20999999961", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 209.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000030", "date": "2026-01-31", "documentKey": "20999999992/Factura/E002-00000111", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 16.72}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000089", "date": "2026-02-01", "documentKey": "20999999992/Factura/E002-00000111", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 51.3}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000112", "date": "2026-02-15", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 760.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 60.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 950.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000090", "date": "2026-02-17", "documentKey": "20999999992/Boleta/B004-00000112", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 60.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000113", "date": "2026-03-04", "client": "20999999959", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 63.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 4, "price": 89.25}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 6, "price": 94.5}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 630.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000091", "date": "2026-03-06", "documentKey": "20999999992/Factura/E002-00000113", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 5.04}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000114", "date": "2026-03-21", "client": "20999999958", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 93.5}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000031", "date": "2026-03-23", "documentKey": "20999999992/Factura/E002-00000114", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 12, "price": 7.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000092", "date": "2026-03-24", "documentKey": "20999999992/Factura/E002-00000114", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 29.04}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000115", "date": "2026-04-07", "client": "20999999981", "currency": "USD", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 6, "price": 26.4}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000116", "date": "2026-04-24", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 646.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 807.5}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 85.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000093", "date": "2026-04-26", "documentKey": "20999999992/Boleta/B004-00000116", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 51.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000117", "date": "2026-05-11", "client": "20999999979", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 760.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000032", "date": "2026-05-13", "documentKey": "20999999992/Factura/E002-00000117", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 60.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000094", "date": "2026-05-14", "documentKey": "20999999992/Factura/E002-00000117", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 38.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000118", "date": "2026-05-28", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 997.5}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000095", "date": "2026-05-30", "documentKey": "20999999992/Factura/E002-00000118", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 23.52}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000119", "date": "2026-06-14", "client": "20999999977", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 836.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 264.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 12, "price": 132.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1375.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000096", "date": "2026-06-16", "documentKey": "20999999992/Factura/E002-00000119", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 66.88}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000096", "date": "2026-06-16", "documentKey": "20999999992/Factura/E002-00000119", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 66.88}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000120", "date": "2026-07-01", "client": "70999991", "currency": "USD", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 1.2}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000120", "date": "2026-07-01", "client": "70999991", "currency": "USD", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 6, "price": 1.2}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000121", "date": "2026-07-18", "client": "20999999975", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 6, "price": 57.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 266.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 12, "price": 114.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000097", "date": "2026-07-20", "documentKey": "20999999992/Factura/E002-00000121", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 6, "price": 4.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000122", "date": "2026-08-04", "client": "20999999974", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 60.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 220.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 180.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 6, "price": 110.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000098", "date": "2026-08-06", "documentKey": "20999999992/Factura/E002-00000122", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 4, "price": 4.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000123", "date": "2026-08-21", "client": "20999999973", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 20, "price": 89.25}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000033", "date": "2026-08-23", "documentKey": "20999999992/Factura/E002-00000123", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 20, "price": 7.14}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000099", "date": "2026-08-24", "documentKey": "20999999992/Factura/E002-00000123", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 40.32}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000124", "date": "2026-09-07", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 935.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 6, "price": 66.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 198.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000100", "date": "2026-09-09", "documentKey": "20999999992/Boleta/B004-00000124", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 74.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000125", "date": "2026-09-24", "client": "20999999971", "currency": "USD", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 108.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}, {"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 14.4}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 0.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000126", "date": "2026-10-11", "client": "20999999970", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 209.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000034", "date": "2026-10-13", "documentKey": "20999999992/Factura/E002-00000126", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 24.32}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000101", "date": "2026-10-14", "documentKey": "20999999992/Factura/E002-00000126", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 25.08}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000127", "date": "2026-10-28", "client": "20999999969", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 95.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 280.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000102", "date": "2026-10-30", "documentKey": "20999999992/Factura/E002-00000127", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 68.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000128", "date": "2026-01-07", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 2.62}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 231.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 252.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000103", "date": "2026-01-09", "documentKey": "20999999992/Boleta/B004-00000128", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 57.12}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000129", "date": "2026-01-24", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 2.75}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 12, "price": 5.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000035", "date": "2026-01-26", "documentKey": "20999999992/Factura/E002-00000129", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.22}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000104", "date": "2026-01-27", "documentKey": "20999999992/Factura/E002-00000129", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 12, "price": 0.66}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000130", "date": "2026-02-10", "client": "20999999966", "currency": "USD", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 0.6}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 2, "price": 21.6}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000130", "date": "2026-02-10", "client": "20999999966", "currency": "USD", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 12, "price": 0.6}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 2, "price": 21.6}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000131", "date": "2026-02-27", "client": "20999999965", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 902.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 57.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 20, "price": 2.38}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 12, "price": 4.75}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000105", "date": "2026-03-01", "documentKey": "20999999992/Factura/E002-00000131", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 72.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000132", "date": "2026-03-16", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 220.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000036", "date": "2026-03-18", "documentKey": "20999999992/Boleta/B004-00000132", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 17.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000106", "date": "2026-03-19", "documentKey": "20999999992/Boleta/B004-00000132", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 102.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000133", "date": "2026-04-02", "client": "20999999963", "currency": "PEN", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 252.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 12, "price": 126.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 99.75}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000107", "date": "2026-04-04", "documentKey": "20999999992/Factura/E002-00000133", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 20.16}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000134", "date": "2026-04-19", "client": "20999999962", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1375.0}, {"productId": "S008", "description": "Capacitación contable", "quantity": 12, "price": 66.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 1045.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 748.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000108", "date": "2026-04-21", "documentKey": "20999999992/Factura/E002-00000134", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 110.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000135", "date": "2026-05-06", "client": "20999999961", "currency": "USD", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 204.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000136", "date": "2026-05-23", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 722.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 90.25}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000109", "date": "2026-05-25", "documentKey": "20999999992/Boleta/B004-00000136", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 57.76}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000109", "date": "2026-05-25", "documentKey": "20999999992/Boleta/B004-00000136", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 57.76}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000137", "date": "2026-06-09", "client": "20999999959", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 60.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 90.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000110", "date": "2026-06-11", "documentKey": "20999999992/Factura/E002-00000137", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 4.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000138", "date": "2026-06-26", "client": "20999999958", "currency": "PEN", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1312.5}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000037", "date": "2026-06-28", "documentKey": "20999999992/Factura/E002-00000138", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de implementación de controles internos.", "lines": [{"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 105.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000111", "date": "2026-06-29", "documentKey": "20999999992/Factura/E002-00000138", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de preparación de libros contables.", "lines": [{"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 35.28}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000139", "date": "2026-07-13", "client": "20999999981", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 20, "price": 93.5}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 352.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000112", "date": "2026-07-15", "documentKey": "20999999992/Factura/E002-00000139", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 20, "price": 7.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000140", "date": "2026-07-30", "client": "70999987", "currency": "USD", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 6, "price": 20.4}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000140", "date": "2026-07-30", "client": "70999987", "currency": "USD", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 6, "price": 20.4}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000141", "date": "2026-08-16", "client": "20999999979", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 722.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 85.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000038", "date": "2026-08-18", "documentKey": "20999999992/Factura/E002-00000141", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 57.76}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000113", "date": "2026-08-19", "documentKey": "20999999992/Factura/E002-00000141", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 20, "price": 10.26}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000142", "date": "2026-09-02", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 5.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 180.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000114", "date": "2026-09-04", "documentKey": "20999999992/Factura/E002-00000142", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 25.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000143", "date": "2026-09-19", "client": "20999999977", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 630.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000115", "date": "2026-09-21", "documentKey": "20999999992/Factura/E002-00000143", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 26.88}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000144", "date": "2026-10-06", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 132.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 836.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000039", "date": "2026-10-08", "documentKey": "20999999992/Boleta/B004-00000144", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 10.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000116", "date": "2026-10-09", "documentKey": "20999999992/Boleta/B004-00000144", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 100.32}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000145", "date": "2026-10-23", "client": "20999999975", "currency": "USD", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 12, "price": 26.4}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 21.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000146", "date": "2026-11-09", "client": "20999999974", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 902.5}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 228.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 85.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000117", "date": "2026-11-11", "documentKey": "20999999992/Factura/E002-00000146", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 72.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000147", "date": "2026-01-19", "client": "20999999973", "currency": "PEN", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 90.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 2.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000040", "date": "2026-01-21", "documentKey": "20999999992/Factura/E002-00000147", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de obligaciones laborales.", "lines": [{"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 4, "price": 7.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000118", "date": "2026-01-22", "documentKey": "20999999992/Factura/E002-00000147", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.3}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000148", "date": "2026-02-05", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 4, "price": 115.5}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 12, "price": 5.25}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 2.62}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000119", "date": "2026-02-07", "documentKey": "20999999992/Boleta/B004-00000148", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de evaluación de procesos administrativos.", "lines": [{"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 4, "price": 9.24}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000149", "date": "2026-02-22", "client": "20999999971", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 1045.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 748.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 352.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 20, "price": 121.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000120", "date": "2026-02-24", "documentKey": "20999999992/Factura/E002-00000149", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 83.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000150", "date": "2026-03-11", "client": "20999999970", "currency": "USD", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000150", "date": "2026-03-11", "client": "20999999970", "currency": "USD", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 76.8}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000151", "date": "2026-03-28", "client": "20999999969", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 722.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 90.25}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 171.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000121", "date": "2026-03-30", "documentKey": "20999999992/Factura/E002-00000151", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 57.76}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000152", "date": "2026-04-14", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 760.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 90.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 950.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000122", "date": "2026-04-16", "documentKey": "20999999992/Boleta/B004-00000152", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de inventario y conciliación de activos.", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 60.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000153", "date": "2026-05-01", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 231.0}, {"productId": "S004", "description": "Asesoría tributaria", "quantity": 4, "price": 89.25}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000041", "date": "2026-05-03", "documentKey": "20999999992/Factura/E002-00000153", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 18.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000041", "date": "2026-05-03", "documentKey": "20999999992/Factura/E002-00000153", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 18.48}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000123", "date": "2026-05-04", "documentKey": "20999999992/Factura/E002-00000153", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 4, "price": 10.71}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000123", "date": "2026-05-04", "documentKey": "20999999992/Factura/E002-00000153", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 4, "price": 10.71}], "active": false}'::jsonb,
    1, 'Ajuste reemplazado por acuerdo posterior con el cliente.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000154", "date": "2026-05-18", "client": "20999999966", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 2, "price": 2.75}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 4, "price": 121.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1375.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000124", "date": "2026-05-20", "documentKey": "20999999992/Factura/E002-00000154", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 2, "price": 0.22}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000155", "date": "2026-06-04", "client": "20999999965", "currency": "USD", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 228.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 57.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000156", "date": "2026-06-21", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 57.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 90.25}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000042", "date": "2026-06-23", "documentKey": "20999999992/Boleta/B004-00000156", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 4.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000125", "date": "2026-06-24", "documentKey": "20999999992/Boleta/B004-00000156", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asistencia para una declaración.", "lines": [{"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 10.83}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000157", "date": "2026-07-08", "client": "20999999963", "currency": "PEN", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 850.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 220.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 2.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000126", "date": "2026-07-10", "documentKey": "20999999992/Factura/E002-00000157", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 68.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000158", "date": "2026-07-25", "client": "20999999962", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 89.25}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 12, "price": 94.5}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000127", "date": "2026-07-27", "documentKey": "20999999992/Factura/E002-00000158", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 7.14}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000159", "date": "2026-08-11", "client": "20999999961", "currency": "PEN", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 660.0}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 264.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000043", "date": "2026-08-13", "documentKey": "20999999992/Factura/E002-00000159", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 52.8}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000128", "date": "2026-08-14", "documentKey": "20999999992/Factura/E002-00000159", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 31.68}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000160", "date": "2026-08-28", "client": "70999991", "currency": "USD", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 204.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000160", "date": "2026-08-28", "client": "70999991", "currency": "USD", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 204.0}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000161", "date": "2026-09-14", "client": "20999999959", "currency": "PEN", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 902.5}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1187.5}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 570.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000129", "date": "2026-09-16", "documentKey": "20999999992/Factura/E002-00000161", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría contable mensual.", "lines": [{"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 34.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000162", "date": "2026-10-01", "client": "20999999958", "currency": "PEN", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 950.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 180.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000044", "date": "2026-10-03", "documentKey": "20999999992/Factura/E002-00000162", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asistencia en cierre contable.", "lines": [{"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 76.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000130", "date": "2026-10-04", "documentKey": "20999999992/Factura/E002-00000162", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 21.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000163", "date": "2026-10-18", "client": "20999999981", "currency": "PEN", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 63.0}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 2, "price": 5.25}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 3, "price": 126.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000131", "date": "2026-10-20", "documentKey": "20999999992/Factura/E002-00000163", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 2, "price": 5.04}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000164", "date": "2026-11-04", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 12, "price": 5.5}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 935.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 836.0}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 2, "price": 121.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000132", "date": "2026-11-06", "documentKey": "20999999992/Boleta/B004-00000164", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 12, "price": 0.44}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000165", "date": "2026-01-14", "client": "20999999979", "currency": "USD", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}, {"productId": "S014", "description": "Revisión de obligaciones laborales", "quantity": 3, "price": 21.6}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000166", "date": "2026-01-31", "client": "20999999978", "currency": "PEN", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 4.75}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 570.0}, {"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 12, "price": 114.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000133", "date": "2026-02-02", "documentKey": "20999999992/Factura/E002-00000166", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 0.38}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000167", "date": "2026-02-17", "client": "20999999977", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 2.5}, {"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 320.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 600.0}, {"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 220.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000134", "date": "2026-02-19", "documentKey": "20999999992/Factura/E002-00000167", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 0.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000168", "date": "2026-03-06", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 336.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 892.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000045", "date": "2026-03-08", "documentKey": "20999999992/Boleta/B004-00000168", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 26.88}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000135", "date": "2026-03-09", "documentKey": "20999999992/Boleta/B004-00000168", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de elaboración de estados financieros.", "lines": [{"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 107.1}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000169", "date": "2026-03-23", "client": "20999999975", "currency": "PEN", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 20, "price": 132.0}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 104.5}, {"productId": "S006", "description": "Revisión de comprobantes", "quantity": 3, "price": 5.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000136", "date": "2026-03-25", "documentKey": "20999999992/Factura/E002-00000169", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de asesoría en gestión financiera.", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 20, "price": 10.56}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000170", "date": "2026-04-09", "client": "20999999974", "currency": "USD", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 28.8}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.6}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000170", "date": "2026-04-09", "client": "20999999974", "currency": "USD", "lines": [{"productId": "S020", "description": "Asesoría en gestión financiera", "quantity": 4, "price": 28.8}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 0.6}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 300.0}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 67.2}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000171", "date": "2026-04-26", "client": "20999999973", "currency": "PEN", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 12, "price": 4.75}, {"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 228.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000046", "date": "2026-04-28", "documentKey": "20999999992/Factura/E002-00000171", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de comprobantes.", "lines": [{"productId": "S006", "description": "Revisión de comprobantes", "quantity": 12, "price": 0.38}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000137", "date": "2026-04-29", "documentKey": "20999999992/Factura/E002-00000171", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de operaciones en moneda extranjera.", "lines": [{"productId": "S018", "description": "Revisión de operaciones en moneda extranjera", "quantity": 1, "price": 27.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000172", "date": "2026-05-13", "client": "70999987", "currency": "PEN", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 20, "price": 2.5}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 600.0}, {"productId": "S012", "description": "Implementación de controles internos", "quantity": 1, "price": 1250.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000138", "date": "2026-05-15", "documentKey": "20999999992/Boleta/B004-00000172", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de digitalización de documentación.", "lines": [{"productId": "S019", "description": "Digitalización de documentación", "quantity": 20, "price": 0.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000173", "date": "2026-05-30", "client": "20999999971", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 714.0}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 6, "price": 2.62}, {"productId": "S015", "description": "Preparación de libros contables", "quantity": 1, "price": 294.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000139", "date": "2026-06-01", "documentKey": "20999999992/Factura/E002-00000173", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 57.12}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000174", "date": "2026-06-16", "client": "20999999970", "currency": "PEN", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 93.5}, {"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 66.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000047", "date": "2026-06-18", "documentKey": "20999999992/Factura/E002-00000174", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de asesoría tributaria.", "lines": [{"productId": "S004", "description": "Asesoría tributaria", "quantity": 2, "price": 7.48}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000140", "date": "2026-06-19", "documentKey": "20999999992/Factura/E002-00000174", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de capacitación contable.", "lines": [{"productId": "S008", "description": "Capacitación contable", "quantity": 20, "price": 7.92}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000175", "date": "2026-07-03", "client": "20999999969", "currency": "USD", "lines": [{"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 182.4}, {"productId": "S007", "description": "Asistencia para una declaración", "quantity": 1, "price": 22.8}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 144.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000176", "date": "2026-07-20", "client": "70999991", "currency": "PEN", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 304.0}, {"productId": "S003", "description": "Elaboración de estados financieros", "quantity": 1, "price": 807.5}, {"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 171.0}, {"productId": "S001", "description": "Asesoría contable mensual", "quantity": 1, "price": 427.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000141", "date": "2026-07-22", "documentKey": "20999999992/Boleta/B004-00000176", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de análisis de cuentas por cobrar.", "lines": [{"productId": "S013", "description": "Análisis de cuentas por cobrar", "quantity": 1, "price": 24.32}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000177", "date": "2026-08-06", "client": "20999999967", "currency": "PEN", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 680.0}, {"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 600.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Débito", "number": "E002-00000048", "date": "2026-08-08", "documentKey": "20999999992/Factura/E002-00000177", "reason": "Aumento de valor", "description": "Diferencia de honorarios por revisión adicional del servicio de revisión de costos de producción.", "lines": [{"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 54.4}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000142", "date": "2026-08-09", "documentKey": "20999999992/Factura/E002-00000177", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de regularización de registros contables.", "lines": [{"productId": "S002", "description": "Regularización de registros contables", "quantity": 1, "price": 72.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000178", "date": "2026-08-23", "client": "20999999966", "currency": "PEN", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 189.0}, {"productId": "S019", "description": "Digitalización de documentación", "quantity": 3, "price": 2.62}, {"productId": "S017", "description": "Evaluación de procesos administrativos", "quantity": 6, "price": 115.5}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000143", "date": "2026-08-25", "documentKey": "20999999992/Factura/E002-00000178", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de conciliación bancaria.", "lines": [{"productId": "S009", "description": "Conciliación bancaria", "quantity": 1, "price": 15.12}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Factura", "number": "E002-00000179", "date": "2026-09-09", "client": "20999999965", "currency": "PEN", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 242.0}, {"productId": "S010", "description": "Inventario y conciliación de activos", "quantity": 1, "price": 836.0}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 748.0}, {"productId": "S016", "description": "Asistencia en cierre contable", "quantity": 1, "price": 1045.0}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Crédito", "number": "FC02-00000144", "date": "2026-09-11", "documentKey": "20999999992/Factura/E002-00000179", "reason": "Descuento", "description": "Reducción de honorarios acordada al revisar el alcance de gestión de planillas.", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 19.36}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000180", "date": "2026-09-26", "client": "70999987", "currency": "USD", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}], "active": true}'::jsonb,
    0, 'Registro inicial');
CALL notasys.ns_documento(
    '{"company": "20999999992", "type": "Boleta", "number": "B004-00000180", "date": "2026-09-26", "client": "70999987", "currency": "USD", "lines": [{"productId": "S005", "description": "Gestión de planillas", "quantity": 1, "price": 52.8}, {"productId": "S011", "description": "Revisión de costos de producción", "quantity": 1, "price": 163.2}], "active": false}'::jsonb,
    1, 'Registro duplicado detectado en la revisión de cierre.');
COMMIT;
