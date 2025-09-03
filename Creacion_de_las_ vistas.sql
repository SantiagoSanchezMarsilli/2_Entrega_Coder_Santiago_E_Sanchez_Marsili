--- Vistas del sistema

--- vista_compras_detalladas

CREATE VIEW vista_compras_detalladas AS
SELECT
    c.ID_Compras AS ID_Compras,
    c.Fecha AS Fecha,
    pr.Nombre AS Producto,
    cp.Cantidad AS Cantidad,
    cp.Precio_Unitario AS Precio_Unitario,
    prov.Nombre AS Proveedor,
    prov.Email AS Email
FROM compras c
JOIN compras_productos cp ON c.ID_Compras = cp.ID_Compras
JOIN productos pr ON cp.ID_Producto = pr.ID_Producto
JOIN proveedores prov ON c.ID_Proveedor = prov.ID_Proveedor;

--- vista_compras_facturadas

CREATE VIEW vista_compras_facturadas AS
SELECT
    c.ID_Compras AS ID_compras,
    c.Fecha AS Fecha,
    p.Nombre AS Nombre_Proveedor,
    c.Total AS Total_Facturado
FROM compras c
JOIN proveedores p ON c.ID_Proveedor = p.ID_Proveedor;

--- vista_control_inventario 

CREATE VIEW vista_control_inventario AS
SELECT
    p.ID_Producto AS ID_Producto,
    p.Nombre AS Nombre,
    p.Descripcion AS Descripcion,
    p.Stock AS stock_actual,
    IFNULL(SUM(cp.Cantidad), 0) AS total_comprado,
    IFNULL(SUM(vp.Cantidad), 0) AS total_vendido,
    ((p.Stock + IFNULL(SUM(vp.Cantidad), 0)) - IFNULL(SUM(cp.Cantidad), 0)) AS stock_recalculado
FROM productos p
LEFT JOIN compras_productos cp ON p.ID_Producto = cp.ID_Producto
LEFT JOIN ventas_productos vp ON p.ID_Producto = vp.ID_Producto
GROUP BY p.ID_Producto, p.Nombre, p.Descripcion, p.Stock;

--- vista_inventario_por_proveedor

CREATE VIEW vista_inventario_por_proveedor AS
SELECT
    pr.ID_Proveedor AS ID_Proveedor,
    pr.Nombre AS nombre_proveedor,
    p.ID_Producto AS ID_Producto,
    p.Nombre AS nombre_producto,
    p.Descripcion AS Descripcion,
    IFNULL(SUM(cp.Cantidad), 0) AS total_comprado,
    IFNULL(SUM(vp.Cantidad), 0) AS total_vendido,
    p.Stock AS stock_actual,
    ((p.Stock + IFNULL(SUM(vp.Cantidad), 0)) - IFNULL(SUM(cp.Cantidad), 0)) AS stock_recalculado
FROM productos p
LEFT JOIN compras_productos cp ON p.ID_Producto = cp.ID_Producto
LEFT JOIN compras c ON cp.ID_Compras = c.ID_Compras
LEFT JOIN proveedores pr ON c.ID_Proveedor = pr.ID_Proveedor
LEFT JOIN ventas_productos vp ON p.ID_Producto = vp.ID_Producto
GROUP BY pr.ID_Proveedor, pr.Nombre, p.ID_Producto, p.Nombre, p.Descripcion, p.Stock;

--- vista_productos_agrupados

CREATE VIEW vista_productos_agrupados AS
SELECT
    productos.Nombre AS Nombre,
    SUM(productos.Stock) AS stock_total,
    GROUP_CONCAT(DISTINCT productos.Descripcion SEPARATOR '; ') AS descripciones,
    GROUP_CONCAT(DISTINCT productos.Precio SEPARATOR '; ') AS costos
FROM productos
GROUP BY productos.Nombre;

--- vista_ventas_detalladas

CREATE VIEW vista_ventas_detalladas AS
SELECT
    v.ID_Ventas AS ID_Ventas,
    v.Fecha AS Fecha,
    p.Nombre AS Producto,
    vp.Cantidad AS Cantidad,
    vp.Precio_Unitario AS Precio_Unitario,
    mp.Medio_de_Pago AS Medio_de_Pago,
    c.Nombre AS Cliente,
    c.Apellido AS Apellido_Cliente
FROM ventas v
JOIN ventas_productos vp ON v.ID_Ventas = vp.ID_Ventas
JOIN productos p ON vp.ID_Producto = p.ID_Producto
JOIN medios_de_pago mp ON v.Medio_de_pago = mp.ID_Medio
JOIN clientes c ON v.ID_Cliente = c.ID_Cliente;