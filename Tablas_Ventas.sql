CREATE TABLE VENTAS (

    IDVenta INT IDENTITY(1,1) PRIMARY KEY,
    IDEmpleado INT NOT NULL,
    FechaVenta DATETIME NOT NULL,
    MontoTotal DECIMAL(12,2) NOT NULL,
    MedioPago VARCHAR(30) NOT NULL,

    CONSTRAINT CK_VENTAS_MedioPago
        CHECK (MedioPago IN (
            'Efectivo',

            'Tarjeta Debito',

            'Tarjeta Credito',

            'Transferencia'
        )),

    CONSTRAINT CK_VENTAS_MontoTotal

        CHECK (MontoTotal >= 0)
);

CREATE TABLE DETALLE_VENTAS (
    IDDetalleVenta INT IDENTITY(1,1) PRIMARY KEY,

    IDVenta INT NOT NULL,
    IDProducto INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    Subtotal DECIMAL(10,2) NOT NULL,

    CONSTRAINT CK_DETALLE_VENTAS_Cantidad

        CHECK (Cantidad > 0),

    CONSTRAINT CK_DETALLE_VENTAS_Precio

        CHECK (PrecioUnitario >= 0 AND Subtotal >= 0)
);