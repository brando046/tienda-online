# Consultas de Negocio

## Introducción

Las consultas implementadas tienen como objetivo demostrar la utilidad práctica de la base de datos para la gestión de la tienda online de productos para mascotas.

Estas consultas permiten obtener información relevante sobre ventas, clientes, inventario, pedidos, pagos, envíos, soporte y devoluciones, facilitando la toma de decisiones y el control operativo de la empresa.

---

# Consulta 1: Productos disponibles para la venta

## Objetivo

Mostrar todas las variantes de productos que disponen de stock suficiente para ser comercializadas.

## Utilidad

* Gestión del catálogo.
* Consulta rápida de productos disponibles.
* Atención al cliente.

---

# Consulta 2: Productos sin stock

## Objetivo

Identificar productos agotados.

## Utilidad

* Reposición de inventario.
* Control de roturas de stock.
* Gestión de compras a proveedores.

---

# Consulta 3: Productos más vendidos

## Objetivo

Determinar qué productos generan mayor volumen de ventas.

## Utilidad

* Análisis comercial.
* Planificación de inventario.
* Estrategias de marketing.

---

# Consulta 4: Pedidos pendientes de envío

## Objetivo

Mostrar pedidos que aún no han sido entregados al transportista.

## Utilidad

* Gestión logística.
* Organización del almacén.
* Seguimiento operativo.

---

# Consulta 5: Tickets abiertos

## Objetivo

Visualizar incidencias que requieren atención.

## Utilidad

* Gestión del soporte.
* Priorización de tareas.
* Atención al cliente.

---

# Consulta 6: Pagos completados

## Objetivo

Mostrar pagos realizados correctamente.

## Utilidad

* Control financiero.
* Auditorías.
* Verificación de transacciones.

---

# Consulta 7: Devoluciones pendientes

## Objetivo

Mostrar solicitudes de devolución aún no resueltas.

## Utilidad

* Gestión postventa.
* Atención al cliente.
* Seguimiento de incidencias.

---

# Consulta 8: Historial de compras de un cliente

## Objetivo

Consultar todos los pedidos realizados por un cliente específico.

## Utilidad

* Atención al cliente.
* Consultas administrativas.
* Análisis de comportamiento.

---

# Consulta 9: Top 10 clientes que más han gastado

## Objetivo

Identificar los clientes con mayor volumen de gasto.

## Utilidad

* Programas de fidelización.
* Segmentación de clientes.
* Estrategias comerciales.

---

# Consulta 10: Ventas por categoría

## Objetivo

Determinar qué categorías generan más ventas.

## Utilidad

* Gestión del catálogo.
* Análisis de demanda.
* Planificación comercial.

---

# Consulta 11: Productos con stock por debajo del mínimo

## Objetivo

Detectar productos que necesitan reposición inmediata.

## Utilidad

* Control de inventario.
* Prevención de roturas de stock.
* Gestión de compras.

---

# Consulta 12: Número de pedidos por estado

## Objetivo

Conocer la distribución actual de los pedidos.

## Utilidad

* Seguimiento operativo.
* Control logístico.
* Informes de actividad.

---

# Consulta 13: Ingresos totales de la tienda

## Objetivo

Calcular el volumen total de ventas.

## Utilidad

* Análisis financiero.
* Indicadores de rendimiento.
* Informes económicos.

---

# Consulta 14: Ingresos por mes

## Objetivo

Analizar la evolución temporal de las ventas.

## Utilidad

* Comparación de periodos.
* Detección de tendencias.
* Planificación estratégica.

---

# Consulta 15: Clientes con más pedidos

## Objetivo

Identificar clientes recurrentes.

## Utilidad

* Fidelización.
* Segmentación.
* Marketing personalizado.

---

# Consulta 16: Productos de una especie concreta

## Objetivo

Filtrar productos destinados a una especie determinada.

## Utilidad

* Navegación del catálogo.
* Búsquedas especializadas.
* Atención al cliente.

---

# Consulta 17: Productos de una marca específica

## Objetivo

Mostrar productos de un fabricante concreto.

## Utilidad

* Gestión comercial.
* Filtros de catálogo.
* Consultas de clientes.

---

# Consulta 18: Pedidos realizados en un rango de fechas

## Objetivo

Filtrar pedidos por periodo temporal.

## Utilidad

* Informes periódicos.
* Auditorías.
* Análisis de ventas.

---

# Consulta 19: Devoluciones por motivo

## Objetivo

Analizar las causas más frecuentes de devolución.

## Utilidad

* Mejora de calidad.
* Control de incidencias.
* Optimización logística.

---

# Consulta 20: Transportistas más utilizados

## Objetivo

Determinar qué empresas gestionan más envíos.

## Utilidad

* Evaluación de proveedores.
* Negociación de contratos.
* Análisis logístico.

---

# Consulta 21: Valor total del inventario

## Objetivo

Calcular el valor económico del stock disponible.

## Utilidad

* Gestión financiera.
* Control de activos.
* Auditorías de inventario.

---

# Consulta 22: Últimos movimientos de stock

## Objetivo

Mostrar la actividad reciente del inventario.

## Utilidad

* Seguimiento de almacén.
* Control de operaciones.
* Auditoría de movimientos.

---

# Consulta 23: Pedidos entregados

## Objetivo

Listar pedidos finalizados correctamente.

## Utilidad

* Informes de ventas.
* Seguimiento de entregas.
* Estadísticas operativas.

---

# Consulta 24: Pagos reembolsados

## Objetivo

Mostrar operaciones que han requerido devolución de importe.

## Utilidad

* Control financiero.
* Seguimiento de incidencias.
* Auditorías económicas.

---

# Consulta 25: Tiempo medio de resolución de tickets

## Objetivo

Medir la eficiencia del servicio de soporte.

## Utilidad

* Indicadores de calidad.
* Mejora del servicio.
* Evaluación del rendimiento del equipo de soporte.

---

# Justificación General

Las consultas desarrolladas cubren las principales necesidades operativas y estratégicas de una tienda online especializada en productos para mascotas.

Permiten gestionar inventario, ventas, clientes, pedidos, pagos, logística, soporte y devoluciones, proporcionando información útil para la toma de decisiones y demostrando la capacidad de explotación de los datos almacenados en la base de datos.


# Pruebas de las Funciones

## Objetivo

Con el fin de verificar el correcto funcionamiento de las funciones implementadas, se han realizado diversas pruebas utilizando datos reales almacenados en la base de datos.

Estas pruebas permiten comprobar que las funciones devuelven los resultados esperados y que pueden ser utilizadas posteriormente en consultas, informes y procesos de gestión.

---

## Prueba 1: Total gastado por un cliente

### Consulta ejecutada

```sql
SELECT fn_total_gastado_cliente(5);
```

### Resultado esperado

La función devuelve la suma total de los pedidos realizados por el cliente con identificador 5, excluyendo aquellos pedidos que se encuentren cancelados.

### Verificación

Permite comprobar el correcto funcionamiento de los cálculos de ventas por cliente.

---

## Prueba 2: Stock disponible de una variante

### Consulta ejecutada

```sql
SELECT fn_stock_disponible(1);
```

### Resultado esperado

La función devuelve la cantidad de unidades disponibles para la variante de producto con identificador 1.

### Verificación

Permite validar el acceso a la información de inventario desde una función almacenada.

---

## Prueba 3: Número total de pedidos de un cliente

### Consulta ejecutada

```sql
SELECT fn_total_pedidos_cliente(5);
```

### Resultado esperado

La función devuelve el número total de pedidos realizados por el cliente indicado.

### Verificación

Permite comprobar la correcta contabilización de pedidos asociados a un usuario.

---

## Prueba 4: Valor económico total del inventario

### Consulta ejecutada

```sql
SELECT fn_valor_inventario();
```

### Resultado esperado

La función devuelve el valor total del inventario calculado a partir del stock disponible y el precio de cada variante de producto.

### Verificación

Permite validar los cálculos globales sobre el inventario de la tienda.

---

## Conclusión

Las pruebas realizadas confirman que las funciones almacenadas implementadas funcionan correctamente y proporcionan información útil para la gestión de clientes, pedidos e inventario.

Estas funciones pueden ser reutilizadas en consultas, vistas, informes y futuros desarrollos del sistema.
