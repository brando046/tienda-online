# Funciones

## Introducción

Con el objetivo de ampliar las capacidades de la base de datos y facilitar la obtención de información relevante para el negocio, se han desarrollado varias funciones almacenadas en PostgreSQL.

Estas funciones encapsulan lógica de consulta reutilizable y permiten obtener indicadores útiles relacionados con clientes, inventario y ventas.

Su utilización mejora la legibilidad del código SQL y evita la repetición de consultas complejas.

---

# Función: fn_total_gastado_cliente

## Propósito

Calcular el importe total gastado por un cliente a lo largo de todos sus pedidos.

## Parámetros

| Parámetro    | Tipo    |
| ------------ | ------- |
| p_usuario_id | INTEGER |

## Valor devuelto

| Tipo          |
| ------------- |
| DECIMAL(10,2) |

## Funcionamiento

La función suma el importe total de todos los pedidos realizados por un usuario, excluyendo aquellos pedidos que hayan sido cancelados.

## Utilidad

* Análisis de clientes.
* Programas de fidelización.
* Identificación de clientes de alto valor.
* Informes comerciales.

## Ejemplo de uso

```sql
SELECT fn_total_gastado_cliente(5);
```

---

# Función: fn_stock_disponible

## Propósito

Consultar la cantidad de stock disponible para una variante concreta de producto.

## Parámetros

| Parámetro     | Tipo    |
| ------------- | ------- |
| p_variante_id | INTEGER |

## Valor devuelto

| Tipo    |
| ------- |
| INTEGER |

## Funcionamiento

La función consulta la tabla de stock y devuelve la cantidad disponible asociada a una variante de producto.

Si la variante no dispone de registro de stock, devuelve el valor 0.

## Utilidad

* Gestión de inventario.
* Validación de disponibilidad.
* Control de existencias.
* Automatización de procesos de venta.

## Ejemplo de uso

```sql
SELECT fn_stock_disponible(1);
```

---

# Función: fn_total_pedidos_cliente

## Propósito

Obtener el número total de pedidos realizados por un cliente.

## Parámetros

| Parámetro    | Tipo    |
| ------------ | ------- |
| p_usuario_id | INTEGER |

## Valor devuelto

| Tipo    |
| ------- |
| INTEGER |

## Funcionamiento

La función cuenta todos los pedidos asociados a un usuario determinado.

## Utilidad

* Análisis de frecuencia de compra.
* Segmentación de clientes.
* Programas de fidelización.
* Informes de actividad.

## Ejemplo de uso

```sql
SELECT fn_total_pedidos_cliente(5);
```

---

# Función: fn_valor_inventario

## Propósito

Calcular el valor económico total del inventario disponible.

## Parámetros

Esta función no recibe parámetros.

## Valor devuelto

| Tipo          |
| ------------- |
| DECIMAL(12,2) |

## Funcionamiento

La función multiplica la cantidad disponible de cada variante por su precio unitario y suma el resultado para obtener el valor total del inventario.

## Utilidad

* Control financiero.
* Valoración de existencias.
* Auditorías de inventario.
* Informes de gestión.

## Ejemplo de uso

```sql
SELECT fn_valor_inventario();
```

---

# Justificación General

Las funciones implementadas permiten reutilizar lógica de negocio frecuente dentro de la base de datos, facilitando la obtención de información relevante mediante llamadas simples.

Su incorporación mejora la mantenibilidad del sistema y aporta funcionalidades avanzadas para la gestión de clientes, ventas e inventario.

Además, constituyen una ampliación del proyecto que demuestra el uso de programación en PostgreSQL mediante PL/pgSQL, complementando el uso de tablas, vistas, triggers y consultas.
