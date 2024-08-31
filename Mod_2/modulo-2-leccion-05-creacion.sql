CREATE SCHEMA ejercicios_2;    --  Crea un nuevo esquema (o base de datos) llamado
USE ejercicios_2;              --  Selecciona el esquema ejercicios_2 para que todas las operaciones SQL siguientes se realicen en él.

-- Ejercicio 1: Crear la tabla Empleadas

CREATE TABLE Empleadas (   --  Crea una nueva tabla en la base de datos para almacenar datos estructurados en filas y columnas.
    id_empleada INT,       -- INT: Define una columna que almacenará números enteros.
    salario INT,
    nombre VARCHAR(50),    -- Define una columna que almacenará cadenas de texto de longitud variable, hasta un máximo especificado.
    apellido VARCHAR(100),
    pais CHAR(3)
);


-- Ejercicio 2: Para agregar una restricción que verifique que la edad sea mayor a 16 años, primero creamos la tabla Personas2 con la restricción:

CREATE TABLE Personas2 ( 
    id INT NOT NULL,      
    apellido VARCHAR(100) NOT NULL,   
    nombre VARCHAR(50),
    edad INT,
    ciudad VARCHAR(25) DEFAULT 'Madrid',
    CHECK (edad > 16) 
);

-- Ejercicio 3: Crea las tabla Empleadas y empleadas_en_proyectos, definiendo claves primarias, claves foránea, tipos de datos, etc. 
-- Haz que cuando se elimine una Empleada, se eliminen todas las entradas de esa empleada asociadas en empleadas_en_proyectos.

CREATE TABLE Empleadas (
    id_empleada INT AUTO_INCREMENT PRIMARY KEY,
    salario INT,
    nombre VARCHAR(50),
    apellido VARCHAR(100),
    pais VARCHAR(3)
);

-- Crear la tabla empleadas_en_proyectos para ver qué empleadas están en cada proyecto con claves foráneas:

-- Claves primarias: Para garantizar que cada empleada tenga un identificador único.
-- Claves foráneas: Para relacionar la tabla Empleadas con la tabla empleadas_en_proyectos.
-- Restricciones y otras características: Para asegurar la integridad y consistencia de los datos.

CREATE TABLE empleadas_en_proyectos ( 
    empleada_en_proyecto INT, 
    id_proyecto INT,
    PRIMARY KEY (empleada_en_proyecto, id_proyecto), 
    CONSTRAINT fk_empleadas_proyectos				 
			FOREIGN KEY (empleada_en_proyecto)       
			REFERENCES empleadas (id_empleada)      
			ON DELETE CASCADE                        
            ON UPDATE CASCADE
);

CREATE TABLE proyecto (
	id_proyecto INT AUTO_INCREMENT,
    nombre_proyecto VARCHAR (20),
    PRIMARY KEY (id_proyecto));


--  Ejercicio 4: Crear la tabla customers
-- Primero, crea un nuevo esquema y actívalo:

CREATE SCHEMA creacion_tienda;
USE creacion_tienda;

-- Ahora, crea la tabla customers:
CREATE TABLE customers (
    id_customer INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    email VARCHAR(255),
    telefono VARCHAR(15)
);

-- Ahora, crea la tabla customers:
CREATE TABLE employees (
    id_employee INT PRIMARY KEY,
    nombre VARCHAR(255),
    posicion VARCHAR(255),
    salario DECIMAL(10,2),
    fecha_contratacion DATE
);

--  Ejercicio 6: Crear las tablas con claves foráneas y restricciones
--  1. Crear la tabla clientes2 (similar a customers, pero con restricciones):

CREATE TABLE clientes2 (
    id_cliente INT PRIMARY KEY, 
    nombre VARCHAR(255),       
    direccion VARCHAR(255),
    email VARCHAR(255),
    telefono VARCHAR(15),
    limite_credito DECIMAL(10,2) CHECK (limite_credito >= 0)
);

--  2.Crear la tabla empleados2 (similar a employees, pero con clave foránea):

CREATE TABLE empleados2 (
    id_empleado INT PRIMARY KEY,     
    nombre VARCHAR(255),
    posicion VARCHAR(255),
    salario DECIMAL(10,2),
    fecha_contratacion DATE,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes2(id_cliente) 
);

