-- Esta tabla llevara el registro de las facturas creadas
CREATE TABLE LogFacturas (
    ID_Log INT PRIMARY KEY AUTO_INCREMENT,
    ID_Factura INT,
    FechaCreacion DATETIME
);

-- Este trigger se ejecuta  desues de insertar una factura y la inserta en la tabla Log
DELIMITER $$

CREATE TRIGGER InsertFactura
AFTER INSERT ON Facturas
FOR EACH ROW
BEGIN
    INSERT INTO LogFacturas (ID_Factura, FechaCreacion)
    VALUES (NEW.ID_Factura, NOW());
END$$

DELIMITER;

-- Trigger para evitar la eliminación de un producto con ventas registradas
DELIMITER $$

CREATE TRIGGER DeleteProducto
BEFORE DELETE ON Productos
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Ventas WHERE ID_Producto = OLD.ID_Producto
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No puedes eliminar un producto que tiene ventas registradas.';
    END IF;
END$$

DELIMITER;