Tabla: roles

## Propósito

La tabla roles almacena los diferentes tipos de usuarios que pueden existir dentro de la tienda online de mascotas.

Permite implementar un sistema de permisos flexible, diferenciando entre clientes que realizan compras, empleados encargados de la gestión de pedidos y administradores con control total sobre la plataforma.

## Atributos

| Atributo    | Tipo         | Descripción                                   |
| ----------- | ------------ | --------------------------------------------- |
| id          | SERIAL       | Identificador único del rol                   |
| nombre      | VARCHAR(30)  | Nombre único del rol                          |
| descripcion | VARCHAR(200) | Descripción de las funciones asociadas al rol |
| created_at  | TIMESTAMP    | Fecha de creación del registro                |


## Relaciones

| Tabla relacionada | Relación                                         |
| ----------------- | ------------------------------------------------ |
| usuarios_roles    | Un rol puede estar asignado a múltiples usuarios |

## Reglas de negocio

El nombre del rol debe ser único.
Un rol no puede eliminarse si está asignado a usuarios.
Todo usuario registrado debe tener al menos un rol asignado.
El rol cliente se asignará automáticamente durante el registro.


## Índices

Clave primaria sobre id.
Restricción UNIQUE sobre nombre.

Valores iniciales
| Rol           |
| ------------- |
| cliente       |
| empleado      |
| administrador |

## Tabla: usuarios
## Propósito

La tabla usuarios almacena toda la información de las personas registradas en la plataforma.

Incluye tanto clientes que realizan compras como empleados y administradores encargados de gestionar el funcionamiento de la tienda online.

## Atributos

| Atributo         | Tipo           | Descripción                           |
| ---------------- | -------------- | ------------------------------------- |
| id               | SERIAL         | Identificador único del usuario       |
| nombre           | VARCHAR(80)    | Nombre del usuario                    |
| apellidos        | VARCHAR(120)   | Apellidos del usuario                 |
| email            | VARCHAR(150)   | Correo electrónico                    |
| password_hash    | VARCHAR(255)   | Contraseña cifrada                    |
| telefono         | VARCHAR(20)    | Teléfono de contacto                  |
| fecha_nacimiento | DATE           | Fecha de nacimiento                   |
| avatar_url       | VARCHAR(300)   | URL de la imagen de perfil            |
| estado           | estado_usuario | Estado actual de la cuenta            |
| ultimo_acceso    | TIMESTAMP      | Último acceso al sistema              |
| email_verificado | BOOLEAN        | Indica si el email ha sido verificado |
| created_at       | TIMESTAMP      | Fecha de creación de la cuenta        |
| updated_at       | TIMESTAMP      | Fecha de última modificación          |
| deleted_at       | TIMESTAMP      | Fecha de eliminación lógica           |


## Relaciones

| Tabla relacionada | Relación                                    |
| ----------------- | ------------------------------------------- |
| usuarios_roles    | Un usuario puede tener varios roles         |
| direcciones       | Un usuario puede tener varias direcciones   |
| carritos          | Un usuario puede tener carritos asociados   |
| pedidos           | Un usuario puede realizar múltiples pedidos |
| tickets_soporte   | Un usuario puede abrir varios tickets       |


## Reglas de negocio

El correo electrónico debe ser único.
No puede existir un usuario sin correo electrónico.
La contraseña nunca se almacenará en texto plano.
Un usuario bloqueado no podrá iniciar sesión.
Un usuario eliminado no podrá acceder al sistema.
El correo electrónico deberá verificarse antes de realizar compras.


## Índices

Clave primaria sobre id.
Restricción UNIQUE sobre email.
Índice sobre estado.
Índice sobre created_at.


## Enumerado asociado

| Valor                  | Descripción          |
| ---------------------- | -------------------- |
| activo                 | Usuario operativo    |
| bloqueado              | Usuario suspendido   |
| pendiente_verificacion | Registro incompleto  |
| eliminado              | Usuario dado de baja |


## Tabla: usuarios_roles
## Propósito

La tabla usuarios_roles implementa la relación muchos a muchos entre usuarios y roles.

Permite que un usuario tenga uno o varios roles dentro de la plataforma.

Ejemplos:

Un cliente normal tendrá únicamente el rol cliente.
Un trabajador podrá tener el rol empleado.
Un administrador podrá tener simultáneamente los roles empleado y administrador.

## Atributos

| Atributo    | Tipo      | Descripción                     |
| ----------- | --------- | ------------------------------- |
| usuario_id  | INTEGER   | Usuario al que se asigna el rol |
| rol_id      | INTEGER   | Rol asignado                    |
| asignado_en | TIMESTAMP | Fecha de asignación             |


## Clave primaria
(usuario_id, rol_id)

Se utiliza una clave primaria compuesta para impedir que un usuario reciba el mismo rol varias veces.


## Relaciones

| Tabla relacionada | Relación                                 |
| ----------------- | ---------------------------------------- |
| usuarios          | Muchos registros pertenecen a un usuario |
| roles             | Muchos registros pertenecen a un rol     |


## Reglas de negocio

Un usuario no puede tener el mismo rol asignado más de una vez.
Un usuario debe poseer al menos un rol.
No se podrá eliminar un rol que esté siendo utilizado.
La asignación de roles debe quedar registrada mediante la fecha de asignación.


## Índices

Clave primaria compuesta (usuario_id, rol_id).
Índice sobre rol_id.


## Justificación del diseño

Se ha optado por una relación N:M mediante la tabla intermedia usuarios_roles en lugar de almacenar directamente el rol dentro de la tabla usuarios.

Esta decisión permite que un mismo usuario pueda asumir distintos roles dentro del sistema sin duplicar información y facilita futuras ampliaciones de la plataforma, manteniendo el modelo normalizado y escalable.