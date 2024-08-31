-- 1. Renombrar la tabla t1 a t2
CREATE TABLE t1 (a INTEGER, b CHAR(10));

RENAME TABLE t1 TO t2;

-- 2. Cambiar el tipo de la columna a de INTEGER a TINYINT NOT NULL
ALTER TABLE t2 MODIFY COLUMN a TINYINT NOT NULL;

-- 3. Cambiar el tipo de la columna b a CHAR(20) y renombrarla como c
ALTER TABLE t2 CHANGE b c CHAR(20);

-- 4. Añadir una nueva columna d de tipo TIMESTAMP (YYYY-MM-DD HH:MM:SS)
ALTER TABLE t2 ADD d TIMESTAMP;

-- 5. Eliminar la columna c
ALTER TABLE t2 DROP COLUMN c;

-- 6. Crear una tabla t3 idéntica a la tabla t2
CREATE TABLE t3 LIKE t2;

-- 7. Eliminar la tabla t2 y renombrar t3 a t1
DROP TABLE t2;
RENAME TABLE t3 TO t1;

-- 8. Crear una copia de la tabla customers llamada customers_mod
#CREATE TABLE IF NOT EXISTS customers_mod 
#SELECT * 
#FROM customers;
CREATE TABLE customers_mod LIKE customers;

-- 9. Inserción de datos específicos en customers_mod
INSERT INTO customers_mod (customernumber, customername, contactlastname, contactfirstname, phone, addressline1, addressline2, city, state, postalcode, country, salesrepemployeenumber, creditlimit) 
VALUES (343, 'Adalab', 'Rodriguez', 'Julia', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 15, 20000000);

-- 10. Inserción de datos con valores faltantes en customers_mod
INSERT INTO customers_mod (customernumber, customername, contactlastname, contactfirstname, phone, addressline1, addressline2, city, state, postalcode, country, salesrepemployeenumber, creditlimit) 
VALUES (344, 'La pegatina After', 'Santiago', 'Maricarmen', '00000000', 'Travesía del rave', NULL, 'Palma de Mallorca', NULL, '07005', 'España', 10, 45673453);

-- 11. Inserción de 5 filas nuevas en customers_mod
INSERT INTO customers_mod (customernumber, customername, contactlastname, contactfirstname, phone, addressline1, addressline2, city, state, postalcode, country, salesrepemployeenumber, creditlimit) 
VALUES 
(345, 'Cliente1', 'Apellido1', NULL, '111111111', 'Dirección 1', 'Segunda dirección 1', 'Ciudad1', 'Estado1', '00001', 'España', 1, 5000),
(346, 'Cliente2', 'Apellido2', NULL, '222222222', 'Dirección 2', 'Segunda dirección 2', 'Ciudad2', 'Estado2', '00002', 'España', 2, 6000),
(347, 'Cliente3', 'Apellido3', 'Nombre3', '333333333', 'Dirección 3', 'Segunda dirección 3', 'Ciudad3', 'Estado3', '00003', 'España', 3, 7000),
(348, 'Cliente4', 'Apellido4', 'Nombre4', '444444444', 'Dirección 4', 'Segunda dirección 4', 'Ciudad4', 'Estado4', '00004', 'España', 4, 8000),
(349, 'Cliente5', 'Apellido5', NULL, '555555555', 'Dirección 5', 'Segunda dirección 5', 'Ciudad5', 'Estado5', '00005', 'España', 5, 9000);


-- 12. Actualizar los datos faltantes para La pegatina After
UPDATE customers_mod 
SET addressline1 = 'Polígono Industrial de Son Castelló', 
    addressline2 = 'Nave 92', 
    city = 'Palma de Mallorca', 
    state = 'España', 
    postalcode = '28123', 
    salesrepemployeenumber = 25, 
    creditlimit = 5000000 
WHERE customernumber = 344;

-- 13. Romper la tabla customers_mod (¡Cuidado! Esto es solo educativo, asegúrate de tener una copia de seguridad antes de ejecutar)
UPDATE customers_mod 
SET addressline1 = 'Vamos', 
    addressline2 = 'a', 
    postalcode = 'fastidiar', 
    country = 'la tabla :)';

-- 14. Actualizar los primeros 10 clientes para que sean gestionados por la representante de ventas número 2
UPDATE customers_mod 
SET salesrepemployeenumber = 2 
WHERE customernumber IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);

-- 15. Eliminar registros con NULL en ContactFirstName
DELETE FROM customers_mod 
WHERE contactfirstname IS NULL;

-- 16. Ejecutar un DELETE sin WHERE (¡Cuidado! Esto eliminará todos los registros de la tabla)
DELETE FROM customers_mod