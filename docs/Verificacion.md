# Verificación de NotaSys

## Pruebas realizadas

| Área | Resultado |
|---|---|
| Compilación | Java 17 como destino, con JDK 21, sin frameworks |
| Modelo y mapeo PostgreSQL/XML | 26 comprobaciones automáticas superadas |
| Interfaz Swing | Selección limitada a artículos originales, vista previa amplia y selector de tipo de nota verificados |
| Procedimientos y reportes | 45 combinaciones de reporte/tipo ejecutadas; resultados no vacíos para el conjunto completo |
| Paginación SQL | Tamaño de página y total de resultados verificados |
| Restricciones PostgreSQL | 17 operaciones inválidas rechazadas y operaciones válidas confirmadas |
| Integración real Java → psql → PostgreSQL | 12 comprobaciones superadas con servidor aislado en localhost |
| Importación seguida de ampliación | 372 comprobantes y 394 notas; conservación de registros e importes originales verificada |

La prueba de integración verificó carga desde el servidor, primera y segunda página, filtro de crédito, exportación completa, guardado, lectura mediante otro cliente, escape de comillas y XML, conflicto de versión, nota persistida, rechazo SQL de un artículo ajeno, desactivación y auditoría.

Las pruebas SQL se ejecutaron en un clúster creado exclusivamente en el directorio de trabajo. No se modificó el servidor PostgreSQL habitual del usuario. Los SQL originales proporcionados se usaron para comprobar la ruta de importación; el script de ampliación utiliza nuevas series y conserva `public`.

## Reproducir las pruebas

`test.ps1 -Jdk <ruta_JDK> -UI` compila y ejecuta las comprobaciones Java y las pantallas. El archivo `tests/fixture.xml` es una captura de la base aislada para pruebas del mapeo; la aplicación distribuida no lo usa como almacenamiento ni como conexión simulada.

En una base exclusiva de pruebas, instala los scripts 01, 02, 03 y 04, y ejecuta `tests/reportes.sql` y `tests/restricciones.sql`. Estos dos archivos usan transacciones que revierten los cambios de prueba.

`IntegrationTest` espera un clúster **aislado** en 127.0.0.1:55439, base postgres y usuario notasys_admin. Registra datos de prueba, por lo que debe ejecutarse sobre una instalación nueva del conjunto ampliado. No lo dirijas a una base de producción.

Para comprobar la importación, reproduce primero la entrega 4 en `public`, instala 01, 02 y 03, ejecuta 05 y 06 y luego `tests/importacion.sql`.

## Límites de esta verificación

Las pruebas cubren los casos enumerados, no todas las combinaciones de datos posibles. No certifican cumplimiento tributario ni validación SUNAT. No se realizó una prueba de carga con millones de registros ni se certificó compatibilidad con todas las versiones de Windows. La impresión PDF depende de las impresoras instaladas en el equipo. El ejecutable no está firmado digitalmente.
