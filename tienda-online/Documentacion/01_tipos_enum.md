# Tipos Enumerados (ENUM)

## Introducción

Con el objetivo de garantizar la integridad de los datos y limitar los valores permitidos en determinados atributos, se han definido varios tipos enumerados (ENUM) en PostgreSQL.

Los tipos ENUM permiten restringir los valores que puede almacenar una columna a un conjunto predefinido de opciones, evitando errores de introducción de datos y mejorando la consistencia de la información almacenada.

Estos tipos son utilizados por diferentes tablas del sistema para representar estados, categorías operativas y motivos asociados a los distintos procesos de negocio de la tienda online de productos para mascotas.

---

# estado_usuario

## Descripción

Define los posibles estados de una cuenta de usuario dentro de la plataforma.

## Valores permitidos

| Valor                  |
| ---------------------- |
| activo                 |
| bloqueado              |
| pendiente_verificacion |
| eliminado              |

## Utilización

Tabla:

* usuarios

## Finalidad

Permitir el control del ciclo de vida de las cuentas de usuario.

---

# tipo_direccion

## Descripción

Indica el tipo de dirección registrada por un usuario.

## Valores permitidos

| Valor       |
| ----------- |
| envio       |
| facturacion |

## Utilización

Tabla:

* direcciones

## Finalidad

Diferenciar direcciones utilizadas para la entrega de pedidos y para la emisión de facturas.

---

# tipo_movimiento_stock

## Descripción

Representa los distintos movimientos que pueden afectar al inventario.

## Valores permitidos

| Valor      |
| ---------- |
| entrada    |
| salida     |
| ajuste     |
| devolucion |

## Utilización

Tabla:

* movimientos_stock

## Finalidad

Registrar de forma precisa las variaciones de existencias.

---

# estado_pedido

## Descripción

Define el estado actual de un pedido dentro del proceso de venta.

## Valores permitidos

| Valor      |
| ---------- |
| pendiente  |
| pagado     |
| preparando |
| enviado    |
| entregado  |
| cancelado  |
| devuelto   |

## Utilización

Tablas:

* pedidos
* historial_estados_pedido

## Finalidad

Realizar el seguimiento completo del ciclo de vida de un pedido.

---

# estado_pago

## Descripción

Representa la situación de un pago asociado a un pedido.

## Valores permitidos

| Valor       |
| ----------- |
| pendiente   |
| completado  |
| fallido     |
| reembolsado |

## Utilización

Tabla:

* pagos

## Finalidad

Controlar el estado de las transacciones económicas.

---

# estado_envio

## Descripción

Indica la situación logística de un envío.

## Valores permitidos

| Valor       |
| ----------- |
| pendiente   |
| preparando  |
| en_transito |
| entregado   |
| incidencia  |
| devuelto    |

## Utilización

Tabla:

* envios

## Finalidad

Permitir el seguimiento de los pedidos durante el proceso de distribución.

---

# estado_ticket

## Descripción

Representa el estado de una incidencia o solicitud de soporte.

## Valores permitidos

| Valor      |
| ---------- |
| abierto    |
| en_proceso |
| resuelto   |
| cerrado    |

## Utilización

Tabla:

* tickets_soporte

## Finalidad

Gestionar el ciclo de vida de las incidencias de atención al cliente.

---

# prioridad_ticket

## Descripción

Permite clasificar la importancia de una incidencia.

## Valores permitidos

| Valor   |
| ------- |
| baja    |
| media   |
| alta    |
| urgente |

## Utilización

Tabla:

* tickets_soporte

## Finalidad

Facilitar la priorización y gestión de incidencias.

---

# estado_devolucion

## Descripción

Representa el estado de una solicitud de devolución.

## Valores permitidos

| Valor       |
| ----------- |
| solicitada  |
| aprobada    |
| rechazada   |
| recibida    |
| reembolsada |

## Utilización

Tabla:

* devoluciones

## Finalidad

Realizar el seguimiento de las devoluciones de productos.

---

# motivo_devolucion

## Descripción

Indica la causa por la que un cliente solicita una devolución.

## Valores permitidos

| Valor               |
| ------------------- |
| producto_defectuoso |
| producto_danado     |
| error_envio         |
| no_satisfecho       |
| otro                |

## Utilización

Tabla:

* devolucion_detalles

## Finalidad

Registrar y analizar los motivos más frecuentes de devolución.

---

# Justificación del Uso de ENUM

La utilización de tipos enumerados aporta diversas ventajas al diseño de la base de datos:

* Garantiza la integridad de los datos.
* Evita valores incorrectos o inconsistentes.
* Simplifica las validaciones a nivel de aplicación.
* Mejora la legibilidad del modelo de datos.
* Facilita el mantenimiento de la información.

Su implementación permite representar de forma clara y controlada los distintos estados y categorías operativas presentes en la tienda online de productos para mascotas.

---

# Conclusión

Los tipos ENUM constituyen una parte fundamental del diseño de la base de datos, ya que permiten controlar los valores admitidos en numerosos procesos del sistema, contribuyendo a mantener la coherencia y fiabilidad de la información almacenada.
