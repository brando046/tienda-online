# Vistas

## Introducción

Las vistas implementadas permiten acceder de forma rápida a información relevante para la gestión de la tienda online sin necesidad de escribir consultas complejas de forma repetitiva.

Su objetivo es facilitar tareas administrativas, generar informes y mejorar el acceso a datos estratégicos para la toma de decisiones.

---

# Vista: Productos con stock disponible

## Nombre

vw_productos_con_stock

## Propósito

Mostrar todos los productos y variantes que disponen de unidades disponibles para la venta.

## Información mostrada

- Producto
- Variante
- Precio
- Stock disponible

## Utilidad

- Gestión de catálogo.
- Visualización de productos disponibles.
- Consultas de inventario.

---

# Vista: Productos sin stock

## Nombre

vw_productos_sin_stock

## Propósito

Identificar variantes de productos que actualmente no disponen de existencias.

## Información mostrada

- Producto
- Variante
- Cantidad disponible

## Utilidad

- Reposición de inventario.
- Control de roturas de stock.
- Gestión de compras a proveedores.

---

# Vista: Pedidos pendientes de envío

## Nombre

vw_pedidos_pendientes_envio

## Propósito

Mostrar los pedidos que ya han sido pagados o están siendo preparados, pero que todavía no han sido enviados.

## Información mostrada

- Número de pedido
- Cliente
- Importe total
- Fecha del pedido

## Utilidad

- Gestión logística.
- Preparación de pedidos.
- Seguimiento operativo diario.

---

# Vista: Historial de compras de clientes

## Nombre

vw_historial_compras_cliente

## Propósito

Mostrar el historial de pedidos realizados por cada cliente.

## Información mostrada

- Cliente
- Número de pedido
- Fecha
- Estado
- Total

## Utilidad

- Atención al cliente.
- Análisis de comportamiento de compra.
- Consultas administrativas.

---

# Vista: Productos más vendidos

## Nombre

vw_productos_mas_vendidos

## Propósito

Calcular las unidades vendidas de cada producto.

## Información mostrada

- Producto
- Unidades vendidas

## Utilidad

- Identificación de productos exitosos.
- Planificación de stock.
- Informes comerciales.

---

# Vista: Tickets abiertos

## Nombre

vw_tickets_abiertos

## Propósito

Mostrar las incidencias que todavía requieren atención por parte del equipo de soporte.

## Información mostrada

- Ticket
- Cliente
- Prioridad
- Fecha de apertura

## Utilidad

- Gestión del soporte.
- Seguimiento de incidencias.
- Priorización del trabajo.

---

# Vista: Pagos completados

## Nombre

vw_pagos_completados

## Propósito

Mostrar todos los pagos realizados correctamente.

## Información mostrada

- Pedido
- Método de pago
- Importe
- Fecha del pago

## Utilidad

- Informes financieros.
- Auditorías.
- Seguimiento de transacciones.

---

# Vista: Devoluciones pendientes

## Nombre

vw_devoluciones_pendientes

## Propósito

Mostrar las devoluciones que todavía no han sido resueltas.

## Información mostrada

- Devolución
- Pedido asociado
- Estado
- Fecha de solicitud

## Utilidad

- Gestión de devoluciones.
- Atención al cliente.
- Seguimiento de incidencias postventa.

---

# Justificación general

Las vistas implementadas permiten simplificar consultas frecuentes utilizadas por administradores, personal de soporte y responsables logísticos.

Su utilización mejora la legibilidad del código SQL, reduce la duplicación de consultas y facilita la generación de informes operativos y comerciales.

Además, proporcionan una capa de abstracción que permite acceder a información compleja de forma sencilla, manteniendo la estructura interna de la base de datos transparente para los usuarios.