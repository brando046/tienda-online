/*
=========================================
TABLA: PEDIDOS
=========================================
*/

CREATE TABLE pedidos (

    id SERIAL PRIMARY KEY,

    usuario_id INTEGER NOT NULL,

    carrito_id INTEGER,

    numero_pedido VARCHAR(30) UNIQUE NOT NULL,

    estado estado_pedido NOT NULL DEFAULT 'pendiente',

    subtotal DECIMAL(10,2) NOT NULL,

    gastos_envio DECIMAL(10,2) NOT NULL DEFAULT 0,

    total DECIMAL(10,2) NOT NULL,

    direccion_envio TEXT NOT NULL,

    direccion_facturacion TEXT NOT NULL,

    fecha_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_pedido_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id),

    CONSTRAINT fk_pedido_carrito
        FOREIGN KEY (carrito_id)
        REFERENCES carritos(id),

    CONSTRAINT chk_subtotal
        CHECK (subtotal >= 0),

    CONSTRAINT chk_total
        CHECK (total >= 0)
);

CREATE INDEX idx_pedidos_usuario
ON pedidos(usuario_id);

CREATE INDEX idx_pedidos_estado
ON pedidos(estado);

CREATE INDEX idx_pedidos_fecha
ON pedidos(fecha_pedido);

/*
=========================================
TABLA: PEDIDO_DETALLES
=========================================
*/

CREATE TABLE pedido_detalles (

    id SERIAL PRIMARY KEY,

    pedido_id INTEGER NOT NULL,

    variante_id INTEGER NOT NULL,

    nombre_producto VARCHAR(200) NOT NULL,

    sku VARCHAR(50) NOT NULL,

    cantidad INTEGER NOT NULL,

    precio_unitario DECIMAL(10,2) NOT NULL,

    subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_detalle_pedido
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_detalle_variante
        FOREIGN KEY (variante_id)
        REFERENCES variantes_producto(id),

    CONSTRAINT chk_detalle_cantidad
        CHECK (cantidad > 0),

    CONSTRAINT chk_detalle_precio
        CHECK (precio_unitario > 0)
);

CREATE INDEX idx_detalles_pedido
ON pedido_detalles(pedido_id);

CREATE INDEX idx_detalles_variante
ON pedido_detalles(variante_id);

/*
=========================================
TABLA: HISTORIAL_ESTADOS_PEDIDO
=========================================
*/

CREATE TABLE historial_estados_pedido (

    id SERIAL PRIMARY KEY,

    pedido_id INTEGER NOT NULL,

    estado_anterior estado_pedido,

    estado_nuevo estado_pedido NOT NULL,

    observaciones TEXT,

    fecha_cambio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_historial_pedido
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_historial_pedido
ON historial_estados_pedido(pedido_id);

CREATE INDEX idx_historial_fecha
ON historial_estados_pedido(fecha_cambio);