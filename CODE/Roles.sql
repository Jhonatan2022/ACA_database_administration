CREATE ROLE 'empleado';
-- permisos limitados (solo lectura)
CREATE ROLE 'gerente';
-- permisos completos para gestionar datos

GRANT SELECT ON tendadb.* TO 'empleado';
-- Permite solo lectura de la BD
GRANT SELECT, INSERT , UPDATE, DELETE ON tiendadb.* TO 'gerente';
-- Permite leer, insertar, actualizar y eliminar datos en la BD

-- Creamos el usuario para asignarle los roles
CREATE USER 'usuario1' @'localhost' IDENTIFIED BY 'root';

CREATE USER 'usuario2' @'localhost' IDENTIFIED BY 'root';

-- Asigna el rol 'empleado' al usuario 'usuario1' y el rol 'gerente' al usuario 'usuario2'
GRANT 'empleado' TO 'usuario1' @'localhost';

GRANT 'gerente' TO 'usuario2' @'localhost';

FLUSH PRIVILEGES;
-- Recarga los privilegios para que los cambios tomen efecto

-- Muestra los privilegios asignados al usuario
SHOW GRANTS FOR 'usuario1' @'localhost';

SHOW GRANTS FOR 'usuario2' @'localhost';

-- Asignamos los procesos almacenados a cada usuario
GRANT EXECUTE ON PROCEDURE TiendaDB.NuevaFactura TO 'usuario2'@'localhost';

GRANT
EXECUTE ON PROCEDURE TiendaDB.VentasPorCliente TO 'usuario2' @'localhost';

GRANT
EXECUTE ON PROCEDURE TiendaDB.ConsultarFacturasCliente TO 'usuario2' @'localhost';

-- Procedimiento para empleado
GRANT
EXECUTE ON PROCEDURE TiendaDB.ConsultarFacturasCliente TO 'usuario1' @'localhost';