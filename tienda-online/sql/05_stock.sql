/*
=========================================
TABLA: STOCK
=========================================
*/

CREATE TABLE stock (

    id SERIAL PRIMARY KEY,

    variante_id INTEGER NOT NULL UNIQUE,

    cantidad INTEGER NOT NULL DEFAULT 0,

    stock_minimo INTEGER NOT NULL DEFAULT 0,

    ultima_actualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_stock_variante
        FOREIGN KEY (variante_id)
        REFERENCES variantes_producto(id)
        ON DELETE CASCADE,

    CONSTRAINT chk_stock_no_negativo
        CHECK (cantidad >= 0),

    CONSTRAINT chk_stock_minimo
        CHECK (stock_minimo >= 0)
);

CREATE INDEX idx_stock_cantidad
ON stock(cantidad);

/*
=========================================
TABLA: MOVIMIENTOS_STOCK
=========================================
*/

CREATE TABLE movimientos_stock (

    id SERIAL PRIMARY KEY,

    variante_id INTEGER NOT NULL,

    tipo_movimiento tipo_movimiento_stock NOT NULL,

    cantidad INTEGER NOT NULL,

    observaciones TEXT,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_movimiento_variante
        FOREIGN KEY (variante_id)
        REFERENCES variantes_producto(id)
        ON DELETE CASCADE,

    CONSTRAINT chk_cantidad_movimiento
        CHECK (cantidad > 0)
);

CREATE INDEX idx_movimientos_variante
ON movimientos_stock(variante_id);

CREATE INDEX idx_movimientos_tipo
ON movimientos_stock(tipo_movimiento);

CREATE INDEX idx_movimientos_fecha
ON movimientos_stock(created_at);