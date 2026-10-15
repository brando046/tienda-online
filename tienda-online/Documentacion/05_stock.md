# Stock

## Propósito

La tabla **stock** almacena la cantidad disponible de cada variante de producto existente en la tienda online.

Permite conocer en todo momento las unidades disponibles para la venta y controlar el inventario de forma precisa.

El stock se gestiona sobre las variantes de producto, ya que son las unidades reales que se venden, almacenan y envían a los clientes.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| variante_id | integer (FK) | no | — | Variante asociada |
| cantidad | integer | no | 0 | Stock disponible |
| stock_minimo | integer | no | 0 | Cantidad mínima recomendada |
| ultima_actualizacion | timestamp | no | now() | Última actualización del stock |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | variantes_producto | 1 → 1 | Stock asociado a una variante |
| genera movimientos | movimientos_stock | 1 → N | Historial de movimientos realizados |

## Reglas de negocio

- Cada variante de producto solo puede tener un registro de stock.
- El stock nunca puede ser negativo.
- El stock mínimo nunca puede ser negativo.
- Toda variante debe tener un registro de stock asociado.
- Las ventas no podrán realizarse si el stock disponible es insuficiente.

## Restricciones

### chk_stock_no_negativo

Impide registrar cantidades inferiores a cero.

### chk_stock_minimo

Impide registrar valores negativos en el stock mínimo.

## Índices

- Clave primaria en `id`.
- Restricción UNIQUE en `variante_id`.
- Índice en `cantidad`.

## Justificación del diseño

Se ha creado una tabla independiente para el stock con el objetivo de separar la información de inventario de la información comercial del producto.

Esta solución facilita futuras ampliaciones, como almacenes múltiples, reservas de stock o sincronización con proveedores, manteniendo el modelo normalizado y escalable.



# Movimientos Stock

## Propósito

La tabla **movimientos_stock** almacena el historial completo de modificaciones realizadas sobre el inventario.

Permite registrar entradas de mercancía, ventas, ajustes manuales y devoluciones, manteniendo una trazabilidad completa de todos los cambios realizados en el stock.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| variante_id | integer (FK) | no | — | Variante afectada |
| tipo_movimiento | tipo_movimiento_stock | no | — | Tipo de movimiento realizado |
| cantidad | integer | no | — | Cantidad afectada |
| observaciones | text | sí | — | Comentarios adicionales |
| created_at | timestamp | no | now() | Fecha del movimiento |

## Enum tipo_movimiento_stock

| Valor | Significado |
|---------|---------|
| entrada | Entrada de mercancía |
| salida | Venta o retirada de stock |
| ajuste | Corrección manual del inventario |
| devolucion | Reincorporación de productos devueltos |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | variantes_producto | N → 1 | Variante afectada |
| actualiza | stock | N → 1 | Modifica el stock disponible |

## Reglas de negocio

- Todo movimiento debe estar asociado a una variante existente.
- La cantidad del movimiento debe ser superior a cero.
- Toda modificación del inventario debe quedar registrada.
- Las devoluciones deben generar un movimiento específico de tipo devolución.
- Los ajustes manuales deben incluir una observación justificativa.

## Restricciones

### chk_cantidad_movimiento

Impide registrar movimientos con cantidades iguales o inferiores a cero.

## Índices

- Clave primaria en `id`.
- Índice en `variante_id`.
- Índice en `tipo_movimiento`.
- Índice en `created_at`.

## Justificación del diseño

Se ha creado una tabla independiente para los movimientos de stock con el fin de mantener un histórico completo de todas las operaciones realizadas sobre el inventario.

Esta solución permite auditar cambios, analizar movimientos de mercancía y facilitar futuras funcionalidades relacionadas con informes de inventario y control logístico.