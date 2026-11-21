BEGIN;
SET search_path TO notasys,public;

CREATE FUNCTION pg_temp.rechaza(command TEXT) RETURNS void LANGUAGE plpgsql AS $$
DECLARE accepted BOOLEAN := TRUE;
BEGIN
    BEGIN
        EXECUTE command;
        SET CONSTRAINTS ALL IMMEDIATE;
    EXCEPTION WHEN OTHERS THEN accepted:=FALSE;
    END;
    IF accepted THEN RAISE EXCEPTION 'Se aceptó una operación inválida: %',command; END IF;
END $$;

DO $$
DECLARE invoice JSONB; note JSONB; changed JSONB; i INT;
BEGIN
    invoice:='{"company":"20999999991","type":"Factura","number":"E999-00000001","date":"2026-01-10","client":"20999999981","currency":"PEN","active":true,"lines":[{"productId":"S001","description":"Asesoría mensual","quantity":2,"price":100},{"productId":"S002","description":"Regularización contable","quantity":1,"price":200}]}';
    CALL ns_documento(invoice,0,'Prueba transaccional');
    SET CONSTRAINTS ALL IMMEDIATE;
    note:='{"company":"20999999991","type":"Crédito","number":"FC99-00000001","date":"2026-01-11","documentKey":"20999999991/Factura/E999-00000001","reason":"Descuento","description":"Revisión de honorarios","active":true,"lines":[{"productId":"S001","description":"Asesoría mensual","quantity":1,"price":25}]}';
    CALL ns_documento(note,0,'Prueba transaccional');
    IF (SELECT importe_total FROM nota_credito WHERE serie='FC99')<>29.50 THEN RAISE EXCEPTION 'Total incorrecto'; END IF;
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,0,''Prueba'')',invoice));
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,0,''Prueba'')',note));
    changed:=jsonb_set(note,'{number}','"FC99-00000002"');
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,0,''Prueba'')',jsonb_set(changed,'{lines,0,productId}','"S003"')));
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,0,''Prueba'')',jsonb_set(changed,'{lines,0,price}','190')));
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,0,''Prueba'')',jsonb_set(changed,'{lines,0,quantity}','3')));
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,0,''Prueba'')',jsonb_set(changed,'{lines,0,quantity}','0')));
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,0,''Prueba'')',jsonb_set(changed,'{lines,0,price}','-1')));
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,0,''Prueba'')',jsonb_set(changed,'{lines,0,price}','1.00001')));
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,0,''Prueba'')',jsonb_set(changed,'{date}','"2026-01-09"')));
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,0,''Prueba'')',jsonb_set(changed,'{date}','"2099-01-01"')));
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,0,''Prueba'')',jsonb_set(changed,'{company}','"20999999992"')));
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,999,''Prueba'')',note));
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,1,''Prueba'')',invoice));
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,1,''Prueba'')',jsonb_set(invoice,'{active}','false')));
    PERFORM pg_temp.rechaza('DELETE FROM notasys.detalle_nota_credito WHERE serie=''FC99''');
    PERFORM pg_temp.rechaza('DELETE FROM notasys.factura WHERE serie=''E999''');
    changed:=jsonb_set(changed,'{reason}','"Devolución parcial"');
    changed:=jsonb_set(changed,'{lines,0,price}','1');
    CALL ns_documento(changed,0,'Prueba devolución');
    changed:=jsonb_set(changed,'{number}','"FC99-00000003"');
    CALL ns_documento(changed,0,'Prueba devolución');
    changed:=jsonb_set(changed,'{number}','"FC99-00000004"');
    PERFORM pg_temp.rechaza(format('CALL notasys.ns_documento(%L::jsonb,0,''Prueba'')',changed));
    -- Discount quantities did not consume returned units: two subsequent returns succeeded.
    CALL ns_documento(jsonb_set(note,'{active}','false'),1,'Reemplazo autorizado');
    IF (SELECT activo FROM nota_credito WHERE serie='FC99' AND correlativo='00000001') THEN RAISE EXCEPTION 'Borrado lógico falló'; END IF;
    RAISE NOTICE '17 rechazos y operaciones válidas de persistencia verificados';
END $$;
ROLLBACK;
