--Trabajo de la aprendiz Natalia Chala
-- Crear la base de datos
CREATE DATABASE Veterinaria;
USE Veterinaria;

-- Tabla de clientes
CREATE TABLE Cliente (
id_cliente INT PRIMARY KEY,
nombre VARCHAR(100),
telefono VARCHAR(20),
correo VARCHAR(100),
direccion VARCHAR(150)
);

-- Tabla de mascotas
CREATE TABLE Mascota (
id_mascota INT PRIMARY KEY,
id_cliente INT,
nombre VARCHAR(50),
especie VARCHAR(50),
raza VARCHAR(50),
edad INT,
sexo VARCHAR(10),
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabla de veterinarios
CREATE TABLE Veterinario (
id_veterinario INT PRIMARY KEY,
nombre VARCHAR(100),
especialidad VARCHAR(100),
telefono VARCHAR(20),
correo VARCHAR(100)
);

-- Tabla de citas
CREATE TABLE Cita (
id_cita INT PRIMARY KEY,
id_mascota INT,
id_veterinario INT,
fecha DATE,
motivo VARCHAR(200),
FOREIGN KEY (id_mascota) REFERENCES Mascota(id_mascota),
FOREIGN KEY (id_veterinario) REFERENCES Veterinario(id_veterinario)
);

-- Tabla de tratamientos
CREATE TABLE Tratamiento (
id_tratamiento INT PRIMARY KEY,
id_cita INT,
descripcion VARCHAR(200),
medicamentos VARCHAR(200),
observaciones TEXT,
FOREIGN KEY (id_cita) REFERENCES Cita(id_cita)
);

-- Tabla de servicios
CREATE TABLE Servicio (
id_servicio INT PRIMARY KEY,
nombre VARCHAR(100),
descripcion VARCHAR(200),
precio DECIMAL(10,2)
);

-- Tabla de facturas
CREATE TABLE Factura (
id_factura INT PRIMARY KEY,
id_cliente INT,
fecha DATE,
total DECIMAL(10,2),
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabla de detalle de factura
CREATE TABLE DetalleFactura (
id_detalle INT PRIMARY KEY,
id_factura INT,
id_servicio INT,
cantidad INT,
subtotal DECIMAL(10,2),
FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

-- Insertar clientes
INSERT INTO Cliente (id_cliente, nombre, telefono, correo, direccion) 
VALUES (1, 'María Pérez', '3001234567', 'maria.perez@email.com', 'Calle 10 #20-30'),
(2, 'Carlos Gómez', '3019876543', 'carlos.gomez@email.com', 'Carrera 5 #12-15'),
(3, 'Lucía Ríos', '3124567890', 'lucia.rios@email.com', 'Av. Siempre Viva #123');

-- Insertar mascotas
INSERT INTO Mascota (id_mascota, id_cliente, nombre, especie, raza, edad, sexo) VALUES
(1, 1, 'Luna', 'Perro', 'Labrador', 4, 'Hembra'),
(2, 2, 'Max', 'Gato', 'Siames', 2, 'Macho'),
(3, 1, 'Toby', 'Perro', 'Beagle', 6, 'Macho');

-- Insertar veterinarios
INSERT INTO Veterinario (id_veterinario, nombre, especialidad, telefono, correo) VALUES
(1, 'Dra. Laura Torres', 'Medicina general', '3201112233', 'laura.torres@vet.com'),
(2, 'Dr. Andrés Mejía', 'Cirugía', '3104445566', 'andres.mejia@vet.com');

-- Insertar citas
INSERT INTO Cita (id_cita, id_mascota, id_veterinario, fecha, motivo) VALUES
(1, 1, 1, '2025-06-10', 'Vacunación anual'),
(2, 2, 1, '2025-06-11', 'Revisión general'),
(3, 3, 2, '2025-06-12', 'Problemas digestivos');

-- Insertar tratamientos
INSERT INTO Tratamiento (id_tratamiento, id_cita, descripcion, medicamentos, observaciones) VALUES
(1, 1, 'Aplicación de vacuna antirrábica', 'Vacuna Rabican', 'Sin reacciones.'),
(2, 2, 'Chequeo completo, sin anomalías', 'Ninguno', 'Gato saludable.'),
(3, 3, 'Tratamiento digestivo', 'Omeprazol veterinario', 'Se recomienda dieta.');

-- Insertar servicios
INSERT INTO Servicio (id_servicio, nombre, descripcion, precio) VALUES
(1, 'Consulta general', 'Consulta médica general para cualquier mascota.', 50.00),
(2, 'Vacunación', 'Aplicación de vacuna según el esquema de salud.', 30.00),
(3, 'Desparasitación', 'Tratamiento contra parásitos internos y externos.', 25.00);

-- Insertar facturas
INSERT INTO Factura (id_factura, id_cliente, fecha, total) VALUES
(1, 1, '2025-06-10', 80.00),
(2, 2, '2025-06-11', 50.00);

-- Insertar detalles de factura
INSERT INTO DetalleFactura (id_detalle, id_factura, id_servicio, cantidad, subtotal) VALUES
(1, 1, 1, 1, 50.00),  -- Consulta
(2, 1, 2, 1, 30.00),  -- Vacunación
(3, 2, 1, 1, 50.00);  -- Consulta 

SELECT * FROM Cliente;
SELECT * FROM Mascota;
SELECT * FROM Veterinario;
SELECT * FROM Cita;

SELECT 
    c.nombre AS Cliente,
    m.nombre AS Mascota,
    ct.fecha,
    ct.motivo
FROM Cliente c
JOIN Mascota m ON c.id_cliente = m.id_cliente
JOIN Cita ct ON m.id_mascota = ct.id_mascota;

SELECT 
    v.nombre AS Veterinario,
    t.descripcion AS Tratamiento,
    t.medicamentos,
    t.observaciones,
    ct.fecha
FROM Tratamiento t
INNER JOIN Cita ct ON t.id_cita = ct.id_cita
INNER JOIN Veterinario v ON ct.id_veterinario = v.id_veterinario;

SELECT 
    f.id_factura,
    c.nombre AS Cliente,
    f.fecha,
    f.total
FROM Factura f
INNER JOIN Cliente c ON f.id_cliente = c.id_cliente;
