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

--        32. Obtener el nombre de los empleados y la cantidad de capacitaciones que han recibido en el último año.

        SELECT e.id_empleado, e.nombre, e.direccion, COUNT(c.id_capacitacion) AS cantidad_capacitaciones
        FROM empleado e 
        JOIN empleado_capacitaciones ec ON e.id_empleado = ec.id_empleado 
        JOIN capacitaciones c ON ec.id_capacitacion = c.id_capacitacion 
        WHERE c.fecha_realizacion BETWEEN NOW() - INTERVAL 1 YEAR AND NOW() 
        GROUP BY e.id_empleado, e.nombre;

--         33. Obtener todos los animales que han sido tratados más de 3 veces en el último año. //La consulta funciona pero en la base de datos no hay ningun animal que haya sido tratado mas de 3 veces en el ultimo año

        SELECT a.*, COUNT(at.id) AS cantidad_tratamientos 
        FROM animal a 
        JOIN animales_tratados at ON a.id_animal = at.id_animal 
        WHERE at.fecha BETWEEN NOW() - INTERVAL 1 YEAR AND NOW() 
        GROUP BY a.id_animal 
        HAVING COUNT(at.id) > 3;

--         34. Calcular el total de ingresos generados por las ventas realizadas en el último trimestre.

        SELECT SUM(total) as total_ingresos 
        FROM venta 
        WHERE fecha BETWEEN NOW() - INTERVAL 3 MONTH AND NOW();

--         35. Obtener el promedio de cantidad de productos vendidos por cada cliente en el último semestre.

        SELECT c.id_cliente, c.nombre as nombre_cliente, AVG(cantidad_productos) AS promedio_productos_vendidos
        FROM (
            SELECT cv.id_cliente, SUM(pv.cantidad) AS cantidad_productos
            FROM productos_venta pv
            JOIN cliente_venta cv ON pv.id_venta = cv.id_venta
            JOIN venta v ON cv.id_venta = v.id_venta
            WHERE v.fecha BETWEEN NOW() - INTERVAL 6 MONTH AND NOW()
            GROUP BY cv.id_cliente
        ) AS subconsulta
        JOIN cliente c ON subconsulta.id_cliente = c.id_cliente
        GROUP BY c.id_cliente;

--         36. Calcular el promedio de valor unitario de los animales asignados a un hábitat específico.

        SELECT h.nombre as nombre_habitat, AVG(a.valor_unitario) as promedio_valor_unitario 
        FROM animal a 
        JOIN animales_habitat ah ON a.id_animal = ah.id_animal 
        JOIN habitat h ON ah.id_habitat = h.id_habitat 
        WHERE h.nombre = 'Granja de Cabras';

--         37. Mostrar la cantidad total de insumos utilizados en cada producto.

        SELECT p.nombre, COUNT(ip.id_insumo) as cantidad_insumos 
        FROM producto p 
        JOIN insumos_producto ip ON p.id_producto = ip.id_producto 
        GROUP BY p.id_producto;

--         38. Obtener el promedio de horas trabajadas por empleado en la última semana.

        SELECT e.nombre, AVG(TIMEDIFF(h.hora_fin, h.hora_inicio)) AS promedio_horas_trabajadas
        FROM empleado e
        JOIN empleado_horarios he ON e.id_empleado = he.id_empleado
        JOIN horarios h ON h.id_horario = h.id_horario
        WHERE NOW() - INTERVAL 1 WEEK AND NOW()
        GROUP BY e.nombre;

-- 		39. Mostrar la cantidad de empleados con el salario menor al promedio.
		
        SELECT count(id_empleado)
        FROM empleado e
		WHERE e.salario > (SELECT AVG(e.salario) FROM empleado e)
        ;

-- 		40. Contar cuántos productos hay en cada categoría.

        SELECT tp.nombre, count(id_producto) as Cantidad
        FROM producto p 
        JOIN tipo_producto tp on tp.id_tipo = p.id_tipo 
        GROUP BY tp.nombre;

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

		SELECT h.*
        FROM habitat h
        JOIN animales_habitat ah ON ah.id_habitat = h.id_habitat
        GROUP BY h.id_habitat
        HAVING COUNT(ah.id_animal) > (SELECT AVG(animales)
                               FROM (SELECT COUNT(id_animal) AS animales
                                     FROM animales_habitat
                                     GROUP BY id_habitat) as subconsulta);

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

		SELECT p.nombre, p.precio_unitario
		FROM producto p
		WHERE p.precio_unitario > (
			SELECT AVG(p2.precio_unitario)
			FROM producto p2
			WHERE p2.id_tipo = p.id_tipo
		);

--      47. Mostrar los proveedores que han suministrado insumos cuyo precio unitario es mayor que el promedio de todos los insumos.

		SELECT p.nombre, i.Precio_unitario
		FROM proveedor p
        JOIN orden o ON p.id_proveedor = o.id_proveedor
		JOIN insumos_orden io ON o.id_orden = io.id_orden
		JOIN insumos i ON io.id_insumo = i.id_insumo
		WHERE i.Precio_unitario > (
			SELECT AVG(i2.Precio_unitario)
			FROM insumos i2
		);

-- 		48. Listar los terrenos cuyo tamaño es mayor que el tamaño promedio de todos los terrenos.

		SELECT t.id_terreno, t.area
		FROM terreno t
		WHERE t.area > (
			SELECT AVG(t2.area)
			FROM terreno t2
		);

-- 		49. Obtener los empleados que han recibido más capacitaciones que el promedio de todos los empleados.

		SELECT e.nombre, COUNT(ec.id_capacitacion) AS total_capacitaciones
		FROM empleado e
		JOIN empleado_capacitaciones ec ON e.id_empleado = ec.id_empleado
		GROUP BY e.nombre
		HAVING COUNT(ec.id_capacitacion) > (
			SELECT AVG(total)
			FROM (
				SELECT COUNT(ec2.id_capacitacion) AS total
				FROM empleado_capacitaciones ec2
				GROUP BY ec2.id_empleado
			) AS subconsulta
		);

-- 		50. Mostrar los productos que han sido vendidos más veces que el promedio de todas las ventas.

		SELECT p.nombre, COUNT(pv.id_producto) AS veces_vendido
		FROM producto p
		JOIN productos_venta pv ON p.id_producto = pv.id_producto
		GROUP BY p.nombre
		HAVING COUNT(pv.id_producto) > (
			SELECT AVG(cantidad)
			FROM (
				SELECT COUNT(pv2.id_producto) AS cantidad
				FROM productos_venta pv2
				GROUP BY pv2.id_producto
			) AS subconsulta
		);

-- 		51. Listar los hábitats que tienen más animales que el promedio de todos los hábitats.

		SELECT h.nombre, COUNT(ah.id_animal) AS total_animales
		FROM habitat h
		JOIN animales_habitat ah ON h.id_habitat = ah.id_habitat
		GROUP BY h.nombre
		HAVING COUNT(ah.id_animal) > (
			SELECT AVG(total)
			FROM (
				SELECT COUNT(ah2.id_animal) AS total
				FROM animales_habitat ah2
				GROUP BY ah2.id_habitat
			) AS subconsulta
		);

-- 		52. Obtener el nombre y el total de ventas de los productos cuyo precio es superior al promedio de la categoría.

		SELECT p.nombre, COUNT(v.id_venta) AS total_ventas
		FROM producto p
		JOIN productos_venta pv ON p.id_producto = pv.id_producto
		JOIN venta v ON pv.id_venta = v.id_venta
		WHERE p.precio_unitario > (
			SELECT AVG(p2.precio_unitario)
			FROM producto p2
			WHERE p2.id_tipo = p.id_tipo
		)
		GROUP BY p.nombre;

-- 		53. Mostrar los terrenos que tienen más animales de lo que el promedio en otros terrenos.

		
--  	54. Mostrar los terrenos donde se han cultivado más tipos de cultivos que el promedio en los demás terrenos.

		SELECT t.*, COUNT(DISTINCT c.id_cultivo) AS total_cultivos
		FROM terreno t
		JOIN cultivos_terreno ct ON t.id_terreno = ct.id_terreno
		JOIN cultivo c ON ct.id_cultivo = c.id_cultivo
		GROUP BY t.id_terreno
		HAVING COUNT(DISTINCT c.id_cultivo) > (
			SELECT AVG(total)
			FROM (
				SELECT COUNT(c2.id_cultivo) AS total
				FROM cultivos_terreno ct2
				JOIN cultivo c2 ON ct2.id_cultivo = c2.id_cultivo
				GROUP BY ct2.id_terreno
			) AS subconsulta
		);

-- 		55. Obtener el promedio del total de ventas por cliente en el último año, y listar aquellos clientes cuyo total de ventas esté por encima de este promedio.

		SELECT c.nombre, SUM(v.total) AS total_ventas
		FROM cliente c
		JOIN cliente_venta cv ON c.id_cliente = cv.id_cliente
		JOIN venta v ON cv.id_venta = v.id_venta
		WHERE v.fecha BETWEEN NOW() - INTERVAL 1 YEAR AND NOW()
		GROUP BY c.nombre
		HAVING SUM(v.total) > (
			SELECT AVG(total)
			FROM (
				SELECT SUM(v2.total) AS total
				FROM cliente_venta cv2
				JOIN venta v2 ON cv2.id_venta = v2.id_venta
				WHERE v2.fecha BETWEEN NOW() - INTERVAL 1 YEAR AND NOW()
				GROUP BY cv2.id_cliente
			) AS subconsulta
		);
        

--      56. Mostrar las ventas realizadas entre dos fechas específicas.

		SELECT * FROM venta WHERE fecha BETWEEN '2024-5-12' AND '2025-09-12';

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
        
-- 		61. Mostrar los empleados que trabajan en una función especifica.
		SELECT e.*
        FROM empleado_funciones ef
        JOIN empleado e
        ON e.id_empleado = ef.id_empleado
        WHERE id_funcion = 3;

-- 		62. Listar todos los terrenos cuyo tamaño es mayor a 500 metros cuadrados.

		SELECT *
        FROM terreno
        WHERE area > 500;

-- 		63. Mostrar todas las órdenes de compra procesadas en los últimos 3 meses.
        SELECT *
        FROM orden
        WHERE fecha >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);

-- 		64. Listar todos los animales que pesan más de 50 kg.
		SELECT a.*
        FROM animal a
        WHERE peso > 50;

-- 		65. Listar todos los clientes que viven en una ciudad cuyo nombre empieza con la letra 'C'.
		SELECT c.* 
        FROM cliente c 
        JOIN ciudad ci
        ON c.id_ciudad = ci.id_ciudad
        WHERE ci.nombre LIKE 'C%';

-- 		66. Mostrar todos los productos que tienen un precio inferior a $5.
		SELECT p.* 
        FROM producto p
        WHERE p.precio_unitario < 5;

-- 		67. Listar los clientes que han realizado compras cuyo total es superior a $500 en el último año.

		SELECT c.nombre, v.total
		FROM cliente c
		JOIN cliente_venta cv ON c.id_cliente = cv.id_cliente
		JOIN venta v ON cv.id_venta = v.id_venta
		WHERE v.total > 500 AND v.fecha BETWEEN NOW() - INTERVAL 1 YEAR AND NOW();

-- 		68. Mostrar todos los productos que fueron vendidos en las ventas superiores a $1000.

		SELECT p.nombre, pv.cantidad
		FROM producto p
		JOIN productos_venta pv ON p.id_producto = pv.id_producto
		JOIN venta v ON pv.id_venta = v.id_venta
		WHERE v.total > 1000;

-- 		69. Obtener todos los proveedores cuyos productos hayan sido comprados en más de 3 órdenes en los últimos 2 años.

		SELECT p.nombre, COUNT(o.id_orden) AS total_ordenes
		FROM proveedor p
		JOIN orden o ON p.id_proveedor = o.id_proveedor
		WHERE o.fecha BETWEEN NOW() - INTERVAL 2 YEAR AND NOW()
		GROUP BY p.nombre
		HAVING COUNT(o.id_orden) > 3;

-- 		70. Listar los empleados que han trabajado más de 200 horas en el último mes.

		SELECT e.nombre, SUM(TIMEDIFF(h.hora_fin, h.hora_inicio)) AS total_horas
		FROM empleado e
		JOIN empleado_horarios eh ON e.id_empleado = eh.id_empleado
        JOIN horarios h ON eh.id_horario = h.id_horario
		WHERE NOW() - INTERVAL 1 MONTH AND NOW()
		GROUP BY e.nombre
		HAVING SUM(TIMEDIFF(h.hora_fin, h.hora_inicio))  > 200;

-- 		71. Mostrar los animales que han recibido tratamientos cuyo costo total es superior a $100.

		SELECT a.*, SUM(at.valor_tratamiento) AS total_costo
		FROM animal a
		JOIN animales_tratados at ON a.id_animal = at.id_animal
		WHERE at.valor_tratamiento > 100
		GROUP BY a.id_animal;

-- 		72. Obtener los empleados que no han realizado ventas en los últimos 6 meses.

		SELECT e.*
		FROM empleado e
		LEFT JOIN venta v ON e.id_empleado = v.id_empleado AND v.fecha BETWEEN NOW() - INTERVAL 6 MONTH AND NOW()
		WHERE v.id_venta IS NULL;

-- 		73. Mostrar los clientes que han comprado productos de al menos 3 categorías diferentes.

		SELECT c.nombre, COUNT(DISTINCT p.id_tipo) AS total_categorias
		FROM cliente c
		JOIN cliente_venta cv ON c.id_cliente = cv.id_cliente
		JOIN productos_venta pv ON cv.id_venta = pv.id_venta
		JOIN producto p ON pv.id_producto = p.id_producto
		GROUP BY c.nombre
		HAVING COUNT(DISTINCT p.id_tipo) >= 3;

-- 		74. Listar los clientes que han realizado compras por un monto total superior a $1,000 en los últimos tres meses.

		SELECT c.nombre, SUM(v.total) AS total_compras
		FROM cliente c
		JOIN cliente_venta cv ON c.id_cliente = cv.id_cliente
		JOIN venta v ON cv.id_venta = v.id_venta
		WHERE v.fecha BETWEEN NOW() - INTERVAL 3 MONTH AND NOW()
		GROUP BY c.nombre
		HAVING SUM(v.total) > 1000;

-- 		75. Obtener la categoria con más empleados.
        SELECT c.*
        FROM categoria c
        JOIN funciones f ON f.id_categoria = c.id_categoria
        JOIN empleado_funciones ef ON ef.id_funcion = f.id_funcion
        GROUP BY c.id_categoria
        HAVING COUNT(ef.id_empleado) = (
            SELECT MAX(empleados)
            FROM (SELECT COUNT(efsub.id_empleado) AS empleados
                  FROM funciones fsub
                  JOIN empleado_funciones efsub ON efsub.id_funcion = fsub.id_funcion
                  GROUP BY fsub.id_categoria) AS subconsulta
);

--      76. Actualizar el precio de todos los productos en un 10%.
		UPDATE producto
        SET precio_unitario = precio_unitario + (precio_unitario * 0.10);

--      77. Modificar el estado de todos los cliente nuevos a regulares.
		UPDATE cliente
        SET id_tipo = 1
        WHERE id_tipo = 3;

--      78. Actualizar la cantidad en inventario de un insumo específico después de una compra.


--      79. Modificar los datos de contacto de un proveedor. //Cambia datos
        UPDATE proveedor
        SET telefono = '111111',  
        WHERE id_proveedor = 1; 


--      80. Actualizar el estado de un terreno que ha sido reasignado para nuevos cultivos. //Cambia datos
		UPDATE terreno
        SET estado = 'Ocupado'  
        WHERE id_terreno = 5;  

--      81. Modificar el salario de todos los empleados en un 5%.
		UPDATE empleado
        SET salario = salario + (salario * 0.05);

--      82. Actualizar el estado de todas las ordenes de compra. //Cambia datos

        UPDATE cliente_venta
        SET estado = 'Entregado'
        WHERE estado = 'En Proceso'; 

--      83. Cambiar el hábitat de un animal que ha sido reasignado. //Cambia datos
        UPDATE animales_habitat ah 
        SET id_habitat = 2
        WHERE id_animal = 2

--      84. Actualizar la cantidad de productos en stock después de una venta.

--      85. Modificar el estado de una capacitación completada por un empleado.

--      86. Eliminar los productos que han vencido.

--      87. Borrar los registros de ventas de hace más de dos años.

--      88. Eliminar los animales que han sido dados de baja.

--      89. Borrar los clientes que no han realizado compras en los últimos cinco años.

--      90. Eliminar los proveedores que no han suministrado insumos en más de un año.

--      91. Borrar las órdenes de compra que ya han sido completadas hace más de un año.

--      92. Eliminar los empleados que han dejado la empresa.
		