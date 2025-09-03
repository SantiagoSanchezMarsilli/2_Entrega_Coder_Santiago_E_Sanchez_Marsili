--- Tablas

--- Tablas Principales

--- Clientes

CREATE TABLE clientes (
    ID_Cliente INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(45) NOT NULL,
    Apellido VARCHAR(45) NOT NULL,
    Direccion VARCHAR(45),
    Telefono VARCHAR(45),
    Email VARCHAR(45) NOT NULL,
    Documento VARCHAR(45) NOT NULL,
    PRIMARY KEY (ID_Cliente),
    UNIQUE KEY Documento_UNIQUE (Documento)
);

--- Proveedores

CREATE TABLE proveedores (
    ID_Proveedor INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(45) NOT NULL,
    Direccion VARCHAR(45) NOT NULL,
    Telefono VARCHAR(45) NOT NULL,
    Email VARCHAR(45),
    PRIMARY KEY (ID_Proveedor)
);

--- Medios de pago

CREATE TABLE medios_de_pago (
    ID_Medio INT NOT NULL,
    Medio_de_Pago VARCHAR(45) NOT NULL,
    Tipo_Pago VARCHAR(10),
    Permite_Cuotas TINYINT(1) DEFAULT 0,
    PRIMARY KEY (ID_Medio)
);

--- Productos

CREATE TABLE productos (
    ID_Producto INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(45),
    Descripcion TEXT,
    Precio DECIMAL(10,0),
    ID_Proveedor INT NOT NULL,
    Stock INT,
    PRIMARY KEY (ID_Producto)
);

--- Tablas de operaciones

--- Compras

CREATE TABLE compras (
    ID_Compras INT NOT NULL AUTO_INCREMENT,
    ID_Proveedor INT NOT NULL,
    Fecha DATE NOT NULL,
    Total DECIMAL(10,0) NOT NULL,
    Comprador INT UNSIGNED,
    PRIMARY KEY (ID_Compras),
    FOREIGN KEY (ID_Proveedor) REFERENCES proveedores(ID_Proveedor),
    FOREIGN KEY (Comprador) REFERENCES empleados(Legajo)
);

--- Ventas

CREATE TABLE ventas (
    ID_Ventas INT NOT NULL AUTO_INCREMENT,
    ID_Cliente INT NOT NULL,
    Fecha DATE NOT NULL,
    Total DECIMAL(10,0) NOT NULL,
    Medio_de_pago INT NOT NULL,
    Vendedor INT UNSIGNED,
    PRIMARY KEY (ID_Ventas),
    FOREIGN KEY (ID_Cliente) REFERENCES clientes(ID_Cliente) ON UPDATE CASCADE,
    FOREIGN KEY (Medio_de_pago) REFERENCES medios_de_pago(ID_Medio),
    FOREIGN KEY (Vendedor) REFERENCES empleados(Legajo)
);

--- Tablas intermedias

--- compras_productos

CREATE TABLE compras_productos (
    ID_Compras INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10,0) NOT NULL,
    FOREIGN KEY (ID_Compras) REFERENCES compras(ID_Compras),
    FOREIGN KEY (ID_Producto) REFERENCES productos(ID_Producto)
);

--- ventas productos

CREATE TABLE ventas_productos (
    ID_Ventas INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10,0) NOT NULL,
    FOREIGN KEY (ID_Ventas) REFERENCES ventas(ID_Ventas),
    FOREIGN KEY (ID_Producto) REFERENCES productos(ID_Producto)
);

--- Tablas de cuotas y roles

--- cuotas_pago

CREATE TABLE cuotas_pago (
    ID_Cuota INT NOT NULL AUTO_INCREMENT,
    ID_Medio INT NOT NULL,
    Cantidad_Cuotas INT,
    PRIMARY KEY (ID_Cuota),
    FOREIGN KEY (ID_Medio) REFERENCES medios_de_pago(ID_Medio),
    CHECK (Cantidad_Cuotas IN (1,3,6))
);

--- roles

CREATE TABLE roles (
    ID_Rol INT NOT NULL AUTO_INCREMENT,
    Rol VARCHAR(50) NOT NULL,
    Descripcion TEXT,
    PRIMARY KEY (ID_Rol)
);

--- empleados

CREATE TABLE empleados (
    Legajo INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nombre_completo VARCHAR(100) NOT NULL,
    `DNI/CUIT` VARCHAR(20) NOT NULL,
    Telefono VARCHAR(20),
    Email VARCHAR(100),
    Rol VARCHAR(50),
    ID_Rol INT,
    PRIMARY KEY (Legajo),
    FOREIGN KEY (ID_Rol) REFERENCES roles(ID_Rol)
);

--- Tablas de auditorías

--- auditoria_ventas

CREATE TABLE auditoria_ventas (
    ID_Auditoria INT NOT NULL AUTO_INCREMENT,
    ID_Ventas INT NOT NULL,
    Fecha DATE NOT NULL,
    ID_Cliente INT NOT NULL,
    Vendedor VARCHAR(100) NOT NULL,
    Medio_de_Pago VARCHAR(50) NOT NULL,
    Total DECIMAL(10,2) NOT NULL,
    Timestamp_Auditoria DATETIME DEFAULT CURRENT_TIMESTAMP,
    Origen_Auditoria VARCHAR(50) DEFAULT 'Trigger_Auto',
    PRIMARY KEY (ID_Auditoria),
    FOREIGN KEY (ID_Ventas) REFERENCES ventas(ID_Ventas),
    FOREIGN KEY (ID_Cliente) REFERENCES clientes(ID_Cliente)
);

--- auditoria_cuotas

CREATE TABLE auditoria_cuotas (
    ID_Auditoria INT NOT NULL AUTO_INCREMENT,
    ID_Cuota INT NOT NULL,
    ID_Venta INT NOT NULL,
    Monto_Cuota DECIMAL(10,2) NOT NULL,
    Fecha_Primer_Vencimiento DATE NOT NULL,
    Fecha_Registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ID_Auditoria)
);