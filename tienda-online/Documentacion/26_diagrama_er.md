# Diagrama Entidad-Relación (E/R)

## Introducción

El diagrama Entidad-Relación representa gráficamente la estructura conceptual de la base de datos desarrollada para la tienda online especializada en productos para mascotas.

Las entidades principales son usuarios, productos, pedidos, pagos, envíos, soporte y devoluciones, junto con las relaciones necesarias para gestionar el funcionamiento completo de la plataforma.

---

## Entidades principales

### Gestión de usuarios

* Usuarios
* Roles
* Usuarios_Roles
* Direcciones

### Catálogo

* Especies_Mascota
* Categorias
* Marcas
* Productos
* Variantes_Producto
* Imagenes_Producto

### Inventario

* Stock
* Movimientos_Stock

### Compras

* Carritos
* Carrito_Detalles

### Ventas

* Pedidos
* Pedido_Detalles
* Historial_Estados_Pedido

### Pagos

* Metodos_Pago
* Pagos

### Logística

* Transportistas
* Envios

### Soporte

* Tickets_Soporte
* Mensajes_Ticket

### Devoluciones

* Devoluciones
* Devolucion_Detalles

---

## Relaciones principales

USUARIOS (1) ──── (N) DIRECCIONES

USUARIOS (N) ──── (N) ROLES
mediante USUARIOS_ROLES

USUARIOS (1) ──── (N) CARRITOS

CARRITOS (1) ──── (N) CARRITO_DETALLES

VARIANTES_PRODUCTO (1) ──── (N) CARRITO_DETALLES

CATEGORIAS (1) ──── (N) PRODUCTOS

MARCAS (1) ──── (N) PRODUCTOS

ESPECIES_MASCOTA (1) ──── (N) PRODUCTOS

PRODUCTOS (1) ──── (N) VARIANTES_PRODUCTO

PRODUCTOS (1) ──── (N) IMAGENES_PRODUCTO

VARIANTES_PRODUCTO (1) ──── (1) STOCK

VARIANTES_PRODUCTO (1) ──── (N) MOVIMIENTOS_STOCK

USUARIOS (1) ──── (N) PEDIDOS

CARRITOS (1) ──── (N) PEDIDOS

PEDIDOS (1) ──── (N) PEDIDO_DETALLES

VARIANTES_PRODUCTO (1) ──── (N) PEDIDO_DETALLES

PEDIDOS (1) ──── (N) HISTORIAL_ESTADOS_PEDIDO

METODOS_PAGO (1) ──── (N) PAGOS

PEDIDOS (1) ──── (N) PAGOS

TRANSPORTISTAS (1) ──── (N) ENVIOS

PEDIDOS (1) ──── (N) ENVIOS

USUARIOS (1) ──── (N) TICKETS_SOPORTE

PEDIDOS (1) ──── (N) TICKETS_SOPORTE

TICKETS_SOPORTE (1) ──── (N) MENSAJES_TICKET

USUARIOS (1) ──── (N) MENSAJES_TICKET

PEDIDOS (1) ──── (N) DEVOLUCIONES

DEVOLUCIONES (1) ──── (N) DEVOLUCION_DETALLES

PEDIDO_DETALLES (1) ──── (N) DEVOLUCION_DETALLES

---

## Conclusión

El diagrama E/R refleja la organización completa de la tienda online y muestra las relaciones necesarias para gestionar usuarios, catálogo, inventario, pedidos, pagos, logística, soporte y devoluciones, garantizando la integridad de los datos mediante claves primarias y claves foráneas.
