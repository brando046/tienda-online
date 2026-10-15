# Métodos de Pago

## Propósito

La tabla **metodos_pago** almacena los distintos métodos de pago disponibles en la tienda online.

Permite gestionar de forma centralizada los sistemas de pago aceptados por la plataforma, facilitando la incorporación o desactivación de métodos sin necesidad de modificar la estructura de la base de datos.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| nombre | varchar(50) | no | — | Nombre del método de pago |
| descripcion | varchar(255) | sí | — | Descripción del método |
| activo | boolean | no | true | Estado del método |
| created_at | timestamp | no | now() | Fecha de creación |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| utilizado por | pagos | 1 → N | Método utilizado en pagos |

## Reglas de negocio

- El nombre del método de pago debe ser único.
- Un método de pago inactivo no podrá utilizarse en nuevas compras.
- Los métodos de pago deben gestionarse desde una tabla independiente para facilitar futuras ampliaciones.

## Índices

- Clave primaria en `id`.
- Restricción UNIQUE en `nombre`.
- Índice en `activo`.

## Datos iniciales

| Método |
|----------|
| Tarjeta |
| PayPal |
| Bizum |
| Transferencia |

## Justificación del diseño

Se ha creado una tabla independiente para los métodos de pago con el fin de evitar valores repetidos y facilitar la administración de los sistemas de pago disponibles.

Esta solución permite añadir nuevos métodos en el futuro sin alterar el modelo de datos.


# Pagos

## Propósito

La tabla **pagos** almacena la información de las transacciones económicas asociadas a los pedidos realizados por los clientes.

Permite registrar el método utilizado, el estado de la operación, el importe abonado y la referencia proporcionada por la plataforma de pago correspondiente.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| pedido_id | integer (FK) | no | — | Pedido asociado |
| metodo_pago_id | integer (FK) | no | — | Método de pago utilizado |
| estado | estado_pago | no | pendiente | Estado del pago |
| importe | decimal(10,2) | no | — | Importe abonado |
| referencia_operacion | varchar(100) | sí | — | Referencia de la transacción |
| fecha_pago | timestamp | no | now() | Fecha del pago |
| observaciones | text | sí | — | Comentarios adicionales |

## Enum estado_pago

| Valor | Significado |
|---------|---------|
| pendiente | Pago iniciado pero no confirmado |
| completado | Pago realizado correctamente |
| fallido | Error durante el proceso de pago |
| reembolsado | Importe devuelto al cliente |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | pedidos | N → 1 | Pedido asociado |
| utiliza | metodos_pago | N → 1 | Método utilizado |

## Reglas de negocio

- Todo pago debe estar asociado a un pedido existente.
- Todo pago debe utilizar un método de pago válido.
- El importe debe ser superior a cero.
- La referencia de operación debe ser única cuando exista.
- Un pedido puede tener varios registros de pago en situaciones especiales como reintentos o reembolsos.

## Restricciones

### chk_importe_pago

Impide registrar importes iguales o inferiores a cero.

## Índices

- Clave primaria en `id`.
- Restricción UNIQUE en `referencia_operacion`.
- Índice en `pedido_id`.
- Índice en `estado`.
- Índice en `fecha_pago`.

## Justificación del diseño

Se ha creado una tabla independiente para los pagos con el objetivo de mantener separada la información financiera del resto de los datos del pedido.

Esta estructura facilita la integración con plataformas externas de pago, el control de incidencias y la gestión de posibles reembolsos, manteniendo además un historial completo de las operaciones realizadas.