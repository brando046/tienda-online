/*
=========================================
TABLA: ESPECIES_MASCOTA
=========================================
*/

/*
=========================================
TABLA: ESPECIES_MASCOTA
=========================================
*/

CREATE TABLE especies_mascota (

    id SERIAL PRIMARY KEY,

    nombre VARCHAR(50) NOT NULL UNIQUE,

    descripcion VARCHAR(255),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


/*
=========================================
DATOS INICIALES
=========================================
*/

INSERT INTO especies_mascota (nombre, descripcion)
VALUES
('Perro', 'Productos para perros'),
('Gato', 'Productos para gatos'),
('Ave', 'Productos para aves'),
('Reptil', 'Productos para reptiles'),
('Roedor', 'Productos para pequeños mamíferos');

/*
=========================================
TABLA: CATEGORIAS
=========================================
*/

/*
=========================================
TABLA: CATEGORIAS
=========================================
*/

CREATE TABLE categorias (

    id SERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL UNIQUE,

    descripcion TEXT,

    activa BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


/*
=========================================
DATOS INICIALES
=========================================
*/

INSERT INTO categorias (nombre, descripcion)
VALUES
('Alimentacion', 'Piensos, comida húmeda y snacks'),
('Juguetes', 'Juguetes para mascotas'),
('Higiene', 'Champús, cepillos y limpieza'),
('Accesorios', 'Collares, correas y accesorios'),
('Transporte', 'Transportines y bolsas de viaje'),
('Salud', 'Suplementos y productos sanitarios'),
('Ropa', 'Prendas para mascotas');

/*
=========================================
TABLA: MARCAS
=========================================
*/

CREATE TABLE marcas (

    id SERIAL PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL UNIQUE,

    descripcion TEXT,

    pais_origen VARCHAR(100),

    sitio_web VARCHAR(255),

    activa BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


/*
=========================================
INDICES
=========================================
*/

CREATE INDEX idx_marcas_activa
ON marcas(activa);

INSERT INTO marcas
(nombre, descripcion, pais_origen, sitio_web)
VALUES
(
    'Royal Canin',
    'Fabricante especializado en alimentación para mascotas',
    'Francia',
    'https://www.royalcanin.com'
),
(
    'Purina',
    'Marca internacional de alimentos para mascotas',
    'Estados Unidos',
    'https://www.purina.com'
),
(
    'Kong',
    'Juguetes resistentes para perros',
    'Estados Unidos',
    'https://www.kongcompany.com'
),
(
    'Trixie',
    'Accesorios y productos para mascotas',
    'Alemania',
    'https://www.trixie.de'
),
(
    'Vitakraft',
    'Productos para aves y pequeños animales',
    'Alemania',
    'https://www.vitakraft.com'
);

/*
=========================================
TABLA: PRODUCTOS
=========================================
*/

CREATE TABLE productos (

    id SERIAL PRIMARY KEY,

    categoria_id INTEGER NOT NULL,

    marca_id INTEGER NOT NULL,

    especie_id INTEGER NOT NULL,

    nombre VARCHAR(150) NOT NULL,

    descripcion TEXT,

    activo BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_productos_categoria
        FOREIGN KEY (categoria_id)
        REFERENCES categorias(id),

    CONSTRAINT fk_productos_marca
        FOREIGN KEY (marca_id)
        REFERENCES marcas(id),

    CONSTRAINT fk_productos_especie
        FOREIGN KEY (especie_id)
        REFERENCES especies_mascota(id)
);

CREATE INDEX idx_productos_categoria
ON productos(categoria_id);

CREATE INDEX idx_productos_marca
ON productos(marca_id);

CREATE INDEX idx_productos_especie
ON productos(especie_id);

CREATE INDEX idx_productos_activo
ON productos(activo);


/*
=========================================
TABLA: VARIANTES_PRODUCTO
=========================================
*/

CREATE TABLE variantes_producto (

    id SERIAL PRIMARY KEY,

    producto_id INTEGER NOT NULL,

    sku VARCHAR(50) NOT NULL UNIQUE,

    nombre_variante VARCHAR(100) NOT NULL,

    precio DECIMAL(10,2) NOT NULL,

    peso_kg DECIMAL(6,2),

    activo BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_variantes_producto
        FOREIGN KEY (producto_id)
        REFERENCES productos(id)
        ON DELETE CASCADE,

    CONSTRAINT chk_precio_positivo
        CHECK (precio > 0)
);

CREATE INDEX idx_variantes_producto
ON variantes_producto(producto_id);

CREATE INDEX idx_variantes_activo
ON variantes_producto(activo);

/*
=========================================
TABLA: IMAGENES_PRODUCTO
=========================================
*/

CREATE TABLE imagenes_producto (

    id SERIAL PRIMARY KEY,

    producto_id INTEGER NOT NULL,

    url_imagen VARCHAR(500) NOT NULL,

    es_principal BOOLEAN NOT NULL DEFAULT FALSE,

    orden_visualizacion INTEGER NOT NULL DEFAULT 1,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_imagen_producto
        FOREIGN KEY (producto_id)
        REFERENCES productos(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_imagenes_producto
ON imagenes_producto(producto_id);