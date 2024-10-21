-- 1. Consultas con SELECT
--     1. Mostrar todos los empleados que tienen el cargo de 'Veterinario'.

--     2. Listar todos los clientes que viven en una ciudad específica.

SELECT nombre, telefono, direccion, email FROM cliente where id_ciudad = 1;

--     3. Mostrar todas las órdenes de compra a proveedores en el último mes.

SELECT * FROM orden;

--     4. Listar todos los animales asignados a un hábitat específico.



--     5. Mostrar todos los productos que vencen este mes.

SELECT * FROM producto WHERE WHERE MONTH(fecha_vencimiento) = MONTH(now()) AND YEAR(fecha_vencimiento) = YEAR(now());

--     6. Listar todas las ventas realizadas en una fecha específica.



--     7. Mostrar todos los terrenos que están ocupados.

SELECT * FROM terreno WHERE estado = 'Ocupado';

--     8. Listar todos los proveedores que suministran insumos esenciales.


--     9. Mostrar todas las tecnologías usadas en los cultivos.


--     10. Listar todas las capacitaciones realizadas en los últimos 4 meses.

SELECT * FROM capacitaciones WHERE fecha_realizacion > now() - INTERVAL 4 MONTH;

--     11. Listar los cultivos que se deben recoger el mes siguiente 


-- 2. Consultas con JOIN

--      11. Obtener todas las ventas junto con los productos vendidos.

--      12. Mostrar los animales junto con las especies a las que pertenecen.

--      13. Listar los clientes y sus compras realizadas.

--      14. Obtener las órdenes de compra junto con los proveedores correspondientes.

--      15. Mostrar los empleados junto con las capacitaciones que han recibido.

--      16. Listar los hábitats con los animales asignados a cada uno. 

--      17. Obtener los cultivos junto con los terrenos donde están plantados.

--      18. Mostrar las ventas junto con los empleados que las realizaron.

--      19. Obtener las compras junto con los productos y proveedores.

--      20. Mostrar los productos junto con los insumos utilizados para su producción.



-- 3. Consultas con Funciones de Agregación

--      21. Calcular el total de ventas realizadas en el último mes.

--      22. Obtener el promedio de ventas por cliente.

--      23. Mostrar la cantidad de animales por hábitat.

--      24. Calcular el total de productos vendidos en el último trimestre.

--      25. Mostrar el promedio de precios de productos por categoría.

--      26. Calcular la cantidad de animales que han sido tratados por un veterinario.

--      27. Obtener el total de ingresos por cada cliente.

--      28. Mostrar la cantidad de insumos utilizados en la producción del último mes.

--      29. Calcular el total de órdenes de compra realizadas a un proveedor específico.

--      30. Mostrar el promedio de ventas realizadas por empleado.




-- 4. Consultas con Subconsultas

--      31. Listar los productos que tienen un precio mayor al promedio de todos los productos.

--      32. Mostrar los empleados que han completado más ventas que el promedio.

--      33. Listar los proveedores que suministran insumos a precios mayores que el promedio.

--      34. Mostrar los hábitats que albergan más animales que el promedio.

--      35. Obtener los clientes que han realizado más compras que el promedio.



-- 5. Consultas con Filtros Avanzados

--      36. Mostrar las ventas realizadas entre dos fechas específicas.

--      37. Listar los productos cuyo precio está entre $10 y $20.

--      38. Mostrar los clientes que no han realizado ninguna compra en el último año.

--      39. Listar los animales que fueron tratados por veterinarios en los últimos seis meses.

--      40. Mostrar las órdenes de compra superiores a un monto específico.



-- 6. Consultas de Actualización (UPDATE)

--      41. Actualizar el precio de todos los productos en un 10%.

--      42. Modificar el estado de un animal después de ser tratado por el veterinario.

--      43. Actualizar la cantidad en inventario de un insumo específico después de una compra.

--      44. Modificar los datos de contacto de un proveedor.

--      45. Actualizar el estado de un terreno que ha sido reasignado para nuevos cultivos.

--      46. Modificar el salario de todos los empleados en un 5%.

--      47. Actualizar el estado de una orden de compra después de su entrega.

--      48. Cambiar el hábitat de un animal que ha sido reasignado.

--      49. Actualizar la cantidad de productos en stock después de una venta.

--      50. Modificar el estado de una capacitación completada por un empleado.



-- 7. Consultas de Eliminación (DELETE)

--      51. Eliminar los productos que han vencido.

--      52. Borrar los registros de ventas de hace más de dos años.

--      53. Eliminar los animales que han sido dados de baja.

--      54. Borrar los clientes que no han realizado compras en los últimos cinco años.

--      55. Eliminar los proveedores que no han suministrado insumos en más de un año.

--      56. Borrar las órdenes de compra que ya han sido completadas hace más de un año.

--      59. Eliminar los empleados que han dejado la empresa.


-- 60