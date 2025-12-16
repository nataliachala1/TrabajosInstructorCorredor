CREATE DATABASE Logistica;
USE Logistica;

CREATE TABLE Ciudad (
id_ciudad INT PRIMARY KEY,
nombre VARCHAR(100)
);

CREATE TABLE Feria (
id_feria INT PRIMARY KEY,
nombre VARCHAR(100),
fecha_inicio DATE,
fecha_fin DATE
);

CREATE TABLE Empresa (
id_empresa INT PRIMARY KEY,
nombre VARCHAR(100)
);

CREATE TABLE Tematica (
id_tematica INT PRIMARY KEY,
nombre VARCHAR(100)
);

CREATE TABLE Pabellon (
id_pabellon INT PRIMARY KEY,
id_tematica INT,
id_feria INT,
capacidad INT,
FOREIGN KEY (id_tematica) REFERENCES Tematica(id_tematica),
FOREIGN KEY (id_feria) REFERENCES Feria(id_feria)
);

CREATE TABLE Stand (
id_stand INT PRIMARY KEY,
id_pabellon INT,
id_empresa INT,
numero INT,
FOREIGN KEY (id_pabellon) REFERENCES Pabellon (id_pabellon),
FOREIGN KEY (id_empresa) REFERENCES Empresa (id_empresa)
);

CREATE TABLE Persona (
id_persona INT PRIMARY KEY, 
nombre VARCHAR(100),
apellido VARCHAR(100),
identificacion VARCHAR(100),
email VARCHAR(100),
telefono VARCHAR(100)
);

CREATE TABLE Ponente (
id_ponente INT PRIMARY KEY,
id_persona INT,
FOREIGN KEY (id_persona) REFERENCES Persona (id_persona)
);

CREATE TABLE Responsable (
id_responsable INT PRIMARY KEY,
id_persona INT,
FOREIGN KEY (id_persona) REFERENCES Persona (id_persona)
);

CREATE TABLE Producto (
id_producto INT PRIMARY KEY, 
id_stand INT,
nombre VARCHAR(100),
FOREIGN KEY (id_stand) REFERENCES Stand (id_stand)
);

CREATE TABLE Producto_responsable (
id_product_respon INT PRIMARY KEY,
id_producto INT,
id_responsable INT,
FOREIGN KEY (id_producto) REFERENCES Producto (id_producto),
FOREIGN KEY (id_responsable) REFERENCES Responsable (id_responsable)
);

CREATE TABLE Tipo_visitante (
id_tipo_visitante INT PRIMARY KEY,
descripcion VARCHAR(200)
);

CREATE TABLE Visitante (
id_visitante INT PRIMARY KEY,
id_persona INT,
id_tipo_visitante INT,
FOREIGN KEY (id_persona) REFERENCES Persona (id_persona),
FOREIGN KEY (id_tipo_visitante) REFERENCES Tipo_visitante (id_tipo_visitante)
);

CREATE TABLE Registro_visita (
id_registro_visita INT PRIMARY KEY,
id_feria INT,
id_visitante INT,
FOREIGN KEY (id_feria) REFERENCES Feria (id_feria),
FOREIGN KEY (id_visitante) REFERENCES Visitante (id_visitante)
);

CREATE TABLE Charla (
id_charla INT PRIMARY KEY,
id_ponente INT,
id_empresa INT,
descripcion VARCHAR(200),
fecha_inicio DATE,
fecha_fin DATE,
FOREIGN KEY (id_ponente) REFERENCES Ponente (id_ponente),
FOREIGN KEY (id_empresa) REFERENCES Empresa (id_empresa)
);

CREATE TABLE Registro_charla (
id_registro_charla INT PRIMARY KEY,
id_charla INT,
id_visitante INT,
FOREIGN KEY (id_charla) REFERENCES Charla (id_charla),
FOREIGN KEY (id_visitante) REFERENCES Visitante (id_visitante)
);

CREATE TABLE Demostracion (
id_demostracion INT PRIMARY KEY,
descripcion VARCHAR(200)
);

CREATE TABLE Registro_demostracion (
id_registro_demostracion INT PRIMARY KEY,
id_demostracion INT,
id_visitante INT,
FOREIGN KEY (id_demostracion) REFERENCES Demostracion (id_demostracion),
FOREIGN KEY (id_visitante) REFERENCES Visitante (id_visitante)
);


--Ciudad
INSERT INTO Ciudad (id_ciudad, nombre) VALUES 
(1,'Neiva'),
(2,'Ibague'),
(3,'Bogota'),
(4,'Medellin'),
(5,'Cali'),
(6,'Barranquilla'),
(7,'Cartagena'),
(8,'Pereira'),
(9,'Manizales'),
(10,'Bucaramanga');

--Feria
INSERT INTO Feria (id_feria, nombre, fecha_inicio, fecha_fin) VALUES
(1,'Feria 1','2025-08-15','2025-08-18'),
(2,'Feria 2','2025-09-15','2025-09-18'),
(3,'Feria 3','2025-10-15','2025-10-18'),
(4,'Feria 4','2025-11-10','2025-11-13'),
(5,'Feria 5','2025-12-05','2025-12-08'),
(6,'Feria 6','2026-01-20','2026-01-23'),
(7,'Feria 7','2026-02-14','2026-02-17'),
(8,'Feria 8','2026-03-10','2026-03-13'),
(9,'Feria 9','2026-04-05','2026-04-08'),
(10,'Feria 10','2026-05-12','2026-05-15');

--Empresa
INSERT INTO Empresa (id_empresa, nombre) VALUES
(1,'Tecnologia S.A'),
(2,'Tecnology'),
(3,'Amazon'),
(4,'Google'),
(5,'Microsoft'),
(6,'Apple Inc.'),
(7,'Facebook Meta'),
(8,'Oracle'),
(9,'Samsung Electronics'),
(10,'IBM');

--Tematica
INSERT INTO Tematica (id_tematica, nombre) VALUES
(1,'Software'),
(2,'Hardware'),
(3,'IoT'),
(4,'Inteligencia Artificial'),
(5,'Ciberseguridad'),
(6,'Realidad Virtual'),
(7,'Realidad Aumentada'),
(8,'Big Data'),
(9,'Cloud Computing'),
(10,'Blockchain');

--Pabellon
INSERT INTO Pabellon (id_pabellon, id_tematica, id_feria, capacidad) VALUES
(1,1,1,2),
(2,2,2,2),
(3,3,3,2),
(4,4,4,2),
(5,5,5,2),
(6,6,6,2),
(7,7,7,2),
(8,8,8,2),
(9,9,9,2),
(10,10,10,2);

--Stand
INSERT INTO Stand (id_stand, id_pabellon, id_empresa, numero) VALUES 
(1,1,1,1),
(2,2,2,2),
(3,3,3,3),
(4,4,4,4),
(5,5,5,5),
(6,6,6,5),
(7,7,7,7),
(8,8,8,8),
(9,9,9,9),
(10,10,10,10);


--Persona
INSERT INTO Persona (id_persona, nombre, apellido, identificacion, email, telefono) VALUES
(1,'Maria','Rodriguez','1075594949','maria123@gmail.com','3137701098'),
(2,'Stiven','Lopez','108793847','stiven123@gmail.com','3167899001'),
(3,'Karen','Cruz','1074398828','karen23@gmail.com','3124567890'),
(4,'Sarina','Casas','108234567','sarica@gmail.com','3124939399'),
(5,'Mateo','Ruiz','109876543','mateor@gmail.com','3156789238'),
(6,'Laura','Ortiz','10756890','lauraort@gmail.com','3217890432'),
(7,'Matias','Perdomo','1098848493','matiasper@gmail.com','3170983789'),
(8,'Valery','Trujillo','1098383838','valery123@gmail.com','3162779908'),
(9,'Andrea','Cardoso','1098282828','andrecar@gmail.com','3124567989'),
(10,'Carlos','Martinez','1077722111','carlosm@gmail.com','3208897766'),
(11,'Juliana','Gomez','1082213344','juligomez@gmail.com','3105678822'),
(12,'Santiago','Moreno','1093344556','santimor@gmail.com','3156678899'),
(13,'Daniela','Fernandez','1078899001','danifernandez@gmail.com','3182233445'),
(14,'Felipe','Torres','1092233445','felipet@gmail.com','3124455667'),
(15,'Camila','Castro','1087766554','camilacastro@gmail.com','3197788990');

--Ponente
INSERT INTO Ponente (id_ponente, id_persona) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

--Responsable
INSERT INTO Responsable (id_responsable, id_persona) VALUES 
(1,6),
(2,7),
(3,8),
(4,9),
(5,10);

--Producto
INSERT INTO Producto (id_producto, id_stand, nombre) VALUES
(1,1,'Asistente virtual'),
(2,2,'Robots'),
(3,3,'Smartwatchs'),
(4,4,'Drones'),
(5,5,'Impresora 3D'),
(6,6,'Laptop Gamer'),
(7,7,'Teléfono Plegable'),
(8,8,'Gafas de Realidad Virtual'),
(9,9,'Tableta Gráfica'),
(10,10,'Sistema de Domótica');

--Producto_responsable 
INSERT INTO Producto_responsable (id_product_respon, id_producto, id_responsable) VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5);

--Tipo_visitante
INSERT INTO Tipo_visitante (id_tipo_visitante, descripcion) VALUES
(1,'General'),
(2,'Estudiante'),
(3,'VIP');

--Visitante
INSERT INTO Visitante (id_visitante, id_persona, id_tipo_visitante) VALUES
(1,11,1),
(2,12,2),
(3,13,3),
(4,14,1),
(5,15,2);


--Registro_visita
INSERT INTO Registro_visita (id_registro_visita, id_feria, id_visitante) VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5);

--Charla
INSERT INTO Charla (id_charla, id_ponente, id_empresa, descripcion, fecha_inicio, fecha_fin) VALUES
(1,1,1,'Charla sobre robots','2025-08-16','2025-08-17'),
(2,2,2,'Charla sobre IA','2025-09-16','2025-09-17'),
(3,3,3,'Charla sobre informatica','2025-10-16','2025-10-17'),
(4,4,4,'Charla sobre ciberseguridad','2025-11-12','2025-11-13'),
(5,5,5,'Charla sobre big data','2025-12-08','2025-12-09');

--Registro_charla
INSERT INTO Registro_charla (id_registro_charla, id_charla, id_visitante) VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5);

--Demostracion
INSERT INTO Demostracion (id_demostracion, descripcion) VALUES
(1,'Robots funcion'),
(2,'Drones IA'),
(3,'Microbots'),
(4,'Impresoras 3D'),
(5,'Vehículos Autónomos'),
(6,'Gafas de Realidad Virtual'),
(7,'Sensores IoT'),
(8,'Asistentes de Voz'),
(9,'Blockchain Finance'),
(10,'Smartwatch Salud');

--Registro_demostracion
INSERT INTO Registro_demostracion (id_registro_demostracion, id_demostracion, id_visitante) VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5);

SELECT *
FROM Ciudad;

SELECT *
FROM Persona;

SELECT *
FROM Tipo_visitante;

--Mostrar el id_visitante con el nombre de la feria
SELECT	vi.id_visitante AS Visitante,
		fe.nombre AS Feria
FROM Registro_visita rv
INNER JOIN Visitante vi ON vi.id_visitante = rv.id_visitante
INNER JOIN Feria fe ON fe.id_feria = rv.id_feria;

--Lista todos los visitantes junto con el nombre de la persona y su tipo de visitante.
SELECT  pe.nombre AS Visitante, 
		ti.descripcion AS Tipo_entrada
FROM Visitante vi
INNER JOIN Persona pe ON pe.id_persona = vi.id_persona
INNER JOIN Tipo_visitante ti ON ti.id_tipo_visitante = vi.id_tipo_visitante

--Muestra todas las charlas junto con el nombre del ponente y la empresa que las dicta.
SELECT  ch.descripcion AS Charla, 
		pe.nombre AS Ponente,
		em.nombre AS Empresa
FROM Charla ch
INNER JOIN Ponente po ON po.id_ponente = ch.id_ponente
INNER JOIN Persona pe ON pe.id_persona = po.id_persona
INNER JOIN Empresa em ON em.id_empresa = ch.id_empresa

--Obtén los productos junto con el nombre del stand y la empresa a la que pertenecen.
SELECT pr.nombre AS Producto,
	   st.numero AS Stand,
	   em.nombre AS Empresa
FROM Producto pr
INNER JOIN Stand st ON st.id_stand = pr.id_stand
INNER JOIN Empresa em ON em.id_empresa = st.id_empresa

--Obtén los visitantes que asistieron a charlas de empresas
SELECT pe.nombre AS Visitante,
	   ch.descripcion AS Charla,
	   em.nombre AS Empresa
FROM Registro_charla rc
INNER JOIN Visitante vi ON vi.id_visitante = rc.id_visitante
INNER JOIN Persona pe ON pe.id_persona = vi.id_persona
INNER JOIN Charla ch ON ch.id_charla = rc.id_charla
INNER JOIN Empresa em ON em.id_empresa = ch.id_empresa

--Cuantas charlas hay en total
SELECT COUNT(*) AS Cantidad_charlas
FROM Charla;

--Cuantos productos tiene cada stand
SELECT st.numero AS Stand,
		COUNT(pr.id_producto) AS Producto
FROM Stand st
INNER JOIN Producto pr ON pr.id_stand = st.id_stand
GROUP BY st.numero
		
--Obtén la suma de todas las capacidades de los pabellones por feria.
SELECT SUM(pa.capacidad) AS Capacidad,
		fe.nombre AS Feria
FROM Pabellon pa
INNER JOIN Feria fe ON fe.id_feria = pa.id_feria
GROUP BY fe.nombre;

--Promedio de duracion en días de las ferias
-- Duración promedio (en días) de las ferias
SELECT AVG(CAST(DATEDIFF(DAY, fecha_inicio, fecha_fin) AS float)) AS PromedioDiasFerias
FROM Feria;

-- (opcional) Duración por feria
SELECT nombre, DATEDIFF(DAY, fecha_inicio, fecha_fin) AS Dias
FROM Feria;

--Muestra el mínimo, máximo y promedio de capacidad de los pabellones.
SELECT 
    MIN(capacidad) AS CapacidadMinima,
    MAX(capacidad) AS CapacidadMaxima,
    AVG(capacidad) AS CapacidadPromedio
FROM Pabellon;

--Actualiza la capacidad de un pabellon
UPDATE Pabellon
SET capacidad = 12
WHERE id_pabellon = 2;

--Elimina producto
DELETE FROM Producto
WHERE nombre = 'Mouse inalámbrico';

--Elimina todos los registros de charlas organizadas por empresas cuyo nombre contiene “Tech”.
DELETE FROM Charla
WHERE id_empresa IN (
    SELECT id_empresa
    FROM Empresa
    WHERE nombre LIKE '%Tech%'
);
