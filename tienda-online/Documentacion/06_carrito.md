# Carritos

## Propósito

La tabla **carritos** almacena los carritos de compra creados por los usuarios de la tienda online.

Su función es permitir que los clientes añadan productos antes de realizar una compra, conservando temporalmente la selección de artículos hasta que se genere un pedido.

Cada usuario puede disponer de varios carritos a lo largo del tiempo, aunque normalmente solo tendrá uno en estado activo.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| usuario_id | integer (FK) | no | — | Usuario propietario del carrito |
| estado | varchar(20) | no | activo | Estado actual del carrito |
| created_at | timestamp | no | now() | Fecha de creación |
| updated_at | timestamp | no | now() | Última modificación |

## Estados posibles

| Estado | Significado |
|----------|----------|
| activo | Carrito actualmente en uso |
| convertido | Carrito transformado en pedido |
| abandonado | Carrito no finalizado por el usuario |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | usuarios | N → 1 | Usuario propietario |
| contiene | carrito_detalles | 1 → N | Productos añadidos |

## Reglas de negocio

- Todo carrito debe pertenecer a un usuario registrado.
- Un carrito activo puede contener múltiples productos.
- Un carrito convertido no podrá modificarse.
- Un carrito abandonado se conserva con fines estadísticos.
- El estado debe pertenecer a los valores permitidos.

## Restricciones

### chk_estado_carrito

Limita los estados válidos a:

- activo
- convertido
- abandonado

## Índices

- Clave primaria en `id`.
- Índice en `usuario_id`.
- Índice en `estado`.

## Justificación del diseño

La separación de los carritos respecto a los pedidos permite almacenar compras incompletas y analizar comportamientos de compra, como carritos abandonados o conversiones a pedido.

Además, facilita la futura implementación de campañas de recuperación de carritos abandonados y estadísticas de ventas.


# Carrito Detalles

## Propósito

La tabla **carrito_detalles** almacena las líneas de productos incluidas dentro de un carrito de compra.

Cada registro representa una variante concreta de producto añadida por el usuario junto con la cantidad seleccionada.

Esta tabla constituye el contenido real del carrito.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| carrito_id | integer (FK) | no | — | Carrito asociado |
| variante_id | integer (FK) | no | — | Variante añadida |
| cantidad | integer | no | 1 | Unidades seleccionadas |
| precio_unitario | decimal(10,2) | no | — | Precio unitario en el momento de añadir |
| created_at | timestamp | no | now() | Fecha de incorporación |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | carritos | N → 1 | Carrito propietario |
| referencia | variantes_producto | N → 1 | Variante seleccionada |

## Reglas de negocio

- Toda línea debe pertenecer a un carrito existente.
- Toda línea debe referenciar una variante válida.
- La cantidad debe ser superior a cero.
- El precio unitario debe ser superior a cero.
- Una variante inactiva no debería poder añadirse al carrito.
- No se debe permitir añadir más unidades que las disponibles en stock.

## Restricciones

### chk_cantidad_carrito

Impide registrar cantidades iguales o inferiores a cero.

### chk_precio_carrito

Impide registrar precios iguales o inferiores a cero.

## Índices

- Clave primaria en `id`.
- Índice en `carrito_id`.
- Índice en `variante_id`.

## Justificación del diseño

Se ha optado por almacenar las líneas del carrito en una tabla independiente para mantener la normalización del modelo y permitir que un mismo carrito contenga múltiples productos.

Además, almacenar el precio unitario en cada línea permite conservar información temporal del catálogo y facilitar la posterior conversión del carrito en pedido.