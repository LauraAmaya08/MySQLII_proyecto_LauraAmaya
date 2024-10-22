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

DELIMITER //
CREATE TRIGGER actualizar_stock
AFTER INSERT ON productos_venta
FOR EACH ROW
BEGIN
    UPDATE producto 
    SET stock = stock - new.cantidad
    WHERE new.id_producto = producto.id_producto;
END//
DELIMITER ;


-- 3. Enviar alerta cuando se despide un empleado.

DELIMITER //
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

DELIMITER //
CREATE TRIGGER alerta_modificacion_funcion
AFTER UPDATE ON empleado_funciones
FOR EACH ROW
BEGIN
    IF new.id_funcion <> old.id_funcion THEN
    INSERT INTO alertas (mensaje,fecha) 
    VALUES (concat('Funciones de empleado ', old.id_empleado, ' actualizadas! Nueva función: ',new.id_funcion), NOW());
    END IF;
END//
DELIMITER ;

-- 5. Registrar cada vez que se entrega un pedido. 

DELIMITER //
CREATE TRIGGER alerta_entrega_pedido
AFTER UPDATE ON cliente_venta
FOR EACH ROW
BEGIN
    IF new.estado = 'Entregado' THEN
    INSERT INTO alertas(mensaje,fecha) 
    VALUES (concat('Pedido Entregado! ID: ', old.id_venta, ' Cliente: ', old.id_cliente), NOW());
    INSERT INTO entrega_venta (id_venta, fecha, anotacion) VALUES
    (old.id_venta, now(), 'Pedido entregado correctamente');
    END IF;
END//
DELIMITER ;


-- 6. Actualizar el historial de capacitaciones al inscribirse un empleado. 

DELIMITER //
CREATE TRIGGER actualizar_historial
AFTER INSERT ON empleado_capacitaciones
FOR EACH ROW
BEGIN
	INSERT INTO alertas(mensaje,fecha) 
    VALUES (concat('El empleado con ID: ', new.id_empleado, ' ha tomado la capacitación con ID ', new.id_capacitacion), NOW());
END//
DELIMITER ;


-- 7. Notificar a los empleados sobre cambios de horarios. 

DELIMITER //
CREATE TRIGGER alerta_modificacion_horarios
AFTER UPDATE ON horarios
FOR EACH ROW
BEGIN
    IF new.hora_inicio <> old.hora_inicio OR new.hora_fin <> old.hora_fin THEN
    INSERT INTO alertas (mensaje,fecha) 
    VALUES (concat('Atención empleados! si tu horario es ', old.hora_inicio, ' - ' ,old.hora_fin, ' tu horario se actualizó a ', new.hora_inicio, ' - ' ,new.hora_fin), NOW());
    END IF;
END//
DELIMITER ;

-- 8. Notificar sobre vencimiento de productos. 

DELIMITER //
CREATE TRIGGER notificar_vencimiento_productos
BEFORE UPDATE ON producto
FOR EACH ROW
BEGIN
    DECLARE dias_restantes INT;
    SET dias_restantes = DATEDIFF(NEW.fecha_vencimiento, CURDATE());
    IF dias_restantes <= 30 AND dias_restantes >= 0 THEN
    INSERT INTO alertas (mensaje,fecha) 
    VALUES (concat('El producto ', NEW.nombre, ' está a punto de vencer en ', dias_restantes, ' días'), NOW());
    END IF;
END//
DELIMITER ;


-- 9. Actualizar el estado de entrega de una venta.
DELIMITER //
CREATE TRIGGER actualizar_estado_entrega
AFTER UPDATE ON venta_cliente
FOR EACH ROW
BEGIN
    IF OLD.estado <> NEW.estado THEN
        INSERT INTO alertas (mensaje, fecha) 
        VALUES (CONCAT('El estado de la entrega de la venta ', NEW.id_venta, ' ha cambiado a ', NEW.estado), NOW());
    END IF;
END//
DELIMITER ;

-- 10. Registrar cada vez que se realiza un mantenimiento.

DELIMITER //
CREATE TRIGGER registrar_mantenimiento
AFTER INSERT ON mantenimiento_tecnologia
FOR EACH ROW
BEGIN
    INSERT INTO alertas (mensaje, fecha) 
    VALUES (CONCAT('Mantenimiento registrado para la tecnología ', NEW.id_tecnologia), NOW());
END//
DELIMITER ;


-- 11. Notificar a los clientes sobre nuevos productos. 

DELIMITER //
CREATE TRIGGER notificar_nuevos_productos
AFTER INSERT ON producto
FOR EACH ROW
BEGIN
    INSERT INTO alertas (mensaje, fecha) 
    VALUES (CONCAT('Nuevo producto disponible: ', NEW.nombre), NOW());
END//
DELIMITER ;


-- 12. Crear un registro de auditoría tras eliminar una tecnología.

DELIMITER //
CREATE TRIGGER auditoria_eliminar_tecnologia
BEFORE DELETE ON tecnologias
FOR EACH ROW
BEGIN
    INSERT INTO auditoria (mensaje,fecha)
    VALUES (CONCAT('Tecnología eliminada: ', OLD.nombre), NOW());
END//
DELIMITER ;


-- 13. Notificar cambios en precios de mantenimientos.

DELIMITER //
CREATE TRIGGER alerta_mantenimientos
AFTER UPDATE ON mantenimiento
FOR EACH ROW
BEGIN
    IF old.total <> new.total THEN
    INSERT INTO alertas(mensaje,fecha) 
    VALUES (concat('Atención! el nuevo precio de ', old.nombre, ' es: ', new.total), NOW());
    END IF;
END//
DELIMITER ;

