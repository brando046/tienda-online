# Tienda Online

## Descripción

Tienda Online es un proyecto de diseño e implementación de una base de datos relacional para una tienda online especializada en productos para mascotas.

El proyecto modela las distintas áreas necesarias para gestionar una tienda, incluyendo usuarios, catálogo de productos, inventario, carritos de compra, pedidos, pagos, envíos, soporte al cliente y devoluciones.

También incorpora consultas SQL, vistas, funciones y triggers para consultar y gestionar los datos, así como automatizar determinadas operaciones de la base de datos.

Este proyecto forma parte de mi aprendizaje en el ciclo de Desarrollo de Aplicaciones Multiplataforma (DAM) y me permite poner en práctica conocimientos de bases de datos relacionales, SQL, PostgreSQL y administración de servicios mediante Docker.

## Tecnologías utilizadas

- **PostgreSQL:** sistema gestor de bases de datos relacionales.
- **SQL:** creación y gestión de tablas, relaciones, consultas y operaciones sobre los datos.
- **Docker:** ejecución de los servicios mediante contenedores.
- **Docker Compose:** configuración y puesta en marcha de PostgreSQL y pgAdmin.
- **pgAdmin:** administración y consulta de la base de datos.
- **Git y GitHub:** control de versiones y alojamiento del proyecto.

## Funcionalidades

- Gestión de usuarios, roles y direcciones.
- Organización del catálogo mediante categorías, marcas y especies de mascotas.
- Gestión de productos, variantes, imágenes y precios.
- Control del inventario y registro de movimientos de stock.
- Modelado de carritos de compra y sus detalles.
- Gestión de pedidos, líneas de pedido e historial de estados.
- Registro de métodos de pago y pagos asociados a pedidos.
- Gestión de transportistas, envíos y seguimiento.
- Sistema de tickets de soporte y mensajes.
- Gestión de devoluciones y sus detalles.
- Consultas SQL para obtener información de la tienda.
- Creación de vistas, funciones y triggers.
- Incorporación de datos de prueba para comprobar el funcionamiento de la base de datos.

## Estructura del proyecto

```text
tienda-online/
├── docker-compose.yml
└── tienda-online/
    ├── Documentacion/
    │   ├── 01_tipos_enum.md
    │   ├── 02_usuarios.md
    │   ├── 03_direcciones.md
    │   ├── 04_catalogo.md
    │   ├── 05_stock.md
    │   ├── 06_carrito.md
    │   ├── 07_pedidos.md
    │   ├── 08_pagos.md
    │   ├── 09_envios.md
    │   ├── 10_soporte.md
    │   ├── 11_devoluciones.md
    │   ├── 12_datos_prueb.md
    │   ├── 20_triggers.md
    │   ├── 21_vistas.md
    │   ├── 22_consultas.md
    │   ├── 23_funciones.md
    │   ├── 24_joins.md
    │   ├── 25_modelo_relacional.md
    │   └── 26_diagrama_er.md
    └── sql/
        ├── 01_tipos_enum.sql
        ├── 02_usuarios.sql
        ├── 03_direcciones.sql
        ├── 04_catalogo.sql
        ├── 05_stock.sql
        ├── 06_carrito.sql
        ├── 07_pedidos.sql
        ├── 08_pagos.sql
        ├── 09_envios.sql
        ├── 10_soporte.sql
        ├── 11_devoluciones.sql
        ├── 12_datos_prueba.sql
        ├── 20_triggers.sql
        ├── 21_vistas.sql
        ├── 22_consultas.sql
        ├── 23_funciones.sql
        └── 24_joins.sql
```

## Organización del proyecto

- **docker-compose.yml:** define los servicios de PostgreSQL y pgAdmin, sus puertos y la configuración de persistencia.
- **Documentacion/:** contiene la documentación del modelo de datos, las tablas, las relaciones y las operaciones SQL.
- **sql/:** contiene los scripts para crear los tipos enumerados, las tablas, los datos de prueba, las vistas, las funciones, los triggers y las consultas.

## Instalación y ejecución

### Requisitos

- Docker Desktop instalado y en ejecución.
- Git instalado para clonar el repositorio.
- Un navegador web para acceder a pgAdmin.

### 1. Clonar el repositorio

Abre una terminal y ejecuta:

```bash
git clone https://github.com/brando046/tienda-online.git
cd tienda-online
```

### 2. Iniciar los contenedores

Desde la carpeta que contiene `docker-compose.yml`, ejecuta:

```bash
docker compose up -d
```

Este comando inicia los servicios configurados en Docker Compose.

Para comprobar el estado de los contenedores:

```bash
docker compose ps
```

### 3. Acceder a pgAdmin

Abre el navegador y accede a:

```text
http://localhost:5050
```

Si el archivo `docker-compose.yml` mantiene las credenciales de ejemplo descritas en este proyecto, los datos de acceso a pgAdmin son:

- **Correo:** `admin@tienda.com`
- **Contraseña:** `admin123`

Si se han modificado las variables de entorno, utiliza las credenciales configuradas actualmente.

### 4. Conectar pgAdmin con PostgreSQL

Configura una nueva conexión al servidor PostgreSQL utilizando los valores definidos en `docker-compose.yml`.

Como referencia, si se mantienen los valores de ejemplo:

- **Host:** `db`, si la conexión se realiza desde el contenedor de pgAdmin.
- **Puerto:** `5432`.
- **Base de datos:** `tienda_online`.
- **Usuario:** `tienda_user`.
- **Contraseña:** `tienda_pass`.

Comprueba los valores reales de configuración en `docker-compose.yml` antes de establecer la conexión.

### 5. Crear la estructura de la base de datos

Ejecuta los scripts de la carpeta `sql/` en el orden adecuado, respetando las dependencias entre tipos, tablas y relaciones.

Después de crear las tablas, ejecuta el script de datos de prueba y los scripts correspondientes a vistas, funciones, triggers y consultas cuando se cumplan sus dependencias.

Consulta los archivos de `Documentacion/` para conocer la finalidad de cada script y el orden de ejecución recomendado.

### 6. Detener los contenedores

Cuando termines de trabajar con el proyecto, puedes detener los servicios con:

```bash
docker compose down
```

Este comando detiene y elimina los contenedores creados por Docker Compose, pero normalmente conserva los datos almacenados en volúmenes persistentes. Evita utilizar `docker compose down -v` si quieres conservarlos.

## Modelo de datos

La base de datos se organiza en diferentes áreas funcionales:

- **Usuarios:** usuarios, roles, asignaciones de roles y direcciones.
- **Catálogo:** especies de mascotas, categorías, marcas, productos, variantes e imágenes.
- **Inventario:** existencias y movimientos de stock.
- **Compras y ventas:** carritos, pedidos, detalles e historial de estados.
- **Pagos y logística:** métodos de pago, pagos, transportistas y envíos.
- **Atención al cliente:** tickets de soporte, mensajes y devoluciones.

Las relaciones entre las tablas se definen mediante claves primarias y claves foráneas para mantener la integridad referencial.

## Documentación

El proyecto incluye documentación en Markdown sobre:

- Tipos de datos y tipos enumerados.
- Estructura de las tablas y sus relaciones.
- Modelo relacional y diagrama entidad-relación.
- Consultas SQL y operaciones con `JOIN`.
- Vistas para consultar información.
- Funciones y triggers para gestionar operaciones.
- Datos de prueba para comprobar el funcionamiento de la base de datos.

## Repositorio

El código fuente y los archivos del proyecto están disponibles en GitHub:

**[Tienda Online — GitHub](https://github.com/brando046/tienda-online)**

## Autor

**Brandon Castrillón**

Estudiante de Desarrollo de Aplicaciones Multiplataforma (DAM).

- **Portfolio:** [Portfolio personal](https://brando046.github.io/Portfolio-Brandon/)
