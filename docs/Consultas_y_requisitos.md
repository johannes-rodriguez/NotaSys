# Correspondencia con la entrega 4

| Opción NotaSys | Consultas originales | Selector / observación |
|---|---|---|
| 1. Notas por período | 1 y 2 | Crédito, Débito, Todos |
| 2. Detalle de una nota | 3 y 11 | Selección de nota y tipo |
| 3. Historial de una factura | 4 | Factura y tipo de nota |
| 4. Historial de una boleta | 5 | Boleta y tipo de nota |
| 5. Resumen mensual por moneda | 6 | Tipo y moneda |
| 6. Clientes con ajustes | 7 | Cliente y tipo |
| 7. Motivos más frecuentes | 8 | Tipo |
| 8. Comprobantes sin notas al cierre | 9 | Fecha de cierre; considera notas activas |
| 9. Resumen diario de documentos | 10 | Agrupa por día dentro del período |
| 10. Comprobantes con ajustes reiterados | 12 | Más de una nota en el filtro |
| 11. Documentos de un cliente | 13 | Cliente obligatorio |
| 12. Productos y servicios ajustados | 14 | Tipo y moneda |
| 13. Notas y comprobante original | 15 y 16 | Crédito, Débito, Todos |
| 14. Notas por motivo y mes | 17 | Amplía el original con selector de tipo |
| 15. Facturas e importe neto ajustado | 18 | Créditos activos hasta la fecha de cierre |

Todos los reportes entran por `ns_reporte`. Las opciones 1, 2, 3, 4, 6, 8, 10, 11, 12, 13 y 15 utilizan JOIN en sus consultas. Se supera el mínimo de diez reportes y seis consultas con JOIN.

## Procedimientos y reglas

| Operación | Entrada SQL | Controles principales |
|---|---|---|
| Alta/edición/desactivación de catálogo | ns_catalogo | Identidad, formato, nombre, versión y emisor activo restante |
| Alta/edición de comprobante | ns_documento | Serie, correlativo, fecha, cliente, moneda, detalles, importes y versión |
| Alta/edición de nota | ns_documento | Origen, emisor, cliente, moneda, fecha, pertenencia de artículos y saldos |
| Desactivación documental | ns_documento | Motivo, versión y notas activas vinculadas |
| Lectura inicial / actualización | ns_leer | Datos de las once tablas e historial |
| Consultas paginadas / exportación | ns_reporte | Período, emisor, tipo, cliente, moneda, estado y objetivo |

Los triggers mantienen la auditoría y validan cabecera/detalle, pertenencia al origen y límites acumulados. Las operaciones sobre notas bloquean la fila del comprobante para serializar ajustes concurrentes. Los importes usan NUMERIC en PostgreSQL y BigDecimal en Java.

## Entregables académicos

El paquete incluye código fuente, ejecutable con runtime, scripts originales, scripts de ampliación, datos, pruebas, manual y memoria descriptiva editable. El informe de la entrega y la memoria deben completarse con portada, integrantes, docente y enlace real del repositorio del equipo; esos datos no se han inventado.
