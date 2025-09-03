--- Funciones del sistema

--- calcular_total_compra

CREATE FUNCTION calcular_total_compra(id_compra INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(Cantidad * Precio_Unitario)
    INTO total
    FROM compras_productos
    WHERE ID_Compras = id_compra;
    RETURN total;
END;

--- calcular_total_venta

CREATE FUNCTION calcular_total_venta(id_venta INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(Cantidad * Precio_Unitario)
    INTO total
    FROM ventas_productos
    WHERE ID_Ventas = id_venta;
    RETURN total;
END;

--- stock_actual_producto

CREATE FUNCTION stock_actual_producto(id_producto INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock_actual INT;
    SELECT Stock
    INTO stock_actual
    FROM productos
    WHERE ID_Producto = id_producto;
    RETURN stock_actual;
END;

--- total_facturado_cliente

CREATE FUNCTION total_facturado_cliente(id_cliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT SUM(Total)
    INTO total
    FROM ventas
    WHERE ID_Cliente = id_cliente;
    RETURN total;
END;