--  Funciones

-- 1. Calcular el total de ventas por cliente.



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

-- 4. Determinar si un cultivo es rentable.

-- 5. Obtener el estado promedio de los animales.

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


-- 7. Obtener el número de empleados por función.

-- 8. Calcular el total de productos vendidos por un empleado específico.

-- 9. Obtener el promedio de peso de los animales en un hábitat.

-- 10. Calcular el total de insumos necesarios para un cultivo específico.

-- 11. Obtener el valor total de ventas en un rango de fechas.

-- 12. Calcular el tiempo promedio de entrega de las ventas.

-- 13. Calcular la cantidad de horas trabajadas por un empleado.

-- 14. Obtener el total de órdenes realizadas a un proveedor específico.

-- 15. Obtener el total de capacitaciones realizadas en un año.

-- 16. Calcular el área total de los terrenos ocupados.

-- 17. Calcular el porcentaje de clientes que compraron productos en estado excelente.