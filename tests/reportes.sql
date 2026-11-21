BEGIN;
SET search_path TO notasys,public;
DO $$ DECLARE result XML; i INT; kind TEXT; objective TEXT; BEGIN
FOR i IN 1..15 LOOP FOR kind IN SELECT unnest(ARRAY['Todos','Crédito','Débito']) LOOP
objective:=CASE WHEN i=2 THEN '20999999991/'||CASE WHEN kind='Débito' THEN 'Débito/E001-00000001' ELSE 'Crédito/FC01-00000001' END WHEN i=3 THEN '20999999991/Factura/E001-00000001' WHEN i=4 THEN '20999999991/Boleta/B003-00000004' ELSE '' END;
CALL notasys.ns_reporte(i,'20999999991','2026-01-01','2026-11-19',CASE WHEN i=11 THEN '20999999980' ELSE '' END,'Todas','Todos',objective,kind,result);
IF result IS NULL THEN RAISE EXCEPTION 'Reporte % no produjo XML',i; END IF;
IF kind='Todos' AND cardinality(xpath('//row',result))=0 THEN RAISE EXCEPTION 'Reporte % vacío inesperado',i; END IF;
END LOOP; END LOOP;
CALL notasys.ns_reporte(1,'20999999991','2026-01-01','2026-11-19','','Todas','Todos','','Todos',0,20,result);
IF cardinality(xpath('//row',result))<>20 THEN RAISE EXCEPTION 'Paginación incorrecta'; END IF;
RAISE NOTICE '45 ejecuciones de reportes correctas'; END $$; ROLLBACK;
