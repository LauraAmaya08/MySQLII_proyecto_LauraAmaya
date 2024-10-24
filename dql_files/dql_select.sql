set SQL_SAFE_UPDATES = 0;

--     1. Mostrar todos las funciones que están relacionadas a producción.

		SELECT * 
        FROM funciones 
        WHERE id_categoria = 11;

--     2. Listar todos los clientes que viven en una ciudad específica.

		SELECT nombre, telefono, direccion, email 
        FROM cliente 
        WHERE id_ciudad = 1;

--     3. Mostrar todas las órdenes de compra a proveedores en el último mes.

		SELECT * FROM orden 
        WHERE fecha 
        BETWEEN NOW() - INTERVAL 1 MONTH AND  NOW();

--     4. Listar todos los animales asignados a un hábitat específico.

		SELECT a.*
        FROM animal a 
        JOIN animales_habitat ah 
        WHERE ah.id_animal = a.id_animal 
        AND ah.id_habitat = 1;

--     5. Mostrar todos los productos que vencen este mes.

		SELECT * 
        FROM producto 
        WHERE MONTH(fecha_vencimiento) = MONTH(now()) AND YEAR(fecha_vencimiento) = YEAR(now());

--     6. Listar todas las ventas realizadas en una fecha específica.

		SELECT * FROM venta v 
        WHERE v.fecha = '2024-01-16';

--     7. Mostrar todos los terrenos que están ocupados.

		SELECT * 
        FROM terreno WHERE estado = 'Ocupado';

--     8. Listar todos los proveedores que suministran insumos esenciales.

		SELECT p.* 
        FROM insumos_producto ip 
        JOIN insumos i 
        ON ip.id_insumo = i.id_insumo 
        JOIN insumos_orden io 
        ON i.id_insumo = io.id_insumo 
        JOIN orden o 
        ON io.id_orden = o.id_orden 
        JOIN proveedor p 
        ON o.id_proveedor = p.id_proveedor 
        WHERE ip.es_Escencial = 1;

--     9. Mostrar todas las tecnologías usadas en los cultivos.

		SELECT DISTINCT t.*
        FROM tecnologias t 
        JOIN tecnologias_terreno tt 
        ON t.id_tecnologia = tt.id_tecnologia;

--     10. Listar todas las capacitaciones realizadas en los últimos 4 meses.

		SELECT * 
        FROM capacitaciones 
        WHERE fecha_realizacion > now() - INTERVAL 4 MONTH;

--     11. Listar los cultivos que se deben recoger el mes siguiente 

		SELECT * 
        FROM cultivos_terreno 
        WHERE fecha_recoger 
        BETWEEN NOW() AND  NOW() + INTERVAL 1 MONTH;

--      11. Obtener todas las ventas junto con los productos vendidos.

		SELECT v.*, pv.cantidad, p.nombre, p.descripcion, p.peso 
        FROM venta v 
        JOIN productos_venta pv 
        ON v.id_venta = pv.id_venta 
        JOIN producto p 
        ON pv.id_producto = p.id_producto; 

--      12. Mostrar los animales junto con las especies a las que pertenecen.

		SELECT a.id_animal as ID, peso, altura, valor_unitario as precio, estado, e.nombre as especie 
        FROM animal a 
        JOIN especie e 
        ON e.id_especie = a.id_especie;

--      13. Listar los clientes y sus compras realizadas.

		SELECT c.nombre, c.telefono, c.direccion, c.email, v.fecha as fecha_venta, v.total 
        FROM cliente c 
        JOIN cliente_venta cv 
        ON c.id_cliente = cv.id_cliente 
        JOIN venta v 
        ON cv.id_venta = v.id_venta;

--      14. Obtener las órdenes de compra junto con los proveedores correspondientes.

		SELECT o.fecha as fecha_orden, o.total, o.estado as estado_orden, p.nombre as nombre_proveedor, p.direccion as direccion_proveedor, p.telefono as telefono_proveedor, p.estado as estado_proveedor 
        FROM orden o 
        JOIN proveedor p 
        ON o.id_proveedor = p.id_proveedor;

--      15. Mostrar los empleados junto con las capacitaciones que han recibido.

		SELECT e.*, c.nombre as nombre_capacitacion, c.fecha_realizacion 
        FROM empleado e 
        JOIN empleado_capacitaciones ec 
        ON e.id_empleado = ec.id_empleado JOIN capacitaciones c ON ec.id_capacitacion = c.id_capacitacion;

--      16. Listar los hábitats con los animales asignados a cada uno. 

		SELECT h.*, ah.fecha, a.id_animal, a.peso, a.valor_unitario, a.altura, a.estado as estado_animal 
        FROM habitat h 
        JOIN animales_habitat ah 
        ON h.id_habitat = ah.id_habitat 
        JOIN animal a 
        ON ah.id_animal = a.id_animal;

--      17. Obtener los cultivos junto con los terrenos donde están plantados.

		SELECT c.nombre as nombre_cultivo, c.estado as estado_cultivo, c.cantidad, ct.fecha_siembra, ct.fecha_recoger, t.capacidad, t.area, t.estado as estado_terreno 
        FROM cultivo c 
        JOIN cultivos_terreno ct 
        ON c.id_cultivo = ct.id_cultivo 
        JOIN terreno t ON ct.id_terreno = t.id_terreno;

--      18. Mostrar las ventas junto con los empleados que las realizaron.

		SELECT v.fecha as fecha_venta, v.total, e.nombre, e.telefono, e.direccion, e.email, e.fecha_contratacion, e.estado as estado_empleado 
        FROM venta v 
        JOIN empleado e 
        ON v.id_empleado = e.id_empleado;

--      19. Obtener las compras junto con los productos y proveedores.

		SELECT v.total as total_venta, v.fecha as fecha_venta, pv.cantidad as cantidad_producto, p.nombre as nombre_producto, p.descripcion as descripcion_producto, p.peso as peso_producto, pr.nombre as nombre_proveedor, pr.telefono as telefono_proveedor, pr.direccion as direccion_proveedor, pr.estado as estado_proveedor 
        FROM venta v 
        JOIN cliente_venta cv 
        ON v.id_venta = cv.id_venta JOIN productos_venta pv ON cv.id_venta = pv.id_venta JOIN producto p ON pv.id_producto = p.id_producto JOIN insumos_producto ip ON p.id_producto = ip.id_producto JOIN insumos i ON ip.id_insumo = i.id_insumo JOIN insumos_orden io ON i.id_insumo = io.id_insumo JOIN orden o ON io.id_orden = o.id_orden JOIN proveedor pr ON o.id_proveedor = pr.id_proveedor;

--      20. Mostrar los productos junto con los insumos utilizados para su producción.

		SELECT p.nombre as nombre_productor, p.descripcion as descripcion_producto, p.peso as peso_producto, i.nombre as nombre_insumo, i.descripcion as descripcion_insumo, i.Precio_unitario as precio_unitario_insumo 
        FROM producto p 
        JOIN insumos_producto ip 
        ON p.id_producto = ip.id_producto 
        JOIN insumos i 
        ON ip.id_insumo = i.id_insumo 
        WHERE ip.es_Escencial = 1;


--      21. Calcular el total de ventas realizadas en el último mes. //Si funciona pero en la base de datos no existen ventas de este mes

		SELECT * 
        FROM venta v
        WHERE v.fecha 
        BETWEEN NOW() - INTERVAL 1 MONTH AND NOW();

--      22. Obtener el promedio de ventas por cliente de todos los clientes.

		SELECT AVG(cantidad_documentos) AS promedio_ventas_cliente
		FROM (
			SELECT cv.id_cliente, COUNT(*) AS cantidad_documentos
			FROM cliente_venta cv
			GROUP BY cv.id_cliente
		) AS subconsulta;

--      23. Mostrar la cantidad de animales por hábitat.

		SELECT h.id_habitat, h.nombre, COUNT(ah.id_animal) AS cantidad_animales 
        FROM animales_habitat ah 
        JOIN habitat h 
        ON ah.id_habitat = h.id_habitat 
        GROUP BY ah.id_habitat;

--      24. Calcular el total de productos vendidos en el último trimestre.

		SELECT SUM(pv.cantidad) as total_productos_vendidos 
        FROM venta v 
        JOIN cliente_venta cv 
        ON v.id_venta = cv.id_venta 
        JOIN productos_venta pv 
        ON cv.id_venta = pv.id_venta 
        WHERE v.fecha BETWEEN NOW() - INTERVAL 3 MONTH AND NOW();

--      25. Mostrar el promedio de precios de productos por categoría.

		SELECT tp.nombre, 
        AVG(p.precio_unitario) AS promedio_precio 
        FROM producto p 
        JOIN tipo_producto tp 
        ON p.id_tipo = tp.id_tipo 
        GROUP BY tp.nombre;

--      26. Calcular la cantidad de animales que han sido tratados por un veterinario.

		SELECT e.id_empleado, e.nombre as nombre_veterinario, COUNT(at.id_animal) as animales_tratados 
        FROM empleado e 
        JOIN animales_tratados at 
        ON e.id_empleado = at.id_empleado 
        GROUP BY e.id_empleado;

--      27. Obtener el total de ingresos por cada cliente.

		SELECT c.nombre as nombre_cliente, COUNT(v.id_venta) AS cantidad_ventas, SUM(v.total) AS total_ventas 
        FROM venta v 
        JOIN cliente_venta cv 
        ON v.id_venta = cv.id_venta 
        JOIN cliente c 
        ON cv.id_cliente = c.id_cliente 
        GROUP BY c.id_cliente;

--      28. Mostrar la cantidad de insumos pedidos del último mes.

		SELECT * 
        FROM orden o 
        JOIN insumos_orden io 
        ON o.id_orden = io.id_orden
        WHERE o.fecha 
        BETWEEN NOW() - INTERVAL 1 MONTH AND NOW();

--      29. Calcular el total de órdenes de compra realizadas a un proveedor específico.

		SELECT o.id_proveedor, p.nombre, COUNT(o.id_proveedor) as total_ordenes 
        FROM orden o 
        JOIN proveedor p 
        ON o.id_proveedor = p.id_proveedor 
        GROUP BY o.id_proveedor;

--      30. Mostrar el promedio de ventas realizadas por empleado.

		SELECT AVG(cantidad_documentos) AS promedio_ventas_empleado
		FROM (
			SELECT v.id_empleado, COUNT(*) AS cantidad_documentos
			FROM venta v
			GROUP BY v.id_empleado
		) AS subconsulta;
        
-- 		31. Listar todos los proveedores que han suministrado productos en al menos 5 órdenes diferentes.

		SELECT p.*, COUNT(o.id_orden) as cantidad_ordenes 
        FROM proveedor p 
        JOIN orden o 
        ON p.id_proveedor = o.id_proveedor 
        GROUP BY p.id_proveedor
        HAVING COUNT(o.id_orden) > 5;

-- 		32. Obtener el nombre de los empleados y la cantidad de capacitaciones que han recibido en el último año.

-- 		33. Obtener todos los animales que han sido tratados más de 3 veces en el último año.

-- 		34. Calcular el total de ingresos generados por las ventas realizadas en el último trimestre.

-- 		35. Obtener el promedio de cantidad de productos vendidos por cada cliente en el último semestre.

-- 		36. Calcular el promedio de valor unitario de los animales asignados a un hábitat específico.

-- 		37. Mostrar la cantidad total de insumos utilizados en cada producto.

-- 		38. Obtener el promedio de horas trabajadas por empleado en la última semana.

-- 		39. Mostrar el empleado con el menor y mayor salario.

-- 		40. Contar cuántos productos hay en cada categoría.


-- 4. Consultas con Subconsultas

--      41. Listar los productos que tienen un precio mayor al promedio de todos los productos.

		SELECT * FROM producto p 
        WHERE p.precio_unitario > (
			SELECT AVG(p.precio_unitario) AS promedio_precio 
            FROM producto p
		);

--      42. Mostrar los empleados que han completado más ventas que el promedio.

		SELECT e.id_empleado, e.nombre, COUNT(*) AS cantidad_ventas
		FROM venta v
        JOIN empleado e ON v.id_empleado = e.id_empleado
		GROUP BY v.id_empleado
		HAVING COUNT(*) > (
			SELECT AVG(cantidad_documentos)
			FROM (
				SELECT COUNT(*) AS cantidad_documentos
				FROM venta
				GROUP BY id_empleado
			) AS subconsulta
		);

--      43. Listar los proveedores que suministran insumos a precios mayores que el promedio.
		
        SELECT p.* FROM proveedor p JOIN orden o ON p.id_proveedor = o.id_proveedor JOIN insumos_orden io ON o.id_orden = io.id_orden JOIN insumos i ON io.id_insumo = i.id_insumo WHERE i.Precio_unitario > (
			SELECT AVG(i.Precio_unitario) 
            FROM insumos i
        ) GROUP BY p.id_proveedor, p.nombre;

--      44. Mostrar los hábitats que albergan más animales que el promedio.

		

--      45. Obtener los clientes que han realizado más compras que el promedio.
		SELECT c.id_cliente, c.nombre, COUNT(*) AS cantidad_compras 
        FROM cliente c
        JOIN cliente_venta cv ON c.id_cliente = cv.id_cliente
        GROUP BY c.id_cliente
        HAVING COUNT(*) > (
			SELECT AVG(cantidad_documentos) AS promedio_ventas_cliente
			FROM (
				SELECT COUNT(*) AS cantidad_documentos
				FROM cliente_venta cv
				GROUP BY cv.id_cliente
			) AS subconsulta
		);
        
--      46. Listar los productos cuyo precio es superior al precio promedio de los productos en la misma categoría.

--      47. Mostrar los proveedores que han suministrado insumos cuyo precio unitario es mayor que el promedio de todos los insumos.

-- 		48. Listar los terrenos cuyo tamaño es mayor que el tamaño promedio de todos los terrenos.

-- 		49. Obtener los empleados que han recibido más capacitaciones que el promedio de todos los empleados.

-- 		50. Mostrar los productos que han sido vendidos más veces que el promedio de todas las ventas.

-- 		51. Listar los hábitats que tienen más animales que el promedio de todos los hábitats.

-- 		52. Obtener el nombre y el total de ventas de los productos cuyo precio es superior al promedio de la categoría.

-- 		53. Mostrar los terrenos que tienen más animales de lo que el promedio en otros terrenos.

--  	54. Mostrar los terrenos donde se han cultivado más tipos de cultivos que el promedio en los demás terrenos.

-- 		55. Obtener el promedio del total de ventas por cliente en el último año, y listar aquellos clientes cuyo total de ventas esté por encima de este promedio.


-- 5. Consultas con Filtros Avanzados

--      56. Mostrar las ventas realizadas entre dos fechas específicas.

		SELECT * 
        FROM venta 
        WHERE fecha 
        BETWEEN '2024-5-12' AND '2025-09-12';

--      57. Listar los productos cuyo precio está entre $10 y $20.

		SELECT * 
        FROM producto 
        WHERE precio_unitario 
        BETWEEN 10 AND 20;

--      58. Mostrar los clientes que no han realizado ninguna compra en el último año. //Si funciona pero en la base de datos no existen compras de hace mas de un año

		SELECT c.id_cliente, c.nombre, MAX(v.fecha) AS ultima_compra 
        FROM cliente c 
        JOIN cliente_venta cv 
        ON c.id_cliente = cv.id_cliente 
        JOIN venta v 
        ON cv.id_venta = v.id_venta 
        GROUP BY c.id_cliente, c.nombre 
        HAVING (
			MAX(v.fecha) IS NULL OR MAX(v.fecha) < NOW() - INTERVAL 1 YEAR
        );
		
--      59. Listar los animales que fueron tratados por veterinarios en los últimos seis meses.

		SELECT a.* 
        FROM animal a 
        JOIN animales_tratados at 
        ON a.id_animal = at.id_animal
        WHERE at.fecha 
        BETWEEN NOW() - INTERVAL 6 MONTH AND NOW();

--      60. Mostrar las órdenes de compra superiores a un monto específico.

		SELECT * 
        FROM orden 
        WHERE total > 200;
        
-- 		61. Mostrar los empleados que trabajan en el departamento de recursos humanos.

-- 		62. Listar todos los terrenos cuyo tamaño es mayor a 500 metros cuadrados.

-- 		63. Mostrar todas las órdenes de compra procesadas en los últimos 3 meses.

-- 		64. Listar todos los animales que pesan más de 50 kg.

-- 		65. Listar todos los clientes que viven en una ciudad cuyo nombre empieza con la letra 'S'.

-- 		66. Mostrar todos los productos que tienen un precio inferior a $5.

-- 		67. Listar los clientes que han realizado compras cuyo total es superior a $500 en el último año.

-- 		68. Mostrar todos los productos que fueron vendidos en las ventas superiores a $1000.

-- 		69. Obtener todos los proveedores cuyos productos hayan sido comprados en más de 5 órdenes en los últimos 2 años.

-- 		70. Listar los empleados que han trabajado más de 200 horas en el último mes.

-- 		71. Mostrar los animales que han recibido tratamientos cuyo costo total es superior a $300.

-- 		72. Obtener los empleados que no han realizado ventas en los últimos 6 meses.

-- 		73. Mostrar los clientes que han comprado productos de al menos 3 categorías diferentes.

-- 		74. Listar los clientes que han realizado compras por un monto total superior a $1,000 en los últimos tres meses.

-- 		75. Listar los empleados que han trabajado más de 8 horas en al menos un día durante la última semana.

-- 6. Consultas de Actualización (UPDATE)

--      76. Actualizar el precio de todos los productos en un 10%.
		UPDATE producto
        SET precio_unitario = precio_unitario + (precio_unitario * 0.10);

--      77. Modificar el estado de todos los cliente nuevos a regulares.
		UPDATE cliente
        SET id_tipo = 1
        WHERE id_tipo = 3;

--      78. Actualizar la cantidad en inventario de un insumo específico después de una compra.

--      79. Modificar los datos de contacto de un proveedor.

--      80. Actualizar el estado de un terreno que ha sido reasignado para nuevos cultivos.

--      81. Modificar el salario de todos los empleados en un 5%.

--      82. Actualizar el estado de una orden de compra después de su entrega.

--      83. Cambiar el hábitat de un animal que ha sido reasignado.

--      84. Actualizar la cantidad de productos en stock después de una venta.

--      85. Modificar el estado de una capacitación completada por un empleado.

--      86. Eliminar los productos que han vencido.

--      87. Borrar los registros de ventas de hace más de dos años.

--      88. Eliminar los animales que han sido dados de baja.

--      89. Borrar los clientes que no han realizado compras en los últimos cinco años.

--      90. Eliminar los proveedores que no han suministrado insumos en más de un año.

--      91. Borrar las órdenes de compra que ya han sido completadas hace más de un año.

--      92. Eliminar los empleados que han dejado la empresa.
		