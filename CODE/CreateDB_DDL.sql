--Creamos la base de datos
CREATE DATABASE IF NOT EXISTS TiendaDB;

--Usamos la base de datos (Activamos la base de datos)
USE TiendaDB;

--Creamos la tablas
-- ON DELETE CASCADE para relaciones directas y dependientes como Cliente → Factura → Venta.
--ON DELETE SET NULL para relaciones que no deberían eliminarse fácilmente, como Producto → Proveedor (mantener el producto con un nuevo proveedor).
-- CLIENTES
CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Telefono VARCHAR(15)
);

-- FACTURAS
CREATE TABLE Facturas (
    ID_Factura INT PRIMARY KEY,
    Fecha DATE,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes (ID_Cliente) ON DELETE CASCADE
);

-- CATEGORIAS 
CREATE TABLE Categorias (
    ID_Categoria INT PRIMARY KEY,
    Descripcion VARCHAR(100)
);

-- PROVEEDORES
CREATE TABLE Proveedores (
    ID_Proveedor INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Telefono VARCHAR(15)
);

-- PRODUCTOS
CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY,
    Descripcion VARCHAR(100),
    Precio DECIMAL(10, 2),
    ID_Categoria INT,
    ID_Proveedor INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias (ID_Categoria) ON DELETE SET NULL,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores (ID_Proveedor) ON DELETE SET NULL
);

-- VENTAS
CREATE TABLE Ventas (
    ID_Venta INT PRIMARY KEY,
    ID_Factura INT,
    ID_Producto INT,
    Cantidad INT,
    FOREIGN KEY (ID_Factura) REFERENCES Facturas (ID_Factura) ON DELETE CASCADE,
    FOREIGN KEY (ID_Producto) REFERENCES Productos (ID_Producto) ON DELETE SET NULL
);