
/*
=========================================
Actualizar updated_at automáticamente
=========================================
*/

CREATE OR REPLACE FUNCTION actualizar_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_usuarios_updated_at
BEFORE UPDATE ON usuarios
FOR EACH ROW
EXECUTE FUNCTION actualizar_updated_at();


CREATE TRIGGER trg_productos_updated_at
BEFORE UPDATE ON productos
FOR EACH ROW
EXECUTE FUNCTION actualizar_updated_at();


CREATE TRIGGER trg_carritos_updated_at
BEFORE UPDATE ON carritos
FOR EACH ROW
EXECUTE FUNCTION actualizar_updated_at();


CREATE TRIGGER trg_pedidos_updated_at
BEFORE UPDATE ON pedidos
FOR EACH ROW
EXECUTE FUNCTION actualizar_updated_at();


/*
=========================================
Registrar histórico de estados de pedido automáticamente
=========================================
*/

CREATE OR REPLACE FUNCTION registrar_cambio_estado_pedido()
RETURNS TRIGGER AS $$
BEGIN

    IF OLD.estado IS DISTINCT FROM NEW.estado THEN

        INSERT INTO historial_estados_pedido (
            pedido_id,
            estado_anterior,
            estado_nuevo,
            fecha_cambio
        )
        VALUES (
            NEW.id,
            OLD.estado,
            NEW.estado,
            CURRENT_TIMESTAMP
        );

    END IF;

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER trg_historial_estado_pedido
AFTER UPDATE ON pedidos
FOR EACH ROW
EXECUTE FUNCTION registrar_cambio_estado_pedido();


/*
=========================================
. Registrar movimientos de stock automáticamente
=========================================
*/

CREATE OR REPLACE FUNCTION registrar_movimiento_stock()
RETURNS TRIGGER AS $$
BEGIN

    IF NEW.cantidad > OLD.cantidad THEN

        INSERT INTO movimientos_stock (
            variante_id,
            tipo_movimiento,
            cantidad,
            observaciones
        )
        VALUES (
            NEW.variante_id,
            'entrada',
            NEW.cantidad - OLD.cantidad,
            'Entrada automática'
        );

    ELSIF NEW.cantidad < OLD.cantidad THEN

        INSERT INTO movimientos_stock (
            variante_id,
            tipo_movimiento,
            cantidad,
            observaciones
        )
        VALUES (
            NEW.variante_id,
            'salida',
            OLD.cantidad - NEW.cantidad,
            'Salida automática'
        );

    END IF;

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

/*
=========================================
Evitar stock negativo
=========================================
*/

CREATE TRIGGER trg_movimiento_stock
AFTER UPDATE ON stock
FOR EACH ROW
EXECUTE FUNCTION registrar_movimiento_stock();

CREATE OR REPLACE FUNCTION validar_stock()
RETURNS TRIGGER AS $$
BEGIN

    IF NEW.cantidad < 0 THEN

        RAISE EXCEPTION
        'El stock no puede ser negativo';

    END IF;

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_validar_stock
BEFORE INSERT OR UPDATE ON stock
FOR EACH ROW
EXECUTE FUNCTION validar_stock();


/*
=========================================
Reponer stock automáticamente al aprobar una devolución
=========================================
*/

CREATE OR REPLACE FUNCTION reponer_stock_devolucion()
RETURNS TRIGGER AS $$
BEGIN

    IF NEW.estado = 'recibida'
       AND OLD.estado IS DISTINCT FROM NEW.estado
    THEN

        UPDATE stock s
        SET cantidad = s.cantidad + dd.cantidad
        FROM devolucion_detalles dd
        JOIN pedido_detalles pd
            ON dd.pedido_detalle_id = pd.id
        WHERE dd.devolucion_id = NEW.id
          AND s.variante_id = pd.variante_id;

    END IF;

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_reponer_stock_devolucion
AFTER UPDATE ON devoluciones
FOR EACH ROW
EXECUTE FUNCTION reponer_stock_devolucion();


/*
=========================================
Crear historial inicial de pedido
=========================================
*/

CREATE OR REPLACE FUNCTION registrar_estado_inicial_pedido()
RETURNS TRIGGER AS $$
BEGIN

    INSERT INTO historial_estados_pedido (
        pedido_id,
        estado_nuevo,
        fecha_cambio
    )
    VALUES (
        NEW.id,
        NEW.estado,
        CURRENT_TIMESTAMP
    );

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_estado_inicial_pedido
AFTER INSERT ON pedidos
FOR EACH ROW
EXECUTE FUNCTION registrar_estado_inicial_pedido();