-- Crear la base de datos
CREATE DATABASE Colegio;

-- Usar la base de datos
USE Colegio;

-- Crear tabla Alumno
CREATE TABLE Alumno (
id_alumno INT PRIMARY KEY,
nombre_completo VARCHAR(100),
correo VARCHAR(100),
apodo VARCHAR(50)
);

-- Crear tabla Docente
CREATE TABLE Docente (
id_docente INT PRIMARY KEY,
nombre VARCHAR(100),
especialidad VARCHAR(100),
correo_institucional VARCHAR(100)
);

-- Crear tabla Asignatura
CREATE TABLE Asignatura (
id_asignatura INT PRIMARY KEY,
titulo VARCHAR(100),
nivel VARCHAR(50)
);

-- Crear tabla Inscripcion
CREATE TABLE Inscripcion (
id_inscripcion INT PRIMARY KEY,
id_alumno INT,
id_asignatura INT,
FOREIGN KEY (id_alumno) REFERENCES Alumno(id_alumno),
FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura)
);

-- Crear tabla AsignaturaDocente
CREATE TABLE AsignaturaDocente (
id_asignatura_docente INT PRIMARY KEY,
id_asignatura INT,
id_docente INT,
periodo VARCHAR(20),
FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id_asignatura),
FOREIGN KEY (id_docente) REFERENCES Docente(id_docente)
);

CREATE TABLE Horario (
id_horario INT PRIMARY KEY,
id_asignatura_docente INT,
dia VARCHAR(20),
hora_inicio TIME,
hora_fin TIME,
aula VARCHAR(20),
FOREIGN KEY (id_asignatura_docente) REFERENCES AsignaturaDocente(id_asignatura_docente)
);

-- Crear tabla Nota
CREATE TABLE Nota (
id_nota INT PRIMARY KEY,
id_inscripcion INT,
tipo VARCHAR(50),
calificacion DECIMAL(4,2),
fecha DATE,
FOREIGN KEY (id_inscripcion) REFERENCES Inscripcion(id_inscripcion)
);

-- Insertar nuevos datos en Alumno
INSERT INTO Alumno (id_alumno, nombre_completo, correo, apodo) 
VALUES (1, 'Valentina Rojas', 'valentina@gmail.com', 'Vale'),
(2, 'Emilio Castro', 'emilio@gmail.com', 'Milo'),
(3, 'Renata Díaz', 'renata@gmail.com', 'Rena'),
(4, 'Tomás Fuentes', 'tomas@gmail.com', 'Tomy'),
(5, 'Isidora Morales', 'isidora@gmail.com', 'Isi');

-- Insertar nuevos datos en Docente
INSERT INTO Docente (id_docente, nombre, especialidad, correo_institucional)
VALUES (1, 'Andrea Silva', 'Ciencias Naturales', 'asilva@gmail.com'),
(2, 'Felipe Navarro', 'Lengua Castellana', 'fnavarro@gmail.com'),
(3, 'Claudia Reyes', 'Educación Física', 'creyes@gmail.com'),
(4, 'Marcos Herrera', 'Historia', 'mherrera@gmail.com'),
(5, 'Patricia Soto', 'Matemáticas', 'psoto@gmail.com');

-- Insertar nuevos datos en Asignatura
INSERT INTO Asignatura (id_asignatura, titulo, nivel)
VALUES (1, 'Ciencias Naturales I', 'Primero Básico'),
(2, 'Lengua y Comunicación', 'Segundo Básico'),
(3, 'Educación Física', 'Tercero Básico'),
(4, 'Historia y Geografía', 'Cuarto Básico'),
(5, 'Matemáticas Aplicadas', 'Quinto Básico');

-- Insertar nuevos datos en Inscripcion
INSERT INTO Inscripcion (id_inscripcion, id_alumno, id_asignatura)
VALUES (1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Insertar nuevos datos en AsignaturaDocente
INSERT INTO AsignaturaDocente (id_asignatura_docente, id_asignatura, id_docente, periodo)
VALUES (1, 1, 1, '2025-A'),
(2, 2, 2, '2025-A'),
(3, 3, 3, '2025-A'),
(4, 4, 4, '2025-A'),
(5, 5, 5, '2025-A');

-- Insertar datos en Horario
INSERT INTO Horario (id_horario, id_asignatura_docente, dia, hora_inicio, hora_fin, aula) VALUES
(1, 1, 'Lunes', '08:00', '09:30', 'Aula 101'),
(2, 2, 'Martes', '10:00', '11:30', 'Aula 102'),
(3, 3, 'Miércoles', '09:45', '11:15', 'Gimnasio'),
(4, 4, 'Jueves', '08:00', '09:30', 'Aula 103'),
(5, 5, 'Viernes', '10:00', '11:30', 'Aula 104');

-- Insertar datos en Nota
INSERT INTO Nota (id_nota, id_inscripcion, tipo, calificacion, fecha) VALUES
(1, 1, 'Prueba', 6.0, '2025-05-10'),
(2, 1, 'Tarea', 5.5, '2025-05-12'),
(3, 2, 'Examen', 4.8, '2025-05-15'),
(4, 3, 'Prueba', 6.3, '2025-05-18'),
(5, 4, 'Examen', 7.0, '2025-05-20');