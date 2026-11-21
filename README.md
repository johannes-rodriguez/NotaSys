# NotaSys 1.0

Aplicación de escritorio para gestionar emisores, clientes, servicios, facturas, boletas y notas de crédito/débito. Java Swing con MVC, interfaces de persistencia y consultas, sin frameworks ni ORM.

## Primer ingreso: configuración automática local

1. Extrae **todo** el ZIP. Entra en **EJECUTABLE** y abre **NotaSys.exe** o el acceso directo **NotaSys**.
2. Deja marcada **Usar PostgreSQL incluido**. Host y puerto se configuran automáticamente: 127.0.0.1 y 55432. Se usa un puerto propio para no interferir con otro PostgreSQL.
3. Conserva el usuario postgres o elige un usuario para la primera creación. Elige una contraseña de al menos 8 caracteres y guárdala en un lugar seguro.
4. Pulsa **Guardar y conectar**. NotaSys inicia PostgreSQL local, crea la base, tablas, procedimientos, triggers, reportes y datos iniciales, y abre la pantalla principal.

No necesitas instalar Java, PostgreSQL, pgAdmin ni contratar un servidor. El paquete incluye el motor y sus dependencias para Windows de 64 bits. El primer inicio tarda más que los siguientes.

En las siguientes aperturas usa el mismo usuario y contraseña. Los demás ajustes se recuerdan. La contraseña no se guarda en disco: el archivo temporal de creación se elimina al finalizar. PostgreSQL conserva su verificador SCRAM.

La información se almacena fuera del ejecutable, en `%USERPROFILE%\.notasys\postgresql\data`. No elimines esa carpeta. Mover el programa no mueve los datos; para cambiar de equipo debes hacer un respaldo y restauración. Cada equipo tiene su propia base, sin sincronización entre equipos.

El motor solo escucha en 127.0.0.1. Se inicia con NotaSys si no está activo y puede permanecer en segundo plano hasta cerrar Windows. Si 55432 está ocupado por otro servicio, se informa el error; no se modifica ese servicio. No se instala un servicio de Windows.

Para usar tu base anterior, desmarca **Usar PostgreSQL incluido**, indica host, puerto (normalmente 5432), base, usuario y contraseña existentes. Si encuentra las tablas de entrega 4 en public, las importa sin alterarlas. En una base nueva carga el conjunto académico incluido. Un esquema notasys existente no se sobrescribe ni duplica. Si una instalación falla, se revierte su estructura y datos juntos; una base nueva puede quedar vacía para reintentar.

## Datos incluidos

La carga ampliada contiene 2 emisores, 32 clientes, 20 servicios, 360 comprobantes, 384 notas y 1.464 líneas de detalle. Distribuye operaciones de 2026 en PEN y USD, documentos activos e inactivos, ajustes repetidos y comprobantes sin notas.

Estos registros adicionales son **sintéticos para evaluación académica**, con nombres y operaciones verosímiles; no acreditan transacciones reales ni titularidad de RUC/DNI. La interfaz no contiene rótulos de demostración. Los datos que importes desde la entrega 4 conservan sus nombres originales.

## Funciones

- Alta, edición, consulta, búsqueda y desactivación lógica con motivo.
- Selección de artículos exclusivamente desde el comprobante original de una nota.
- Cliente, moneda y tasa efectiva de IGV heredados del comprobante.
- Control del crédito acumulado por artículo y documento; control separado de cantidades devueltas.
- Historial persistente con usuario PostgreSQL, valores anteriores y nuevos.
- 15 reportes que cubren las 18 consultas originales; selector Crédito/Débito/Todos en las consultas equivalentes.
- Resultados en ventanas independientes, con páginas de 20, 50 o 100 filas procesadas en PostgreSQL.
- CSV de todos los resultados filtrados, con protección de celdas que podrían interpretarse como fórmulas.
- Vista previa amplia, exportación HTML e impresión; utiliza Microsoft Print to PDF si está disponible en Windows.

## Alcance y decisiones

- Es un cliente de gestión interna. No transmite comprobantes, firma XML, genera CDR ni realiza trámites ante SUNAT.
- Los comprobantes nuevos usan IGV del 18 %. La lectura conserva importes históricos; las notas calculan el impuesto según la relación IGV/base de su comprobante. No incorpora operaciones mixtas, exoneraciones por línea ni todos los motivos de emisión electrónica.
- Se conservan las series del modelo académico: facturas `E...`, boletas `B...`, notas de débito `E...`. El número se guarda con ocho dígitos y debe ser positivo.
- La factura requiere cliente identificado con RUC de 11 dígitos. Se validan formato y longitud de documentos; no se consulta la existencia del contribuyente ni se verifica su condición en SUNAT.
- Una nota necesita cliente identificado. Una boleta importada sin cliente puede consultarse y completarse antes de crear su nota.
- El neto documental del reporte 15 resta créditos activos hasta el cierre. No representa una cuenta por cobrar ni descuenta pagos; no suma débitos.
- Catálogos, listados e historial se cargan al conectar/actualizar. Los reportes sí se paginan en el servidor; la exportación completa consume memoria proporcional a las filas exportadas.

## Arquitectura y comunicación

`App` compone las dependencias. Las vistas Swing se comunican con `AppController`; `AppModel` valida operaciones y depende de `DataRepository` y `ReportProvider`. `PostgresRepository` mapea las once tablas originales y el historial, llamando a procedimientos. `SqlGateway` permite sustituir el transporte.

Esta distribución utiliza **psql/libpq**, el cliente nativo de PostgreSQL incluido en `app/pgsql`, lanzado mediante `ProcessBuilder` sin shell. No utiliza JDBC en esta versión. El SQL viaja por entrada estándar, los valores se escapan, hay tiempo máximo de ejecución y la contraseña se pasa al proceso hijo en memoria. No se guarda contraseña en archivos. Los datos de conexión no secretos se conservan en `.notasys/conexion.properties` dentro del perfil del usuario.

## Código y compilación

El código está en `src/model`, `src/view` y `src/controller`. Los scripts están en `db`; las pruebas, en `tests`. No hay dependencias de frameworks.

Con JDK 21 en Windows:

```powershell
.\build.ps1 -Jdk 'C:\Program Files\Java\jdk-21'
.\test.ps1 -Jdk 'C:\Program Files\Java\jdk-21' -UI
.\build.ps1 -Jdk 'C:\Program Files\Java\jdk-21' -Package
```

El empaquetado se detiene si `dist/NotaSys` ya existe, para no borrar otra compilación. Conserva o renombra esa carpeta antes de empaquetar de nuevo.

## Advertencia de Windows

El ejecutable se distribuye **sin firma Authenticode**. No se ha desactivado ni alterado SmartScreen. Evitar la consola es independiente de la confianza del editor: una aplicación nueva sin reputación puede mostrar una advertencia. Para distribución pública se necesita gestionar una firma de código confiable y la reputación del editor; firmar no garantiza la ausencia inmediata de avisos.

Referencia: https://learn.microsoft.com/windows/apps/package-and-deploy/smartscreen-reputation

Consulta `docs/Manual_usuario.md`, `docs/Memoria_descriptiva.md` y `docs/Verificacion.md` para operación, diseño y evidencia de pruebas.
