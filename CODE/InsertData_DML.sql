USE TiendaDB;

-- INSERTANDO CLIENTES 
INSERT INTO Clientes (ID_Cliente, Nombre, Direccion, Telefono) VALUES
(1, 'Carlos Martínez', 'Calle 12 #34-56', '3101234567'),
(2, 'Ana Torres', 'Carrera 7 #89-12', '3202345678'),
(3, 'Luis Pérez', 'Av. Siempre Viva 742', '3003456789'),
(4, 'María Gómez', 'Transversal 23 #45-67', '3114567890'),
(5, 'Jorge Ramírez', 'Calle 45 #56-78', '3125678901'),
(6, 'Laura Acosta', 'Carrera 10 #11-22', '3136789012'),
(7, 'Camilo Suárez', 'Diagonal 22 #33-44', '3147890123'),
(8, 'Diana Herrera', 'Calle 80 #99-00', '3158901234');

-- INSERTANDO CATEGORÍAS
INSERT INTO Categorias (ID_Categoria, Descripcion) VALUES
(1, 'Electrónica'),
(2, 'Ropa'),
(3, 'Alimentos'),
(4, 'Juguetes'),
(5, 'Hogar'),
(6, 'Herramientas'),
(7, 'Libros'),
(8, 'Oficina');

-- INSERTANDO PROVEEDORES
INSERT INTO Proveedores (ID_Proveedor, Nombre, Direccion, Telefono) VALUES
(1, 'Electroventas S.A.', 'Zona Industrial #45', '3209988777'),
(2, 'Moda Total', 'Cra 15 #12-34', '3102233445'),
(3, 'Distribuidora Alimex', 'Av. Central #67', '3113344556'),
(4, 'Juguetilandia', 'Calle 13 #21-09', '3124455667'),
(5, 'Casa Hogar', 'Cra 18 #45-67', '3135566778'),
(6, 'Ferretería Pro', 'Cl 78 #10-20', '3146677889'),
(7, 'Lecturas S.A.', 'Cra 9 #9-99', '3157788990'),
(8, 'OfiExpress', 'Zona Centro #22', '3168899001');

-- INSERTANDO PRODUCTOS
INSERT INTO Productos (ID_Producto, Descripcion, Precio, ID_Categoria, ID_Proveedor) VALUES
(1, 'Televisor 50"', 1999000, 1, 1),
(2, 'Camiseta Deportiva', 45000, 2, 2),
(3, 'Caja de cereal', 12900, 3, 3),
(4, 'Muñeca de colección', 85000, 4, 4),
(5, 'Silla ergonómica', 299000, 5, 5),
(6, 'Taladro eléctrico', 189000, 6, 6),
(7, 'Libro de ciencia ficción', 35000, 7, 7),
(8, 'Grapadora metálica', 15900, 8, 8);

-- INSERTANDO FACTURAS
INSERT INTO Facturas (ID_Factura, Fecha, ID_Cliente) VALUES
(1, '2025-04-10', 1),
(2, '2025-04-11', 2),
(3, '2025-04-12', 3),
(4, '2025-04-13', 4),
(5, '2025-04-14', 5),
(6, '2025-04-15', 6),
(7, '2025-04-16', 7),
(8, '2025-04-17', 8);

-- INSERTANDO VENTAS
INSERT INTO Ventas (ID_Venta, ID_Factura, ID_Producto, Cantidad) VALUES
(1, 1, 1, 1),
(2, 2, 2, 3),
(3, 3, 3, 5),
(4, 4, 4, 2),
(5, 5, 5, 1),
(6, 6, 6, 1),
(7, 7, 7, 4),
(8, 8, 8, 2);
