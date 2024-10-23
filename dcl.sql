-- Usuarios

-- 1. Administrador
CREATE USER 'adminHE'@'localhost' IDENTIFIED BY 'Admin2024$';
GRANT ALL PRIVILEGES ON *.* TO 'adminHE'@'localhost' WITH GRANT OPTION;

-- 2. Gestor de operaciones agricolas 

CREATE USER 'operadorHE'@'localhost' IDENTIFIED BY 'Oper2024!';

-- Permisos 
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.cultivo TO 'operadorHE'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.terreno TO 'operadorHE'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.insumos TO 'operadorHE'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.tecnologias_terreno TO 'operadorHE'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.habitats_tecnologias TO 'operadorHE'@'localhost';


-- 3. Gestor de recursos humanos

CREATE USER 'rrHHsHE'@'localhost' IDENTIFIED BY 'rrHH2024!';

-- Permisos 
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.empleado TO 'rrHHsHE'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.capacitaciones TO 'rrHHsHE'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.horarios TO 'rrHHsHE'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.empleado_capacitaciones TO 'rrHHsHE'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.empleado_horarios TO 'rrHHsHE'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.empleado_funciones TO 'rrHHsHE'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.funciones TO 'rrHHsHE'@'localhost';

-- 4. Gestor de ventas

CREATE USER 'ventas'@'localhost' IDENTIFIED BY 'ventA2024!';

-- Permisos
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.cliente TO 'ventas'@'localhost' ;
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.venta TO 'ventas'@'localhost' ;
GRANT SELECT 
ON la_huerta_encantadaDB.productos TO 'ventas'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.tipo_cliente TO 'ventas'@'localhost' ;
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.cliente_venta TO 'ventas'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.productos_venta TO 'ventas'@'localhost';

-- 5. Gestor de operaciones ganaderas 

CREATE USER 'operGan'@'localhost' IDENTIFIED BY 'ganaderO2024!';

-- Permisos 
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.animal TO 'operGan'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.habitat TO 'operGan'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.animales_habitat TO 'operGan'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.animales_tratados TO 'operGan'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.habitats_tecnologias TO 'operGan'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.uso_animal TO 'operGan'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.usos_animal TO 'operGan'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE 
ON la_huerta_encantadaDB.especie TO 'operGan'@'localhost';