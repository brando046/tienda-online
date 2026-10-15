# Consultas con JOIN

## Introducción

Las operaciones JOIN permiten combinar información procedente de varias tablas relacionadas mediante claves primarias y claves foráneas.

Su utilización es fundamental en bases de datos relacionales, ya que permite obtener información completa y coherente sin duplicar datos.

En este proyecto se han implementado diferentes consultas utilizando JOIN para demostrar el correcto diseño de las relaciones entre entidades y la capacidad de explotar la información almacenada.

---

# JOIN 1: Usuarios y Roles

## Tablas involucradas

* usuarios
* usuarios_roles
* roles

## Tipo de JOIN

INNER JOIN

## Objetivo

Mostrar los usuarios registrados junto con el rol que tienen asignado dentro de la plataforma.

## Utilidad

* Gestión de permisos.
* Administración de usuarios.
* Control de accesos.

---

# JOIN 2: Usuarios y Direcciones

## Tablas involucradas

* usuarios
* direcciones

## Tipo de JOIN

INNER JOIN

## Objetivo

Mostrar los usuarios junto con sus direcciones registradas.

## Utilidad

* Gestión de envíos.
* Información de facturación.
* Atención al cliente.

---

# JOIN 3: Productos, Categorías, Marcas y Especies

## Tablas involucradas

* productos
* categorias
* marcas
* especies_mascota

## Tipo de JOIN

INNER JOIN

## Objetivo

Mostrar información completa de cada producto incluyendo categoría, marca y especie de mascota asociada.

## Utilidad

* Gestión del catálogo.
* Informes comerciales.
* Navegación de productos.

---

# JOIN 4: Productos y Variantes

## Tablas involucradas

* productos
* variantes_producto

## Tipo de JOIN

INNER JOIN

## Objetivo

Mostrar todas las variantes disponibles de cada producto.

## Utilidad

* Gestión de inventario.
* Visualización de formatos comerciales.
* Administración del catálogo.

---

# JOIN 5: Productos y Stock

## Tablas involucradas

* productos
* variantes_producto
* stock

## Tipo de JOIN

INNER JOIN

## Objetivo

Mostrar el stock disponible para cada variante de producto.

## Utilidad

* Control de inventario.
* Reposición de mercancía.
* Gestión operativa.

---

# JOIN 6: Pedidos y Clientes

## Tablas involucradas

* pedidos
* usuarios

## Tipo de JOIN

INNER JOIN

## Objetivo

Relacionar cada pedido con el cliente que lo realizó.

## Utilidad

* Seguimiento de pedidos.
* Atención al cliente.
* Informes de ventas.

---

# JOIN 7: Detalles de Pedido

## Tablas involucradas

* pedidos
* usuarios
* pedido_detalles

## Tipo de JOIN

INNER JOIN

## Objetivo

Mostrar la composición completa de cada pedido.

## Utilidad

* Facturación.
* Auditorías.
* Historial de compras.

---

# JOIN 8: Pagos y Métodos de Pago

## Tablas involucradas

* pagos
* pedidos
* metodos_pago

## Tipo de JOIN

INNER JOIN

## Objetivo

Mostrar la información financiera de los pedidos junto con el método de pago utilizado.

## Utilidad

* Gestión financiera.
* Auditorías.
* Control de transacciones.

---

# JOIN 9: Envíos y Transportistas

## Tablas involucradas

* envios
* pedidos
* transportistas

## Tipo de JOIN

INNER JOIN

## Objetivo

Relacionar cada envío con la empresa de transporte responsable.

## Utilidad

* Gestión logística.
* Seguimiento de entregas.
* Evaluación de proveedores.

---

# JOIN 10: Tickets de Soporte

## Tablas involucradas

* tickets_soporte
* usuarios
* pedidos

## Tipo de JOIN

LEFT JOIN e INNER JOIN

## Objetivo

Mostrar las incidencias abiertas por los clientes junto con los pedidos asociados.

## Utilidad

* Atención al cliente.
* Gestión de incidencias.
* Seguimiento de problemas.

---

# JOIN 11: Devoluciones

## Tablas involucradas

* devoluciones
* devolucion_detalles
* pedidos

## Tipo de JOIN

INNER JOIN

## Objetivo

Mostrar la información completa de las devoluciones realizadas por los clientes.

## Utilidad

* Gestión postventa.
* Control de calidad.
* Análisis de incidencias.

---

# Tipos de JOIN Utilizados

## INNER JOIN

Permite recuperar únicamente los registros que tienen correspondencia en ambas tablas relacionadas.

### Aplicaciones en el proyecto

* Usuarios y roles.
* Productos y categorías.
* Pedidos y clientes.
* Pagos y métodos de pago.
* Envíos y transportistas.

---

## LEFT JOIN

Permite recuperar todos los registros de la tabla principal aunque no exista información relacionada en la tabla secundaria.

### Aplicaciones en el proyecto

* Tickets de soporte asociados opcionalmente a pedidos.

---

# Justificación General

La utilización de operaciones JOIN es imprescindible para explotar correctamente una base de datos relacional.

Las consultas desarrolladas demuestran el correcto diseño de las relaciones entre entidades y permiten obtener información compleja combinando datos procedentes de diferentes tablas.

Su implementación facilita la generación de informes, la gestión operativa y el análisis de información dentro de la tienda online de productos para mascotas.
