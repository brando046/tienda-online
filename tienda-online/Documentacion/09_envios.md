# Transportistas

## Propósito

La tabla **transportistas** almacena la información de las empresas de transporte encargadas de realizar las entregas de los pedidos de la tienda online.

Permite centralizar la gestión de los operadores logísticos y facilitar la asignación de envíos a diferentes empresas de transporte.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| nombre | varchar(100) | no | — | Nombre del transportista |
| telefono | varchar(20) | sí | — | Teléfono de contacto |
| email | varchar(150) | sí | — | Correo electrónico |
| sitio_web | varchar(255) | sí | — | Página web oficial |
| activo | boolean | no | true | Estado del transportista |
| created_at | timestamp | no | now() | Fecha de creación |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| realiza envíos | envios | 1 → N | Un transportista puede gestionar múltiples envíos |

## Reglas de negocio

- El nombre del transportista debe ser único.
- Un transportista inactivo no podrá asignarse a nuevos envíos.
- Un transportista puede gestionar múltiples pedidos simultáneamente.

## Índices

- Clave primaria en `id`.
- Restricción UNIQUE en `nombre`.
- Índice en `activo`.

## Datos iniciales

| Transportista |
|---------------|
| Correos |
| MRW |
| SEUR |
| GLS |

## Justificación del diseño

Se ha creado una tabla independiente para los transportistas con el fin de evitar duplicación de información y facilitar la administración de las empresas de reparto.

Esta solución permite mantener los datos de contacto centralizados y obtener estadísticas sobre el rendimiento de cada operador logístico.


# Envíos

## Propósito

La tabla **envios** almacena la información relacionada con el proceso logístico de entrega de los pedidos realizados por los clientes.

Permite realizar el seguimiento completo de cada envío, conocer su estado actual y asociar cada pedido a una empresa transportista.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| pedido_id | integer (FK) | no | — | Pedido asociado |
| transportista_id | integer (FK) | sí | — | Empresa encargada del envío |
| estado | estado_envio | no | pendiente | Estado actual del envío |
| numero_seguimiento | varchar(100) | sí | — | Código de seguimiento |
| fecha_envio | timestamp | sí | — | Fecha de salida |
| fecha_entrega | timestamp | sí | — | Fecha de recepción |
| observaciones | text | sí | — | Comentarios adicionales |
| created_at | timestamp | no | now() | Fecha de creación |

## Enum estado_envio

| Valor | Significado |
|---------|---------|
| pendiente | Envío aún no preparado |
| preparando | Pedido en preparación |
| en_transito | Pedido entregado al transportista |
| entregado | Pedido recibido por el cliente |
| incidencia | Problema durante el transporte |
| devuelto | Pedido devuelto al remitente |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | pedidos | N → 1 | Pedido asociado |
| gestionado por | transportistas | N → 1 | Empresa de transporte responsable |

## Reglas de negocio

- Todo envío debe estar asociado a un pedido existente.
- Un pedido puede tener un envío asociado.
- El número de seguimiento debe ser único.
- La fecha de entrega no puede ser anterior a la fecha de envío.
- Un envío entregado no puede volver a estados anteriores sin una incidencia registrada.

## Índices

- Clave primaria en `id`.
- Restricción UNIQUE en `numero_seguimiento`.
- Índice en `pedido_id`.
- Índice en `transportista_id`.
- Índice en `estado`.

## Justificación del diseño

Se ha creado una tabla independiente para los envíos con el objetivo de separar la gestión logística de la información comercial del pedido.

Esta estructura facilita la integración con empresas de transporte, el seguimiento de pedidos por parte de los clientes y la gestión de incidencias durante el proceso de entrega.