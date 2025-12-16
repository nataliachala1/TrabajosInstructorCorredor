--Trabajo de la aprendiz Natalia Chala
--Se crea la base de datos Cine

CREATE DATABASE Cine;
USE Cine;

--Se crea tabla Sala
CREATE TABLE Sala (
id_sala INT PRIMARY KEY,
numero INT
);

--Se crea tabla Comida
CREATE TABLE Comida (
id_comida INT PRIMARY KEY,
nombre VARCHAR (50),
descripcion VARCHAR (100),
precio DECIMAL (10,3)
);

--Se crea tabla Cliente
CREATE TABLE Cliente (
id_cliente INT PRIMARY KEY,
nombre VARCHAR (50),
correo VARCHAR (100),
edad INT
);

--Se crea tabla Genero
CREATE TABLE Genero (
id_genero INT PRIMARY KEY,
nombre VARCHAR (50)
);

--Se crea tabla Pelicula
CREATE TABLE Pelicula (
id_pelicula INT PRIMARY KEY,
id_genero INT,
titulo VARCHAR (50),
descripcion VARCHAR (100),
FOREIGN KEY (id_genero) REFERENCES Genero(id_genero)
);

--Se crea tabla Funcion
CREATE TABLE Funcion (
id_funcion INT PRIMARY KEY,
id_pelicula INT,
id_sala INT,
fecha DATE,
hora TIME,
FOREIGN KEY (id_pelicula) REFERENCES Pelicula(id_pelicula),
FOREIGN KEY (id_sala) REFERENCES Sala(id_sala)
);

--Se crea tabla Venta comida
CREATE TABLE venta_comida (
id_venta INT PRIMARY KEY,
id_cliente INT,
id_comida INT,
cantidad INT,
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
FOREIGN KEY (id_comida) REFERENCES Comida(id_comida)
);

--Se crea tabla Ticket
CREATE TABLE Ticket (
id_ticket INT PRIMARY KEY,
id_cliente INT,
id_funcion INT,
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
FOREIGN KEY (id_funcion) REFERENCES Funcion(id_funcion)
);

--Insertar nuevos datos en sala
INSERT INTO Sala (id_sala, numero)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4);

--Insertar nuevos datos en comida
INSERT INTO Comida (id_comida, nombre, descripcion, precio) 
VALUES (1, 'Palomitas Grandes', 'Palomitas de maíz', 12.500),
(2, 'Refresco Grande', 'Bebida gaseosa de 32 oz', 7.000),
(3, 'Nachos con Queso', 'Tortilla chips con salsa de queso', 10.000),
(4, 'Combo Cine', 'Palomitas + Refresco + Nachos', 18.900);

--Insertar nuevos datos en cliente
INSERT INTO Cliente (id_cliente, nombre, correo, edad) 
VALUES (1, 'Laura Martínez', 'lauramartinez@gmail.com', 28),
(2, 'Carlos Gómez', 'carlosgomez@gmail.com', 35),
(3, 'Sofía Rodríguez', 'sofiarodriguez@gmail.com', 22),
(4, 'Andrés Peña', 'andrespena@gmail.com', 41);

--Insertar nuevos datos en genero
INSERT INTO Genero (id_genero, nombre) 
VALUES (1, 'Acción'),
(2, 'Comedia'),
(3, 'Drama'),
(4, 'Animación');

--Insertar nuevos datos en Pelicula
INSERT INTO Pelicula (id_pelicula, id_genero, titulo, descripcion) 
VALUES (1, 1, 'Misión Imposible', 'Agente secreto en misión peligrosa'),
(2, 2, 'Loco por Mary', 'Una comedia romántica divertida'),
(3, 3, 'En busca de la felicidad', 'Historia inspiradora de superación'),
(4, 4, 'Toy Story', 'Juguetes que cobran vida');

--Insertar nuevos datos Funcion
INSERT INTO Funcion (id_funcion, id_pelicula, id_sala, fecha, hora)
VALUES (1, 1, 1, '2025-06-12', '18:00:00'),
(2, 2, 2, '2025-06-12', '20:00:00'),
(3, 3, 3, '2025-06-13', '16:30:00'),
(4, 4, 4, '2025-06-13', '14:00:00');

--Insertar nuevos datos Ticket
INSERT INTO Ticket (id_ticket, id_cliente, id_funcion)
VALUES (1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4);

--Insertar nuevos datos en venta comida
INSERT INTO venta_comida (id_venta, id_cliente, id_comida, cantidad)
VALUES (1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 4, 1),
(4, 4, 3, 3);

--Select

SELECT  pe.titulo AS Persona,
		sa.numero AS Sala
FROM Funcion fu
INNER JOIN Pelicula pe ON pe.id_pelicula = fu.id_pelicula
INNER JOIN Sala sa ON sa.id_sala =  fu.id_sala;

SELECT  c.nombre AS Persona,
		pe.titulo AS Pelicula,
		fu.fecha AS Fecha,
		fu.hora AS Hora
FROM Ticket ti
INNER JOIN Cliente c ON ti.id_cliente = c.id_cliente
INNER JOIN Funcion fu ON ti.id_funcion = fu.id_funcion
INNER JOIN Pelicula pe ON fu.id_pelicula = pe.id_pelicula;

SELECT *
FROM Cliente
CROSS JOIN Comida;

SELECT c.nombre, vc.cantidad AS Cantidad_comida
FROM venta_comida vc
CROSS JOIN Comida c;

SELECT f.id_funcion,
       p.titulo AS Pelicula,
       c.nombre AS Cliente
FROM Ticket t
RIGHT JOIN Funcion f ON t.id_funcion = f.id_funcion
RIGHT JOIN Pelicula p ON f.id_pelicula = p.id_pelicula
LEFT JOIN Cliente c ON t.id_cliente = c.id_cliente;

SELECT c.nombre AS Cliente,
       p.titulo AS Pelicula
FROM Cliente c
LEFT JOIN Ticket t ON c.id_cliente = t.id_cliente
LEFT JOIN Funcion f ON t.id_funcion = f.id_funcion
LEFT JOIN Pelicula p ON f.id_pelicula = p.id_pelicula;

SELECT  nombre AS Comida,
		descripcion AS Descripcion
FROM Comida;


--Subconsulta

SELECT *
FROM Pelicula
WHERE id_pelicula IN (
	SELECT id_pelicula
	FROM Funcion
	WHERE CAST(fecha AS DATE) = CAST(GETDATE() AS DATE)
);

SELECT nombre
FROM Cliente
WHERE id_cliente IN (
	SELECT id_cliente
	FROM venta_comida
	WHERE id_comida = (
		SELECT TOP 1 id_comida
		FROM Comida
		ORDER BY precio DESC
	)
);

--Sentencias UPDATE Y DELETE
UPDATE Cliente
SET nombre = 'Sofia Andrade'
WHERE id_cliente = 1;

UPDATE Pelicula
SET titulo = 'Terremoto'
WHERE id_pelicula = 1;

UPDATE Genero
SET nombre = 'Acción y ficción'
WHERE id_genero = 1;

UPDATE Comida
SET nombre = 'Crispetas'
WHERE id_comida = 1;

UPDATE Comida
SET descripcion = 'Crujientes y cubiertas de mantequilla'
WHERE id_comida = 1;

DELETE Comida
WHERE id_comida = 1;

DELETE Cliente
WHERE id_cliente = 1;

DELETE Pelicula
WHERE id_pelicula = 1;

DELETE Funcion
WHERE id_funcion = 1;

DELETE Sala
WHERE id_sala = 1;

--Funciones

SELECT SUM(precio) AS Suma_precio
FROM Comida;

SELECT AVG(precio) AS Promedio_precio
FROM Comida;

SELECT DATALENGTH(nombre) AS Columnas
FROM Comida;

SELECT UPPER(nombre) AS Comida
FROM Comida;

SELECT LOWER(nombre) AS Comida
FROM Comida;

--Truncate
TRUNCATE TABLE Cliente;

--Drop
DROP TABLE Ticket;
