# Manual de usuario — NotaSys 1.0

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

## 2. Empresa y catálogos

Selecciona el emisor en la barra superior. Los comprobantes, notas y reportes corresponden al emisor elegido; los catálogos de clientes y productos son compartidos.

En **Catálogos**, selecciona Emisores, Clientes o Productos y servicios. Utiliza **Nuevo**, **Editar**, **Ver** o **Desactivar**. Los identificadores no se cambian después de registrar. Un servicio requiere código, descripción y unidad. La desactivación requiere motivo y conserva los documentos históricos.

## 3. Comprobantes

En **Comprobantes**, pulsa **Nuevo**. Elige Factura o Boleta, verifica la serie y el correlativo, ingresa una fecha válida, selecciona el cliente y la moneda. Agrega artículos con cantidad positiva y valor unitario sin IGV. Se aceptan hasta cuatro decimales en cantidades y valores; los importes se redondean a dos.

Si necesitas corregir una línea antes de guardar, selecciónala, pulsa **Quitar ítem** y agrégala con sus valores corregidos. No se permite repetir el mismo código en varias líneas. Consulta la vista previa y guarda.

Busca un documento por número, cliente o identificación. El selector de estado permite consultar activos, inactivos o todos. Un comprobante con notas vinculadas conserva su contenido: no admite edición. La desactivación queda bloqueada mientras existan notas activas.

## 4. Notas de ajuste

Selecciona un comprobante y pulsa **Crear nota de ajuste**, o ingresa desde **Notas de ajuste → Nuevo**. Elige Crédito o Débito y el comprobante de origen.

La lista de artículos contiene únicamente el detalle de ese comprobante. Al cambiar el comprobante se limpia el detalle que estabas preparando. El cliente, la moneda y los valores de referencia se cargan automáticamente. El importe que ingresas en **Valor unitario del ajuste** es el ajuste, no el nuevo precio final del servicio.

Ejemplo: una factura tiene dos horas de asesoría a S/ 100 cada una. Para descontar S/ 20 del valor de venta puedes registrar cantidad 1 y valor del ajuste 20. Para devolver una hora, usa el motivo Devolución parcial, cantidad 1 y el valor que corresponda al ajuste. El sistema controla tanto los importes ya acreditados como las cantidades previamente devueltas.

Completa motivo y descripción. La fecha de la nota debe ser igual o posterior a la del comprobante y no puede ser futura. Revisa la vista previa y guarda. El botón queda deshabilitado mientras se procesa el guardado para impedir envíos repetidos.

La nota no puede trasladarse a otra factura durante una edición. Para corregir un vínculo equivocado, desactiva el registro interno con un motivo y crea el correcto. Esto no tramita una anulación tributaria.

## 5. Vista previa e impresión

La vista previa muestra emisor, RUC, número, fecha, cliente, comprobante modificado, motivo, detalle e importes. **BORRADOR · Sin guardar** identifica un formulario todavía no registrado.

Usa **Imprimir / PDF** y selecciona la impresora deseada. Si Windows ofrece Microsoft Print to PDF, puedes obtener un PDF desde ese diálogo. **Guardar documento HTML** conserva la presentación para abrirla en un navegador. El documento es una representación interna de los datos.

## 6. Reportes

El Centro de reportes contiene 15 opciones correspondientes a las 18 consultas de la entrega 4. Cada opción abre una ventana independiente y ampliable. Puedes mantener varias abiertas.

Define fechas, cliente, moneda, estado y, cuando corresponda, tipo de nota. Selecciona una nota o comprobante para los reportes individuales. El reporte Documentos de un cliente exige elegir un cliente concreto. Pulsa **Consultar**.

Las opciones Crédito/Débito/Todos unifican consultas equivalentes. En reportes que incluyen comprobantes y notas o que tienen un alcance fijo, el selector de tipo queda deshabilitado. Las fechas iniciales corresponden al año actual; los datos suministrados están en 2026.

Avanza con **Anterior / Siguiente** o cambia el tamaño de página. La consulta paginada se realiza en PostgreSQL. Al modificar filtros se limpian los resultados anteriores para no exportar información desactualizada. **Exportar resultados CSV** consulta y guarda todas las filas del filtro, no solo la página visible.

Cada ventana conserva el emisor con el que se abrió, aunque cambies la empresa en el menú principal.

## 7. Historial y actualización

En **Historial**, consulta altas, modificaciones y desactivaciones. **Ver detalle del cambio** muestra el usuario PostgreSQL, el motivo y los datos anteriores y posteriores. Los movimientos permanecen al cerrar la aplicación.

Pulsa **Actualizar** para recoger operaciones de otros usuarios. Si el sistema indica que un registro cambió, actualiza y vuelve a abrir su formulario antes de editar. La validación de versión evita sobrescribir cambios recientes.

## 8. Incidencias habituales

| Mensaje o situación | Acción |
|---|---|
| No conecta | Verifica servidor activo, puerto, base y credenciales. |
| Esquema o procedimiento inexistente | Ejecuta los scripts 01, 02 y 03 en la base elegida. |
| Artículo ajeno al comprobante | Selecciona un artículo del detalle original. |
| Ajuste superior al saldo | Consulta las notas anteriores y reduce el importe o cantidad. |
| Registro modificado por otro usuario | Pulsa Actualizar y vuelve a abrir el formulario. |
| Reporte vacío | Amplía fechas y revisa emisor, tipo, estado y moneda. |
| Falta el cliente de una boleta | Completa el cliente antes de crear la nota. |
| El ejecutable no encuentra archivos | Extrae y conserva completa la carpeta NotaSys. |
| Guardado confirmado, actualización fallida | Actualiza antes de repetir; la operación ya se confirmó. |

## 9. Cierre y respaldo

Los cambios confirmados se guardan en PostgreSQL. Los formularios no guardados se pierden al cerrarlos. Realiza los respaldos de la base con las herramientas de PostgreSQL o pgAdmin y conserva también el código y los scripts de instalación.
