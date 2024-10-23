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

-- 3. Calcular el precio promedio de productos.

DELIMITER //
CREATE FUNCTION promedio_precio()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10,2);
    SELECT avg(precio_unitario) INTO promedio
    FROM producto;
    RETURN promedio;
END//
DELIMITER ;

-- 4. Determinar si un cultivo es rentable.

DELIMITER //
CREATE FUNCTION es_cultivo_rentable(id_producto_e INT)
RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
    DECLARE ingresos DECIMAL(10,2) DEFAULT 0;
    DECLARE resultado VARCHAR(15);
    
    SELECT SUM(p.precio_unitario* pv.cantidad)
    INTO ingresos
    FROM productos_venta pv 
    JOIN producto p
    ON p.id_producto = pv.id_producto
    WHERE pv.id_producto = id_producto_e;

    IF ingresos > 1000.00 THEN
        SET resultado = 'Rentable';
    ELSE
        SET resultado = 'No Rentable';
    END IF;

    RETURN resultado;
END//
DELIMITER ;


-- 5. Obtener funciones por categoría especifica.

DELIMITER //
CREATE FUNCTION funciones_categoria(id_categoria_e INT)
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE cantidad INT;
    SELECT count(id_funcion) INTO cantidad
    FROM funciones
    WHERE id_categoria = id_categoria_e;
    RETURN cantidad;
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

DELIMITER //
CREATE FUNCTION total_productos_empleado(id_empleado_e INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_vendidos INT DEFAULT 0;
    SELECT SUM(pv.cantidad)
    INTO total_vendidos
    FROM venta v
    JOIN productos_venta pv ON v.id_venta = pv.id_venta
    WHERE v.id_empleado = id_empleado_e;
    RETURN total_vendidos;
END//
DELIMITER ;


-- 9. Obtener el promedio de peso de los animales en un hábitat.

DELIMITER //
CREATE FUNCTION promedio_peso_habitat(id_habitat_e INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE promedio_peso DECIMAL(10,2)  DEFAULT 0;
SELECT avg(a.peso) INTO promedio_peso FROM animal a JOIN animales_habitat ah on a.id_animal = ah.id_animal
WHERE ah.id_habitat = id_habitat_e;
RETURN promedio_peso;
END//
DELIMITER ;

-- 10. Calcular la cantidad de insumos necesarios para un producto específico.

DELIMITER //
CREATE FUNCTION insumos_total_producto(producto_id_e INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE insumos_total INT  DEFAULT 0;
SELECT count(ip.id_insumo) INTO insumos_total 
FROM insumos_producto ip 
JOIN insumos i on i.id_insumo = ip.id_insumo
JOIN producto p on p.id_producto = ip.id_producto
WHERE ip.id_producto = producto_id_e;
RETURN insumos_total;
END//
DELIMITER ;

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

DELIMITER //
CREATE FUNCTION tiempo_entrega()
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE promedio_entrega DECIMAL(10,2);
    
    SELECT AVG(DATEDIFF(ev.fecha, v.fecha)) INTO promedio_entrega
    FROM venta v JOIN 
    entrega_venta ev
    on v.id_venta = ev.id_venta;
    RETURN concat(promedio_entrega, ' dias');
END//
DELIMITER ;


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

DELIMITER //
CREATE FUNCTION porcentaje_clientes_estado_excelente()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_clientes INT DEFAULT 0;
    DECLARE estado_excelente INT DEFAULT 0;
    DECLARE porcentaje DECIMAL(5,2) DEFAULT 0;


    SELECT COUNT(DISTINCT cv.id_cliente)
    INTO total_clientes
    FROM cliente_venta cv;

    SELECT COUNT(DISTINCT cv.id_cliente)
    INTO estado_excelente
    FROM cliente_venta cv
    JOIN productos_venta pv ON pv.id_venta = cv.id_venta
    JOIN producto p ON p.id_producto = pv.id_producto
    WHERE p.estado = 'Excelente';
	SET porcentaje = (estado_excelente / total_clientes) * 100;
    
    RETURN porcentaje;
END//
DELIMITER ;

-- 18. Calcular promedio de animales por habitat.

DELIMITER //
CREATE FUNCTION animales_habitat(id_habitat_e INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad INT DEFAULT 0;
    SELECT COUNT(a.id_animal) INTO cantidad
    FROM animal a
    JOIN animales_habitat ah ON a.id_animal = ah.id_animal
    WHERE ah.id_habitat = id_habitat_e;

    RETURN cantidad;
END//
DELIMITER ;


-- 19. Calcular el descuento aplicado a una compra.

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


-- 20. Obtener el estado promedio de los animales.

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


