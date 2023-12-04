-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2023 a las 21:21:36
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba_tecnica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `dni` int(10) NOT NULL DEFAULT 0,
  `apellido` varchar(100) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `nro` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`dni`, `apellido`, `nombres`, `calle`, `nro`) VALUES
(11111111, 'Luna', 'Roberto', 'San Luis', 365),
(12333333, 'Tagarna', 'Luis', 'falsa', 123),
(22222222, 'Pérez', 'Luis', 'Chacabuco', 3615),
(33333333, 'López', 'María', 'Lopez Torrez', 2045),
(44444444, 'Antúnez', 'David', 'Alberto Roth', 2315),
(55555555, 'Villalba', 'Estela', 'San Martin', 615),
(66666666, 'Villar', 'Roxana', 'Santa Fé', 315),
(77777777, 'Zarza', 'Luis', 'Las Américas', 365),
(88888888, 'Estevéz', 'Mónica', 'Santa Catalina', 4615);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `cod_curso` varchar(10) NOT NULL DEFAULT '',
  `desccripcion` varchar(100) DEFAULT NULL,
  `cod_dep` int(5) NOT NULL,
  `dni_prof` int(10) NOT NULL,
  `abreviatura` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`cod_curso`, `desccripcion`, `cod_dep`, `dni_prof`, `abreviatura`) VALUES
('1', 'Introducción a Java', 2, 10111111, 'IntJava'),
('2', 'Introducción a Base De Datos', 1, 10333333, 'IntBd'),
('3', 'Desarrollo Front End', 2, 10555555, 'DesFE'),
('4', 'Desarrollo Back End', 2, 10222222, 'DesBE'),
('5', 'Excel Básico', 3, 10444444, 'ExBas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `cod_dep` int(5) NOT NULL DEFAULT 0,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`cod_dep`, `descripcion`) VALUES
(1, 'Base Datos'),
(2, 'Programacion'),
(3, 'Informática'),
(4, 'Seguridad e Higiene');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

CREATE TABLE `inscripciones` (
  `dni_Alu` int(10) NOT NULL,
  `cod_curso` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inscripciones`
--

INSERT INTO `inscripciones` (`dni_Alu`, `cod_curso`) VALUES
(11111111, '1'),
(33333333, '1'),
(22222222, '2'),
(44444444, '2'),
(55555555, '3'),
(66666666, '3'),
(11111111, '3'),
(33333333, '3'),
(11111111, '4'),
(33333333, '4'),
(22222222, '4'),
(44444444, '4'),
(55555555, '4'),
(12333333, '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `dni_alu` int(10) NOT NULL DEFAULT 0,
  `cod_curso` varchar(10) NOT NULL DEFAULT '',
  `mes` int(2) NOT NULL DEFAULT 0,
  `anio` int(4) NOT NULL DEFAULT 0,
  `fecha` date DEFAULT NULL,
  `monto` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`dni_alu`, `cod_curso`, `mes`, `anio`, `fecha`, `monto`) VALUES
(11111111, '1', 3, 2023, '2023-03-05', 2500),
(11111111, '1', 4, 2023, '2023-04-05', 2500),
(11111111, '1', 5, 2023, '2023-05-05', 2500),
(11111111, '1', 6, 2023, '2023-06-05', 2500),
(33333333, '1', 3, 2023, '2023-03-05', 2500),
(33333333, '1', 4, 2023, '2023-04-05', 2500),
(33333333, '1', 5, 2023, '2023-05-05', 2500),
(33333333, '1', 6, 2023, '2023-06-05', 2500),
(11111111, '4', 6, 2023, '2023-06-05', 2500),
(12333333, '4', 6, 2023, '2023-06-22', NULL),
(22222222, '4', 6, 2023, '2023-06-05', 2500),
(33333333, '4', 6, 2023, '2023-06-05', 2500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `dni` int(10) NOT NULL DEFAULT 0,
  `apellido` varchar(100) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `nro` int(10) DEFAULT NULL,
  `cod_titulo` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`dni`, `apellido`, `nombres`, `calle`, `nro`, `cod_titulo`) VALUES
(10111111, 'Pérez', 'Roberto', 'San Luis', 365, 1),
(10222222, 'López', 'Luis', 'Chacabuco', 3615, 3),
(10333333, 'Villar', 'María', 'Lopez Torrez', 2045, 4),
(10444444, 'Vazquez', 'David', 'Alberto Roth', 2315, 5),
(10555555, 'Olmedo', 'Estela', 'San Martin', 615, 2),
(10666666, 'Zado', 'Roxana', 'Santa Fé', 315, 6),
(10777777, 'Escobar', 'Luis', 'Las Américas', 365, 3),
(10888888, 'Martinez', 'Mónica', 'Santa Catalina', 4615, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_alumnos`
--

CREATE TABLE `telefonos_alumnos` (
  `dni` int(10) NOT NULL,
  `cod_tipo_tel` int(3) NOT NULL,
  `numero` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `telefonos_alumnos`
--

INSERT INTO `telefonos_alumnos` (`dni`, `cod_tipo_tel`, `numero`) VALUES
(11111111, 1, 42424242),
(22222222, 1, 24242424),
(22222222, 2, 6424424),
(33333333, 1, 5425897),
(44444444, 2, 1254783),
(55555555, 1, 4248424),
(66666666, 1, 8247434),
(66666666, 2, 5298743);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos_profesores`
--

CREATE TABLE `telefonos_profesores` (
  `dni` int(10) NOT NULL,
  `cod_tipo_tel` int(3) NOT NULL,
  `numero` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `telefonos_profesores`
--

INSERT INTO `telefonos_profesores` (`dni`, `cod_tipo_tel`, `numero`) VALUES
(10111111, 1, 42424242),
(10222222, 1, 24242424),
(10222222, 2, 6424424),
(10333333, 1, 5425897),
(10444444, 2, 1254783),
(10555555, 1, 4248424),
(10666666, 1, 8247434),
(10666666, 2, 5298743);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_telefonos`
--

CREATE TABLE `tipos_telefonos` (
  `cod_tipo_tel` int(3) NOT NULL DEFAULT 0,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipos_telefonos`
--

INSERT INTO `tipos_telefonos` (`cod_tipo_tel`, `descripcion`) VALUES
(1, 'Fijo'),
(2, 'Celular');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `titulos_habilitantes`
--

CREATE TABLE `titulos_habilitantes` (
  `cod_titulo` int(5) NOT NULL DEFAULT 0,
  `titulo` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `titulos_habilitantes`
--

INSERT INTO `titulos_habilitantes` (`cod_titulo`, `titulo`) VALUES
(1, 'Instructor Java'),
(2, 'Instructor Front End'),
(3, 'Instructor Back End'),
(4, 'Instructor Base Datos'),
(5, 'Instructor Ofimática'),
(6, 'Instructor App Movil');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`cod_curso`),
  ADD KEY `FKCursos_Profesor` (`dni_prof`),
  ADD KEY `FKCursos_DEpartamentos` (`cod_dep`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`cod_dep`);

--
-- Indices de la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD KEY `FKInscripciones_Alumnos` (`dni_Alu`),
  ADD KEY `FKIncripciones_Cursos` (`cod_curso`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`cod_curso`,`dni_alu`,`mes`,`anio`),
  ADD KEY `FKPAgos_Alumnos` (`dni_alu`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`dni`),
  ADD KEY `FKProfesor_Titulo` (`cod_titulo`);

--
-- Indices de la tabla `telefonos_alumnos`
--
ALTER TABLE `telefonos_alumnos`
  ADD PRIMARY KEY (`dni`,`cod_tipo_tel`,`numero`),
  ADD KEY `FKTelefonos_Alumnos_Tipo_Tel` (`cod_tipo_tel`);

--
-- Indices de la tabla `telefonos_profesores`
--
ALTER TABLE `telefonos_profesores`
  ADD PRIMARY KEY (`dni`,`cod_tipo_tel`,`numero`),
  ADD KEY `FKTelefonos_Profesores_Tipo_Tel` (`cod_tipo_tel`);

--
-- Indices de la tabla `tipos_telefonos`
--
ALTER TABLE `tipos_telefonos`
  ADD PRIMARY KEY (`cod_tipo_tel`);

--
-- Indices de la tabla `titulos_habilitantes`
--
ALTER TABLE `titulos_habilitantes`
  ADD PRIMARY KEY (`cod_titulo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `FKCursos_DEpartamentos` FOREIGN KEY (`cod_dep`) REFERENCES `departamentos` (`cod_dep`),
  ADD CONSTRAINT `FKCursos_Profesor` FOREIGN KEY (`dni_prof`) REFERENCES `profesores` (`dni`);

--
-- Filtros para la tabla `inscripciones`
--
ALTER TABLE `inscripciones`
  ADD CONSTRAINT `FKIncripciones_Cursos` FOREIGN KEY (`cod_curso`) REFERENCES `cursos` (`cod_curso`),
  ADD CONSTRAINT `FKInscripciones_Alumnos` FOREIGN KEY (`dni_Alu`) REFERENCES `alumnos` (`dni`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `FKPAgos_Alumnos` FOREIGN KEY (`dni_alu`) REFERENCES `alumnos` (`dni`),
  ADD CONSTRAINT `FKPagos_Cursos` FOREIGN KEY (`cod_curso`) REFERENCES `cursos` (`cod_curso`);

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `FKProfesor_Titulo` FOREIGN KEY (`cod_titulo`) REFERENCES `titulos_habilitantes` (`cod_titulo`);

--
-- Filtros para la tabla `telefonos_alumnos`
--
ALTER TABLE `telefonos_alumnos`
  ADD CONSTRAINT `FKTelefonos_Alumnos_Alum` FOREIGN KEY (`dni`) REFERENCES `alumnos` (`dni`),
  ADD CONSTRAINT `FKTelefonos_Alumnos_Tipo_Tel` FOREIGN KEY (`cod_tipo_tel`) REFERENCES `tipos_telefonos` (`cod_tipo_tel`);

--
-- Filtros para la tabla `telefonos_profesores`
--
ALTER TABLE `telefonos_profesores`
  ADD CONSTRAINT `FKTelefonos_Profesores_Profe` FOREIGN KEY (`dni`) REFERENCES `profesores` (`dni`),
  ADD CONSTRAINT `FKTelefonos_Profesores_Tipo_Tel` FOREIGN KEY (`cod_tipo_tel`) REFERENCES `tipos_telefonos` (`cod_tipo_tel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
