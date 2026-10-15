/*
=================================================
BLOQUE 1
USUARIOS
=================================================
*/

INSERT INTO usuarios
(
    nombre,
    apellidos,
    email,
    password_hash,
    telefono,
    fecha_nacimiento,
    estado,
    email_verificado
)
VALUES
(
    'Carlos',
    'Martinez',
    'admin@petshop.com',
    '$2a$10$admin123',
    '600111111',
    '1985-05-10',
    'activo',
    TRUE
),
(
    'Laura',
    'Gomez',
    'empleado1@petshop.com',
    '$2a$10$empleado1',
    '600222222',
    '1992-07-15',
    'activo',
    TRUE
),
(
    'David',
    'Ruiz',
    'empleado2@petshop.com',
    '$2a$10$empleado2',
    '600333333',
    '1990-11-22',
    'activo',
    TRUE
),
(
    'Ana',
    'Lopez',
    'ana@email.com',
    '$2a$10$cliente1',
    '611111111',
    '1998-03-05',
    'activo',
    TRUE
),
(
    'Javier',
    'Fernandez',
    'javier@email.com',
    '$2a$10$cliente2',
    '622222222',
    '1995-08-12',
    'activo',
    TRUE
),
(
    'Marta',
    'Sanchez',
    'marta@email.com',
    '$2a$10$cliente3',
    '633333333',
    '2000-01-25',
    'activo',
    TRUE
),
(
    'Sergio',
    'Navarro',
    'sergio@email.com',
    '$2a$10$cliente4',
    '644444444',
    '1997-04-18',
    'activo',
    FALSE
),
(
    'Lucia',
    'Perez',
    'lucia@email.com',
    '$2a$10$cliente5',
    '655555555',
    '1999-09-30',
    'activo',
    TRUE
);


/*
=================================================
USUARIOS_ROLES
=================================================
*/

/*
Roles:
1 = cliente
2 = empleado
3 = administrador
*/

INSERT INTO usuarios_roles
(usuario_id, rol_id)
VALUES
(1,3),
(2,2),
(3,2),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1);


/*
=================================================
DIRECCIONES
=================================================
*/

INSERT INTO direcciones
(
    usuario_id,
    nombre_destinatario,
    telefono,
    direccion_linea1,
    ciudad,
    provincia,
    codigo_postal,
    pais,
    tipo,
    predeterminada
)
VALUES
(
    4,
    'Ana Lopez',
    '611111111',
    'Calle Larios 15',
    'Malaga',
    'Malaga',
    '29005',
    'España',
    'envio',
    TRUE
),
(
    4,
    'Ana Lopez',
    '611111111',
    'Calle Larios 15',
    'Malaga',
    'Malaga',
    '29005',
    'España',
    'facturacion',
    TRUE
),
(
    5,
    'Javier Fernandez',
    '622222222',
    'Avenida Andalucia 23',
    'Sevilla',
    'Sevilla',
    '41001',
    'España',
    'envio',
    TRUE
),
(
    5,
    'Javier Fernandez',
    '622222222',
    'Avenida Andalucia 23',
    'Sevilla',
    'Sevilla',
    '41001',
    'España',
    'facturacion',
    TRUE
),
(
    6,
    'Marta Sanchez',
    '633333333',
    'Calle Mayor 44',
    'Madrid',
    'Madrid',
    '28001',
    'España',
    'envio',
    TRUE
),
(
    7,
    'Sergio Navarro',
    '644444444',
    'Gran Via 77',
    'Valencia',
    'Valencia',
    '46001',
    'España',
    'envio',
    TRUE
),
(
    8,
    'Lucia Perez',
    '655555555',
    'Paseo Maritimo 8',
    'Cadiz',
    'Cadiz',
    '11001',
    'España',
    'envio',
    TRUE
);

/*
=================================================
BLOQUE 2
PRODUCTOS
=================================================
*/

INSERT INTO productos
(
    categoria_id,
    marca_id,
    especie_id,
    nombre,
    descripcion
)
VALUES
(1,1,1,'Royal Canin Mini Adult','Pienso para perros adultos de raza pequeña'),
(1,1,2,'Royal Canin Kitten','Alimento para gatos cachorros'),
(2,3,1,'Kong Classic','Juguete resistente para perros'),
(4,4,1,'Collar Nylon Trixie','Collar ajustable para perro'),
(4,4,1,'Correa Trixie Premium','Correa resistente para paseos'),
(1,2,2,'Purina One Gato Adulto','Pienso para gatos adultos'),
(1,5,3,'Vitakraft Menu Premium','Alimento para aves'),
(2,4,2,'Ratón de Juguete Trixie','Juguete para gatos'),
(5,4,1,'Transportín Trixie Capri','Transportín para mascotas'),
(3,4,1,'Champú Trixie Aloe Vera','Champú para perros');


/*
=================================================
VARIANTES_PRODUCTO
=================================================
*/

INSERT INTO variantes_producto
(
    producto_id,
    sku,
    nombre_variante,
    precio,
    peso_kg
)
VALUES
(1,'RC-MINI-2KG','Bolsa 2 Kg',18.99,2.00),
(1,'RC-MINI-8KG','Bolsa 8 Kg',54.99,8.00),

(2,'RC-KITTEN-2KG','Bolsa 2 Kg',21.50,2.00),
(2,'RC-KITTEN-4KG','Bolsa 4 Kg',39.99,4.00),

(3,'KONG-S','Talla S',8.95,0.20),
(3,'KONG-M','Talla M',11.95,0.30),
(3,'KONG-L','Talla L',14.95,0.45),

(4,'COLLAR-S','Talla S',6.50,0.10),
(4,'COLLAR-M','Talla M',7.50,0.15),
(4,'COLLAR-L','Talla L',8.50,0.20),

(5,'CORREA-1M','Longitud 1m',9.95,0.25),
(5,'CORREA-2M','Longitud 2m',12.95,0.35),

(6,'PURINA-1.5KG','Bolsa 1.5 Kg',11.99,1.50),
(6,'PURINA-3KG','Bolsa 3 Kg',21.99,3.00),

(7,'VITAKRAFT-1KG','Bolsa 1 Kg',6.95,1.00),

(8,'RATON-GATO','Modelo estándar',4.95,0.05),

(9,'TRANSPORTIN-S','Tamaño pequeño',24.99,1.50),
(9,'TRANSPORTIN-M','Tamaño mediano',34.99,2.50),

(10,'CHAMPU-250','Botella 250 ml',7.99,0.25),
(10,'CHAMPU-500','Botella 500 ml',12.99,0.50);


/*
=================================================
IMAGENES_PRODUCTO
=================================================
*/

INSERT INTO imagenes_producto
(
    producto_id,
    url_imagen,
    es_principal,
    orden_visualizacion
)
VALUES
(1,'https://img.petshop.com/royalcanin-mini.jpg',TRUE,1),
(2,'https://img.petshop.com/royalcanin-kitten.jpg',TRUE,1),
(3,'https://img.petshop.com/kong-classic.jpg',TRUE,1),
(4,'https://img.petshop.com/collar-trixie.jpg',TRUE,1),
(5,'https://img.petshop.com/correa-trixie.jpg',TRUE,1),
(6,'https://img.petshop.com/purina-one.jpg',TRUE,1),
(7,'https://img.petshop.com/vitakraft-menu.jpg',TRUE,1),
(8,'https://img.petshop.com/raton-gato.jpg',TRUE,1),
(9,'https://img.petshop.com/transportin.jpg',TRUE,1),
(10,'https://img.petshop.com/champu-trixie.jpg',TRUE,1);


/*
=================================================
BLOQUE 3
STOCK
=================================================
*/

INSERT INTO stock
(
    variante_id,
    cantidad,
    stock_minimo
)
VALUES
(1, 25, 5),
(2, 12, 5),
(3, 18, 5),
(4, 9, 3),
(5, 30, 5),
(6, 24, 5),
(7, 15, 5),
(8, 20, 5),
(9, 14, 5),
(10, 8, 3),
(11, 16, 5),
(12, 10, 3),
(13, 28, 5),
(14, 22, 5),
(15, 35, 5),
(16, 17, 5),
(17, 7, 2),
(18, 4, 2),
(19, 13, 3),
(20, 6, 2);


/*
=================================================
MOVIMIENTOS_STOCK
=================================================
*/

INSERT INTO movimientos_stock
(
    variante_id,
    tipo_movimiento,
    cantidad,
    observaciones
)
VALUES
(1,'entrada',25,'Carga inicial de inventario'),
(2,'entrada',12,'Carga inicial de inventario'),
(3,'entrada',18,'Carga inicial de inventario'),
(4,'entrada',9,'Carga inicial de inventario'),
(5,'entrada',30,'Carga inicial de inventario'),
(6,'entrada',24,'Carga inicial de inventario'),
(7,'entrada',15,'Carga inicial de inventario'),
(8,'entrada',20,'Carga inicial de inventario'),
(9,'entrada',14,'Carga inicial de inventario'),
(10,'entrada',8,'Carga inicial de inventario'),
(11,'entrada',16,'Carga inicial de inventario'),
(12,'entrada',10,'Carga inicial de inventario'),
(13,'entrada',28,'Carga inicial de inventario'),
(14,'entrada',22,'Carga inicial de inventario'),
(15,'entrada',35,'Carga inicial de inventario'),
(16,'entrada',17,'Carga inicial de inventario'),
(17,'entrada',7,'Carga inicial de inventario'),
(18,'entrada',4,'Carga inicial de inventario'),
(19,'entrada',13,'Carga inicial de inventario'),
(20,'entrada',6,'Carga inicial de inventario');


/*
=================================================
MOVIMIENTOS ADICIONALES DE EJEMPLO
=================================================
*/

INSERT INTO movimientos_stock
(
    variante_id,
    tipo_movimiento,
    cantidad,
    observaciones
)
VALUES
(1,'salida',2,'Venta realizada'),
(5,'salida',1,'Venta realizada'),
(6,'salida',3,'Venta realizada'),
(11,'salida',2,'Venta realizada'),
(15,'salida',4,'Venta realizada'),
(17,'entrada',5,'Reposición de proveedor'),
(19,'entrada',3,'Reposición de proveedor');


/*
=================================================
BLOQUE 4
CARRITOS
=================================================
*/

INSERT INTO carritos
(
    usuario_id,
    estado
)
VALUES
(4,'activo'),
(5,'convertido'),
(6,'convertido'),
(7,'abandonado'),
(8,'activo');


/*
=================================================
CARRITO_DETALLES
=================================================
*/

/*
Carrito 1 (Ana)
*/

INSERT INTO carrito_detalles
(
    carrito_id,
    variante_id,
    cantidad,
    precio_unitario
)
VALUES
(1,1,1,18.99),
(1,5,1,8.95);


/*
Carrito 2 (Javier)
*/

INSERT INTO carrito_detalles
(
    carrito_id,
    variante_id,
    cantidad,
    precio_unitario
)
VALUES
(2,3,1,21.50),
(2,8,2,6.50);


/*
Carrito 3 (Marta)
*/

INSERT INTO carrito_detalles
(
    carrito_id,
    variante_id,
    cantidad,
    precio_unitario
)
VALUES
(3,13,1,11.99),
(3,16,1,4.95);


/*
Carrito 4 (Sergio)
*/

INSERT INTO carrito_detalles
(
    carrito_id,
    variante_id,
    cantidad,
    precio_unitario
)
VALUES
(4,17,1,24.99),
(4,19,1,7.99);


/*
Carrito 5 (Lucía)
*/

INSERT INTO carrito_detalles
(
    carrito_id,
    variante_id,
    cantidad,
    precio_unitario
)
VALUES
(5,2,1,54.99),
(5,11,1,9.95),
(5,15,2,6.95);

/*
=================================================
BLOQUE 5
PEDIDOS
=================================================
*/

INSERT INTO pedidos
(
    usuario_id,
    carrito_id,
    numero_pedido,
    estado,
    subtotal,
    gastos_envio,
    total,
    direccion_envio,
    direccion_facturacion
)
VALUES
(
    5,
    2,
    'PED-2025-0001',
    'entregado',
    34.50,
    4.99,
    39.49,
    'Avenida Andalucia 23, Sevilla',
    'Avenida Andalucia 23, Sevilla'
),
(
    6,
    3,
    'PED-2025-0002',
    'enviado',
    16.94,
    4.99,
    21.93,
    'Calle Mayor 44, Madrid',
    'Calle Mayor 44, Madrid'
),
(
    4,
    NULL,
    'PED-2025-0003',
    'pagado',
    27.94,
    4.99,
    32.93,
    'Calle Larios 15, Malaga',
    'Calle Larios 15, Malaga'
),
(
    8,
    NULL,
    'PED-2025-0004',
    'preparando',
    68.89,
    0.00,
    68.89,
    'Paseo Maritimo 8, Cadiz',
    'Paseo Maritimo 8, Cadiz'
),
(
    5,
    NULL,
    'PED-2025-0005',
    'entregado',
    24.99,
    4.99,
    29.98,
    'Avenida Andalucia 23, Sevilla',
    'Avenida Andalucia 23, Sevilla'
);


/*
=================================================
PEDIDO_DETALLES
=================================================
*/

/*
Pedido 1
*/

INSERT INTO pedido_detalles
(
    pedido_id,
    variante_id,
    nombre_producto,
    sku,
    cantidad,
    precio_unitario,
    subtotal
)
VALUES
(
    1,
    3,
    'Royal Canin Kitten',
    'RC-KITTEN-2KG',
    1,
    21.50,
    21.50
),
(
    1,
    8,
    'Collar Nylon Trixie',
    'COLLAR-S',
    2,
    6.50,
    13.00
);


/*
Pedido 2
*/

INSERT INTO pedido_detalles
(
    pedido_id,
    variante_id,
    nombre_producto,
    sku,
    cantidad,
    precio_unitario,
    subtotal
)
VALUES
(
    2,
    13,
    'Purina One Gato Adulto',
    'PURINA-1.5KG',
    1,
    11.99,
    11.99
),
(
    2,
    16,
    'Ratón de Juguete Trixie',
    'RATON-GATO',
    1,
    4.95,
    4.95
);


/*
Pedido 3
*/

INSERT INTO pedido_detalles
(
    pedido_id,
    variante_id,
    nombre_producto,
    sku,
    cantidad,
    precio_unitario,
    subtotal
)
VALUES
(
    3,
    1,
    'Royal Canin Mini Adult',
    'RC-MINI-2KG',
    1,
    18.99,
    18.99
),
(
    3,
    5,
    'Kong Classic',
    'KONG-S',
    1,
    8.95,
    8.95
);


/*
Pedido 4
*/

INSERT INTO pedido_detalles
(
    pedido_id,
    variante_id,
    nombre_producto,
    sku,
    cantidad,
    precio_unitario,
    subtotal
)
VALUES
(
    4,
    2,
    'Royal Canin Mini Adult',
    'RC-MINI-8KG',
    1,
    54.99,
    54.99
),
(
    4,
    11,
    'Correa Trixie Premium',
    'CORREA-1M',
    1,
    9.95,
    9.95
);


/*
Pedido 5
*/

INSERT INTO pedido_detalles
(
    pedido_id,
    variante_id,
    nombre_producto,
    sku,
    cantidad,
    precio_unitario,
    subtotal
)
VALUES
(
    5,
    17,
    'Transportín Trixie Capri',
    'TRANSPORTIN-S',
    1,
    24.99,
    24.99
);


/*
=================================================
HISTORIAL_ESTADOS_PEDIDO
=================================================
*/

INSERT INTO historial_estados_pedido
(
    pedido_id,
    estado_anterior,
    estado_nuevo,
    observaciones
)
VALUES
(1,NULL,'pendiente','Pedido creado'),
(1,'pendiente','pagado','Pago recibido'),
(1,'pagado','preparando','Preparación en almacén'),
(1,'preparando','enviado','Pedido enviado'),
(1,'enviado','entregado','Pedido entregado'),

(2,NULL,'pendiente','Pedido creado'),
(2,'pendiente','pagado','Pago recibido'),
(2,'pagado','preparando','Preparación en almacén'),
(2,'preparando','enviado','Pedido enviado'),

(3,NULL,'pendiente','Pedido creado'),
(3,'pendiente','pagado','Pago recibido'),

(4,NULL,'pendiente','Pedido creado'),
(4,'pendiente','pagado','Pago recibido'),
(4,'pagado','preparando','Preparación en almacén'),

(5,NULL,'pendiente','Pedido creado'),
(5,'pendiente','pagado','Pago recibido'),
(5,'pagado','preparando','Preparación en almacén'),
(5,'preparando','enviado','Pedido enviado'),
(5,'enviado','entregado','Pedido entregado');

/*
=================================================
BLOQUE 6
PAGOS
=================================================
*/

INSERT INTO pagos
(
    pedido_id,
    metodo_pago_id,
    estado,
    importe,
    referencia_operacion,
    observaciones
)
VALUES
(
    1,
    1,
    'completado',
    39.49,
    'TRX-2025-000001',
    'Pago realizado con tarjeta'
),
(
    2,
    2,
    'completado',
    21.93,
    'TRX-2025-000002',
    'Pago realizado mediante PayPal'
),
(
    3,
    3,
    'completado',
    32.93,
    'TRX-2025-000003',
    'Pago realizado mediante Bizum'
),
(
    4,
    1,
    'completado',
    68.89,
    'TRX-2025-000004',
    'Pago realizado con tarjeta'
),
(
    5,
    4,
    'completado',
    29.98,
    'TRX-2025-000005',
    'Pago realizado mediante transferencia'
);


/*
=================================================
PAGO REEMBOLSADO DE EJEMPLO
=================================================
*/

INSERT INTO pagos
(
    pedido_id,
    metodo_pago_id,
    estado,
    importe,
    referencia_operacion,
    observaciones
)
VALUES
(
    5,
    4,
    'reembolsado',
    24.99,
    'REF-2025-000001',
    'Reembolso parcial por devolución'
);

/*
=================================================
BLOQUE 7
ENVIOS
=================================================
*/

INSERT INTO envios
(
    pedido_id,
    transportista_id,
    estado,
    numero_seguimiento,
    fecha_envio,
    fecha_entrega,
    observaciones
)
VALUES
(
    1,
    2,
    'entregado',
    'MRW202500001',
    '2025-05-10 09:00:00',
    '2025-05-12 13:45:00',
    'Entrega realizada correctamente'
),
(
    2,
    3,
    'en_transito',
    'SEUR202500002',
    '2025-05-15 08:30:00',
    NULL,
    'En reparto'
),
(
    3,
    1,
    'pendiente',
    NULL,
    NULL,
    NULL,
    'Pendiente de preparación'
),
(
    4,
    4,
    'preparando',
    NULL,
    NULL,
    NULL,
    'Preparando envío en almacén'
),
(
    5,
    1,
    'entregado',
    'COR202500005',
    '2025-05-20 10:00:00',
    '2025-05-22 12:20:00',
    'Entrega realizada correctamente'
);

/*
=================================================
BLOQUE 8
TICKETS_SOPORTE
=================================================
*/

INSERT INTO tickets_soporte
(
    usuario_id,
    pedido_id,
    asunto,
    descripcion,
    estado,
    prioridad
)
VALUES
(
    5,
    1,
    'Retraso en la entrega',
    'El pedido tardó más de lo esperado en llegar.',
    'cerrado',
    'baja'
),
(
    6,
    2,
    'Seguimiento no actualizado',
    'La empresa de transporte no actualiza el estado del envío.',
    'en_proceso',
    'media'
),
(
    4,
    3,
    'Consulta sobre el pedido',
    'Quiero saber cuándo se enviará mi pedido.',
    'abierto',
    'alta'
);


/*
=================================================
MENSAJES_TICKET
=================================================
*/

/*
Ticket 1
*/

INSERT INTO mensajes_ticket
(
    ticket_id,
    usuario_id,
    mensaje,
    es_interno
)
VALUES
(
    1,
    5,
    'Mi pedido ha llegado con retraso.',
    FALSE
),
(
    1,
    2,
    'Hemos revisado la incidencia y la entrega ya se ha completado.',
    FALSE
),
(
    1,
    2,
    'Ticket resuelto y cerrado.',
    TRUE
);


/*
Ticket 2
*/

INSERT INTO mensajes_ticket
(
    ticket_id,
    usuario_id,
    mensaje,
    es_interno
)
VALUES
(
    2,
    6,
    'No veo movimientos recientes en el seguimiento.',
    FALSE
),
(
    2,
    3,
    'Estamos contactando con la empresa de transporte.',
    FALSE
);


/*
Ticket 3
*/

INSERT INTO mensajes_ticket
(
    ticket_id,
    usuario_id,
    mensaje,
    es_interno
)
VALUES
(
    3,
    4,
    '¿Cuándo será enviado mi pedido?',
    FALSE
);

/*
=================================================
BLOQUE 9
DEVOLUCIONES
=================================================
*/

INSERT INTO devoluciones
(
    pedido_id,
    estado,
    fecha_resolucion,
    observaciones
)
VALUES
(
    5,
    'reembolsada',
    CURRENT_TIMESTAMP,
    'Producto devuelto correctamente y reembolso realizado'
),
(
    1,
    'solicitada',
    NULL,
    'Cliente solicita devolución por producto defectuoso'
);


/*
=================================================
DEVOLUCION_DETALLES
=================================================
*/

/*
Devolución asociada al pedido 5

Pedido 5:
Pedido_Detalle ID = 9
Transportín Trixie Capri
*/

INSERT INTO devolucion_detalles
(
    devolucion_id,
    pedido_detalle_id,
    cantidad,
    motivo,
    observaciones
)
VALUES
(
    1,
    9,
    1,
    'no_satisfecho',
    'El tamaño del transportín no era el esperado'
);


/*
Devolución asociada al pedido 1

Pedido 1:
Pedido_Detalle ID = 1
Royal Canin Kitten
*/

INSERT INTO devolucion_detalles
(
    devolucion_id,
    pedido_detalle_id,
    cantidad,
    motivo,
    observaciones
)
VALUES
(
    2,
    1,
    1,
    'producto_defectuoso',
    'Envase dañado durante el transporte'
);

