--CREATE DATABASE MarketControl;
--GO

USE MarketControl;

CREATE TABLE Empleados(
	IDEmpleado	INT IDENTITY(1,1),
	Legajo		VARCHAR(20) NOT NULL,
	Apellidos	VARCHAR(100) NOT NULL,
	Nombres		VARCHAR(100) NOT NULL,
	Cargo		VARCHAR(50) NOT NULL,
	
	--Restricciones
	CONSTRAINT PK_Empleados PRIMARY KEY (IDEmpleado),
	CONSTRAINT UQ_Empleados_Legajo UNIQUE (Legajo),
	CONSTRAINT CK_Empleados_Cargo CHECK (Cargo IN ('Administrador', 'Cajero', 'Repositor'))
);
GO
CREATE TABLE Ordenes_Compra(
	IDOrdenCompra	INT IDENTITY(1,1),
	IDProveedor		INT NOT NULL,
	FechaOrden		DATETIME NOT NULL,
	Estado			VARCHAR(20) NOT NULL,
	MontoTotal		DECIMAL(12,2) NOT NULL,

	--Restricciones
	CONSTRAINT PK_Ordenes_Compra PRIMARY KEY (IDOrdenCompra),
	--CONSTRAINT FK_Proveedores_Ordenes_Compra FOREIGN KEY (IDProveedor) REFERENCES Proveedores (IDProveedores),
	CONSTRAINT CK_Ordenes_Compra_Estado CHECK (Estado IN ('Pendiente', 'Recibido', 'Cancelado')) 
);
GO
CREATE TABLE Detalle_Ordenes_Compra(
	IDDetalleOrden		INT IDENTITY (1,1),
	IDOrdenCompra		INT NOT NULL,
	IDProducto			INT NOT NULL,
	CantidadPedida		INT NOT NULL,
	PrecioCostoUnitario	DECIMAL(10,2) NOT NULL,

	CONSTRAINT PK_Detalle_Ordenes_Compra PRIMARY KEY (IDDetalleOrden),
	CONSTRAINT FK_Ordenes_Compra_Detalle_Ordenes_Compra FOREIGN KEY (IDOrdenCompra) REFERENCES Ordenes_Compra(IDOrdenCompra),
	--CONSTRAINT FK_Productos_Detalle_Ordenes_Compra FOREIGN KEY (IDProducto) REFERENCES Productos(IDProducto)

);