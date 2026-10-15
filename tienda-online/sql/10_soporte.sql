/*
=========================================
TABLA: TICKETS_SOPORTE
=========================================
*/

CREATE TABLE tickets_soporte (

    id SERIAL PRIMARY KEY,

    usuario_id INTEGER NOT NULL,

    pedido_id INTEGER,

    asunto VARCHAR(200) NOT NULL,

    descripcion TEXT NOT NULL,

    estado estado_ticket NOT NULL DEFAULT 'abierto',

    prioridad prioridad_ticket NOT NULL DEFAULT 'media',

    fecha_apertura TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    fecha_cierre TIMESTAMP,

    CONSTRAINT fk_ticket_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id),

    CONSTRAINT fk_ticket_pedido
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(id)
        ON DELETE SET NULL
);

CREATE INDEX idx_tickets_usuario
ON tickets_soporte(usuario_id);

CREATE INDEX idx_tickets_estado
ON tickets_soporte(estado);

CREATE INDEX idx_tickets_prioridad
ON tickets_soporte(prioridad);


/*
=========================================
TABLA: MENSAJES_TICKET
=========================================
*/

CREATE TABLE mensajes_ticket (

    id SERIAL PRIMARY KEY,

    ticket_id INTEGER NOT NULL,

    usuario_id INTEGER NOT NULL,

    mensaje TEXT NOT NULL,

    es_interno BOOLEAN NOT NULL DEFAULT FALSE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_mensaje_ticket
        FOREIGN KEY (ticket_id)
        REFERENCES tickets_soporte(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_mensaje_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
);

CREATE INDEX idx_mensajes_ticket
ON mensajes_ticket(ticket_id);

CREATE INDEX idx_mensajes_fecha
ON mensajes_ticket(created_at);

