# Triggers

## Introducción

Los triggers implementados permiten automatizar procesos críticos del negocio y garantizar la integridad de los datos sin depender exclusivamente de la aplicación.

Su objetivo es reducir errores humanos, mantener históricos automáticos y asegurar el cumplimiento de las reglas de negocio definidas para la tienda online.

---

# Trigger: Actualización automática de updated_at

## Nombre

trg_usuarios_updated_at

trg_productos_updated_at

trg_carritos_updated_at

trg_pedidos_updated_at

## Función asociada

actualizar_updated_at()

## Propósito

Actualiza automáticamente el campo `updated_at` cada vez que se modifica un registro.

## Tablas afectadas

- usuarios
- productos
- carritos
- pedidos

## Beneficios

- Mantiene un registro fiable de la última modificación.
- Evita olvidos por parte del desarrollador.
- Facilita auditorías y seguimiento de cambios.

---

# Trigger: Historial automático de estados de pedido

## Nombre

trg_historial_estado_pedido

## Función asociada

registrar_cambio_estado_pedido()

## Propósito

Registrar automáticamente todos los cambios de estado que experimenta un pedido.

## Tabla origen

pedidos

## Tabla destino

historial_estados_pedido

## Ejemplo

Estado anterior:

pendiente

Estado nuevo:

pagado

Resultado:

Se crea automáticamente un registro en la tabla historial_estados_pedido.

## Beneficios

- Mantiene trazabilidad completa del ciclo de vida del pedido.
- Facilita la atención al cliente.
- Permite generar estadísticas logísticas.

---

# Trigger: Registro automático de movimientos de stock

## Nombre

trg_movimiento_stock

## Función asociada

registrar_movimiento_stock()

## Propósito

Registrar automáticamente entradas y salidas de stock cuando se modifica la cantidad disponible de una variante.

## Tabla origen

stock

## Tabla destino

movimientos_stock

## Ejemplo

Stock anterior:

50

Stock nuevo:

45

Resultado:

Se registra automáticamente un movimiento de salida de 5 unidades.

## Beneficios

- Mantiene un histórico completo del inventario.
- Facilita auditorías.
- Permite analizar movimientos de mercancía.

---

# Trigger: Validación de stock negativo

## Nombre

trg_validar_stock

## Función asociada

validar_stock()

## Propósito

Impedir que el sistema almacene cantidades negativas de stock.

## Tabla afectada

stock

## Regla de negocio aplicada

No se puede vender un producto sin stock disponible.

## Beneficios

- Protege la integridad del inventario.
- Evita errores operativos.
- Refuerza las restricciones CHECK existentes.

---

# Trigger: Reposición automática por devolución

## Nombre

trg_reponer_stock_devolucion

## Función asociada

reponer_stock_devolucion()

## Propósito

Incrementar automáticamente el stock cuando una devolución es recibida correctamente.

## Tabla origen

devoluciones

## Tabla modificada

stock

## Condición de ejecución

Cuando el estado de la devolución cambia a:

recibida

## Beneficios

- Automatiza la gestión de inventario.
- Evita errores manuales.
- Mantiene el stock actualizado en tiempo real.

---

# Trigger: Registro del estado inicial del pedido

## Nombre

trg_estado_inicial_pedido

## Función asociada

registrar_estado_inicial_pedido()

## Propósito

Registrar automáticamente el primer estado de un pedido en el historial.

## Tabla origen

pedidos

## Tabla destino

historial_estados_pedido

## Ejemplo

Al crear un pedido:

Estado inicial:

pendiente

Resultado:

Se crea automáticamente el primer registro en el historial.

## Beneficios

- Garantiza que todos los pedidos tienen historial.
- Mantiene coherencia en la trazabilidad.
- Facilita el seguimiento completo desde la creación del pedido.

---

# Justificación general

Los triggers implementados permiten automatizar procesos esenciales del negocio relacionados con pedidos, inventario y devoluciones.

Su utilización reduce errores humanos, mejora la consistencia de los datos y proporciona mecanismos de auditoría fundamentales para una plataforma de comercio electrónico.

Además, varios de estos triggers responden directamente a requisitos y reglas de negocio definidos en el enunciado del proyecto, especialmente en los apartados de control de stock, histórico de estados y gestión de devoluciones.