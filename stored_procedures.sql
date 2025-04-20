-- PROCEDIMIENTO 1: Obtener ventas por cliente
USE TiendaDB;
DELIMITER $$
CREATE PROCEDURE VentasPorCliente(IN p_ID_Cliente INT)
BEGIN
    SELECT 
        a.ID_Factura,
        a.Fecha,
        c.Descripcion AS Producto,
        d.Cantidad
    FROM Facturas a
    JOIN Ventas d ON a.ID_Factura = d.ID_Factura
    JOIN Productos c ON d.ID_Producto = c.ID_Producto
    WHERE a.ID_Cliente = p_ID_Cliente;
END$$
DELIMITER ;


-- PROCEDIMIENTO 2: Insertar nueva factura con ID manual
USE tiendaDB;
DELIMITER $$
CREATE PROCEDURE NuevaFactura(
    IN p_ID_Factura INT,
    IN p_Fecha DATE,
    IN p_ID_Cliente INT
)
BEGIN
    INSERT INTO Facturas (ID_Factura, Fecha, ID_Cliente)
    VALUES (p_ID_Factura, p_Fecha, p_ID_Cliente);
END$$
DELIMITER ;

-- PROCEDIMIENTO 3: Consultar facturas de un cliente este procedimiento se crea para el usuario empleado
DELIMITER $$
CREATE PROCEDURE ConsultarFacturasCliente(IN cliente_id INT)
BEGIN
    -- Consulta con alias alfabéticos
    SELECT 
        a.ID_Factura,
        a.Fecha,                  
        b.Nombre AS Cliente,
        c.Descripcion AS Producto,
        d.Cantidad
    FROM Facturas a
    JOIN Clientes b ON a.ID_Cliente = b.ID_Cliente
    JOIN Ventas d ON a.ID_Factura = d.ID_Factura
    JOIN Productos c ON d.ID_Producto = c.ID_Producto
    WHERE a.ID_Cliente = cliente_id;
END$$
DELIMITER ;

