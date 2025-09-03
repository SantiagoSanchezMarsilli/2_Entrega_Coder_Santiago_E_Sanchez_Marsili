--- Stored Procedures

--- Procedimiento registrar_compra

DELIMITER //

CREATE PROCEDURE registrar_compra (
    IN proveedor_id INT,
    IN fecha_compra DATE,
    IN total_compra DECIMAL(10,2),
    IN comprador_id INT
)
BEGIN
    INSERT INTO compras (ID_Proveedor, Fecha, Total, Comprador)
    VALUES (proveedor_id, fecha_compra, total_compra, comprador_id);
END;
//

DELIMITER ;

--- Procedimiento registrar_venta

DELIMITER //

CREATE PROCEDURE registrar_venta (
    IN cliente_id INT,
    IN fecha_venta DATE,
    IN total_venta DECIMAL(10,2),
    IN medio_pago_id INT,
    IN vendedor_id INT
)
BEGIN
    INSERT INTO ventas (ID_Cliente, Fecha, Total, Medio_de_pago, Vendedor)
    VALUES (cliente_id, fecha_venta, total_venta, medio_pago_id, vendedor_id);
END;
//

DELIMITER ;

--- Procedimiento actualizar_stock

DELIMITER //

CREATE PROCEDURE actualizar_stock (
    IN producto_id INT,
    IN cantidad INT
)
BEGIN
    UPDATE productos
    SET Stock = Stock + cantidad
    WHERE ID_Producto = producto_id;
END;
//

DELIMITER ;

--- Procedimiento registrar_cuota

DELIMITER //

CREATE PROCEDURE registrar_cuota (
    IN medio_id INT,
    IN cantidad_cuotas INT
)
BEGIN
    INSERT INTO cuotas_pago (ID_Medio, Cantidad_Cuotas)
    VALUES (medio_id, cantidad_cuotas);
END;
//

DELIMITER ;

--- Procedimiento ObtenerResumenComprasPorEmpleado

DELIMITER //

CREATE PROCEDURE ObtenerResumenComprasPorEmpleado()
BEGIN
    SELECT 
        e.Nombre_Completo AS Nombre_Empleado,
        COUNT(c.Comprador) AS Cantidad_Compras,
        SUM(c.Total) AS Monto_Total,
        AVG(c.Total) AS Promedio_Compra
    FROM compras c
    INNER JOIN empleados e ON c.Comprador = e.Legajo
    GROUP BY e.Nombre_Completo;
END;
//

DELIMITER ;

--- Procedimiento ObtenerResumenVentasPorEmpleado

DELIMITER //

CREATE PROCEDURE ObtenerResumenVentasPorEmpleado()
BEGIN
    SELECT 
        e.Nombre_Completo AS Nombre_Empleado,
        COUNT(v.Vendedor) AS Cantidad_Ventas,
        SUM(v.Total) AS Monto_Total,
        AVG(v.Total) AS Promedio_Venta
    FROM ventas v
    INNER JOIN empleados e ON v.Vendedor = e.Legajo
    GROUP BY e.Nombre_Completo;
END;
//

DELIMITER ;