-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-06-2020 a las 07:12:55
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `refaccionaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agricultura`
--

CREATE TABLE `agricultura` (
  `ID` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Precio` float NOT NULL,
  `Ubicacion` varchar(100) NOT NULL,
  `Palabra_Clave` varchar(50) NOT NULL,
  `ID_distribuidor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `agricultura`
--

INSERT INTO `agricultura` (`ID`, `Nombre`, `Descripcion`, `Precio`, `Ubicacion`, `Palabra_Clave`, `ID_distribuidor`) VALUES
('1', 'Luis Fernando', 'jkhj', 256.3, 'sd', 'Pala', '2'),
('2', 'Julian', 'sdsd', 12.3, 'ESTANTE \"A\"', 'Pala', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `automoviles`
--

CREATE TABLE `automoviles` (
  `ID` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Precio` float NOT NULL,
  `Ubicacion` varchar(100) NOT NULL,
  `Palabra_Clave` varchar(50) NOT NULL,
  `ID_distribuidor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `automoviles`
--

INSERT INTO `automoviles` (`ID`, `Nombre`, `Descripcion`, `Precio`, `Ubicacion`, `Palabra_Clave`, `ID_distribuidor`) VALUES
('1', 'Julian', 'sdsd', 12.3, 'ESTANTE \"A\"', 'Pala', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `construccion`
--

CREATE TABLE `construccion` (
  `ID` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Precio` float NOT NULL,
  `Ubicacion` varchar(100) NOT NULL,
  `Palabra_Clave` varchar(50) NOT NULL,
  `ID_distribuidor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `construccion`
--

INSERT INTO `construccion` (`ID`, `Nombre`, `Descripcion`, `Precio`, `Ubicacion`, `Palabra_Clave`, `ID_distribuidor`) VALUES
('1', 'LUIS FERNANDO', 'sdsd', 12.3, 'ESTANTE \"A\"', 'Pala', '2'),
('2', 'Julian', 'sdsd', 12.3, 'ESTANTE \"A\"', 'Pala', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distribuidores`
--

CREATE TABLE `distribuidores` (
  `ID` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `RFC` varchar(50) NOT NULL,
  `Telefono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `distribuidores`
--

INSERT INTO `distribuidores` (`ID`, `Nombre`, `RFC`, `Telefono`) VALUES
('1', 'METLIFE', 'ADSA', '2851147357'),
('2', 'PEGOUT', 'ASDJ213', '2546');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellidos` varchar(50) NOT NULL,
  `Telefono` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`ID`, `Nombre`, `Apellidos`, `Telefono`, `Password`) VALUES
('1', 'Luis Fernando', 'Gallardo Lopez', '23762', 'saad'),
('2', 'LUIS FERNANDO', 'Gallardo Lopez', '2851147357', 'saad');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agricultura`
--
ALTER TABLE `agricultura`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `bodega3` (`ID_distribuidor`);

--
-- Indices de la tabla `automoviles`
--
ALTER TABLE `automoviles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_distribuidor` (`ID_distribuidor`);

--
-- Indices de la tabla `construccion`
--
ALTER TABLE `construccion`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `bodega` (`ID_distribuidor`);

--
-- Indices de la tabla `distribuidores`
--
ALTER TABLE `distribuidores`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agricultura`
--
ALTER TABLE `agricultura`
  ADD CONSTRAINT `bodega3` FOREIGN KEY (`ID_distribuidor`) REFERENCES `distribuidores` (`ID`);

--
-- Filtros para la tabla `automoviles`
--
ALTER TABLE `automoviles`
  ADD CONSTRAINT `bodega2` FOREIGN KEY (`ID_distribuidor`) REFERENCES `distribuidores` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `construccion`
--
ALTER TABLE `construccion`
  ADD CONSTRAINT `bodega` FOREIGN KEY (`ID_distribuidor`) REFERENCES `distribuidores` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
