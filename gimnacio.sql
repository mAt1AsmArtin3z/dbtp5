-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2024 a las 04:07:14
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gimnacio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aparatos`
--

CREATE TABLE `aparatos` (
  `id_sala` int(11) NOT NULL,
  `id_aparato` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado_conservacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id_clase` int(11) NOT NULL,
  `id_entrenador` int(11) DEFAULT NULL,
  `id_socio` int(11) DEFAULT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `dia_inicio` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenador`
--

CREATE TABLE `entrenador` (
  `id_entrenador` int(11) NOT NULL,
  `dni_entrenador` varchar(20) DEFAULT NULL,
  `nombre_entrenador` varchar(100) DEFAULT NULL,
  `telefono_entrenador` varchar(20) DEFAULT NULL,
  `titulacion` tinyint(1) DEFAULT NULL,
  `experiencia_profesional` varchar(255) DEFAULT NULL,
  `apellido_entrenador` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `descripcion_pago` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pista`
--

CREATE TABLE `pista` (
  `id_pista` int(11) NOT NULL,
  `descripcion_pista` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pista_squash`
--

CREATE TABLE `pista_squash` (
  `id_sala` int(11) NOT NULL,
  `id_pista` int(11) NOT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `tamaño` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion`
--

CREATE TABLE `profesion` (
  `id_profesion` int(11) NOT NULL,
  `tipo_profesion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `id_pago` int(11) DEFAULT NULL,
  `id_socio` int(11) DEFAULT NULL,
  `fecha_reserva` date DEFAULT NULL,
  `hora_inicio_reserva` time DEFAULT NULL,
  `hora_fin_reserva` time DEFAULT NULL,
  `seña_pago` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `id_tipo_salas` int(11) NOT NULL,
  `id_sala` int(11) DEFAULT NULL,
  `tamaño_metros_cuadrados` decimal(10,2) DEFAULT NULL,
  `aparatos` tinyint(1) DEFAULT NULL,
  `imparte_clases` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `id_socio` int(11) NOT NULL,
  `nombre_socio` varchar(100) DEFAULT NULL,
  `direccion_socio` varchar(255) DEFAULT NULL,
  `telefono_socio` varchar(20) DEFAULT NULL,
  `profesion_socio` varchar(100) DEFAULT NULL,
  `id_profesion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_sala`
--

CREATE TABLE `tipo_sala` (
  `id_tipo_sala` int(11) NOT NULL,
  `descripcion_sala` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aparatos`
--
ALTER TABLE `aparatos`
  ADD PRIMARY KEY (`id_sala`,`id_aparato`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id_clase`);

--
-- Indices de la tabla `entrenador`
--
ALTER TABLE `entrenador`
  ADD PRIMARY KEY (`id_entrenador`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`);

--
-- Indices de la tabla `pista`
--
ALTER TABLE `pista`
  ADD PRIMARY KEY (`id_pista`);

--
-- Indices de la tabla `pista_squash`
--
ALTER TABLE `pista_squash`
  ADD PRIMARY KEY (`id_sala`,`id_pista`);

--
-- Indices de la tabla `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`id_profesion`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id_reserva`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`id_tipo_salas`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`id_socio`);

--
-- Indices de la tabla `tipo_sala`
--
ALTER TABLE `tipo_sala`
  ADD PRIMARY KEY (`id_tipo_sala`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
