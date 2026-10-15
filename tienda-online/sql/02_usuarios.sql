-- Active: 1781125620657@@localhost@5432@tienda_online
/*
=========================================
TABLA: ROLES
=========================================
*/

CREATE TABLE roles (
    id SERIAL PRIMARY KEY,

    nombre VARCHAR(30) NOT NULL UNIQUE,

    descripcion VARCHAR(200),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


/*
=========================================
TABLA: USUARIOS
=========================================
*/

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,

    nombre VARCHAR(80) NOT NULL,

    apellidos VARCHAR(120) NOT NULL,

    email VARCHAR(150) NOT NULL UNIQUE,

    password_hash VARCHAR(255) NOT NULL,

    telefono VARCHAR(20),

    fecha_nacimiento DATE,

    avatar_url VARCHAR(300),

    estado estado_usuario NOT NULL DEFAULT 'activo',

    ultimo_acceso TIMESTAMP,

    email_verificado BOOLEAN NOT NULL DEFAULT FALSE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    deleted_at TIMESTAMP
);


/*
=========================================
TABLA: USUARIOS_ROLES
=========================================
*/

CREATE TABLE usuarios_roles (

    usuario_id INTEGER NOT NULL,

    rol_id INTEGER NOT NULL,

    asignado_en TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (usuario_id, rol_id),

    CONSTRAINT fk_usuario_rol_usuario
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_usuario_rol_rol
        FOREIGN KEY (rol_id)
        REFERENCES roles(id)
        ON DELETE RESTRICT
);


/*
=========================================
INDICES
=========================================
*/

CREATE INDEX idx_usuarios_estado
ON usuarios(estado);

CREATE INDEX idx_usuarios_created_at
ON usuarios(created_at);

CREATE INDEX idx_usuarios_roles_rol
ON usuarios_roles(rol_id);


/*
=========================================
DATOS INICIALES
=========================================
*/

INSERT INTO roles (nombre, descripcion)
VALUES
('cliente', 'Usuario que realiza compras en la tienda'),
('empleado', 'Trabajador encargado de la gestión de pedidos'),
('administrador', 'Control total de la plataforma');