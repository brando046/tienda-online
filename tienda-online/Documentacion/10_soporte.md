# Tickets Soporte

## Propósito

La tabla **tickets_soporte** almacena las incidencias, consultas y solicitudes de ayuda enviadas por los clientes de la tienda online.

Permite gestionar la comunicación entre los usuarios y el equipo de soporte, facilitando el seguimiento y resolución de problemas relacionados con pedidos, productos, pagos o cualquier otro aspecto de la plataforma.

Un ticket puede estar asociado a un pedido concreto o existir de forma independiente.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| usuario_id | integer (FK) | no | — | Cliente que abre el ticket |
| pedido_id | integer (FK) | sí | — | Pedido relacionado |
| asunto | varchar(200) | no | — | Título del ticket |
| descripcion | text | no | — | Descripción inicial |
| estado | estado_ticket | no | abierto | Estado actual |
| prioridad | prioridad_ticket | no | media | Nivel de prioridad |
| fecha_apertura | timestamp | no | now() | Fecha de creación |
| fecha_cierre | timestamp | sí | — | Fecha de cierre |

## Enum estado_ticket

| Valor | Significado |
|---------|---------|
| abierto | Ticket recién creado |
| en_proceso | Incidencia en revisión |
| resuelto | Problema solucionado |
| cerrado | Ticket finalizado |

## Enum prioridad_ticket

| Valor | Significado |
|---------|---------|
| baja | Consulta informativa |
| media | Incidencia normal |
| alta | Problema importante |
| urgente | Problema crítico |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | usuarios | N → 1 | Usuario que crea el ticket |
| relacionado con | pedidos | N → 1 | Pedido asociado (opcional) |
| contiene mensajes | mensajes_ticket | 1 → N | Conversación del ticket |

## Reglas de negocio

- Todo ticket debe estar asociado a un usuario.
- Un ticket puede existir sin estar asociado a un pedido.
- Todo ticket debe tener un asunto y una descripción.
- El estado debe pertenecer a los valores definidos.
- Una vez cerrado, el ticket no debería admitir nuevas respuestas sin ser reabierto.

## Índices

- Clave primaria en `id`.
- Índice en `usuario_id`.
- Índice en `estado`.
- Índice en `prioridad`.

## Justificación del diseño

Se ha creado una tabla específica para la gestión de incidencias con el objetivo de centralizar la atención al cliente y mantener un historial completo de las consultas realizadas.

La relación opcional con pedidos permite gestionar tanto incidencias relacionadas con compras como consultas generales sobre la tienda.


# Mensajes Ticket

## Propósito

La tabla **mensajes_ticket** almacena todas las respuestas e interacciones realizadas dentro de un ticket de soporte.

Permite mantener un historial completo de la conversación entre el cliente y los empleados de la tienda, garantizando la trazabilidad de todas las comunicaciones relacionadas con una incidencia.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| ticket_id | integer (FK) | no | — | Ticket asociado |
| usuario_id | integer (FK) | no | — | Autor del mensaje |
| mensaje | text | no | — | Contenido del mensaje |
| es_interno | boolean | no | false | Indica si es una nota interna |
| created_at | timestamp | no | now() | Fecha de creación |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | tickets_soporte | N → 1 | Ticket asociado |
| escrito por | usuarios | N → 1 | Autor del mensaje |

## Reglas de negocio

- Todo mensaje debe pertenecer a un ticket existente.
- Todo mensaje debe estar asociado a un usuario.
- El contenido del mensaje no puede estar vacío.
- Los mensajes internos solo deben ser visibles para empleados y administradores.
- Los mensajes deben conservarse para mantener el historial completo de la incidencia.

## Índices

- Clave primaria en `id`.
- Índice en `ticket_id`.
- Índice en `created_at`.

## Justificación del diseño

Se ha optado por almacenar los mensajes en una tabla independiente para permitir múltiples interacciones dentro de un mismo ticket sin duplicar información.

Esta estructura facilita el seguimiento de incidencias, mejora la comunicación entre clientes y personal de soporte y mantiene un registro completo de todas las actuaciones realizadas.

