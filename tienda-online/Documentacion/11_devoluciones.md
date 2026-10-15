# Devoluciones

## Propósito

La tabla **devoluciones** almacena las solicitudes de devolución realizadas por los clientes sobre pedidos previamente efectuados en la tienda online.

Permite gestionar el ciclo completo de una devolución, desde la solicitud inicial hasta su resolución final, manteniendo un registro histórico de todas las devoluciones realizadas.

Una devolución puede incluir uno o varios productos de un mismo pedido.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| pedido_id | integer (FK) | no | — | Pedido asociado |
| estado | estado_devolucion | no | solicitada | Estado actual de la devolución |
| fecha_solicitud | timestamp | no | now() | Fecha de solicitud |
| fecha_resolucion | timestamp | sí | — | Fecha de resolución |
| observaciones | text | sí | — | Comentarios adicionales |

## Enum estado_devolucion

| Valor | Significado |
|---------|---------|
| solicitada | Solicitud enviada por el cliente |
| aprobada | Solicitud aceptada |
| rechazada | Solicitud denegada |
| recibida | Producto recibido por la tienda |
| reembolsada | Reembolso realizado |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | pedidos | N → 1 | Pedido sobre el que se realiza la devolución |
| contiene líneas | devolucion_detalles | 1 → N | Productos devueltos |

## Reglas de negocio

- Toda devolución debe estar asociada a un pedido existente.
- Un pedido puede tener varias devoluciones a lo largo del tiempo.
- Una devolución puede afectar únicamente a una parte del pedido.
- El estado de la devolución debe pertenecer a los valores definidos.
- Toda devolución debe conservar su historial incluso si el pedido ya ha sido entregado.

## Índices

- Clave primaria en `id`.
- Índice en `pedido_id`.
- Índice en `estado`.

## Justificación del diseño

Se ha creado una tabla independiente para las devoluciones con el objetivo de gestionar de forma estructurada las solicitudes realizadas por los clientes.

Esta solución permite controlar el estado de cada devolución y mantener la trazabilidad completa del proceso de devolución y reembolso.


# Devolución Detalles

## Propósito

La tabla **devolucion_detalles** almacena las líneas individuales de productos incluidos en una devolución.

Permite realizar devoluciones parciales, devolviendo únicamente determinados artículos o cantidades concretas de un pedido.

Cada registro representa una línea específica de producto devuelto.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| devolucion_id | integer (FK) | no | — | Devolución asociada |
| pedido_detalle_id | integer (FK) | no | — | Línea del pedido devuelta |
| cantidad | integer | no | — | Cantidad devuelta |
| motivo | motivo_devolucion | no | — | Motivo de la devolución |
| observaciones | text | sí | — | Comentarios adicionales |

## Enum motivo_devolucion

| Valor | Significado |
|---------|---------|
| producto_defectuoso | Producto con defectos de fabricación |
| producto_danado | Producto dañado durante el transporte |
| error_envio | Producto incorrecto enviado |
| no_satisfecho | El cliente no está satisfecho |
| otro | Cualquier otro motivo |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | devoluciones | N → 1 | Devolución asociada |
| referencia | pedido_detalles | N → 1 | Línea original del pedido |

## Reglas de negocio

- Toda línea de devolución debe pertenecer a una devolución existente.
- Toda línea debe referenciar una línea válida del pedido original.
- La cantidad devuelta debe ser superior a cero.
- No se pueden devolver más unidades de las compradas originalmente.
- Toda devolución debe indicar un motivo.

## Restricciones

### chk_cantidad_devuelta

Impide registrar cantidades iguales o inferiores a cero.

## Índices

- Clave primaria en `id`.
- Índice en `devolucion_id`.
- Índice en `pedido_detalle_id`.

## Justificación del diseño

Se ha optado por una tabla independiente para las líneas de devolución con el objetivo de permitir devoluciones parciales y mantener un control detallado de los productos afectados.

Esta estructura facilita la gestión de incidencias, el control de reembolsos y la actualización del inventario cuando los productos son devueltos correctamente.