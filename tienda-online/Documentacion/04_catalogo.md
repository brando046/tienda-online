# Especies Mascota

## Propósito

La tabla **especies_mascota** almacena las especies de mascotas para las que está destinado un producto.

Permite clasificar el catálogo y facilitar la búsqueda de productos específicos para perros, gatos, aves, reptiles o pequeños mamíferos.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| nombre | varchar(50) | no | — | Nombre de la especie |
| descripcion | varchar(255) | sí | — | Descripción de la especie |
| created_at | timestamp | no | now() | Fecha de creación |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| clasifica productos | productos | 1 → N | Una especie puede estar asociada a múltiples productos |

## Reglas de negocio

- El nombre de la especie debe ser único.
- No puede existir una especie sin nombre.
- Un producto debe estar asociado a una especie.

## Índices

- Clave primaria en `id`.
- Restricción UNIQUE en `nombre`.

## Datos iniciales

| Especie |
|----------|
| Perro |
| Gato |
| Ave |
| Reptil |
| Roedor |

## Justificación del diseño

La separación de las especies en una tabla independiente permite mantener el catálogo normalizado y facilita la ampliación futura del sistema añadiendo nuevas especies sin modificar la estructura de la base de datos.



# Categorías

## Propósito

La tabla **categorias** almacena las distintas categorías comerciales del catálogo de productos.

Permite organizar los productos según su función y mejorar la navegación y búsqueda dentro de la tienda online.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| nombre | varchar(100) | no | — | Nombre de la categoría |
| descripcion | text | sí | — | Descripción de la categoría |
| activa | boolean | no | true | Estado de la categoría |
| created_at | timestamp | no | now() | Fecha de creación |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| agrupa productos | productos | 1 → N | Una categoría puede contener múltiples productos |

## Reglas de negocio

- El nombre de la categoría debe ser único.
- Una categoría inactiva no debe mostrarse en el catálogo público.
- Todo producto debe pertenecer a una categoría.

## Índices

- Clave primaria en `id`.
- Restricción UNIQUE en `nombre`.

## Datos iniciales

| Categoría |
|------------|
| Alimentación |
| Juguetes |
| Higiene |
| Accesorios |
| Transporte |
| Salud |
| Ropa |

## Justificación del diseño

Las categorías permiten estructurar el catálogo de forma lógica y escalable, facilitando tanto la experiencia del cliente como la gestión administrativa de los productos.



# Marcas

## Propósito

La tabla **marcas** almacena la información de los fabricantes o marcas comerciales de los productos vendidos en la tienda.

Permite identificar el origen de cada producto y facilita búsquedas y filtros basados en marcas reconocidas por los clientes.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| nombre | varchar(100) | no | — | Nombre de la marca |
| descripcion | text | sí | — | Descripción de la marca |
| pais_origen | varchar(100) | sí | — | País de origen |
| sitio_web | varchar(255) | sí | — | Página web oficial |
| activa | boolean | no | true | Estado de la marca |
| created_at | timestamp | no | now() | Fecha de creación |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| fabrica productos | productos | 1 → N | Una marca puede fabricar múltiples productos |

## Reglas de negocio

- El nombre de la marca debe ser único.
- Una marca inactiva no podrá asociarse a nuevos productos.
- Los productos pueden pertenecer a una única marca.

## Índices

- Clave primaria en `id`.
- Restricción UNIQUE en `nombre`.
- Índice en `activa`.

## Datos iniciales

| Marca |
|---------|
| Royal Canin |
| Purina |
| Kong |
| Trixie |
| Vitakraft |

## Justificación del diseño

Se ha creado una tabla independiente para las marcas con el objetivo de evitar duplicidades y facilitar la gestión centralizada de la información de los fabricantes.

Esta solución permite mantener el modelo normalizado y favorece futuras funcionalidades como filtros avanzados, estadísticas de ventas por marca o integración con proveedores.


# Productos

## Propósito

La tabla **productos** almacena la información general de los artículos comercializados en la tienda online de mascotas.

Representa el producto principal visible en el catálogo, independientemente de las variantes específicas que puedan existir.

Por ejemplo, "Royal Canin Mini Adult" es un producto, mientras que sus diferentes formatos de venta (1 kg, 3 kg o 7 kg) se almacenan como variantes.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| categoria_id | integer (FK) | no | — | Categoría a la que pertenece |
| marca_id | integer (FK) | no | — | Marca fabricante |
| especie_id | integer (FK) | no | — | Especie destinataria |
| nombre | varchar(150) | no | — | Nombre comercial del producto |
| descripcion | text | sí | — | Descripción detallada |
| activo | boolean | no | true | Estado de publicación |
| created_at | timestamp | no | now() | Fecha de creación |
| updated_at | timestamp | no | now() | Última modificación |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | categorias | N → 1 | Categoría del producto |
| pertenece a | marcas | N → 1 | Marca fabricante |
| destinado a | especies_mascota | N → 1 | Especie objetivo |
| posee variantes | variantes_producto | 1 → N | Variantes comercializables |
| posee imágenes | imagenes_producto | 1 → N | Galería del producto |

## Reglas de negocio

- Todo producto debe pertenecer a una categoría.
- Todo producto debe estar asociado a una marca.
- Todo producto debe estar asociado a una especie.
- Un producto puede tener múltiples variantes.
- Un producto inactivo no debe mostrarse en la tienda.

## Índices

- Clave primaria en `id`.
- Índice en `categoria_id`.
- Índice en `marca_id`.
- Índice en `especie_id`.
- Índice en `activo`.

## Justificación del diseño

Se ha separado el producto general de sus variantes para permitir la venta de diferentes presentaciones de un mismo artículo sin duplicar información común como nombre, descripción, categoría o marca.

Esta estructura cumple las recomendaciones del proyecto y facilita la gestión del catálogo.


# Variantes Producto

## Propósito

La tabla **variantes_producto** almacena las distintas versiones comercializables de un producto.

Representa la unidad real que puede venderse, almacenarse en stock, añadirse al carrito y aparecer en los pedidos.

Por ejemplo:

Producto:
- Royal Canin Mini Adult

Variantes:
- Saco 1 kg
- Saco 3 kg
- Saco 7 kg

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| producto_id | integer (FK) | no | — | Producto asociado |
| sku | varchar(50) | no | — | Código único de inventario |
| nombre_variante | varchar(100) | no | — | Nombre de la variante |
| precio | decimal(10,2) | no | — | Precio de venta |
| peso_kg | decimal(6,2) | sí | — | Peso del producto |
| activo | boolean | no | true | Estado de la variante |
| created_at | timestamp | no | now() | Fecha de creación |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | productos | N → 1 | Producto principal |
| controlada por | stock | 1 → 1 | Stock disponible |
| utilizada en | carrito_detalles | 1 → N | Carritos |
| utilizada en | pedido_detalles | 1 → N | Pedidos |
| utilizada en | devolucion_detalles | 1 → N | Devoluciones |

## Reglas de negocio

- Cada SKU debe ser único.
- El precio debe ser superior a cero.
- Una variante debe pertenecer a un producto existente.
- Una variante inactiva no podrá venderse.
- El stock se gestionará siempre sobre variantes.

## Índices

- Clave primaria en `id`.
- Restricción UNIQUE en `sku`.
- Índice en `producto_id`.
- Índice en `activo`.

## Justificación del diseño

La separación entre productos y variantes permite gestionar correctamente diferentes tamaños, formatos o presentaciones de un mismo artículo.

Además, el stock, los pedidos y las ventas se realizan sobre variantes concretas, garantizando un control preciso del inventario.


# Imágenes Producto

## Propósito

La tabla **imagenes_producto** almacena las imágenes asociadas a cada producto del catálogo.

Permite mantener una galería de imágenes para mostrar diferentes vistas del producto y definir una imagen principal para la presentación en la tienda online.

## Atributos

| Columna | Tipo | Nulo | Defecto | Descripción |
|----------|----------|----------|----------|----------|
| id | serial | no | auto | Clave primaria |
| producto_id | integer (FK) | no | — | Producto asociado |
| url_imagen | varchar(500) | no | — | Ruta o URL de la imagen |
| es_principal | boolean | no | false | Indica la imagen principal |
| orden_visualizacion | integer | no | 1 | Orden en la galería |
| created_at | timestamp | no | now() | Fecha de creación |

## Relaciones

| Relación | Tabla | Cardinalidad | Descripción |
|-----------|---------|---------|---------|
| pertenece a | productos | N → 1 | Producto propietario de la imagen |

## Reglas de negocio

- Toda imagen debe estar asociada a un producto.
- Un producto puede tener múltiples imágenes.
- Solo una imagen debería marcarse como principal.
- Las imágenes deben almacenarse mediante URL o ruta válida.

## Índices

- Clave primaria en `id`.
- Índice en `producto_id`.

## Justificación del diseño

Se ha creado una tabla independiente para las imágenes con el objetivo de permitir múltiples fotografías por producto sin duplicar información dentro de la tabla principal.

Esta solución facilita la escalabilidad del catálogo y mejora la presentación visual de los productos.