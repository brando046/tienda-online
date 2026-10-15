/*
=================================================
CONSULTA 1
PRODUCTOS DISPONIBLES PARA LA VENTA
=================================================
*/

SELECT *
FROM vw_productos_con_stock;


/*
=================================================
CONSULTA 2
PRODUCTOS SIN STOCK
=================================================
*/

SELECT *
FROM vw_productos_sin_stock;


/*
=================================================
CONSULTA 3
PRODUCTOS MÁS VENDIDOS
=================================================
*/

SELECT *
FROM vw_productos_mas_vendidos;


/*
=================================================
CONSULTA 4
PEDIDOS PENDIENTES DE ENVÍO
=================================================
*/

SELECT *
FROM vw_pedidos_pendientes_envio;


/*
=================================================
CONSULTA 5
TICKETS ABIERTOS
=================================================
*/

SELECT *
FROM vw_tickets_abiertos;


/*
=================================================
CONSULTA 6
PAGOS COMPLETADOS
=================================================
*/

SELECT *
FROM vw_pagos_completados;


/*
=================================================
CONSULTA 7
DEVOLUCIONES PENDIENTES
=================================================
*/

SELECT *
FROM vw_devoluciones_pendientes;


/*
=================================================
CONSULTA 8
HISTORIAL DE COMPRAS DE UN CLIENTE
=================================================
*/

SELECT *
FROM vw_historial_compras_cliente
WHERE usuario_id = 1;


/*
=================================================
CONSULTA 9
TOP 10 CLIENTES QUE MÁS HAN GASTADO
=================================================
*/

SELECT
    u.id,
    CONCAT(u.nombre, ' ', u.apellidos) AS cliente,
    SUM(p.total) AS total_gastado
FROM usuarios u
INNER JOIN pedidos p
    ON u.id = p.usuario_id
WHERE p.estado <> 'cancelado'
GROUP BY u.id, cliente
ORDER BY total_gastado DESC
LIMIT 10;


/*
=================================================
CONSULTA 10
VENTAS POR CATEGORÍA
=================================================
*/

SELECT
    c.nombre AS categoria,
    SUM(pd.cantidad) AS unidades_vendidas
FROM categorias c
INNER JOIN productos p
    ON c.id = p.categoria_id
INNER JOIN variantes_producto vp
    ON p.id = vp.producto_id
INNER JOIN pedido_detalles pd
    ON vp.id = pd.variante_id
GROUP BY c.nombre
ORDER BY unidades_vendidas DESC;


/*
=================================================
CONSULTA 11
PRODUCTOS CON STOCK BAJO
=================================================
*/

SELECT
    vp.id,
    vp.nombre_variante,
    s.cantidad,
    s.stock_minimo
FROM stock s
INNER JOIN variantes_producto vp
    ON s.variante_id = vp.id
WHERE s.cantidad <= s.stock_minimo;


/*
=================================================
CONSULTA 12
NÚMERO DE PEDIDOS POR ESTADO
=================================================
*/

SELECT
    estado,
    COUNT(*) AS total
FROM pedidos
GROUP BY estado
ORDER BY total DESC;


/*
=================================================
CONSULTA 13
INGRESOS TOTALES DE LA TIENDA
=================================================
*/

SELECT
    SUM(total) AS ingresos_totales
FROM pedidos
WHERE estado NOT IN ('cancelado');


/*
=================================================
CONSULTA 14
INGRESOS POR MES
=================================================
*/

SELECT
    DATE_TRUNC('month', fecha_pedido) AS mes,
    SUM(total) AS ingresos
FROM pedidos
WHERE estado NOT IN ('cancelado')
GROUP BY mes
ORDER BY mes;


/*
=================================================
CONSULTA 15
CLIENTES CON MÁS PEDIDOS
=================================================
*/

SELECT
    u.id,
    CONCAT(u.nombre, ' ', u.apellidos) AS cliente,
    COUNT(p.id) AS total_pedidos
FROM usuarios u
INNER JOIN pedidos p
    ON u.id = p.usuario_id
GROUP BY u.id, cliente
ORDER BY total_pedidos DESC;


/*
=================================================
CONSULTA 16
PRODUCTOS DE UNA ESPECIE CONCRETA
=================================================
*/

SELECT
    p.nombre,
    e.nombre AS especie
FROM productos p
INNER JOIN especies_mascota e
    ON p.especie_id = e.id
WHERE e.nombre = 'Perro';


/*
=================================================
CONSULTA 17
PRODUCTOS DE UNA MARCA
=================================================
*/

SELECT
    p.nombre,
    m.nombre AS marca
FROM productos p
INNER JOIN marcas m
    ON p.marca_id = m.id
WHERE m.nombre = 'Royal Canin';


/*
=================================================
CONSULTA 18
PEDIDOS REALIZADOS EN UN RANGO DE FECHAS
=================================================
*/

SELECT *
FROM pedidos
WHERE fecha_pedido
BETWEEN '2025-01-01'
AND '2025-12-31';


/*
=================================================
CONSULTA 19
DEVOLUCIONES POR MOTIVO
=================================================
*/

SELECT
    motivo,
    COUNT(*) AS total
FROM devolucion_detalles
GROUP BY motivo
ORDER BY total DESC;


/*
=================================================
CONSULTA 20
TRANSPORTISTAS MÁS UTILIZADOS
=================================================
*/

SELECT
    t.nombre,
    COUNT(e.id) AS total_envios
FROM transportistas t
INNER JOIN envios e
    ON t.id = e.transportista_id
GROUP BY t.nombre
ORDER BY total_envios DESC;


/*
=================================================
CONSULTA 21
VALOR TOTAL DEL INVENTARIO
=================================================
*/

SELECT
    SUM(s.cantidad * vp.precio) AS valor_inventario
FROM stock s
INNER JOIN variantes_producto vp
    ON s.variante_id = vp.id;


/*
=================================================
CONSULTA 22
ÚLTIMOS MOVIMIENTOS DE STOCK
=================================================
*/

SELECT
    vp.nombre_variante,
    ms.tipo_movimiento,
    ms.cantidad,
    ms.created_at
FROM movimientos_stock ms
INNER JOIN variantes_producto vp
    ON ms.variante_id = vp.id
ORDER BY ms.created_at DESC
LIMIT 20;


/*
=================================================
CONSULTA 23
PEDIDOS ENTREGADOS
=================================================
*/

SELECT *
FROM pedidos
WHERE estado = 'entregado';


/*
=================================================
CONSULTA 24
PAGOS REEMBOLSADOS
=================================================
*/

SELECT *
FROM pagos
WHERE estado = 'reembolsado';


/*
=================================================
CONSULTA 25
TIEMPO MEDIO DE RESOLUCIÓN DE TICKETS
=================================================
*/

SELECT
    AVG(fecha_cierre - fecha_apertura)
AS tiempo_medio_resolucion
FROM tickets_soporte
WHERE fecha_cierre IS NOT NULL;

/*
=========================================
PRUEBAS DE FUNCIONES
=========================================
*/

SELECT fn_total_gastado_cliente(5);

SELECT fn_stock_disponible(1);

SELECT fn_total_pedidos_cliente(5);

SELECT fn_valor_inventario();