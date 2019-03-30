-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 06-03-2019 a las 03:04:22
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fruit`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fruit`
--

CREATE TABLE `fruit` (
  `name` varchar(50) NOT NULL,
  `units` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fruit`
--

INSERT INTO `fruit` (`name`, `units`, `quantity`, `price`, `country`) VALUES
('frambuesa', 10, 89, 40, 'Rusia'),
('fresa', 10, 50, 40, 'México'),
('grosella', 10, 20, 50, 'India'),
('kiwi', 4, 16, 35, 'Brasil'),
('limón', 10, 100, 3, 'Canadá'),
('mango', 10, 109, 5, 'Italia'),
('manzana', 10, 100, 8, 'México'),
('pera', 10, 45, 5, 'EEUU'),
('plátano', 12, 90, 12, 'Perú'),
('sandía', 1, 2, 20, 'Turquía');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `fruit`
--
ALTER TABLE `fruit`
  ADD PRIMARY KEY (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
