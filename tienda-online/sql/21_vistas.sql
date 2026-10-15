/*
=========================================
VISTA: PRODUCTOS CON STOCK
=========================================
*/

CREATE VIEW vw_productos_con_stock AS
SELECT
    p.id AS producto_id,
    p.nombre AS producto,
    vp.id AS variante_id,
    vp.nombre_variante,
    vp.precio,
    s.cantidad AS stock
FROM productos p
INNER JOIN variantes_producto vp
    ON p.id = vp.producto_id
INNER JOIN stock s
    ON vp.id = s.variante_id
WHERE p.activo = TRUE
  AND vp.activo = TRUE
  AND s.cantidad > 0;


  /*
=========================================
VISTA: PRODUCTOS SIN STOCK
=========================================
*/

CREATE VIEW vw_productos_sin_stock AS
SELECT
    p.id,
    p.nombre,
    vp.nombre_variante,
    s.cantidad
FROM productos p
INNER JOIN variantes_producto vp
    ON p.id = vp.producto_id
INNER JOIN stock s
    ON vp.id = s.variante_id
WHERE s.cantidad = 0;


/*
=========================================
VISTA: PEDIDOS PENDIENTES DE ENVIO
=========================================
*/

CREATE VIEW vw_pedidos_pendientes_envio AS
SELECT
    p.id,
    p.numero_pedido,
    u.nombre,
    u.apellidos,
    p.total,
    p.fecha_pedido
FROM pedidos p
INNER JOIN usuarios u
    ON p.usuario_id = u.id
WHERE p.estado IN ('pagado', 'preparando');


/*
=========================================
VISTA: HISTORIAL DE COMPRAS
=========================================
*/

CREATE VIEW vw_historial_compras_cliente AS
SELECT
    u.id AS usuario_id,
    CONCAT(u.nombre, ' ', u.apellidos) AS cliente,
    p.numero_pedido,
    p.fecha_pedido,
    p.total,
    p.estado
FROM usuarios u
INNER JOIN pedidos p
    ON u.id = p.usuario_id;

/*
=========================================
VISTA: PRODUCTOS MAS VENDIDOS
=========================================
*/

CREATE VIEW vw_productos_mas_vendidos AS
SELECT
    p.id,
    p.nombre,
    SUM(pd.cantidad) AS unidades_vendidas
FROM productos p
INNER JOIN variantes_producto vp
    ON p.id = vp.producto_id
INNER JOIN pedido_detalles pd
    ON vp.id = pd.variante_id
GROUP BY p.id, p.nombre
ORDER BY unidades_vendidas DESC;


/*
=========================================
VISTA: TICKETS ABIERTOS
=========================================
*/

CREATE VIEW vw_tickets_abiertos AS
SELECT
    t.id,
    t.asunto,
    t.prioridad,
    t.fecha_apertura,
    CONCAT(u.nombre, ' ', u.apellidos) AS cliente
FROM tickets_soporte t
INNER JOIN usuarios u
    ON t.usuario_id = u.id
WHERE t.estado IN ('abierto', 'en_proceso');


/*
=========================================
VISTA: PAGOS COMPLETADOS
=========================================
*/

CREATE VIEW vw_pagos_completados AS
SELECT
    p.id,
    pe.numero_pedido,
    mp.nombre AS metodo_pago,
    p.importe,
    p.fecha_pago
FROM pagos p
INNER JOIN pedidos pe
    ON p.pedido_id = pe.id
INNER JOIN metodos_pago mp
    ON p.metodo_pago_id = mp.id
WHERE p.estado = 'completado';


/*
=========================================
VISTA: DEVOLUCIONES PENDIENTES
=========================================
*/

CREATE VIEW vw_devoluciones_pendientes AS
SELECT
    d.id,
    p.numero_pedido,
    d.estado,
    d.fecha_solicitud
FROM devoluciones d
INNER JOIN pedidos p
    ON d.pedido_id = p.id
WHERE d.estado IN ('solicitada', 'aprobada');