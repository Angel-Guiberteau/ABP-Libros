-- Usar la base de datos
USE appLibros;

-- Inserts para la tabla Administradores
INSERT INTO Administradores (idAdmin, nombre, correo, contrasenia) VALUES
(1, 'Luis Fernández', 'admin1@librosapp.com', 'admin123'),
(2, 'Clara Rivera', 'admin2@librosapp.com', 'admin456'),
(3, 'José Díaz', 'admin3@librosapp.com', 'admin789'),
(4, 'Lucía Méndez', 'admin4@librosapp.com', 'admin101'),
(5, 'Diego Martín', 'admin5@librosapp.com', 'admin102');

-- Inserts para la tabla Tutores
INSERT INTO Tutores (idTutor, nombre, correo) VALUES
(1, 'María López', 'maria.lopez@tutores.com'),
(2, 'Juan Pérez', 'juan.perez@tutores.com'),
(3, 'Ana Gómez', 'ana.gomez@tutores.com'),
(4, 'Carlos Torres', 'carlos.torres@tutores.com'),
(5, 'Sofía Ramírez', 'sofia.ramirez@tutores.com');

-- Inserts para la tabla Editoriales
INSERT INTO Editoriales (idEditorial, nombre, correo, telefono) VALUES
(1, 'Editorial Alfa', 'contacto@alfa.com', '987654321'),
(2, 'Editorial Beta', 'info@beta.com', '987654322'),
(3, 'Editorial Gamma', 'soporte@gamma.com', '987654323'),
(4, 'Editorial Delta', 'contacto@delta.com', '987654324'),
(5, 'Editorial Epsilon', 'info@epsilon.com', '987654325');

-- Inserts para la tabla Cursos
INSERT INTO Cursos (idCurso, nombre) VALUES
('C001', 'Matemáticas Avanzadas'),
('C002', 'Historia del Arte'),
('C003', 'Química Orgánica'),
('C004', 'Física Cuántica'),
('C005', 'Literatura Clásica');

-- Inserts para la tabla Clases
INSERT INTO Clases (idCurso, letraClase, nombre) VALUES
('C001', 'A', 'Álgebra Lineal'),
('C002', 'B', 'Renacimiento'),
('C003', 'C', 'Reacciones Orgánicas'),
('C004', 'D', 'Partículas Subatómicas'),
('C005', 'E', 'Poetas Griegos');

-- Inserts para la tabla Asignaturas
INSERT INTO Asignaturas (idAsignatura, nombre) VALUES
(1, 'Matemáticas'),
(2, 'Historia'),
(3, 'Ciencias Naturales'),
(4, 'Física'),
(5, 'Literatura');

-- Inserts para la tabla clases_asignaturas
INSERT INTO clases_asignaturas (idCurso, letraClase, idAsignatura) VALUES
('C001', 'A', 1),
('C002', 'B', 2),
('C003', 'C', 3),
('C004', 'D', 4),
('C005', 'E', 5);

-- Inserts para la tabla Libros
INSERT INTO Libros (ISBN, nombre, precio, idEditorial, idAsignatura) VALUES
('9781234567897', 'Cálculo Avanzado', 45.99, 1, 1),
('9781234567898', 'Arte Moderno', 39.50, 2, 2),
('9781234567899', 'Química para Todos', 50.75, 3, 3),
('9781234567800', 'El Universo en Contexto', 60.20, 4, 4),
('9781234567801', 'Antología Literaria', 25.00, 5, 5);

-- Inserts para la tabla Reservas
INSERT INTO Reservas (idReserva, dni, nombreTutor, correo, nombreAlumno, documento, apta, fecha_reserva, coste_total, fecha_registro, idCurso, letraClase) VALUES
(1, '123456789', 'María López', 'maria.lopez@tutores.com', 'Luis Pérez', 'documento1.pdf', true, '2024-11-20', 100.50, '2024-11-19', 'C001', 'A'),
(2, '987654321', 'Juan Pérez', 'juan.perez@tutores.com', 'Ana Torres', 'documento2.pdf', true, '2024-11-21', 200.00, '2024-11-20', 'C002', 'B'),
(3, '456789123', 'Ana Gómez', 'ana.gomez@tutores.com', 'Carlos García', 'documento3.pdf', false, '2024-11-22', 150.75, '2024-11-21', 'C003', 'C'),
(4, '654321987', 'Carlos Torres', 'carlos.torres@tutores.com', 'Laura Martínez', 'documento4.pdf', true, '2024-11-23', 80.00, '2024-11-22', 'C004', 'D'),
(5, '789123456', 'Sofía Ramírez', 'sofia.ramirez@tutores.com', 'Diego Fernández', 'documento5.pdf', false, '2024-11-24', 120.00, '2024-11-23', 'C005', 'E');

-- Inserts para la tabla Reservas_Libros
INSERT INTO Reservas_Libros (ISBN, idReserva, entregado) VALUES
('9781234567897', 1, true),
('9781234567898', 1, false),
('9781234567899', 2, true),
('9781234567800', 3, false),
('9781234567801', 4, true);


-- MAS INSERTS DE RESERVAS

-- Inserts adicionales para la tabla Reservas
INSERT INTO Reservas (idReserva, dni, nombreTutor, correo, nombreAlumno, documento, apta, fecha_reserva, coste_total, fecha_registro, idCurso, letraClase) VALUES
(6, '321654987', 'María López', 'maria.lopez@tutores.com', 'Pedro Sánchez', 'documento6.pdf', true, '2024-11-25', 95.00, '2024-11-24', 'C001', 'A'),
(7, '789654123', 'Juan Pérez', 'juan.perez@tutores.com', 'Laura Gómez', 'documento7.pdf', false, '2024-11-26', 150.00, '2024-11-25', 'C002', 'B'),
(8, '456123789', 'Ana Gómez', 'ana.gomez@tutores.com', 'Marta López', 'documento8.pdf', true, '2024-11-27', 200.00, '2024-11-26', 'C003', 'C'),
(9, '654987321', 'Carlos Torres', 'carlos.torres@tutores.com', 'Javier Martínez', 'documento9.pdf', true, '2024-11-28', 80.50, '2024-11-27', 'C004', 'D'),
(10, '123789456', 'Sofía Ramírez', 'sofia.ramirez@tutores.com', 'Clara Fernández', 'documento10.pdf', false, '2024-11-29', 110.00, '2024-11-28', 'C005', 'E');

-- Inserts adicionales para la tabla Reservas_Libros
INSERT INTO Reservas_Libros (ISBN, idReserva, entregado) VALUES
('9781234567897', 6, true), -- Libro "Cálculo Avanzado" para la Reserva 6
('9781234567898', 6, false), -- Libro "Arte Moderno" para la Reserva 6
('9781234567899', 7, true), -- Libro "Química para Todos" para la Reserva 7
('9781234567800', 8, true), -- Libro "El Universo en Contexto" para la Reserva 8
('9781234567801', 9, false), -- Libro "Antología Literaria" para la Reserva 9
('9781234567897', 10, false), -- Libro "Cálculo Avanzado" para la Reserva 10
('9781234567898', 10, true); -- Libro "Arte Moderno" para la Reserva 10


-- Inserts adicionales para la tabla Reservas con idReserva
INSERT INTO Reservas (idReserva, dni, nombreTutor, correo, nombreAlumno, documento, apta, fecha_reserva, coste_total, fecha_registro, idCurso, letraClase) VALUES
(11, '951753852', 'María López', 'maria.lopez@tutores.com', 'Isabel Castro', 'documento11.pdf', true, '2024-11-30', 105.00, '2024-11-29', 'C001', 'A'),
(12, '357159456', 'Juan Pérez', 'juan.perez@tutores.com', 'Sergio Hernández', 'documento12.pdf', false, '2024-12-01', 125.50, '2024-11-30', 'C002', 'B'),
(13, '789456123', 'Ana Gómez', 'ana.gomez@tutores.com', 'Gabriel Ortiz', 'documento13.pdf', true, '2024-12-02', 140.00, '2024-12-01', 'C003', 'C'),
(14, '456789321', 'Carlos Torres', 'carlos.torres@tutores.com', 'Alejandra Vega', 'documento14.pdf', true, '2024-12-03', 85.75, '2024-12-02', 'C004', 'D'),
(15, '321654987', 'Sofía Ramírez', 'sofia.ramirez@tutores.com', 'David Blanco', 'documento15.pdf', false, '2024-12-04', 95.25, '2024-12-03', 'C005', 'E');

-- Inserts adicionales para la tabla Reservas_Libros
INSERT INTO Reservas_Libros (ISBN, idReserva, entregado) VALUES
('9781234567897', 11, true), -- Libro "Cálculo Avanzado" para la Reserva 11
('9781234567898', 11, false), -- Libro "Arte Moderno" para la Reserva 11
('9781234567899', 12, true), -- Libro "Química para Todos" para la Reserva 12
('9781234567800', 13, true), -- Libro "El Universo en Contexto" para la Reserva 13
('9781234567801', 13, false), -- Libro "Antología Literaria" para la Reserva 13
('9781234567897', 14, false), -- Libro "Cálculo Avanzado" para la Reserva 14
('9781234567898', 15, true); -- Libro "Arte Moderno" para la Reserva 15



INSERT INTO Reservas (idReserva, dni, nombreTutor, correo, nombreAlumno, documento, fecha_reserva, coste_total, fecha_registro, idCurso, letraClase) VALUES
(16, '564788924', 'López', 'maria@tutores.com', 'Isabel', 'documento16.pdf', '2024-11-30', 105.00, '2024-11-29', 'C001', 'A');
INSERT INTO Reservas_Libros (ISBN, idReserva, entregado) VALUES ('9781234567897', 16); -- Libro "Cálculo Avanzado" para la Reserva 11
