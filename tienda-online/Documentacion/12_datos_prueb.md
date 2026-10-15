# Datos de Prueba

## Introducción

Con el objetivo de verificar el correcto funcionamiento de la base de datos, se han incorporado datos de prueba representativos de una tienda online especializada en productos para mascotas.

Estos datos permiten comprobar la integridad referencial, validar las relaciones entre tablas y ejecutar correctamente las consultas, vistas y triggers implementados durante el desarrollo del proyecto.

La información introducida simula situaciones reales de funcionamiento de una plataforma de comercio electrónico, incluyendo usuarios, productos, pedidos, pagos, envíos, incidencias y devoluciones.

---

# Usuarios y Roles

Se han creado varios usuarios con diferentes perfiles dentro del sistema:

* 1 Administrador.
* 2 Empleados.
* 5 Clientes.

Además, se han registrado las correspondientes asignaciones de roles mediante la tabla intermedia `usuarios_roles`.

## Objetivo

Permitir la simulación de distintos niveles de acceso dentro de la plataforma.

---

# Direcciones

Se han añadido direcciones de envío y facturación asociadas a distintos clientes.

## Objetivo

Simular el almacenamiento de información necesaria para la gestión de pedidos y envíos.

---

# Catálogo de Productos

Se han creado productos pertenecientes a diferentes categorías y especies de mascotas:

* Alimentación.
* Juguetes.
* Higiene.
* Accesorios.
* Transporte.

Las marcas utilizadas incluyen:

* Royal Canin.
* Purina.
* Kong.
* Trixie.
* Vitakraft.

## Objetivo

Representar un catálogo realista de productos para mascotas.

---

# Variantes de Producto

Cada producto dispone de una o varias variantes comerciales.

Ejemplos:

* Diferentes tamaños.
* Diferentes pesos.
* Diferentes formatos.

## Objetivo

Simular productos que pueden comercializarse en múltiples presentaciones.

---

# Imágenes de Producto

Se han asociado imágenes a todos los productos del catálogo.

## Objetivo

Representar los recursos gráficos utilizados por una tienda online.

---

# Inventario

Se han creado registros de stock para todas las variantes de producto.

Además, se han registrado movimientos de inventario:

* Entradas iniciales.
* Salidas por ventas.
* Reposiciones de proveedor.

## Objetivo

Validar el funcionamiento de los procesos relacionados con el control de inventario.

---

# Carritos de Compra

Se han creado varios carritos con distintos estados:

* Activo.
* Convertido.
* Abandonado.

Cada carrito contiene diferentes productos y cantidades.

## Objetivo

Simular el comportamiento habitual de los clientes antes de realizar una compra.

---

# Pedidos

Se han generado pedidos asociados a distintos clientes.

Los pedidos presentan diferentes estados:

* Pagado.
* Preparando.
* Enviado.
* Entregado.

También se han registrado las líneas de detalle correspondientes a cada pedido.

## Objetivo

Permitir la validación de consultas, informes y procesos de venta.

---

# Historial de Estados

Para cada pedido se ha almacenado un historial de cambios de estado.

## Objetivo

Mantener trazabilidad sobre la evolución de cada pedido.

---

# Pagos

Se han registrado pagos utilizando diferentes métodos:

* Tarjeta.
* PayPal.
* Bizum.
* Transferencia bancaria.

Además, se ha incluido un ejemplo de reembolso.

## Objetivo

Comprobar el funcionamiento de la gestión financiera de la tienda.

---

# Envíos

Se han creado envíos utilizando diferentes empresas de transporte:

* Correos.
* MRW.
* SEUR.
* GLS.

Los envíos presentan distintos estados operativos.

## Objetivo

Validar la gestión logística de los pedidos.

---

# Soporte

Se han generado tickets de soporte asociados a distintos pedidos.

Los tickets presentan diferentes estados:

* Abierto.
* En proceso.
* Cerrado.

Además, se han registrado mensajes intercambiados entre clientes y empleados.

## Objetivo

Simular la atención al cliente y la gestión de incidencias.

---

# Devoluciones

Se han creado solicitudes de devolución asociadas a pedidos reales.

Los ejemplos incluyen:

* Productos defectuosos.
* Clientes no satisfechos.

También se han registrado los detalles de cada devolución y un ejemplo de reembolso.

## Objetivo

Validar los procesos de postventa y devolución de productos.

---

# Resumen de Datos Generados

| Elemento               | Cantidad |
| ---------------------- | -------: |
| Usuarios               |        8 |
| Roles asignados        |        8 |
| Direcciones            |        7 |
| Productos              |       10 |
| Variantes de producto  |       20 |
| Imágenes               |       10 |
| Registros de stock     |       20 |
| Movimientos de stock   |       27 |
| Carritos               |        5 |
| Detalles de carrito    |       11 |
| Pedidos                |        5 |
| Detalles de pedido     |        9 |
| Historial de estados   |       18 |
| Pagos                  |        6 |
| Envíos                 |        5 |
| Tickets de soporte     |        3 |
| Mensajes de ticket     |        6 |
| Devoluciones           |        2 |
| Detalles de devolución |        2 |

---

# Conclusión

Los datos de prueba implementados permiten comprobar el funcionamiento integral de la base de datos y garantizan que todas las consultas, vistas, relaciones y mecanismos automáticos desarrollados durante el proyecto puedan ser ejecutados y validados correctamente.

La información utilizada mantiene coherencia con el contexto de una tienda online especializada en productos para mascotas, proporcionando un entorno de pruebas realista y representativo.
