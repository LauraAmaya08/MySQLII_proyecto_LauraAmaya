-- 1. Informar de productos vencidos cada dia

CREATE EVENT registrar_productos_vencidos
ON SCHEDULE EVERY 1 DAY
DO
  INSERT INTO alertas (mensaje, fecha)
  SELECT CONCAT('Producto: ', nombre, ' vencido!'), CURDATE()
  FROM producto
  WHERE fecha_vencimiento <= CURDATE();


-- 2. CREATE EVENT borrar_ventas_antiguas
ON SCHEDULE EVERY 1 YEAR
DO
  DELETE FROM orden 
  WHERE fecha < DATE_SUB(CURDATE(), INTERVAL 2 YEAR);