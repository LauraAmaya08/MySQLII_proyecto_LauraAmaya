-- Procedimientos Almacenados

-- 1. 

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

-- 6. Agregar un nuevo insumo.

DELIMITER //
CREATE PROCEDURE agregar_insumo (IN nombre_E VARCHAR(200), IN descripcion_E  TEXT, IN stock_E  INT , IN Precio_unitario_E  DECIMAL(10,2), IN stock_minimo_E INT)
BEGIN
    INSERT INTO insumos (nombre, descripcion, stock, Precio_unitario, stock_minimo) VALUES
    (nombre_E, descripcion_E, stock_E, Precio_unitario_E, stock_minimo_E );
END//
DELIMITER ;

-- 7. Modificar el estado del pedido de un cliente.

DELIMITER //
CREATE PROCEDURE modificar_estado(IN id_e INT, IN nuevo_estado VARCHAR(50))
BEGIN
    UPDATE cliente_venta
    SET estado = nuevo_estado
    WHERE id = id_e;
END//
DELIMITER ;

-- 8. Buscar entregas por estado.

DELIMITER //
CREATE PROCEDURE estado_entregas(IN estadoBuscar VARCHAR(50))
BEGIN
    SELECT * FROM cliente_venta cv
    where cv.estado = estadoBuscar;
END//
DELIMITER ;

-- 9. Eliminar relaciones de una tecnología.

DELIMITER //
CREATE PROCEDURE borrar_relaciones_tecnologias(IN IDtecnologia INT)
BEGIN
    DELETE FROM tecnologias_terreno tt WHERE tt.id_tecnologia = IDtecnologia;
    DELETE FROM habitats_tecnologias ht WHERE ht.id_tecnologia = IDtecnologia;
    DELETE FROM mantenimiento_tecnologia mt WHERE mt.id_tecnologia = IDtecnologia;
END//
DELIMITER ;


-- 10. Obtener las funciones de un empleado.
DELIMITER //
CREATE PROCEDURE listar_capacitaciones_empleado(IN IDempleado INT)
BEGIN
    SELECT *
    FROM empleado_capacitaciones ec
    JOIN capacitaciones c ON c.id_capacitacion = ec.id_capacitacion
    WHERE ec.id_empleado = IDempleado;
END//
DELIMITER ;

-- 11. Obtener el estado de un producto específico.
DELIMITER //
CREATE PROCEDURE estado_producto(IN IDproducto INT, OUT estado_e VARCHAR(50))
BEGIN
    SELECT estado INTO estado_e
    FROM producto
    WHERE id_producto = IDproducto;
END//
DELIMITER ;


-- 12. Obtener total de ventas por un producto.
DELIMITER //
CREATE PROCEDURE total_ventas_producto(IN IDproducto INT, OUT total_ventas INT)
BEGIN
    SELECT SUM(pv.cantidad) INTO total_ventas
    FROM productos_venta pv
    WHERE pv.id_producto = IDproducto;
END//
DELIMITER ;


-- 13. Listar los mantenimientos de una tecnología.
DELIMITER //
CREATE PROCEDURE historial_mantenimiento(IN IDtecnologia INT)
BEGIN
    SELECT * FROM mantenimiento_tecnologia WHERE id_tecnologia = IDtecnologia;
END//
DELIMITER ;

-- 14. Obtener la cantidad de empleados que desempeñan una función.

DELIMITER //
CREATE PROCEDURE cantidad_empleados_funcion(IN IDfuncion INT, OUT cantidad INT)
BEGIN
    SELECT COUNT(id_empleado) INTO cantidad FROM empleado_funciones WHERE id_funcion = IDfuncion;
END//
DELIMITER ;

-- 15. Actualizar el precio de un producto.

DELIMITER //
CREATE PROCEDURE actualizar_precio_producto(IN IDproducto INT, IN nuevo_precio DECIMAL(10,2))
BEGIN
    UPDATE producto 
    SET precio_unitario = nuevo_precio 
    WHERE id_producto = IDproducto;
END//
DELIMITER ;

-- 16. Listar animales por habitat.

DELIMITER //
CREATE PROCEDURE listar_animales_habitat(IN IDhabitat INT)
BEGIN
    SELECT * FROM animales_habitat WHERE id_habitat = IDhabitat;
END//
DELIMITER ;


-- 17. Registrar un animal y devolver su ID.

DELIMITER //
CREATE PROCEDURE registrar_animal_y_devolver_id(IN id_especie_E INT, IN peso_E DECIMAL(10,2),IN altura_E DECIMAL(10,2), IN valor_unitario_E DECIMAL(10,2), IN estado_E VARCHAR(50), OUT nuevo_id INT) 
BEGIN
    INSERT INTO animal (id_especie, peso, altura, valor_unitario, estado)
    VALUES (id_especie_E, peso_E, altura_E, valor_unitario_E, estado_E);
    SET nuevo_id = LAST_INSERT_ID();
END//
DELIMITER ;


--  18. Registrar un nuevo animal con su habitat.

DELIMITER //
CREATE PROCEDURE registrar_animal_habitat(IN id_especie_E INT, IN id_habitat_E INT, IN peso_E DECIMAL(10,2), IN altura_E DECIMAL(10,2), IN valor_unitario_E DECIMAL(10,2), IN estado_E VARCHAR(50), IN fecha_E DATE)
BEGIN
    DECLARE nuevo_id INT;
    INSERT INTO animal (id_especie, peso, altura, valor_unitario, estado)
    VALUES (id_especie_E, peso_E, altura_E, valor_unitario_E, estado_E);
    SET nuevo_id = LAST_INSERT_ID();
    INSERT INTO animales_habitat (id_animal, id_habitat, fecha)
    VALUES (nuevo_id, id_habitat_E, fecha_E);
END//
DELIMITER ;


--  19. Eliminar un insumo de todos los registros.

DELIMITER //
CREATE PROCEDURE eliminar_insumo(IN IDinsumo INT)
BEGIN
    DELETE FROM insumos_orden WHERE id_insumo = IDinsumo;
    DELETE FROM insumos_producto WHERE id_insumo = IDinsumo;
    DELETE FROM insumos WHERE id_insumo = IDinsumo;
END//
DELIMITER ;


--  20. Obtener los insumos que provienen de un proveedor.

DELIMITER //
CREATE PROCEDURE insumos_por_proveedor(IN IDproveedor INT)
BEGIN
    SELECT i.*
    FROM insumos i
    JOIN insumos_orden io ON i.id_insumo = io.id_insumo
    JOIN orden o ON o.id_orden = io.id_orden
    JOIN proveedor prod ON o.id_proveedor = prod.id_proveedor
    WHERE prod.id_proveedor = IDproveedor;
END//
DELIMITER ;