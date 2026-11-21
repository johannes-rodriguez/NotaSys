BEGIN;
DO $$
BEGIN
    IF (SELECT count(*) FROM notasys.v_comprobantes) <> 372 THEN
        RAISE EXCEPTION 'Cantidad incorrecta después de importar y ampliar';
    END IF;
    IF (SELECT count(*) FROM notasys.v_notas) <> 394 THEN
        RAISE EXCEPTION 'Cantidad de notas incorrecta después de importar y ampliar';
    END IF;
    IF EXISTS (
        SELECT 1 FROM public.factura f
        LEFT JOIN notasys.factura n ON (n.ruc_emisor,n.serie,n.correlativo)=(f.ruc_emisor,f.serie,lpad(f.correlativo,8,'0'))
        WHERE n.ruc_emisor IS NULL OR n.importe_total<>f.importe_total OR n.igv<>f.igv
    ) THEN RAISE EXCEPTION 'La importación alteró importes originales'; END IF;
    IF (SELECT count(*) FROM public.factura)<>8 OR (SELECT count(*) FROM public.nota_credito)<>6 THEN
        RAISE EXCEPTION 'Los registros originales no se conservaron';
    END IF;
    RAISE NOTICE 'Importación y ampliación verificadas: 372 comprobantes y 394 notas';
END $$;
ROLLBACK;
