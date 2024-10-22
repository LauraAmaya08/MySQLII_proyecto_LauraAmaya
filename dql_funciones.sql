--  Funciones

-- 1. Calcular el total de ventas por cliente.

DELIMITER //
CREATE FUNCTION total_venta(ID_Cliente_e INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE cantidad INT DEFAULT 0;
SELECT  count(id_venta) INTO cantidad FROM cliente_venta cv
WHERE id_cliente = ID_Cliente_e;
RETURN cantidad;
END//
DELIMITER ;

-- 2. Obtener el promedio de stock de insumos.

DELIMITER //
CREATE FUNCTION promedio_insumos()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE promedio_stock DECIMAL(10,2)  DEFAULT 0;
SELECT avg(stock) FROM insumos INTO promedio_stock;
RETURN promedio_stock;
END//
DELIMITER ;


-- 3. Calcular el descuento aplicado a una compra.

DELIMITER //
CREATE FUNCTION descuento_total(tipo_cliente_id INT, precio DECIMAL (10,2))
RETURNS DECIMAL (10,2)
DETERMINISTIC
BEGIN
DECLARE descuento_total DECIMAL (10,2) DEFAULT 0;
SELECT descuento INTO descuento_total FROM tipo_cliente
WHERE id_tipo = tipo_cliente_id;
RETURN precio - descuento_total;
END//
DELIMITER ;

-- 4. Determinar si un cultivo es rentable.



-- 5. Obtener el estado promedio de los animales.

DELIMITER //
CREATE FUNCTION estado_promedio_animales()
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE exc_count INT DEFAULT 0;
    DECLARE reg_count INT DEFAULT 0;
    DECLARE mal_count INT DEFAULT 0;
    DECLARE estado_promedio VARCHAR(10);
	SELECT 
        COUNT(CASE WHEN estado = 'Excelente' THEN 1 END),
        COUNT(CASE WHEN estado = 'Regular' THEN 1 END),
        COUNT(CASE WHEN estado = 'Malo' THEN 1 END)
	INTO exc_count, reg_count, mal_count
    FROM animal;
    IF exc_count >= reg_count AND exc_count >= mal_count THEN
        SET estado_promedio = 'Excelente';
    ELSEIF reg_count >= exc_count AND reg_count >= mal_count THEN
        SET estado_promedio = 'Regular';
    ELSE
        SET estado_promedio = 'Malo';
    END IF;
    RETURN estado_promedio;
END//
DELIMITER ;

-- 6. Calcular el costo total de mantenimiento de tecnologías.

DELIMITER //
CREATE FUNCTION total_mantenimiento()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE cantidad DECIMAL(10,2) DEFAULT 0;
SELECT sum(total) INTO cantidad FROM mantenimiento;
RETURN cantidad;
END//
DELIMITER ;


-- 7. Obtener el número de empleados por una función.

DELIMITER //
CREATE FUNCTION total_empleados(ID_Entregada INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE cantidad INT DEFAULT 0;
SELECT  count(id_empleado) INTO cantidad FROM empleado_funciones
WHERE id_funcion = ID_Entregada;
RETURN cantidad;
END//
DELIMITER ;

-- 8. Calcular el total de productos vendidos por un empleado específico.


-- 9. Obtener el promedio de peso de los animales en un hábitat.



-- 10. Calcular el total de insumos necesarios para un cultivo específico.

-- 11. Obtener el total de ventas en un rango de fechas.

DELIMITER //
CREATE FUNCTION ventas_segun_fecha(fecha_inicio DATE, fecha_fin DATE)
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE contador INT DEFAULT 0;
    SELECT count(v.id_venta) INTO contador FROM venta v WHERE fecha BETWEEN fecha_inicio AND fecha_fin;
    RETURN contador;
END//
DELIMITER ;


-- 12. Calcular el tiempo promedio de entrega de las ventas.


-- 13. Calcular la cantidad de horas diarias de trabajo de un empleado.

DELIMITER //
CREATE FUNCTION horas_trabajadas(id_empleado_e INT)
RETURNS DECIMAL(10,2) 
DETERMINISTIC
BEGIN
    DECLARE total_horas DECIMAL(10,2) DEFAULT 0;
    DECLARE dias INT DEFAULT 0;
    DECLARE total_horas_diarias DECIMAL(10,2) DEFAULT 0;
    SELECT SUM(TIMESTAMPDIFF( HOUR, h.hora_inicio, h.hora_fin))
    INTO total_horas_diarias
    FROM empleado_horarios ef JOIN horarios h ON ef.id_horario = h.id_horario
    WHERE ef.id_empleado = id_empleado_e;
    SET total_horas = total_horas_diarias; 
    RETURN total_horas;
END//
DELIMITER ;


-- 14. Obtener el total de órdenes realizadas a un proveedor específico.

DELIMITER //
CREATE FUNCTION ordenes_proveedor_especifico(id_proveedor_e INT)
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE contador INT DEFAULT 0;
    SELECT count(o.id_orden) INTO contador FROM orden o WHERE o.id_proveedor = id_proveedor_e;
    RETURN contador;
END//
DELIMITER ;

-- 15. Obtener el total de capacitaciones realizadas en un año.

DELIMITER //
CREATE FUNCTION capacitaciones_año(anio INT)
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE contador INT DEFAULT 0;
    SELECT count(c.id_capacitacion) INTO contador FROM capacitaciones c WHERE YEAR(c.fecha_realizacion) = anio;
    RETURN contador;
END//
DELIMITER;

-- 16. Calcular el área total de los terrenos ocupados.

DELIMITER //
CREATE FUNCTION area_total()
RETURNS DECIMAL(10,2) 
DETERMINISTIC
BEGIN
    DECLARE contador DECIMAL(10,2) DEFAULT 0;
    SELECT sum(t.area) INTO contador FROM terreno t WHERE t.estado = 'Ocupado';
    RETURN contador;
END//
DELIMITER ;


-- 17. Calcular el porcentaje de clientes que compraron productos en estado excelente.

