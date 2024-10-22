-- Triggers

-- 1. Registrar compras de insumos. 

DELIMITER //
CREATE TRIGGER registrar_compra_insumo
AFTER INSERT ON insumos_orden
FOR EACH ROW
BEGIN
    INSERT INTO compras (fecha ,total) 
    VALUES (concat('Compra insumo! ID:', new.id_insumo), NOW(), new.cantidad);
    UPDATE insumos 
    SET stock = stock + new.cantidad
    WHERE id_insumo = new.id_insumo;
END//
DELIMITER ;


-- 2. Actualizar stock de productos tras una venta. 

-- 3. Enviar alerta cuando se despide un empleado.

CREATE TRIGGER alerta_despido_empleado
AFTER UPDATE ON empleado
FOR EACH ROW
BEGIN
    IF new.estado = 'Inactivo' THEN
    INSERT INTO alertas (mensaje,fecha) 
    VALUES (concat('Empleado despedido! ID: ', old.id_empleado), NOW());
    END IF;
END//
DELIMITER ;



-- 4. Notificar a un empleado al ser asignado a una nueva función. 

-- 5. Registrar cada vez que se entrega un producto. 

-- 6. Actualizar el historial de capacitaciones al inscribirse un empleado. 

-- 7. Notificar a los empleados sobre cambios de horarios. 

-- 8. Notificar sobre vencimiento de productos. 

-- 9. Actualizar el estado de entrega de una venta.

-- 10. Registrar cada vez que se realiza un mantenimiento. 

-- 11. Notificar a los clientes sobre nuevos productos. 

-- 12. Notificar sobre cambios en los precios de productos. 

-- 13. Actualizar el total de ventas en el registro del empleado. 

-- 14. Eliminar registros de empleados inactivo.

-- 15. Crear un registro de auditoría tras eliminar un empleado. 

-- 16. Notificar cambios en precios a clientes favoritos.