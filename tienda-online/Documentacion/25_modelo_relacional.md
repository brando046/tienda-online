# Modelo Relacional

## Introducción

El modelo relacional representa la estructura lógica de la base de datos de la tienda online especializada en productos para mascotas.

Cada relación corresponde a una tabla de la base de datos y muestra sus atributos principales, claves primarias (PK) y claves foráneas (FK).

---

# ROLES

```text
ROLES
(
    id PK,
    nombre,
    descripcion,
    created_at
)
```

---

# USUARIOS

```text
USUARIOS
(
    id PK,
    nombre,
    apellidos,
    email,
    password_hash,
    telefono,
    fecha_nacimiento,
    avatar_url,
    estado,
    ultimo_acceso,
    email_verificado,
    created_at,
    updated_at,
    deleted_at
)
```

---

# USUARIOS_ROLES

```text
USUARIOS_ROLES
(
    usuario_id PK FK → usuarios.id,
    rol_id PK FK → roles.id,
    asignado_en
)
```

---

# DIRECCIONES

```text
DIRECCIONES
(
    id PK,
    usuario_id FK → usuarios.id,
    nombre_destinatario,
    telefono,
    direccion_linea1,
    direccion_linea2,
    ciudad,
    provincia,
    codigo_postal,
    pais,
    tipo,
    predeterminada,
    created_at
)
```

---

# ESPECIES_MASCOTA

```text
ESPECIES_MASCOTA
(
    id PK,
    nombre,
    descripcion,
    created_at
)
```

---

# CATEGORIAS

```text
CATEGORIAS
(
    id PK,
    nombre,
    descripcion,
    activa,
    created_at
)
```

---

# MARCAS

```text
MARCAS
(
    id PK,
    nombre,
    descripcion,
    pais_origen,
    sitio_web,
    activa,
    created_at
)
```

---

# PRODUCTOS

```text
PRODUCTOS
(
    id PK,
    categoria_id FK → categorias.id,
    marca_id FK → marcas.id,
    especie_id FK → especies_mascota.id,
    nombre,
    descripcion,
    activo,
    created_at,
    updated_at
)
```

---

# VARIANTES_PRODUCTO

```text
VARIANTES_PRODUCTO
(
    id PK,
    producto_id FK → productos.id,
    sku,
    nombre_variante,
    precio,
    peso_kg,
    activo,
    created_at
)
```

---

# IMAGENES_PRODUCTO

```text
IMAGENES_PRODUCTO
(
    id PK,
    producto_id FK → productos.id,
    url_imagen,
    es_principal,
    orden_visualizacion,
    created_at
)
```

---

# STOCK

```text
STOCK
(
    id PK,
    variante_id FK → variantes_producto.id,
    cantidad,
    stock_minimo,
    ultima_actualizacion
)
```

---

# MOVIMIENTOS_STOCK

```text
MOVIMIENTOS_STOCK
(
    id PK,
    variante_id FK → variantes_producto.id,
    tipo_movimiento,
    cantidad,
    observaciones,
    created_at
)
```

---

# CARRITOS

```text
CARRITOS
(
    id PK,
    usuario_id FK → usuarios.id,
    estado,
    created_at,
    updated_at
)
```

---

# CARRITO_DETALLES

```text
CARRITO_DETALLES
(
    id PK,
    carrito_id FK → carritos.id,
    variante_id FK → variantes_producto.id,
    cantidad,
    precio_unitario,
    created_at
)
```

---

# PEDIDOS

```text
PEDIDOS
(
    id PK,
    usuario_id FK → usuarios.id,
    carrito_id FK → carritos.id,
    numero_pedido,
    estado,
    subtotal,
    gastos_envio,
    total,
    direccion_envio,
    direccion_facturacion,
    fecha_pedido,
    updated_at
)
```

---

# PEDIDO_DETALLES

```text
PEDIDO_DETALLES
(
    id PK,
    pedido_id FK → pedidos.id,
    variante_id FK → variantes_producto.id,
    nombre_producto,
    sku,
    cantidad,
    precio_unitario,
    subtotal
)
```

---

# HISTORIAL_ESTADOS_PEDIDO

```text
HISTORIAL_ESTADOS_PEDIDO
(
    id PK,
    pedido_id FK → pedidos.id,
    estado_anterior,
    estado_nuevo,
    observaciones,
    fecha_cambio
)
```

---

# METODOS_PAGO

```text
METODOS_PAGO
(
    id PK,
    nombre,
    descripcion,
    activo,
    created_at
)
```

---

# PAGOS

```text
PAGOS
(
    id PK,
    pedido_id FK → pedidos.id,
    metodo_pago_id FK → metodos_pago.id,
    estado,
    importe,
    referencia_operacion,
    fecha_pago,
    observaciones
)
```

---

# TRANSPORTISTAS

```text
TRANSPORTISTAS
(
    id PK,
    nombre,
    telefono,
    email,
    sitio_web,
    activo,
    created_at
)
```

---

# ENVIOS

```text
ENVIOS
(
    id PK,
    pedido_id FK → pedidos.id,
    transportista_id FK → transportistas.id,
    estado,
    numero_seguimiento,
    fecha_envio,
    fecha_entrega,
    observaciones,
    created_at
)
```

---

# TICKETS_SOPORTE

```text
TICKETS_SOPORTE
(
    id PK,
    usuario_id FK → usuarios.id,
    pedido_id FK → pedidos.id,
    asunto,
    descripcion,
    estado,
    prioridad,
    fecha_apertura,
    fecha_cierre
)
```

---

# MENSAJES_TICKET

```text
MENSAJES_TICKET
(
    id PK,
    ticket_id FK → tickets_soporte.id,
    usuario_id FK → usuarios.id,
    mensaje,
    es_interno,
    created_at
)
```

---

# DEVOLUCIONES

```text
DEVOLUCIONES
(
    id PK,
    pedido_id FK → pedidos.id,
    estado,
    fecha_solicitud,
    fecha_resolucion,
    observaciones
)
```

---

# DEVOLUCION_DETALLES

```text
DEVOLUCION_DETALLES
(
    id PK,
    devolucion_id FK → devoluciones.id,
    pedido_detalle_id FK → pedido_detalles.id,
    cantidad,
    motivo,
    observaciones
)
```

---

# Conclusión

El modelo relacional resultante está compuesto por las entidades necesarias para gestionar usuarios, catálogo de productos, inventario, carritos de compra, pedidos, pagos, envíos, soporte técnico y devoluciones dentro de una tienda online especializada en productos para mascotas.

La estructura cumple los principios de normalización y garantiza la integridad referencial mediante el uso de claves primarias y claves foráneas.
