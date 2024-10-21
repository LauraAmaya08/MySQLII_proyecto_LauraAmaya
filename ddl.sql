CREATE DATABASE la_huerta_encantadaDB;
USE la_huerta_encantadaDB;

-- Categoria de funciones, ejemplo: Mantenimiento, Administración

CREATE TABLE IF NOT EXISTS categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE
);

-- Funciones desempeñadas por empleados

CREATE TABLE IF NOT EXISTS funciones (
    id_funcion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE,
    descripcion TEXT,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) 
);


-- Información de empleados 

CREATE TABLE IF NOT EXISTS empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(13) UNIQUE NOT NULL,
    direccion VARCHAR(150),
    email VARCHAR(300) UNIQUE,
    fecha_contratacion DATE NOT NULL,
    salario INT NOT NULL,
    estado VARCHAR(15) 
);

-- Relación entre empleados y funciones

CREATE TABLE empleado_funciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_funcion INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_funcion) REFERENCES funciones(id_funcion) 
);

-- Información de capacitaciones para empleados 

CREATE TABLE IF NOT EXISTS capacitaciones (
    id_capacitacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE,
    descripcion TEXT,
    fecha_realizacion DATE NOT NULL
);

-- Relación entre empleados y capacitaciones

CREATE TABLE IF NOT EXISTS empleado_capacitaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_capacitacion INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_capacitacion) REFERENCES capacitaciones(id_capacitacion) 
);

-- Horarios de trabajo de empleados 

CREATE TABLE IF NOT EXISTS horarios (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    hora_inicio VARCHAR(5) NOT NULL,
    hora_fin VARCHAR(5) NOT NULL
);


-- Relacion empleados con su horario de trabajo

CREATE TABLE IF NOT EXISTS empleado_horarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_horario INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado),
    FOREIGN KEY (id_horario) REFERENCES horarios(id_horario),
    dias_semana INT NOT NULL 
);

-- Ciudades
CREATE TABLE IF NOT EXISTS ciudad (
    id_ciudad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL UNIQUE
);


-- Tipos de clientes

CREATE TABLE IF NOT EXISTS tipo_cliente (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descuento DECIMAL(10,2) NOT NULL UNIQUE
);

-- Información clientes

CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(13) UNIQUE NOT NULL,
    direccion VARCHAR(150),
    email VARCHAR(300) UNIQUE,
    id_ciudad INT NOT NULL,
    id_tipo INT,
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad),
    FOREIGN KEY (id_tipo) REFERENCES tipo_cliente(id_tipo)
);


-- Información proveedores 

CREATE TABLE IF NOT EXISTS proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(150),
    telefono VARCHAR(13) UNIQUE NOT NULL,
    id_ciudad INT NOT NULL,
    estado ENUM('Activo','Inactivo','Favorito') NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
);


-- Registro de ordenes a proveedores

CREATE TABLE IF NOT EXISTS orden (
    id_orden INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT NOT NULL,
    total DECIMAL(10, 2),
    fecha DATE NOT NULL,
    estado ENUM('Entregado','Pendiente','Cancelada','En proceso') NOT NULL,
    FOREIGN KEY (id_proveedor) REFERENCES proveedor(id_proveedor)
);

-- Información de insumos

CREATE TABLE IF NOT EXISTS insumos (
    id_insumo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    stock INT NOT NULL,
    Precio_unitario DECIMAL(10, 2) NOT NULL,
    stock_minimo INT NOT NULL
);

-- Detalles de orden (insumos)

CREATE TABLE IF NOT EXISTS insumos_orden (
    id_insumo INT NOT NULL,
    id_orden INT NOT NULL,
    FOREIGN KEY (id_insumo) REFERENCES insumos(id_insumo),
    FOREIGN KEY (id_orden) REFERENCES orden(id_orden),
    cantidad INT NOT NULL 
);

-- Tipos de productos 

CREATE TABLE IF NOT EXISTS tipo_producto (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT
);


-- Información de lotes de cultivo

CREATE TABLE IF NOT EXISTS cultivo (
    id_cultivo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estado ENUM('Excelente','Regular','Malo') NOT NULL,
    cantidad INT NOT NULL
);

-- Información productos

CREATE TABLE IF NOT EXISTS producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE,
    descripcion TEXT,
    precio_unitario DECIMAL (10,2) NOT NULL,
    peso DECIMAL(10,2) NOT NULL,
    es_Cultivo BOOLEAN NOT NULL,
    id_cultivo INT,
    id_tipo INT NOT NULL,
    stock INT NOT NULL,
    fecha_vencimiento DATE NOT NULL,
    estado ENUM('Excelente','Regular','Malo') NOT NULL,
    FOREIGN KEY (id_cultivo) REFERENCES cultivo(id_cultivo),
    FOREIGN KEY (id_tipo) REFERENCES tipo_producto(id_tipo)
);

-- Insumos necesarios es productos

CREATE TABLE IF NOT EXISTS insumos_producto(
    id_insumo INT NOT NULL,
    id_producto INT NOT NULL,
    FOREIGN KEY (id_insumo) REFERENCES insumos(id_insumo),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    es_Escencial BOOLEAN NOT NULL
);


-- Información de terreno de siembra

CREATE TABLE IF NOT EXISTS terreno (
    id_terreno INT AUTO_INCREMENT PRIMARY KEY,
    capacidad INT NOT NULL,
    area DECIMAL(10, 2),
    estado ENUM('Ocupado','Vacío') NOT NULL
);

-- Relación entre la siembra y el terreno

CREATE TABLE IF NOT EXISTS cultivos_terreno(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cultivo INT NOT NULL,
    id_terreno INT NOT NULL,
    FOREIGN KEY (id_cultivo) REFERENCES cultivo(id_cultivo),
    FOREIGN KEY (id_terreno) REFERENCES terreno(id_terreno),
    fecha_siembra DATE NOT NULL,
    fecha_recoger DATE NOT NULL
);

-- Informacion de tecnologias

CREATE TABLE IF NOT EXISTS tecnologias (
    id_tecnologia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estado ENUM('Excelente','Regular','Malo') NOT NULL,
    es_Usado BOOLEAN NOT NULL
);

-- Relación entre terrenos y tecnologias 

CREATE TABLE IF NOT EXISTS tecnologias_terreno (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_tecnologia INT NOT NULL,
    id_terreno INT NOT NULL,
    FOREIGN KEY (id_tecnologia) REFERENCES tecnologias(id_tecnologia),
    FOREIGN KEY (id_terreno) REFERENCES terreno(id_terreno),
    fecha DATE NOT NULL 
);

-- Registros de mantenimientos de tecnologias 

CREATE TABLE IF NOT EXISTS mantenimiento (
    id_mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    descripcion TEXT,
    total DECIMAL(10,2) NOT NULL
);

-- Relacion entre los mantenimientos y tecnologias 

CREATE TABLE IF NOT EXISTS mantenimiento_tecnologia (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_tecnologia INT NOT NULL,
    id_mantenimiento INT NOT NULL,
    FOREIGN KEY (id_tecnologia) REFERENCES tecnologias(id_tecnologia),
    FOREIGN KEY (id_mantenimiento) REFERENCES mantenimiento(id_mantenimiento),
    fecha_realizacion DATE NOT NULL 
);

-- Registro de habitats de animales 

CREATE TABLE habitat (
    id_habitat INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    area DECIMAL(10, 2),
    capacidad INT NOT NULL
);

-- Relación entre habitats y tecnologias 

CREATE TABLE IF NOT EXISTS habitats_tecnologias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_tecnologia INT NOT NULL,
    id_habitat INT NOT NULL,
    FOREIGN KEY (id_tecnologia) REFERENCES tecnologias(id_tecnologia),
    FOREIGN KEY (id_habitat) REFERENCES habitat(id_habitat),
    fecha DATE NOT NULL 
);

-- Registro de usos de animales 

CREATE TABLE IF NOT EXISTS uso_animal (
    id_uso INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(100) NOT NULL UNIQUE,
    produccion VARCHAR(100)
);

-- Registro de especies 

CREATE TABLE IF NOT EXISTS especie (
    id_especie INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Registro de animales
CREATE TABLE IF NOT EXISTS animal (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    id_especie INT NOT NULL,
    id_uso INT NOT NULL,
    peso DECIMAL(10, 2),
    altura DECIMAL(10, 2),
    valor_unitario DECIMAL(10, 2) NOT NULL,
    estado ENUM('Excelente','Regular','Malo') NOT NULL,
    FOREIGN KEY (id_especie) REFERENCES especie(id_especie)
);

-- Usos de un animal
CREATE TABLE IF NOT EXISTS usos_animal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_uso INT NOT NULL,
    id_animal INT NOT NULL,
    FOREIGN KEY (id_uso) REFERENCES uso_animal(id_uso),
    FOREIGN KEY (id_animal) REFERENCES animal(id_animal)
);


-- Animales en un habitat
CREATE TABLE IF NOT EXISTS animales_habitat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_animal INT NOT NULL,
    id_habitat INT NOT NULL,
    fecha DATE NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_animal) REFERENCES animal(id_animal),
    FOREIGN KEY (id_habitat) REFERENCES habitat(id_habitat)
);



-- Registro ventas

CREATE TABLE IF NOT EXISTS venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    fecha DATE NOT NULL,
    total DECIMAL (10,2) NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

-- Detalles de la venta (productos)

CREATE TABLE IF NOT EXISTS productos_venta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);

-- Relación de clientes y sus compras

CREATE TABLE IF NOT EXISTS cliente_venta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    id_cliente INT NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    estado ENUM('Entregado','Pendiente','Cancelada','En proceso') NOT NULL
);

-- Registros de entrega 

CREATE TABLE IF NOT EXISTS entrega_venta (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT NOT NULL,
    fecha DATE NOT NULL,
    anotacion TEXT,
    FOREIGN KEY (id_venta) REFERENCES cliente_venta(id_venta)
);


-- Alertas, compras, auditoria

CREATE TABLE IF NOT EXISTS alertas (
    id_alerta INT AUTO_INCREMENT PRIMARY KEY,
    mensaje TEXT,
    fecha DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS auditoria (
    id_auditoria INT AUTO_INCREMENT PRIMARY KEY,
    mensaje TEXT,
    fecha DATE NOT NULL
);


-- Relación empleados - animales

CREATE TABLE IF NOT EXISTS animales_tratados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_animal INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha DATE NOT NULL,
    descripcion TEXT NOT NULL,
    valor_tratamiento DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_animal) REFERENCES animal(id_animal),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);