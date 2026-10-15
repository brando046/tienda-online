/*
=========================================
TABLA: TRANSPORTISTAS
=========================================
*/

CREATE TABLE transportistas (

    id SERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL UNIQUE,

    telefono VARCHAR(20),

    email VARCHAR(150),

    sitio_web VARCHAR(255),

    activo BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_transportistas_activo
ON transportistas(activo);

INSERT INTO transportistas
(nombre, telefono, email, sitio_web)
VALUES
('Correos', '900400004', 'atcliente@correos.com', 'https://www.correos.es'),
('MRW', '902300400', 'informacion@mrw.es', 'https://www.mrw.es'),
('SEUR', '902101010', 'clientes@seur.com', 'https://www.seur.com'),
('GLS', '902113300', 'clientes@gls-spain.com', 'https://www.gls-spain.com');


/*
=========================================
TABLA: ENVIOS
=========================================
*/

CREATE TABLE envios (

    id SERIAL PRIMARY KEY,

    pedido_id INTEGER NOT NULL,

    transportista_id INTEGER,

    estado estado_envio NOT NULL DEFAULT 'pendiente',

    numero_seguimiento VARCHAR(100) UNIQUE,

    fecha_envio TIMESTAMP,

    fecha_entrega TIMESTAMP,

    observaciones TEXT,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_envio_pedido
        FOREIGN KEY (pedido_id)
        REFERENCES pedidos(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_envio_transportista
        FOREIGN KEY (transportista_id)
        REFERENCES transportistas(id)
);

CREATE INDEX idx_envios_pedido
ON envios(pedido_id);

CREATE INDEX idx_envios_transportista
ON envios(transportista_id);

CREATE INDEX idx_envios_estado
ON envios(estado);

