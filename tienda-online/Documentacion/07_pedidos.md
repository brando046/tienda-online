# Pedidos

## Propósito

La tabla **pedidos** almacena la información principal de las compras realizadas por los clientes de la tienda online.

Representa la confirmación de una compra y conserva toda la información necesaria para procesar el pedido, incluyendo el estado, importes y direcciones utilizadas en el momento de la compra.

Una vez creado, el pedido debe mantener su información histórica aunque el cliente modifique posteriormente sus datos personales o direcciones.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| usuario_id | integer (FK) | no | — | Cliente que realiza el pedido |
| carrito_id | integer (FK) | sí | — | Carrito origen del pedido |
| numero_pedido | varchar(30) | no | — | Identificador único visible |
| estado | estado_pedido | no | pendiente | Estado actual |
| subtotal | decimal(10,2) | no | — | Importe de productos |
| gastos_envio | decimal(10,2) | no | 0 | Coste del envío |
| total | decimal(10,2) | no | — | Importe final |
| direccion_envio | text | no | — | Dirección de envío congelada |
| direccion_facturacion | text | no | — | Dirección de facturación congelada |
| fecha_pedido | timestamp | no | now() | Fecha de creación |
| updated_at | timestamp | no | now() | Última modificación |

## Enum estado_pedido

| Valor | Significado |
|---------|---------|
| pendiente | Pedido recién creado |
| pagado | Pago confirmado |
| preparando | Preparación en almacén |
| enviado | Entregado al transportista |
| entregado | Pedido recibido |
| cancelado | Pedido cancelado |
| devuelto | Pedido devuelto |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | usuarios | N → 1 | Cliente propietario |
| procede de | carritos | N → 1 | Carrito convertido |
| contiene | pedido_detalles | 1 → N | Productos comprados |
| registra cambios | historial_estados_pedido | 1 → N | Historial de estados |
| recibe pagos | pagos | 1 → N | Pagos asociados |
| genera envíos | envios | 1 → N | Envíos asociados |
| genera devoluciones | devoluciones | 1 → N | Devoluciones asociadas |

## Reglas de negocio

- Todo pedido debe pertenecer a un usuario.
- Todo pedido debe poseer un número único.
- El total nunca puede ser negativo.
- El pedido debe conservar las direcciones utilizadas en el momento de compra.
- Un pedido puede cambiar de estado varias veces durante su ciclo de vida.
- Un pedido cancelado no debe eliminarse de la base de datos.

## Restricciones

### chk_subtotal

Impide registrar subtotales negativos.

### chk_total

Impide registrar importes finales negativos.

## Índices

- Clave primaria en `id`.
- Restricción UNIQUE en `numero_pedido`.
- Índice en `usuario_id`.
- Índice en `estado`.
- Índice en `fecha_pedido`.

## Justificación del diseño

Se ha decidido almacenar las direcciones directamente dentro del pedido para garantizar la conservación del histórico de compras.

De esta forma, aunque el cliente modifique posteriormente sus direcciones, el pedido mantendrá exactamente la información utilizada durante la compra.


# Pedido Detalles

## Propósito

La tabla **pedido_detalles** almacena las líneas individuales de cada pedido.

Cada registro representa una variante concreta de producto adquirida por el cliente, junto con la cantidad y el precio aplicado en el momento de la compra.

Esta tabla constituye el detalle comercial real del pedido.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| pedido_id | integer (FK) | no | — | Pedido asociado |
| variante_id | integer (FK) | no | — | Variante comprada |
| nombre_producto | varchar(200) | no | — | Nombre almacenado históricamente |
| sku | varchar(50) | no | — | SKU histórico |
| cantidad | integer | no | — | Unidades compradas |
| precio_unitario | decimal(10,2) | no | — | Precio aplicado |
| subtotal | decimal(10,2) | no | — | Importe de la línea |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | pedidos | N → 1 | Pedido propietario |
| referencia | variantes_producto | N → 1 | Variante adquirida |

## Reglas de negocio

- Toda línea debe pertenecer a un pedido.
- La cantidad debe ser superior a cero.
- El precio unitario debe ser superior a cero.
- El nombre del producto debe conservarse aunque posteriormente cambie en el catálogo.
- El SKU debe conservarse para mantener la trazabilidad histórica.

## Restricciones

### chk_detalle_cantidad

Impide registrar cantidades iguales o inferiores a cero.

### chk_detalle_precio

Impide registrar precios iguales o inferiores a cero.

## Índices

- Clave primaria en `id`.
- Índice en `pedido_id`.
- Índice en `variante_id`.

## Justificación del diseño

Se almacenan datos históricos como el nombre del producto y el SKU para evitar que modificaciones futuras del catálogo alteren la información de pedidos ya realizados.

Esta decisión garantiza la integridad histórica de las compras.


# Historial Estados Pedido

## Propósito

La tabla **historial_estados_pedido** almacena todos los cambios de estado que experimenta un pedido a lo largo de su ciclo de vida.

Permite mantener una trazabilidad completa del proceso de compra desde la creación hasta la entrega, cancelación o devolución.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| pedido_id | integer (FK) | no | — | Pedido afectado |
| estado_anterior | estado_pedido | sí | — | Estado previo |
| estado_nuevo | estado_pedido | no | — | Estado asignado |
| observaciones | text | sí | — | Comentarios adicionales |
| fecha_cambio | timestamp | no | now() | Momento del cambio |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | pedidos | N → 1 | Pedido asociado |

## Reglas de negocio

- Todo cambio de estado debe quedar registrado.
- Un pedido puede tener múltiples cambios a lo largo del tiempo.
- El primer estado registrado será normalmente "pendiente".
- Los cambios deben almacenarse en orden cronológico.

## Índices

- Clave primaria en `id`.
- Índice en `pedido_id`.
- Índice en `fecha_cambio`.

## Justificación del diseño

Se ha creado una tabla independiente para registrar los cambios de estado y mantener una auditoría completa del proceso de compra.

Esta solución facilita el seguimiento de pedidos, la atención al cliente y la generación de informes sobre tiempos de procesamiento y entrega.