# Direcciones

## Propósito

La tabla **direcciones** almacena las direcciones asociadas a los usuarios de la tienda online.

Permite gestionar direcciones de envío y facturación de forma independiente, posibilitando que un mismo usuario disponga de varias direcciones registradas.

Las direcciones utilizadas en un pedido se copiarán posteriormente al pedido para conservar el histórico aunque el usuario modifique sus datos.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| usuario_id | integer (FK) | no | — | Usuario propietario de la dirección |
| nombre_destinatario | varchar(120) | no | — | Nombre de la persona que recibirá el pedido |
| telefono | varchar(20) | sí | — | Teléfono de contacto |
| direccion_linea1 | varchar(200) | no | — | Dirección principal |
| direccion_linea2 | varchar(200) | sí | — | Información complementaria |
| ciudad | varchar(100) | no | — | Ciudad |
| provincia | varchar(100) | no | — | Provincia |
| codigo_postal | varchar(10) | no | — | Código postal |
| pais | varchar(100) | no | España | País |
| tipo | enum | no | — | Tipo de dirección |
| predeterminada | boolean | no | false | Indica si es la dirección principal |
| created_at | timestamp | no | now() | Fecha de creación |

## Enum tipo_direccion

| Valor | Significado |
|---------|---------|
| envio | Dirección utilizada para recibir pedidos |
| facturacion | Dirección utilizada para documentos de facturación |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | usuarios | N → 1 | Usuario propietario de la dirección |
| utilizada en | pedidos | 1 → N | Dirección usada en pedidos realizados |

## Reglas de negocio

- Toda dirección debe pertenecer a un usuario registrado.
- Un usuario puede tener múltiples direcciones.
- Una dirección debe tener ciudad, provincia y código postal.
- La dirección predeterminada será utilizada por defecto durante el proceso de compra.
- Una dirección puede marcarse como de envío o de facturación.
- Los pedidos conservarán una copia de la dirección utilizada para mantener el histórico de compras.

## Índices

- Clave primaria en `id`.
- Índice en `usuario_id`.

## Justificación del diseño

Se ha optado por almacenar las direcciones en una tabla independiente para evitar duplicidad de información y permitir que un mismo usuario gestione múltiples direcciones.

Esta solución facilita futuras ampliaciones, como direcciones de trabajo, recogida o envíos internacionales, manteniendo el modelo normalizado y escalable.