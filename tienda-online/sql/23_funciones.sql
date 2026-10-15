
/*
=================================================
Calcular total gastado por un cliente
=================================================
*/

CREATE OR REPLACE FUNCTION fn_total_gastado_cliente(
    p_usuario_id INTEGER
)
RETURNS DECIMAL(10,2)
AS $$
DECLARE
    v_total DECIMAL(10,2);
BEGIN

    SELECT COALESCE(SUM(total),0)
    INTO v_total
    FROM pedidos
    WHERE usuario_id = p_usuario_id
    AND estado <> 'cancelado';

    RETURN v_total;

END;
$$ LANGUAGE plpgsql;

/*
=================================================
Obtener stock disponible de una variante
=================================================
*/

CREATE OR REPLACE FUNCTION fn_stock_disponible(
    p_variante_id INTEGER
)
RETURNS INTEGER
AS $$
DECLARE
    v_stock INTEGER;
BEGIN

    SELECT cantidad
    INTO v_stock
    FROM stock
    WHERE variante_id = p_variante_id;

    RETURN COALESCE(v_stock,0);

END;
$$ LANGUAGE plpgsql;

/*
=================================================
Número de pedidos de un cliente
=================================================
*/


CREATE OR REPLACE FUNCTION fn_total_pedidos_cliente(
    p_usuario_id INTEGER
)
RETURNS INTEGER
AS $$
DECLARE
    v_total INTEGER;
BEGIN

    SELECT COUNT(*)
    INTO v_total
    FROM pedidos
    WHERE usuario_id = p_usuario_id;

    RETURN v_total;

END;
$$ LANGUAGE plpgsql;

/*
=================================================
Valor total del inventario
=================================================
*/


CREATE OR REPLACE FUNCTION fn_valor_inventario()
RETURNS DECIMAL(12,2)
AS $$
DECLARE
    v_total DECIMAL(12,2);
BEGIN

    SELECT SUM(s.cantidad * vp.precio)
    INTO v_total
    FROM stock s
    INNER JOIN variantes_producto vp
        ON s.variante_id = vp.id;

    RETURN COALESCE(v_total,0);

END;
$$ LANGUAGE plpgsql;