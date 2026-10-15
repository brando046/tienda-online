/*
=========================================
TABLA: CARRITOS
=========================================
*/

CREATE TABLE carritos (

    id SERIAL PRIMARY KEY,

    usuario_id INTEGER NOT NULL,

    estado VARCHAR(20) NOT NULL DEFAULT 'activo',

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_carrito_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
        ON DELETE CASCADE,

    CONSTRAINT chk_estado_carrito
        CHECK (estado IN ('activo', 'convertido', 'abandonado'))
);

CREATE INDEX idx_carritos_usuario
ON carritos(usuario_id);

CREATE INDEX idx_carritos_estado
ON carritos(estado);

/*
=========================================
TABLA: CARRITO_DETALLES
=========================================
*/

CREATE TABLE carrito_detalles (

    id SERIAL PRIMARY KEY,

    carrito_id INTEGER NOT NULL,

    variante_id INTEGER NOT NULL,

    cantidad INTEGER NOT NULL DEFAULT 1,

    precio_unitario DECIMAL(10,2) NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_detalle_carrito
        FOREIGN KEY (carrito_id)
        REFERENCES carritos(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_detalle_variante
        FOREIGN KEY (variante_id)
        REFERENCES variantes_producto(id),

    CONSTRAINT chk_cantidad_carrito
        CHECK (cantidad > 0),

    CONSTRAINT chk_precio_carrito
        CHECK (precio_unitario > 0)
);

CREATE INDEX idx_carrito_detalles_carrito
ON carrito_detalles(carrito_id);

CREATE INDEX idx_carrito_detalles_variante
ON carrito_detalles(variante_id);