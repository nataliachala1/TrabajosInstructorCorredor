--Trabajo de la aprendiz Natalia Chala
--Se crea la base de datos Aeropuerto

CREATE DATABASE Aeropuerto;
USE Aeropuerto;

CREATE TABLE Cliente (
id_cliente INT PRIMARY KEY,
nombre VARCHAR(50),
documento VARCHAR (20),
telefono VARCHAR(20),
correo VARCHAR(50)
);

CREATE TABLE Empleado (
id_empleado INT PRIMARY KEY,
nombre VARCHAR(50),
telefono VARCHAR(20),
correo VARCHAR(50)
);

CREATE TABLE Avion (
id_avion INT PRIMARY KEY,
numero INT,
capacidad INT,
aerolinea VARCHAR (50)
);

CREATE TABLE Destino (
id_destino INT PRIMARY KEY,
ciudad VARCHAR (50),
pais VARCHAR (50)
);

CREATE TABLE Vuelo (
id_vuelo INT PRIMARY KEY,
id_avion INT,
id_destino INT,
fecha_salida DATE,
fecha_llegada DATE,
FOREIGN KEY (id_avion) REFERENCES Avion(id_avion),
FOREIGN KEY (id_destino) REFERENCES Destino(id_destino)
);

CREATE TABLE MetodoPago (
id_metodo INT PRIMARY KEY,
tipo VARCHAR (50)
);


CREATE TABLE Pago (
id_pago INT PRIMARY KEY,
id_cliente INT,
id_metodo INT,
precio DECIMAL (10,3),
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
FOREIGN KEY (id_metodo) REFERENCES MetodoPago(id_metodo)
);

CREATE TABLE Ticket (
id_ticket INT PRIMARY KEY,
id_cliente INT,
id_vuelo INT,
id_pago INT,
fecha DATE,
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
FOREIGN KEY (id_vuelo) REFERENCES Vuelo(id_vuelo),
FOREIGN KEY (id_pago) REFERENCES Pago(id_pago)
);

INSERT INTO Cliente (id_cliente, nombre, documento, telefono, correo)
VALUES 
(1,'Laura Martínez', 'CC123456', '3001234567', 'laura@gmail.com'),
(2,'Carlos Gómez', 'CC789101', '3017654321', 'carlos@hotmail.com'),
(3,'Sofía Díaz', 'CC345678', '3025554321', 'sofia@gmail.com'),
(4,'Juan Pérez', 'CC987654', '3041239876', 'juan@gmail.com');

INSERT INTO Empleado (id_empleado,nombre, telefono, correo)
VALUES 
(1,'Pedro Ruiz', '3101234567', 'pedro@aeropuerto.com'),
(2,'Ana López', '3127654321', 'ana@aeropuerto.com'),
(3,'Miguel Torres', '3134567890', 'miguel@aeropuerto.com'),
(4,'Lucía Romero', '3148765432', 'lucia@aeropuerto.com');

INSERT INTO Avion (id_avion, numero, capacidad, aerolinea)
VALUES 
(1, 101, 150, 'Avianca'),
(2, 102, 180, 'LATAM'),
(3,103, 200, 'Copa Airlines'),
(4, 104, 170, 'Viva Air');

INSERT INTO Destino (id_destino,ciudad, pais)
VALUES 
(1,'Bogotá', 'Colombia'),
(2,'Madrid', 'España'),
(3,'Miami', 'Estados Unidos'),
(4,'Buenos Aires', 'Argentina');

INSERT INTO Vuelo (id_vuelo,id_avion, id_destino, fecha_salida, fecha_llegada)
VALUES 
(1,1, 2, '2025-07-01', '2025-07-02'),
(2,2, 3, '2025-07-03', '2025-07-04'),
(3,3, 4, '2025-07-05', '2025-07-06'),
(4,4, 1, '2025-07-07', '2025-07-08');

INSERT INTO MetodoPago (id_metodo,tipo)
VALUES 
(1,'Tarjeta de crédito'),
(2,'Transferencia bancaria'),
(3,'Efectivo'),
(4,'PayPal');

INSERT INTO Pago (id_pago, id_cliente, id_metodo, precio)
VALUES 
(1,1, 1, 39940.000),
(2,2, 2, 820.000),
(3,3, 3, 695000.000),
(4,4, 4, 910000.000);

INSERT INTO Ticket (id_ticket,id_cliente, id_vuelo, id_pago, fecha)
VALUES 
(1,1, 1, 1, '2025-06-15'),
(2,2, 2, 2, '2025-06-16'),
(3,3, 3, 3, '2025-06-17'),
(4,4, 4, 4, '2025-06-18');

SELECT *
FROM Ticket;

SELECT 
    c.nombre AS Cliente,
    d.ciudad AS Destino,
    d.pais,
    v.fecha_salida,
    v.fecha_llegada
FROM Ticket t
INNER JOIN Cliente c ON t.id_cliente = c.id_cliente
INNER JOIN Vuelo v ON t.id_vuelo = v.id_vuelo
INNER JOIN Destino d ON v.id_destino = d.id_destino;

SELECT 
    v.id_vuelo,
    a.numero AS NumeroAvion,
    a.aerolinea,
    d.ciudad AS Destino,
    v.fecha_salida
FROM Vuelo v
JOIN Avion a ON v.id_avion = a.id_avion
JOIN Destino d ON v.id_destino = d.id_destino;

UPDATE Cliente
SET correo = 'laura.nueva@gmail.com'
WHERE id_cliente = 1;



