/*
=========================================
TABLA: DEVOLUCIONES
=========================================
*/

CREATE TABLE devoluciones (

    id SERIAL PRIMARY KEY,

    pedido_id INTEGER NOT NULL,

    estado estado_devolucion NOT NULL DEFAULT 'solicitada',

    fecha_solicitud TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    fecha_resolucion TIMESTAMP,

    observaciones TEXT,

    CONSTRAINT fk_devolucion_pedido
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_devoluciones_pedido
ON devoluciones(pedido_id);

CREATE INDEX idx_devoluciones_estado
ON devoluciones(estado);

/*
=========================================
TABLA: DEVOLUCION_DETALLES
=========================================
*/

CREATE TABLE devolucion_detalles (

    id SERIAL PRIMARY KEY,

    devolucion_id INTEGER NOT NULL,

    pedido_detalle_id INTEGER NOT NULL,

    cantidad INTEGER NOT NULL,

    motivo motivo_devolucion NOT NULL,

    observaciones TEXT,

    CONSTRAINT fk_detalle_devolucion
        FOREIGN KEY (devolucion_id)
        REFERENCES devoluciones(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_detalle_pedido
        FOREIGN KEY (pedido_detalle_id)
        REFERENCES pedido_detalles(id),

    CONSTRAINT chk_cantidad_devuelta
        CHECK (cantidad > 0)
);

CREATE INDEX idx_detalles_devolucion
ON devolucion_detalles(devolucion_id);

CREATE INDEX idx_detalles_pedido_devuelto
ON devolucion_detalles(pedido_detalle_id);