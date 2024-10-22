-- Procedimientos Almacenados

-- 1. Listar funciones de un empleado.

DELIMITER //
CREATE PROCEDURE funciones_empleado(IN IDempleado INT)
BEGIN
    SELECT e.nombre,f.nombre as funcion
    FROM empleado_funciones ef
    JOIN funciones f ON f.id_funcion = ef.id_funcion
    join empleado e ON e.id_empleado = ef.id_empleado
    where e.id_empleado = IDempleado;
END//
DELIMITER ;

-- 2. Actualizar el estado de un producto.

DELIMITER //
CREATE PROCEDURE actualizar_estado_producto (IN IDproducto INT, IN estadoProducto VARCHAR(50))
BEGIN
    UPDATE producto
    SET estado = estadoProducto
    WHERE id_producto = IDproducto;
END//
DELIMITER ;

-- 3. Registrar una capacitación para un empleado.

DELIMITER //
CREATE PROCEDURE registrar_capacitacion (IN IDcapacitacion INT, IN IDempleado INT)
BEGIN
    INSERT INTO empleado_capacitaciones(id_empleado, id_capacitacion)VALUES
    (IDempleado,IDcapacitacion);
END//
DELIMITER ;

-- 4. Desactivar un empleado

DELIMITER //

CREATE PROCEDURE desactivar_empleado (IN IDempleado INT)
BEGIN
    UPDATE empleado
    SET estado = 'Inactivo'
    WHERE id_empleado = IDempleado;
 END //

DELIMITER ;

-- 5. Eliminar mantenimiento

DELIMITER //
CREATE PROCEDURE eliminar_mantenimiento(IN IDmantenimiento INT)
BEGIN
    DELETE FROM mantenimiento_tecnologia WHERE id_mantenimiento = IDmantenimiento;
    DELETE FROM mantenimiento WHERE id_mantenimiento = IDmantenimiento;
END//
DELIMITER ;

-- 6. Actualizar los horarios de un empleado.



-- 7. Registrar un nuevo cliente.



-- 8. Agregar un nuevo insumo.

DELIMITER //
CREATE PROCEDURE agregar_insumo (IN nombre_E VARCHAR(200), IN descripcion_E  TEXT, IN stock_E  INT , IN Precio_unitario_E  DECIMAL(10,2), IN stock_minimo_E INT)
BEGIN
    INSERT INTO insumos (nombre, descripcion, stock, Precio_unitario, stock_minimo) VALUES
    (nombre_E, descripcion_E, stock_E, Precio_unitario_E, stock_minimo_E );
END//
DELIMITER ;

-- 9. Modificar el estado del pedido de un cliente.

DELIMITER //
CREATE PROCEDURE modificar_estado(IN id_e INT, IN nuevo_estado VARCHAR(50))
BEGIN
    UPDATE cliente_venta
    SET estado = nuevo_estado
    WHERE id = id_e;
END//
DELIMITER ;

-- 10. Asignar una tecnología a un terreno.



-- 11. Buscar entregas por estado.

DELIMITER //
CREATE PROCEDURE estado_entregas(IN estadoBuscar VARCHAR(50))
BEGIN
    SELECT * FROM cliente_venta cv
    where cv.estado = estadoBuscar;
END//
DELIMITER ;

-- 12. Registrar un el estado de un animal.

-- 13. Registrar un nuevo habitat.

-- 14. Cambiar la ciudad de un proveedor.

-- 15. Eliminar relaciones de una tecnología.

DELIMITER //
CREATE PROCEDURE borrar_relaciones_tecnologias(IN IDtecnologia INT)
BEGIN
    DELETE FROM tecnologias_terreno tt WHERE tt.id_tecnologia = IDtecnologia;
    DELETE FROM habitats_tecnologias ht WHERE ht.id_tecnologia = IDtecnologia;
    DELETE FROM mantenimiento_tecnologia mt WHERE mt.id_tecnologia = IDtecnologia;
END//
DELIMITER ;

-- 16. Registrar un uso de animal.