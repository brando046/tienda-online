/*
=========================================
TABLA: METODOS_PAGO
=========================================
*/

CREATE TABLE metodos_pago (

    id SERIAL PRIMARY KEY,

    nombre VARCHAR(50) NOT NULL UNIQUE,

    descripcion VARCHAR(255),

    activo BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_metodos_pago_activo
ON metodos_pago(activo);


INSERT INTO metodos_pago (nombre, descripcion)
VALUES
('Tarjeta', 'Pago mediante tarjeta bancaria'),
('PayPal', 'Pago mediante PayPal'),
('Bizum', 'Pago mediante Bizum'),
('Transferencia', 'Pago mediante transferencia bancaria');


/*
=========================================
TABLA: PAGOS
=========================================
*/

CREATE TABLE pagos (

    id SERIAL PRIMARY KEY,

    pedido_id INTEGER NOT NULL,

    metodo_pago_id INTEGER NOT NULL,

    estado estado_pago NOT NULL DEFAULT 'pendiente',

    importe DECIMAL(10,2) NOT NULL,

    referencia_operacion VARCHAR(100) UNIQUE,

    fecha_pago TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    observaciones TEXT,

    CONSTRAINT fk_pago_pedido
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(id),

    CONSTRAINT fk_pago_metodo
        FOREIGN KEY (metodo_pago_id)
        REFERENCES metodos_pago(id),

    CONSTRAINT chk_importe_pago
        CHECK (importe > 0)
);

CREATE INDEX idx_pagos_pedido
ON pagos(pedido_id);

CREATE INDEX idx_pagos_estado
ON pagos(estado);

CREATE INDEX idx_pagos_fecha
ON pagos(fecha_pago);