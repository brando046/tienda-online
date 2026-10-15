/*
=========================================
TABLA: DIRECCIONES
=========================================
*/

CREATE TABLE direcciones (

    id SERIAL PRIMARY KEY,

    usuario_id INTEGER NOT NULL,

    nombre_destinatario VARCHAR(120) NOT NULL,

    telefono VARCHAR(20),

    direccion_linea1 VARCHAR(200) NOT NULL,

    direccion_linea2 VARCHAR(200),

    ciudad VARCHAR(100) NOT NULL,

    provincia VARCHAR(100) NOT NULL,

    codigo_postal VARCHAR(10) NOT NULL,

    pais VARCHAR(100) NOT NULL DEFAULT 'España',

    tipo tipo_direccion NOT NULL,

    predeterminada BOOLEAN NOT NULL DEFAULT FALSE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_direcciones_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
        ON DELETE CASCADE
);


/*
=========================================
INDICES
=========================================
*/

CREATE INDEX idx_direcciones_usuario
ON direcciones(usuario_id);