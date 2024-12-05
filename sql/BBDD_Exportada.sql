-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2024 a las 12:50:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `applibros`
--
CREATE DATABASE IF NOT EXISTS `applibros` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `applibros`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `idAdmin` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contrasenia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`idAdmin`, `nombre`, `correo`, `contrasenia`) VALUES
(1, 'Luis Fernández', 'admin1@librosapp.com', 'admin123'),
(2, 'Clara Rivera', 'admin2@librosapp.com', 'admin456'),
(3, 'José Díaz', 'admin3@librosapp.com', 'admin789'),
(4, 'Lucía Méndez', 'admin4@librosapp.com', 'admin101'),
(5, 'Diego Martín', 'admin5@librosapp.com', 'admin102');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `idAsignatura` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`idAsignatura`, `nombre`) VALUES
(1, 'Matemáticas'),
(2, 'Historia'),
(3, 'Ciencias Naturales'),
(4, 'Física'),
(5, 'Literatura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `idCurso` char(6) NOT NULL,
  `letraClase` char(1) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` (`idCurso`, `letraClase`, `nombre`) VALUES
('C001', 'A', 'Álgebra Lineal'),
('C002', 'B', 'Renacimiento'),
('C003', 'C', 'Reacciones Orgánicas'),
('C004', 'D', 'Partículas Subatómicas'),
('C005', 'E', 'Poetas Griegos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases_asignaturas`
--

CREATE TABLE `clases_asignaturas` (
  `idCurso` char(6) NOT NULL,
  `letraClase` char(1) NOT NULL,
  `idAsignatura` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clases_asignaturas`
--

INSERT INTO `clases_asignaturas` (`idCurso`, `letraClase`, `idAsignatura`) VALUES
('C001', 'A', 1),
('C002', 'B', 2),
('C003', 'C', 3),
('C004', 'D', 4),
('C005', 'E', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `idCurso` char(6) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`idCurso`, `nombre`) VALUES
('C001', 'Matemáticas Avanzadas'),
('C002', 'Historia del Arte'),
('C003', 'Química Orgánica'),
('C004', 'Física Cuántica'),
('C005', 'Literatura Clásica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editoriales`
--

CREATE TABLE `editoriales` (
  `idEditorial` smallint(5) UNSIGNED NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `editoriales`
--

INSERT INTO `editoriales` (`idEditorial`, `nombre`, `correo`, `telefono`) VALUES
(1, 'Editorial Alfa', 'contacto@alfa.com', '987654321'),
(2, 'Editorial Beta', 'info@beta.com', '987654322'),
(3, 'Editorial Gamma', 'soporte@gamma.com', '987654323'),
(4, 'Editorial Delta', 'contacto@delta.com', '987654324'),
(5, 'Editorial Epsilon', 'info@epsilon.com', '987654325');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ISBN` char(13) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `idEditorial` smallint(5) UNSIGNED NOT NULL,
  `idAsignatura` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ISBN`, `nombre`, `precio`, `idEditorial`, `idAsignatura`) VALUES
('9781234567800', 'El Universo en Contexto', 60.20, 4, 4),
('9781234567801', 'Antología Literaria', 25.00, 5, 5),
('9781234567897', 'Cálculo Avanzado', 45.99, 1, 1),
('9781234567898', 'Arte Moderno', 39.50, 2, 2),
('9781234567899', 'Química para Todos', 50.75, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `idReserva` int(10) UNSIGNED NOT NULL,
  `dni` char(9) NOT NULL,
  `nombreTutor` varchar(100) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `nombreAlumno` varchar(100) NOT NULL,
  `documento` varchar(255) NOT NULL,
  `apta` tinyint(1) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `coste_total` decimal(10,2) NOT NULL,
  `fecha_registro` date NOT NULL,
  `idCurso` char(6) NOT NULL,
  `letraClase` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`idReserva`, `dni`, `nombreTutor`, `correo`, `nombreAlumno`, `documento`, `apta`, `fecha_reserva`, `coste_total`, `fecha_registro`, `idCurso`, `letraClase`) VALUES
(1, '123456789', 'María López', 'maria.lopez@tutores.com', 'Luis Pérez', 'documento1.pdf', 1, '2024-11-20', 100.50, '2024-11-19', 'C001', 'A'),
(2, '987654321', 'Juan Pérez', 'juan.perez@tutores.com', 'Ana Torres', 'documento2.pdf', 0, '2024-11-21', 200.00, '2024-11-20', 'C002', 'B'),
(3, '456789123', 'Ana Gómez', 'ana.gomez@tutores.com', 'Carlos García', 'documento3.pdf', 1, '2024-11-22', 150.75, '2024-11-21', 'C003', 'C'),
(4, '654321987', 'Carlos Torres', 'carlos.torres@tutores.com', 'Laura Martínez', 'documento4.pdf', 1, '2024-11-23', 80.00, '2024-11-22', 'C004', 'D'),
(5, '789123456', 'Sofía Ramírez', 'sofia.ramirez@tutores.com', 'Diego Fernández', 'documento5.pdf', 1, '2024-11-24', 120.00, '2024-11-23', 'C005', 'E'),
(6, '321654987', 'María López', 'maria.lopez@tutores.com', 'Pedro Sánchez', 'documento6.pdf', 1, '2024-11-25', 95.00, '2024-11-24', 'C001', 'A'),
(7, '789654123', 'Juan Pérez', 'juan.perez@tutores.com', 'Laura Gómez', 'documento7.pdf', 0, '2024-11-26', 150.00, '2024-11-25', 'C002', 'B'),
(8, '456123789', 'Ana Gómez', 'ana.gomez@tutores.com', 'Marta López', 'documento8.pdf', 1, '2024-11-27', 200.00, '2024-11-26', 'C003', 'C'),
(9, '654987321', 'Carlos Torres', 'carlos.torres@tutores.com', 'Javier Martínez', 'documento9.pdf', 0, '2024-11-28', 80.50, '2024-11-27', 'C004', 'D'),
(10, '123789456', 'Sofía Ramírez', 'sofia.ramirez@tutores.com', 'Clara Fernández', 'documento10.pdf', 1, '2024-11-29', 110.00, '2024-11-28', 'C005', 'E'),
(11, '951753852', 'María López', 'maria.lopez@tutores.com', 'Isabel Castro', 'documento11.pdf', 1, '2024-11-30', 105.00, '2024-11-29', 'C001', 'A'),
(12, '357159456', 'Juan Pérez', 'juan.perez@tutores.com', 'Sergio Hernández', 'documento12.pdf', 1, '2024-12-01', 125.50, '2024-11-30', 'C002', 'B'),
(13, '789456123', 'Ana Gómez', 'ana.gomez@tutores.com', 'Gabriel Ortiz', 'documento13.pdf', 0, '2024-12-02', 140.00, '2024-12-01', 'C003', 'C'),
(14, '456789321', 'Carlos Torres', 'carlos.torres@tutores.com', 'Alejandra Vega', 'documento14.pdf', 1, '2024-12-03', 85.75, '2024-12-02', 'C004', 'D'),
(15, '321654987', 'Sofía Ramírez', 'sofia.ramirez@tutores.com', 'David Blanco', 'documento15.pdf', 0, '2024-12-04', 95.25, '2024-12-03', 'C005', 'E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas_libros`
--

CREATE TABLE `reservas_libros` (
  `ISBN` char(13) NOT NULL,
  `idReserva` int(10) UNSIGNED NOT NULL,
  `entregado` tinyint(1) NOT NULL,
  `pedido` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas_libros`
--

INSERT INTO `reservas_libros` (`ISBN`, `idReserva`, `entregado`, `pedido`) VALUES
('9781234567800', 3, 0, 0),
('9781234567800', 5, 1, 1),
('9781234567800', 8, 0, 1),
('9781234567800', 13, 0, 0),
('9781234567801', 4, 0, 1),
('9781234567801', 5, 1, 1),
('9781234567801', 9, 0, 0),
('9781234567801', 13, 0, 0),
('9781234567897', 1, 0, 0),
('9781234567897', 6, 1, 1),
('9781234567897', 10, 0, 1),
('9781234567897', 11, 0, 0),
('9781234567897', 14, 1, 1),
('9781234567898', 1, 0, 1),
('9781234567898', 6, 1, 1),
('9781234567898', 10, 1, 1),
('9781234567898', 11, 0, 1),
('9781234567898', 15, 0, 0),
('9781234567899', 2, 0, 0),
('9781234567899', 7, 0, 0),
('9781234567899', 12, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutores`
--

CREATE TABLE `tutores` (
  `idTutor` tinyint(3) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tutores`
--

INSERT INTO `tutores` (`idTutor`, `nombre`, `correo`) VALUES
(1, 'María López', 'maria.lopez@tutores.com'),
(2, 'Juan Pérez', 'juan.perez@tutores.com'),
(3, 'Ana Gómez', 'ana.gomez@tutores.com'),
(4, 'Carlos Torres', 'carlos.torres@tutores.com'),
(5, 'Sofía Ramírez', 'sofia.ramirez@tutores.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`idAdmin`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`idAsignatura`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`idCurso`,`letraClase`);

--
-- Indices de la tabla `clases_asignaturas`
--
ALTER TABLE `clases_asignaturas`
  ADD PRIMARY KEY (`idCurso`,`letraClase`,`idAsignatura`),
  ADD KEY `fk_clases_asignaturas_asignaturas` (`idAsignatura`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`idCurso`);

--
-- Indices de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  ADD PRIMARY KEY (`idEditorial`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `fk_libros_editoriales` (`idEditorial`),
  ADD KEY `fk_libros_asignaturas` (`idAsignatura`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `fk_reservas_clases` (`idCurso`,`letraClase`);

--
-- Indices de la tabla `reservas_libros`
--
ALTER TABLE `reservas_libros`
  ADD PRIMARY KEY (`ISBN`,`idReserva`),
  ADD KEY `fk_reservas_libros_reservas` (`idReserva`);

--
-- Indices de la tabla `tutores`
--
ALTER TABLE `tutores`
  ADD PRIMARY KEY (`idTutor`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `idAdmin` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `idAsignatura` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `editoriales`
--
ALTER TABLE `editoriales`
  MODIFY `idEditorial` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `idReserva` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tutores`
--
ALTER TABLE `tutores`
  MODIFY `idTutor` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `fk_clases_cursos` FOREIGN KEY (`idCurso`) REFERENCES `cursos` (`idCurso`);

--
-- Filtros para la tabla `clases_asignaturas`
--
ALTER TABLE `clases_asignaturas`
  ADD CONSTRAINT `fk_clases_asignaturas_asignaturas` FOREIGN KEY (`idAsignatura`) REFERENCES `asignaturas` (`idAsignatura`),
  ADD CONSTRAINT `fk_clases_asignaturas_clases` FOREIGN KEY (`idCurso`,`letraClase`) REFERENCES `clases` (`idCurso`, `letraClase`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `fk_libros_asignaturas` FOREIGN KEY (`idAsignatura`) REFERENCES `asignaturas` (`idAsignatura`),
  ADD CONSTRAINT `fk_libros_editoriales` FOREIGN KEY (`idEditorial`) REFERENCES `editoriales` (`idEditorial`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `fk_reservas_clases` FOREIGN KEY (`idCurso`,`letraClase`) REFERENCES `clases` (`idCurso`, `letraClase`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservas_libros`
--
ALTER TABLE `reservas_libros`
  ADD CONSTRAINT `fk_reservas_libros_libros` FOREIGN KEY (`ISBN`) REFERENCES `libros` (`ISBN`),
  ADD CONSTRAINT `fk_reservas_libros_reservas` FOREIGN KEY (`idReserva`) REFERENCES `reservas` (`idReserva`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
