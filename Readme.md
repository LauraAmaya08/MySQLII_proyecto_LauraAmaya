<h1> La Huerta Encantada - MySQL Data Base 🌸</h1>

<p align="center">
  <img src="images/descarga.jpeg" alt="Imagen referencial" width="500" />
</p>


Este proyecto tiene como objetivo diseñar y desarrollar una base de datos integral que permita gestionar de manera eficiente todas las operaciones relacionadas con la producción agrícola de la finca. La implementación de esta base de datos facilitará el seguimiento de cultivos, la gestión de maquinaria, el control de ventas y la administración de recursos humanos, proporcionando una herramienta que permita una toma de decisiones informada y ágil.

## Tabla de Contenidos
- [Identificación del Problema](#problema)
- [Requisitos del Sistema: ](#requisitos)
- [Uso del proyecto](#Uso)
- [Diagrama Lógico](#diagrama)
- [Consultas](#consultas)
- [Eventos Programados](#eventos)
- [Triggers](#triggers)
- [Funciones](#funciones)
- [Procedimientos Almacenados](#procedimientos)
- [Usuarios](#usuarios )
- [Contacto](#contacto)


## Problema

En un contexto agrícola cada vez más competitivo, la optimización de recursos y la gestión eficiente de procesos se han convertido en factores cruciales para el éxito de cualquier finca. "La Huerta Encantada", una finca dedicada a la producción de diversos cultivos se enfrenta al desafío de administrar de manera efectiva sus operaciones diarias.

La falta de un sistema centralizado para gestionar las diversas áreas de producción, desde el control de inventarios hasta la gestión de empleados y la relación con proveedores y clientes, generan ineficiencias que impactan negativamente en la productividad y rentabilidad de la finca.

## Requisitos

Este proyecto utiliza MySQL y MySQL Workbench para la gestión de datos y procedimientos.

### Hardware
- **Espacio en Disco:** Al menos 2 GB de espacio libre en disco para la instalación y almacenamiento de datos.

### Software

- **MySQL Server:** Debes tener MySQL Server instalado (preferiblemente la versión 8.0.36).
  
- **Controladores de MySQL:** Asegúrate de que los controladores de MySQL estén instalados correctamente.

- **Workbench:** Necesario para la prueba y el uso del proyecto.

### Red
- Conexión a Internet (opciona).

### Permisos de Usuario
- Tener permisos adecuados para instalar software y acceder a la base de datos.

## Instalación
1. Descarga e instala MySQL Server desde [sitio oficial](https://dev.mysql.com/downloads/mysql/).
2. Descarga e instala MySQL Workbench desde [sitio oficial](https://dev.mysql.com/downloads/workbench/).
3. Configura tu conexión a la base de datos desde MySQL Workbench.

## Uso

1. Clona este repositorio, para obtener una copia local del proyecto:
   ```bash
   git clone https://github.com/LauraAmaya08/MySQLII_proyecto_LauraAmaya/
   ```
2. **Carpeta dql_files**: Contiene archivos SQL específicos para las consultas DQL, que son principalmente instrucciones SELECT para consultar información:
- **dql_eventos.sql**: Archivo que incluye eventos que gestionan acciones automatizadas en la base de datos.

- **dql_funciones.sql**: Contiene funciones personalizadas definidas en SQL para ser utilizadas dentro y fuera de consultas.

- **dql_procedimientos.sql**: Incluye procedimientos almacenados que pueden ejecutarse para mayor eficiencia entre consultas.

- **dql_select.sql**: Incluye varias consultas para recuperar datos específicos de la base de datos.

- **dql_triggers.sql**: Almacena triggers, que son acciones automáticas que se ejecutan en respuesta a eventos específicos dentro de la base de datos, como actualizaciones, inserciones o eliminaciones de registros.


3. **Archivos DDL, DML, y DCL:**

- **ddl.sql**: Contiene instrucciones para crear y definir la estructura de la base de datos (tablas, relaciones).

- **dml.sql**: Incluye los registros de ingreso a las entidades de la base de datos

- **dcl.sql**: Contiene instrucciones que gestionan los permisos y controles de acceso dentro de la base de datos para controlar quién tiene acceso a los datos.

4. **Cargar los scripts en MySQL Workbench:**
 Abre MySQL Workbench y ejecuta cada uno de los scripts SQL en el orden adecuado (empieza con el archivo ddl.sql para definir la base de datos, luego utiliza los archivos DML y DQL para manipular y consultar los datos).

5. Con ayuda de las consultas referidas a continuación, ¡Explora la base de datos!


## Entidad-Relación


### 1. **Categoría**
   - **Descripción**: Clasifica las funciones de los empleados.
   - **Atributos**:
     - `id_categoria`: Identificador único.
     - `nombre`: Nombre de la categoría (único).

### 2. **Funciones**
   - **Descripción**: Define las funciones desempeñadas por los empleados.
   - **Atributos**:
     - `id_funcion`: Identificador único.
     - `nombre`: Nombre de la función (único).
     - `descripcion`: Descripción de la función.
     - `id_categoria`: Relación con la tabla `Categoría`.

### 3. **Empleado**
   - **Descripción**: Almacena información sobre los empleados.
   - **Atributos**:
     - `id_empleado`: Identificador único.
     - `nombre`: Nombre del empleado.
     - `telefono`: Teléfono del empleado (único).
     - `direccion`: Dirección del empleado.
     - `email`: Correo electrónico del empleado (único).
     - `fecha_contratacion`: Fecha de contratación.
     - `salario`: Salario del empleado.
     - `estado`: Estado del empleado.

### 4. **Empleado_Funciones**
   - **Descripción**: Relaciona empleados con sus funciones.
   - **Atributos**:
     - `id`: Identificador único.
     - `id_empleado`: Relación con `Empleado`.
     - `id_funcion`: Relación con `Funciones`.
     - `fecha`: Fecha de asignación.

### 5. **Capacitaciones**
   - **Descripción**: Información sobre las capacitaciones ofrecidas a los empleados.
   - **Atributos**:
     - `id_capacitacion`: Identificador único.
     - `nombre`: Nombre de la capacitación (único).
     - `descripcion`: Descripción de la capacitación.
     - `fecha_realizacion`: Fecha de realización.

### 6. **Empleado_Capacitaciones**
   - **Descripción**: Relaciona empleados con las capacitaciones que han recibido.
   - **Atributos**:
     - `id`: Identificador único.
     - `id_empleado`: Relación con `Empleado`.
     - `id_capacitacion`: Relación con `Capacitaciones`.

### 7. **Horarios**
   - **Descripción**: Define los horarios de trabajo de los empleados.
   - **Atributos**:
     - `id_horario`: Identificador único.
     - `hora_inicio`: Hora de inicio.
     - `hora_fin`: Hora de fin.

### 8. **Empleado_Horarios**
   - **Descripción**: Relaciona empleados con sus horarios de trabajo.
   - **Atributos**:
     - `id`: Identificador único.
     - `id_empleado`: Relación con `Empleado`.
     - `id_horario`: Relación con `Horarios`.
     - `dias_semana`: Días de la semana aplicables.

### 9. **Ciudad**
   - **Descripción**: Información sobre las ciudades.
   - **Atributos**:
     - `id_ciudad`: Identificador único.
     - `nombre`: Nombre de la ciudad (único).

### 10. **Tipo_Cliente**
- **Descripción**: Define los tipos de clientes y sus descuentos.
- **Atributos**:
    - `id_tipo`: Identificador único.
    - `nombre`: Nombre del tipo (único).
    - `descuento`: Descuento asociado.

### 11. **Cliente**
- **Descripción**: Almacena información sobre los clientes.
- **Atributos**:
      - `id_cliente`: Identificador único.
      - `nombre`: Nombre del cliente.
      - `telefono`: Teléfono del cliente (único).
      - `direccion`: Dirección del cliente.
      - `email`: Correo electrónico del cliente (único).
      - `id_ciudad`: Relación con `Ciudad`.
      - `id_tipo`: Relación con `Tipo_Cliente`.

### 12. **Proveedor**
- **Descripción**: Información sobre los proveedores.
- **Atributos**:
      - `id_proveedor`: Identificador único.
      - `nombre`: Nombre del proveedor.
      - `direccion`: Dirección del proveedor.
      - `telefono`: Teléfono del proveedor (único).
      - `id_ciudad`: Relación con ` Ciudad`.
      - `estado`: Estado del proveedor.

### 13. **Orden**
- **Descripción**: Registra las órdenes de compra a proveedores.
- **Atributos**:
    - `id_orden`: Identificador único.
    - `id_proveedor`: Relación con `Proveedor`.
    - `total`: Total de la orden.
    - `fecha`: Fecha de la orden.
    - `estado`: Estado de la orden.

### 14. **Insumos**
- **Descripción**: Información sobre los insumos utilizados en la producción.
- **Atributos**:
    - `id_insumo`: Identificador único.
    - `nombre`: Nombre del insumo.
    - `descripcion`: Descripción del insumo.
    - `stock`: Cantidad disponible.
    - `Precio_unitario`: Precio unitario.
    - `stock_minimo`: Stock mínimo permitido.

### 15. **Insumos_Orden**
- **Descripción**: Relaciona insumos con las órdenes de compra.
- **Atributos**:
    - `id_insumo`: Relación con `Insumos`.
    - `id_orden`: Relación con `Orden`.
    - `cantidad`: Cantidad de insumos en la orden.

### 16. **Tipo_Producto**
- **Descripción**: Define los tipos de productos.
- **Atributos**:
    - `id_tipo`: Identificador único.
    - `nombre`: Nombre del tipo (único).
    - `descripcion`: Descripción del tipo.

### 17. **Cultivo**
- **Descripción**: Información sobre los cultivos.
- **Atributos**:
    - `id_cultivo`: Identificador único.
    - `nombre`: Nombre del cultivo.
    - `estado`: Estado del cultivo.
    - `cantidad`: Cantidad disponible.

### 18. **Producto**
- **Descripción**: Almacena información sobre los productos.
- **Atributos**:
      - `id_producto`: Identificador único.
      - `nombre`: Nombre del producto (único).
      - `descripcion`: Descripción del producto.
      - `precio_unitario`: Precio unitario.
      - `peso`: Peso del producto.
      - `es_Cultivo`: Indica si es un cultivo.
      - `id_cultivo`: Relación con `Cultivo`.
      - `id_tipo`: Relación con `Tipo_Producto`.
      - `stock`: Cantidad disponible.
      - `fecha_vencimiento`: Fecha de vencimiento.
      - `estado`: Estado del producto.

### 19. **Insumos_Producto**
- **Descripción**: Relaciona insumos con productos.
- **Atributos**:
    - `id_insumo`: Relación con `Insumos`.
    - `id_producto`: Relación con `Producto`.
    - `es_Escencial`: Indica si el insumo es esencial.

### 20. **Terreno**
- **Descripción**: Información sobre los terrenos.
- **Atributos**:
    - `id_terreno`: Identificador único.
    - `capacidad`: Capacidad del terreno.
    - `area`: Área del terreno.
    - `estado`: Estado del terreno.

### 21. **Cultivos_Terreno**
- **Descripción**: Relaciona cultivos con terrenos.
- **Atributos**:
    - `id_cultivo`: Relación con `Cultivo`.
    - `id_terreno`: Relación con `Terreno`.
    - `fecha_siembra`: Fecha de siembra.
    - `fecha_recoger`: Fecha de recoger.

### 22. **Tecnologias**
- **Descripción**: Información sobre las tecnologías utilizadas.
- **Atributos**:
    - `id_tecnologia`: Identificador único.
    - `nombre`: Nombre de la tecnología.
    - `estado`: Estado de la tecnología.
    - `es_Usado`: Indica si está en uso.

### 23. **Tecnologias_Terreno**
- **Descripción**: Relaciona tecnologías con terrenos.
- **Atributos**:
    - `id_tecnologia`: Relación con `Tecnologias`.
    - `id_terreno`: Relación con `Terreno`.
    - `fecha`: Fecha de asignación.

### 24. **Mantenimiento**
- **Descripción**: Información sobre los mantenimientos realizados.
- **Atrib utos**:
    - `id_mantenimiento`: Identificador único.
    - `nombre`: Nombre del mantenimiento (único).
    - `descripcion`: Descripción del mantenimiento.
    - `total`: Total del mantenimiento.

### 25. **Mantenimiento_Tecnologia**
- **Descripción**: Relaciona mantenimientos con tecnologías.
- **Atributos**:
    - `id_tecnologia`: Relación con `Tecnologias`.
    - `id_mantenimiento`: Relación con `Mantenimiento`.
    - `fecha_realizacion`: Fecha de realización.

### 26. **Habitat**
- **Descripción**: Información sobre los hábitats.
- **Atributos**:
    - `id_habitat`: Identificador único.
    - `nombre`: Nombre del hábitat.
    - `area`: Área del hábitat.
    - `capacidad`: Capacidad del hábitat.

### 27. **Habitats_Tecnologias**
- **Descripción**: Relaciona hábitats con tecnologías.
- **Atributos**:
    - `id_tecnologia`: Relación con `Tecnologias`.
    - `id_habitat`: Relación con `Habitat`.
    - `fecha`: Fecha de asignación.

### 28. **Uso_Animal**
- **Descripción**: Define los usos de los animales.
- **Atributos**:
    - `id_uso`: Identificador único.
    - `descripcion`: Descripción del uso.
    - `produccion`: Producción asociada.

### 29. **Especie**
- **Descripción**: Información sobre las especies de animales.
- **Atributos**:
    - `id_especie`: Identificador único.
    - `nombre`: Nombre de la especie (único).

### 30. **Animal**
- **Descripción**: Almacena información sobre los animales.
- **Atributos**:
    - `id_animal`: Identificador único.
    - `id_especie`: Relación con `Especie`.
    - `peso`: Peso del animal.
    - `altura`: Altura del animal.
    - `valor_unitario`: Valor unitario.
    - `estado`: Estado del animal.

### 31. **Usos_Animal**
- **Descripción**: Relaciona usos con animales.
- **Atributos**:
    - `id_uso`: Relación con `Uso_Animal`.
    - `id_animal`: Relación con `Animal`.

### 32. **Animales_Habitat**
- **Descripción**: Relaciona animales con hábitats.
- **Atributos**:
    - `id_animal`: Relación con `Animal`.
    - `id_habitat`: Relación con `Habitat`.
    - `fecha`: Fecha de asignación.

### 33. **Venta**
- **Descripción**: Registra las ventas realizadas.
- **Atributos**:
    - `id_venta`: Identificador único.
    - `id_empleado`: Relación con `Empleado`.
    - `fecha`: Fecha de la venta.
    - `total`: Total de la venta.

### 34. **Productos_Venta**
- **Descripción**: Relaciona productos con ventas.
- **Atributos**:
    - `id_venta`: Relación con `Venta`.
    - `id_producto`: Relación con `Producto`.
    - `cantidad`: Cantidad vendida.

### 35. **Cliente_Venta**
- **Descripción**: Relaciona clientes con ventas.
- **Atributos**:
    - `id_venta`: Relación con `Venta`.
    - `id_cliente`: Relación con `Cliente`.
    - `estado`: Estado de la venta.

### 36. **Entrega_Venta**
- **Descripción**: Registra las entregas de ventas.
- **Atributos**:
    - `id_entrega`: Identificador único.
    - `id_venta`: Relación con `Venta`.
    - `fecha`: Fecha de entrega.
    - `anotacion`: Anotación de la entrega.

### 37. **Alertas**
- **Descripción**: Información sobre las alertas generadas.
- **Atributos**:
    - `id_alerta`: Identificador único.
    - `mensaje`: Mensaje de la alerta.
    - `fecha`: Fecha de la alerta.

### 38. **Compras**
- **Descripción**: Registra las compras realizadas.
- **Atributos**:
    - `id_compra `: Identificador único.
    - `descripcion`: Descripción de la compra.
    - `fecha`: Fecha de la compra.
    - `total`: Total de la compra.

### 39. **Auditoria**
- **Descripción**: Información sobre las auditorías realizadas.
- **Atributos**:
    - `id_auditoria`: Identificador único.
    - `mensaje`: Mensaje de la auditoría.
    - `fecha`: Fecha de la auditoría.

### 40. **Animales_Tratados**
- **Descripción**: Registra los tratamientos de animales.
- **Atributos**:
    - `id_animal`: Relación con `Animal`.
    - `id_empleado`: Relación con `Empleado`.
    - `fecha`: Fecha del tratamiento.
    - `descripcion`: Descripción del tratamiento.
    - `valor_tratamiento`: Valor del tratamiento.

## Relaciones

1. Un empleado puede tener varias funciones `(Empleado_Funciones)`.
2. Un empleado puede tener varias capacitaciones `(Empleado_Capacitaciones)`.
3. Un empleado puede tener varios horarios `(Empleado_Horarios)`.
4. Un proveedor puede tener varias órdenes `(Orden)`.
5. Un insumo puede estar en varias órdenes `(Insumos_Orden)`.
6. Un producto puede tener varios insumos `(Insumos_Producto)`.
7. Un cultivo puede estar en varios terrenos `(Cultivos_Terreno)`.
8. Un terreno puede tener varias tecnologías `(Tecnologias_Terreno)`.
9. Una tecnología puede tener varios mantenimientos `(Mantenimiento_Tecnologia)`.
10. Un hábitat puede tener varias tecnologías `(Habitats_Tecnologias)`.
11. Un animal puede tener varios usos `(Usos_Animal)`.
12. Un animal puede estar en varios hábitats `(Animales_Habitat)`.
13. Una venta puede tener varios productos `(Productos_Venta)`.
14. Una venta puede tener un cliente `(Cliente_Venta)`.
15. Una entrega puede tener una venta `(Entrega_Venta)`.
16. Un empleado puede tratar varios animales `(Animales_Tratados)`.


## Diagrama
<img src="images/ERDDiagram1.jpg" alt="Diagrama de relación de entidad" width="auto" />


## Consultas

### 1. Consultar proveedores que suministran insumos esenciales. 
 Esta consulta retorna la informacion de los proveedores que suministran insumos escenciales para la fabricación de productos.

```sql
SELECT p.* 
FROM insumos_producto ip 
JOIN insumos i ON ip.id_insumo = i.id_insumo 
JOIN insumos_orden io ON i.id_insumo = io.id_insumo 
JOIN orden o ON io.id_orden = o.id_orden 
JOIN proveedor p ON o.id_proveedor = p.id_proveedor 
WHERE ip.es_Escencial = 1;
```

### 2. Consultar las compras junto con los productos y proveedores. 
 Esta consulta retorna la informacion de las compras realizadas junto con sus respectivos productos y proveedores de los mismos.

```sql
SELECT v.total as total_venta, v.fecha as fecha_venta, 
pv.cantidad as cantidad_producto, p.nombre as nombre_producto, 
p.descripcion as descripcion_producto, p.peso as peso_producto, 
pr.nombre as nombre_proveedor, pr.telefono as telefono_proveedor, 
pr.direccion as direccion_proveedor, pr.estado as estado_proveedor 
FROM venta v 
JOIN cliente_venta cv ON v.id_venta = cv.id_venta 
JOIN productos_venta pv ON cv.id_venta = pv.id_venta 
JOIN producto p ON pv.id_producto = p.id_producto 
JOIN insumos_producto ip ON p.id_producto = ip.id_producto 
JOIN insumos i ON ip.id_insumo = i.id_insumo 
JOIN insumos_orden io ON i.id_insumo = io.id_insumo 
JOIN orden o ON io.id_orden = o.id_orden 
JOIN proveedor pr ON o.id_proveedor = pr.id_proveedor;
```

### 3. Consultar la cantidad de animales por hábitat. 
 Esta consulta retorna el nombre del habitat y la cantidad de animales que se encuentran en el mismo.

```sql
SELECT h.id_habitat, h.nombre, COUNT(ah.id_animal) AS cantidad_animales 
FROM animales_habitat ah 
JOIN habitat h ON ah.id_habitat = h.id_habitat 
GROUP BY ah.id_habitat;
```

### 4. Consultar promedio de productos vendidos por cliente en el último semestre. 
 Esta consulta retorna el nombre del cliente que ha realizado compras y el promedio de los productos que ha adquirido.

```sql
SELECT c.id_cliente, c.nombre as nombre_cliente, 
AVG(cantidad_productos) AS promedio_productos_vendidos
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
```

### 5. Consultar empleados con más capacitaciones que el promedio. 
 Esta consulta retorna el nombre del empleado y la cantidad de capacitaciones que ha recibido.

```sql
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
    ) AS subquery
);
```

### 6. Consultar terrenos con más tipos de cultivos que el promedio. 
 Esta consulta retorna la información del terreno y la cantidad de diferentes tipos de cultivos cultivados en el, de los terrenos que tienen mas tipos que el promedio.

```sql
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
    ) AS subquery
);
```

### 7. Consultar proveedores cuyos productos hayan sido comprados en más de 3 órdenes en los últimos 2 años. 
 Esta consulta retorna el nombre del proveedor y la cantidad de veces que se le hicieron ordenes al mismo en los ultimos dos años.

```sql
SELECT p.nombre, COUNT(o.id_orden) AS total_ordenes
FROM proveedor p
JOIN orden o ON p.id_proveedor = o.id_proveedor
WHERE o.fecha BETWEEN NOW() - INTERVAL 2 YEAR AND NOW()
GROUP BY p.nombre
HAVING COUNT(o.id_orden) > 3;
```

### 8. Consultar clientes con compras de productos de al menos 3 categorías diferentes. 
 Esta consulta retorna el nombre del cliente y la cantidad de categorias que ha comprado si ha comprado productos de al menos 3 categorias diferentes.

```sql
SELECT c.nombre, COUNT(DISTINCT p.id_tipo) AS total_categorias
FROM cliente c
JOIN cliente_venta cv ON c.id_cliente = cv.id_cliente
JOIN productos_venta pv ON cv.id_venta = pv.id_venta
JOIN producto p ON pv.id_producto = p.id_producto
GROUP BY c.nombre
HAVING COUNT(DISTINCT p.id_tipo) >= 3;
```

### 9. Cambiar el hábitat de un animal que ha sido reasignado. 
 Esta consulta update actualiza el habitat de un animal que se desea cambiar en la tabla de la relación.

```sql
UPDATE animales_habitat ah 
SET id_habitat = 2
WHERE id_animal = 2
```

### 10. Borrar los clientes que no han realizado compras en los últimos cinco años. 
 Esta consulta delete elimina los clientes que no han realizado compras en los ultimos 5 años.

```sql
DELETE FROM cliente
WHERE id_cliente NOT IN (
SELECT id_cliente FROM cliente_venta cv
JOIN venta v ON v.id_venta = cv.id_venta 
WHERE fecha >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
);
```

## Eventos 

### 1. Informar de productos vencidos cada dia. 
 Este evento genera un registro en la tabla alertas cuando encuentra un producto vencido.

```sql
CREATE EVENT registrar_productos_vencidos
ON SCHEDULE EVERY 1 DAY
DO
  INSERT INTO alertas (mensaje, fecha)
  SELECT CONCAT('Producto: ', nombre, ' vencido!'), CURDATE()
  FROM producto
  WHERE fecha_vencimiento <= CURDATE();
```

### 2. Eliminar ordenes antiguas. 
 Este evento elimina ordenes que ya hayan cumplido un lapso de 2 años.

```sql
ON SCHEDULE EVERY 1 YEAR
DO
  DELETE FROM orden 
  WHERE fecha < DATE_SUB(CURDATE(), INTERVAL 2 YEAR);
```

## Triggers

### 1. Registrar compras de insumos. 
 Este trigger se activa después de insertar un registro en `insumos_orden`. Inserta un nuevo registro en la tabla compras para registrar la compra y actualiza el stock del insumo correspondiente.

```sql
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
```
### 2. Actualizar stock de productos tras una venta.
Se activa después de insertar una venta en `productos_venta`. Actualiza el stock del producto restando la cantidad vendida. 
```sql
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
```
### 3. Enviar alerta cuando se despide un empleado.
Se activa después de que un registro de empleado se actualiza. Si el estado del empleado cambia a 'Inactivo', se registra un mensaje en la tabla `auditoria` informando que el empleado ha sido despedido.
```sql
DELIMITER //
CREATE TRIGGER alerta_despido_empleado
AFTER UPDATE ON empleado
FOR EACH ROW
BEGIN
    IF new.estado = 'Inactivo' THEN
    INSERT INTO auditoria (mensaje,fecha) 
    VALUES (concat('Empleado despedido! ID: ', old.id_empleado), NOW());
    END IF;
END//
DELIMITER ;
```
### 4. Notificar a un empleado al ser asignado a una nueva función. 
Se activa después de que se actualiza la función de un empleado. Si la función cambia, inserta un mensaje en `auditoria` notificando sobre la actualización.
```sql
DELIMITER //
CREATE TRIGGER alerta_modificacion_funcion
AFTER UPDATE ON empleado_funciones
FOR EACH ROW
BEGIN
    IF new.id_funcion <> old.id_funcion THEN
    INSERT INTO auditoria (mensaje,fecha) 
    VALUES (concat('Funciones de empleado ', old.id_empleado, ' actualizadas! Nueva función: ',new.id_funcion), NOW());
    END IF;
END//
DELIMITER ;

```
### 5. Registrar cada vez que se entrega un pedido. 
Se activa después de que se actualiza el estado de un pedido en `cliente_venta`. Si el estado es 'Entregado', se inserta un mensaje en `alertas` y se registra la entrega en `entrega_venta`.
```sql
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

```
###  6. Actualizar el historial de capacitaciones al inscribirse un empleado. 
 Se activa después de insertar un registro en `empleado_capacitaciones`. Inserta un mensaje en `alertas` indicando que el empleado ha completado una capacitación.
```sql
DELIMITER //
CREATE TRIGGER actualizar_historial
AFTER INSERT ON empleado_capacitaciones
FOR EACH ROW
BEGIN
	INSERT INTO alertas(mensaje,fecha) 
    VALUES (concat('El empleado con ID: ', new.id_empleado, ' ha tomado la capacitación con ID ', new.id_capacitacion), NOW());
END//
DELIMITER ;

```
### 7. Notificar a los empleados sobre cambios de horarios. 
 Se activa después de que se actualizan los horarios. Si hay un cambio en las horas de inicio o fin, se registra una alerta en `auditoria` para notificar a los empleados.
```sql
DELIMITER //
CREATE TRIGGER alerta_modificacion_horarios
AFTER UPDATE ON horarios
FOR EACH ROW
BEGIN
    IF new.hora_inicio <> old.hora_inicio OR new.hora_fin <> old.hora_fin THEN
    INSERT INTO auditoria (mensaje,fecha) 
    VALUES (concat('Atención empleados! si tu horario es ', old.hora_inicio, ' - ' ,old.hora_fin, ' tu horario se actualizó a ', new.hora_inicio, ' - ' ,new.hora_fin), NOW());
    END IF;
END//
DELIMITER ;
```
### 8. Notificar sobre vencimiento de productos.
Se activa antes de actualizar un producto. Si la fecha de vencimiento está a 30 días o menos, se registra una alerta en `alertas`. 
```sql
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

```

## Funciones

### 1. Calcular el total de ventas por cliente.
Devuelve el total de ventas realizadas por un cliente específico, dado su ID.
```sql
DELIMITER //
CREATE FUNCTION total_venta(ID_Cliente_e INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad INT DEFAULT 0;
    SELECT count(id_venta) INTO cantidad FROM cliente_venta cv
    WHERE id_cliente = ID_Cliente_e;
    RETURN cantidad;
END//
DELIMITER ;
```
### 2. Obtener el promedio de stock de insumos.
Devuelve el promedio del stock de todos los insumos en la base de datos.
```sql
DELIMITER //
CREATE FUNCTION promedio_insumos()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio_stock DECIMAL(10,2) DEFAULT 0;
    SELECT avg(stock) INTO promedio_stock FROM insumos;
    RETURN promedio_stock;
END//
DELIMITER ;
```
### 3. Calcular el precio promedio de productos.
Devuelve el precio promedio de todos los productos disponibles en la base de datos.
```sql
DELIMITER //
CREATE FUNCTION promedio_precio()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE promedio DECIMAL(10,2);
    SELECT avg(precio_unitario) INTO promedio FROM producto;
    RETURN promedio;
END//
DELIMITER ;
```
### 4. Determinar si un cultivo es rentable.
Evalúa los ingresos generados por un producto específico y devuelve si es 'Rentable' o 'No Rentable' según un umbral definido.
```sql
DELIMITER //
CREATE FUNCTION es_cultivo_rentable(id_producto_e INT)
RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN
    DECLARE ingresos DECIMAL(10,2) DEFAULT 0;
    DECLARE resultado VARCHAR(15);
    
    SELECT SUM(p.precio_unitario * pv.cantidad)
    INTO ingresos
    FROM productos_venta pv 
    JOIN producto p ON p.id_producto = pv.id_producto
    WHERE pv.id_producto = id_producto_e;

    IF ingresos > 1000.00 THEN
        SET resultado = 'Rentable';
    ELSE
        SET resultado = 'No Rentable';
    END IF;

    RETURN resultado;
END//
DELIMITER ;
```
### 5. Obtener funciones por categoría específica.
Devuelve la cantidad de funciones que pertenecen a una categoría específica dada su ID.
```sql
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
```
### 6. Calcular el costo total de mantenimiento de tecnologías.
Devuelve la cantidad de funciones que pertenecen a una categoría específica dada su ID.
```sql
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
```
### 7. Obtener el número de empleados por una función.
Devuelve el número de empleados asignados a una función específica, dada su ID.
```sql
DELIMITER //
CREATE FUNCTION total_empleados(ID_Entregada INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE cantidad INT DEFAULT 0;
    SELECT count(id_empleado) INTO cantidad FROM empleado_funciones
    WHERE id_funcion = ID_Entregada;
    RETURN cantidad;
END//
DELIMITER ;
```
### 8. Calcular el total de productos vendidos por un empleado específico.
Devuelve la cantidad total de productos vendidos por un empleado específico, dado su ID.
```sql
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
```

## Procedimientos

### 1. Listar funciones de un empleado.
 Devuelve una lista de funciones asignadas a un empleado específico.
```sql
DELIMITER //
CREATE PROCEDURE funciones_empleado(IN IDempleado INT)
BEGIN
    SELECT e.nombre,f.nombre as funcion
    FROM empleado_funciones ef
    JOIN funciones f ON f.id_funcion = ef.id_funcion
    join empleado e ON e.id_empleado = ef.id_empleado
    where e.id_empleado = IDempleado;
END//
DELIMITER ;
```
### 2. Actualizar el estado de un producto.
Cambia el estado de un producto específico en la base de datos según el ID proporcionado.
```sql
DELIMITER //
CREATE PROCEDURE actualizar_estado_producto (IN IDproducto INT, IN estadoProducto VARCHAR(50))
BEGIN
    UPDATE producto
    SET estado = estadoProducto
    WHERE id_producto = IDproducto;
END//
DELIMITER ;
```
### 3. Registrar una capacitación para un empleado.
Inserta un registro en `empleado_capacitaciones` para registrar que un empleado ha tomado una capacitación específica.
```sql
DELIMITER //
CREATE PROCEDURE registrar_capacitacion (IN IDcapacitacion INT, IN IDempleado INT)
BEGIN
    INSERT INTO empleado_capacitaciones(id_empleado, id_capacitacion)VALUES
    (IDempleado,IDcapacitacion);
END//
DELIMITER ;
```
### 4. Desactivar un empleado.
Cambia el estado de un empleado a 'Inactivo' según su ID.
```sql
DELIMITER //

CREATE PROCEDURE desactivar_empleado (IN IDempleado INT)
BEGIN
    UPDATE empleado
    SET estado = 'Inactivo'
    WHERE id_empleado = IDempleado;
 END //

DELIMITER ;

```
### 5. Eliminar mantenimiento.
Elimina registros de mantenimiento tanto en la tabla de mantenimiento específico como en la tabla general de mantenimiento.
```sql
DELIMITER //
CREATE PROCEDURE eliminar_mantenimiento(IN IDmantenimiento INT)
BEGIN
    DELETE FROM mantenimiento_tecnologia WHERE id_mantenimiento = IDmantenimiento;
    DELETE FROM mantenimiento WHERE id_mantenimiento = IDmantenimiento;
END//
DELIMITER ; 
```
### 6. Agregar un nuevo insumo.
Inserta un nuevo insumo en la base de datos con la información proporcionada.
```sql
DELIMITER //
CREATE PROCEDURE agregar_insumo (IN nombre_E VARCHAR(200), IN descripcion_E  TEXT, IN stock_E  INT , IN Precio_unitario_E  DECIMAL(10,2), IN stock_minimo_E INT)
BEGIN
    INSERT INTO insumos (nombre, descripcion, stock, Precio_unitario, stock_minimo) VALUES
    (nombre_E, descripcion_E, stock_E, Precio_unitario_E, stock_minimo_E );
END//
DELIMITER ;
```
### 7. Modificar el estado del pedido de un cliente.
Actualiza el estado de un pedido específico en la base de datos.
```sql
DELIMITER //
CREATE PROCEDURE modificar_estado(IN id_e INT, IN nuevo_estado VARCHAR(50))
BEGIN
    UPDATE cliente_venta
    SET estado = nuevo_estado
    WHERE id = id_e;
END//
DELIMITER ;
```
### 8. Buscar entregas por estado.
Devuelve todos los registros de entregas que coincidan con el estado especificado.
```sql
DELIMITER //
CREATE PROCEDURE estado_entregas(IN estadoBuscar VARCHAR(50))
BEGIN
    SELECT * FROM cliente_venta cv
    where cv.estado = estadoBuscar;
END//
DELIMITER ;
```
### 9. Eliminar relaciones de una tecnología.
Elimina todas las relaciones de una tecnología específica en varias tablas asociadas.

```sql
DELIMITER //
CREATE PROCEDURE borrar_relaciones_tecnologias(IN IDtecnologia INT)
BEGIN
    DELETE FROM tecnologias_terreno tt WHERE tt.id_tecnologia = IDtecnologia;
    DELETE FROM habitats_tecnologias ht WHERE ht.id_tecnologia = IDtecnologia;
    DELETE FROM mantenimiento_tecnologia mt WHERE mt.id_tecnologia = IDtecnologia;
END//
DELIMITER ;
```

## Contacto
Para cualquier pregunta o sugerencia, por favor contacta a:
- **Nombre:** Laura Amaya
- **Email:** laurasofiaamayacasado@gmail.com