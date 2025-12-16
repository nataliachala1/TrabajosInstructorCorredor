CREATE DATABASE Hotel;
USE Hotel;

CREATE TABLE cliente(
id_cliente INT PRIMARY KEY,
nombre VARCHAR(100),
telefono VARCHAR(50),
documento VARCHAR(50)
);

CREATE TABLE habitaciones(
id_habitaciones INT PRIMARY KEY,
numero INT,
precio DECIMAL(10,2),
estado VARCHAR(20)
);

CREATE TABLE reservas(
id_reserva INT PRIMARY KEY,
id_habitaciones INT,
id_cliente INT,
fecha_entrada DATE,
fecha_salida DATE,
estado VARCHAR(20),
FOREIGN KEY (id_habitaciones) REFERENCES habitaciones(id_habitaciones),
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE pagos(
id_pago INT PRIMARY KEY,
id_reserva INT,
pago_total DECIMAL(10,2),
fecha_pago DATE,
FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva)
);

-- Tabla de empleados
CREATE TABLE empleado (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(100),
    cargo VARCHAR(50),
    telefono VARCHAR(50)
);

-- Tabla de servicios del hotel
CREATE TABLE servicio (
    id_servicio INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(200),
    precio DECIMAL(10,2)
);

-- Tabla de uso de servicios por cliente
CREATE TABLE uso_servicio (
    id_uso INT PRIMARY KEY,
    id_cliente INT,
    id_servicio INT,
    fecha DATE,
    cantidad INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id_servicio)
);

INSERT INTO cliente(id_cliente,nombre,telefono,documento)
VALUES (1,'Natalia Chala','3137701099','1075508373'),
(2,'Valery Trujillo','3137701092','1075508149'),
(3,'Maria Rodriguez','3137701098','1087609383');

INSERT INTO habitaciones(id_habitaciones,numero,precio,estado)
VALUES (1,2,40.000,'Disponible'),
(2,3,50.00,'Disponible'),
(3,4,80.00,'Disponible');

INSERT INTO reservas(id_reserva,id_habitaciones,id_cliente,fecha_entrada,fecha_salida,estado)
VALUES (1,2,1,'2025-05-15','2025-05-16','Activo');

INSERT INTO pagos(id_pago,id_reserva,pago_total,fecha_pago)
VALUES (1,1,40.000,'2025-05-25');

INSERT INTO empleado (id_empleado, nombre, cargo, telefono)
VALUES
(1, 'Camila Torres', 'Recepcionista', '3201112233'),
(2, 'Luis Fernández', 'Administrador', '3104456677'),
(3, 'María Salazar', 'Aseo', '3112233445');

INSERT INTO servicio (id_servicio, nombre, descripcion, precio)
VALUES
(1, 'Spa', 'Acceso al spa del hotel por 1 hora', 30.00),
(2, 'Restaurante', 'Desayuno buffet completo', 15.00),
(3, 'Lavandería', 'Servicio de lavado de ropa por prenda', 5.00);

INSERT INTO uso_servicio (id_uso, id_cliente, id_servicio, fecha, cantidad)
VALUES
(1, 1, 1, '2025-05-15', 1), -- Natalia Chala usó el spa
(2, 2, 2, '2025-05-15', 1), -- Valery Trujillo usó el restaurante
(3, 3, 3, '2025-05-16', 4); -- María Rodríguez usó lavandería 4 veces

UPDATE habitaciones
SET estado = 'ocupada'
WHERE id_habitaciones = 2;
