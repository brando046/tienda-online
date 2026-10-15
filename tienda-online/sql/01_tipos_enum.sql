-- Active: 1781125620657@@localhost@5432
CREATE TYPE estado_usuario AS ENUM (
    'activo',
    'bloqueado',
    'pendiente_verificacion',
    'eliminado'
);

CREATE TYPE tipo_direccion AS ENUM (
    'envio',
    'facturacion'
);

CREATE TYPE tipo_movimiento_stock AS ENUM (
    'entrada',
    'salida',
    'ajuste',
    'devolucion'
);

CREATE TYPE estado_pedido AS ENUM (
    'pendiente',
    'pagado',
    'preparando',
    'enviado',
    'entregado',
    'cancelado',
    'devuelto'
);

CREATE TYPE estado_pago AS ENUM (
    'pendiente',
    'completado',
    'fallido',
    'reembolsado'
);

CREATE TYPE estado_envio AS ENUM (
    'pendiente',
    'preparando',
    'en_transito',
    'entregado',
    'incidencia',
    'devuelto'
);

CREATE TYPE estado_ticket AS ENUM (
    'abierto',
    'en_proceso',
    'resuelto',
    'cerrado'
);

CREATE TYPE prioridad_ticket AS ENUM (
    'baja',
    'media',
    'alta',
    'urgente'
);

CREATE TYPE estado_devolucion AS ENUM (
    'solicitada',
    'aprobada',
    'rechazada',
    'recibida',
    'reembolsada'
);

CREATE TYPE motivo_devolucion AS ENUM (
    'producto_defectuoso',
    'producto_danado',
    'error_envio',
    'no_satisfecho',
    'otro'
);