
/*
=========================================
CONSULTAS CON JOIN
=========================================
*/


/*
=========================================
Usuarios y Roles
=========================================
*/
SELECT
    u.id,
    u.nombre,
    u.apellidos,
    r.nombre AS rol
FROM usuarios u
INNER JOIN usuarios_roles ur
    ON u.id = ur.usuario_id
INNER JOIN roles r
    ON ur.rol_id = r.id;

/*
=========================================
Usuarios y Direcciones
=========================================
*/
 SELECT
    u.nombre,
    u.apellidos,
    d.ciudad,
    d.provincia
FROM usuarios u
INNER JOIN direcciones d
    ON u.id = d.usuario_id;   

/*
=========================================
Productos con Categoría, Marca y Especie
=========================================
*/

    SELECT
    p.nombre,
    c.nombre AS categoria,
    m.nombre AS marca,
    e.nombre AS especie
FROM productos p
INNER JOIN categorias c
    ON p.categoria_id = c.id
INNER JOIN marcas m
    ON p.marca_id = m.id
INNER JOIN especies_mascota e
    ON p.especie_id = e.id;

/*
=========================================
Productos y Variantes
=========================================
*/

    SELECT
    p.nombre,
    vp.nombre_variante,
    vp.precio
FROM productos p
INNER JOIN variantes_producto vp
    ON p.id = vp.producto_id;


/*
=========================================
Productos y Stock
=========================================
*/

    SELECT
    p.nombre,
    vp.nombre_variante,
    s.cantidad
FROM productos p
INNER JOIN variantes_producto vp
    ON p.id = vp.producto_id
INNER JOIN stock s
    ON vp.id = s.variante_id;

/*
=========================================
Pedidos y Clientes
=========================================
*/

    SELECT
    p.numero_pedido,
    u.nombre,
    u.apellidos,
    p.total,
    p.estado
FROM pedidos p
INNER JOIN usuarios u
    ON p.usuario_id = u.id;

/*
=========================================
Pedido Completo
=========================================
*/

    SELECT
    p.numero_pedido,
    u.nombre,
    pd.nombre_producto,
    pd.cantidad,
    pd.precio_unitario
FROM pedidos p
INNER JOIN usuarios u
    ON p.usuario_id = u.id
INNER JOIN pedido_detalles pd
    ON p.id = pd.pedido_id;

/*
=========================================
Pagos
=========================================
*/

    SELECT
    p.numero_pedido,
    mp.nombre AS metodo_pago,
    pa.importe,
    pa.estado
FROM pagos pa
INNER JOIN pedidos p
    ON pa.pedido_id = p.id
INNER JOIN metodos_pago mp
    ON pa.metodo_pago_id = mp.id;

/*
=========================================
Envíos
=========================================
*/

    SELECT
    p.numero_pedido,
    t.nombre AS transportista,
    e.estado
FROM envios e
INNER JOIN pedidos p
    ON e.pedido_id = p.id
INNER JOIN transportistas t
    ON e.transportista_id = t.id;

/*
=========================================
Tickets de Soporte
=========================================
*/

    SELECT
    ts.asunto,
    u.nombre,
    p.numero_pedido,
    ts.estado
FROM tickets_soporte ts
INNER JOIN usuarios u
    ON ts.usuario_id = u.id
LEFT JOIN pedidos p
    ON ts.pedido_id = p.id;

/*
=========================================
Devoluciones
=========================================
*/

    SELECT
    d.id,
    p.numero_pedido,
    dd.motivo,
    dd.cantidad
FROM devoluciones d
INNER JOIN pedidos p
    ON d.pedido_id = p.id
INNER JOIN devolucion_detalles dd
    ON d.id = dd.devolucion_id;