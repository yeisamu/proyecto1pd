-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 26-04-2017 a las 17:20:44
-- Versión del servidor: 5.1.41
-- Versión de PHP: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `supermercado`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra_temp`
--

CREATE TABLE IF NOT EXISTS `detalle_compra_temp` (
  `id_detalle_compra` int(10) NOT NULL AUTO_INCREMENT,
  `id_producto` int(10) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `valor` bigint(20) NOT NULL,
  `user` varchar(50) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_detalle_compra`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Volcar la base de datos para la tabla `detalle_compra_temp`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `id_detalle` int(10) NOT NULL AUTO_INCREMENT,
  `id_producto` int(10) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `valor` bigint(20) NOT NULL,
  `user` varchar(50) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `id_factura` int(10) NOT NULL,
  PRIMARY KEY (`id_detalle`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Volcar la base de datos para la tabla `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_detalle`, `id_producto`, `cantidad`, `valor`, `user`, `fecha_registro`, `id_factura`) VALUES
(1, 12, 2, 3000, 'usuario', '2017-04-22 18:11:22', 7),
(2, 12, 5, 7500, 'usuario', '2017-04-22 18:11:31', 7),
(3, 11, 2, 3000, 'usuario', '2017-04-22 18:11:35', 7),
(4, 12, 3, 4500, 'usuario', '2017-04-22 18:15:54', 7),
(5, 12, 3, 4500, 'usuario', '2017-04-22 18:17:00', 7),
(6, 1, 1, 1500, 'usuario', '2017-04-22 18:41:17', 7),
(7, 1, 1, 1500, 'usuario', '2017-04-22 19:08:16', 7),
(8, 12, 2, 3000, 'usuario', '2017-04-22 18:11:22', 11),
(9, 12, 5, 7500, 'usuario', '2017-04-22 18:11:31', 11),
(10, 11, 2, 3000, 'usuario', '2017-04-22 18:11:35', 11),
(11, 12, 3, 4500, 'usuario', '2017-04-22 18:15:54', 11),
(12, 12, 3, 4500, 'usuario', '2017-04-22 18:17:00', 11),
(13, 1, 1, 1500, 'usuario', '2017-04-22 18:41:17', 11),
(14, 1, 1, 1500, 'usuario', '2017-04-22 19:08:16', 11),
(15, 12, 2, 3000, 'usuario', '2017-04-22 18:11:22', 12),
(16, 12, 5, 7500, 'usuario', '2017-04-22 18:11:31', 12),
(17, 11, 2, 3000, 'usuario', '2017-04-22 18:11:35', 12),
(18, 12, 3, 4500, 'usuario', '2017-04-22 18:15:54', 12),
(19, 12, 3, 4500, 'usuario', '2017-04-22 18:17:00', 12),
(20, 1, 1, 1500, 'usuario', '2017-04-22 18:41:17', 12),
(21, 1, 1, 1500, 'usuario', '2017-04-22 19:08:16', 12),
(22, 1, 3, 4500, 'usuario', '2017-04-26 14:44:52', 15),
(23, 12, 2, 3000, 'usuario', '2017-04-26 14:44:57', 15),
(24, 1, 2, 3000, 'usuario', '2017-04-26 14:45:18', 15),
(25, 10, 100, 100000, 'usuario', '2017-04-26 14:49:22', 16),
(26, 10, 100, 100000, 'usuario', '2017-04-26 14:50:26', 17),
(27, 10, 100, 100000, 'usuario', '2017-04-26 14:57:42', 18),
(28, 10, 100, 100000, 'usuario', '2017-04-26 15:33:51', 19),
(29, 9, 1, 16000, 'yeison.velasquez@gmail.com', '2017-04-26 16:16:20', 24),
(30, 12, 2, 3000, 'usuario', '2017-04-26 16:16:36', 25),
(31, 8, 1, 1000, 'usuario', '2017-04-26 16:17:10', 25),
(32, 10, 1, 1000, 'usuario', '2017-04-26 16:17:14', 25);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE IF NOT EXISTS `factura` (
  `id_fatura` int(10) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) NOT NULL,
  `total` int(20) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `estado` enum('liquidado','sin_pagar') NOT NULL DEFAULT 'sin_pagar',
  PRIMARY KEY (`id_fatura`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Volcar la base de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_fatura`, `user`, `total`, `fecha_factura`, `estado`) VALUES
(1, '2', 24000, '2017-04-22 18:43:20', 'sin_pagar'),
(2, '2', 24000, '2017-04-22 19:05:29', 'sin_pagar'),
(3, '2', 24000, '2017-04-22 19:06:28', 'sin_pagar'),
(4, '2', 25500, '2017-04-22 19:08:30', 'sin_pagar'),
(5, '2', 25500, '2017-04-22 19:09:33', 'sin_pagar'),
(6, '2', 25500, '2017-04-22 19:10:35', 'sin_pagar'),
(7, '2', 25500, '2017-04-22 19:11:30', 'sin_pagar'),
(8, '2', 25500, '2017-04-22 19:11:57', 'sin_pagar'),
(9, '2', 25500, '2017-04-22 19:12:50', 'sin_pagar'),
(10, '2', 25500, '2017-04-22 19:14:56', 'sin_pagar'),
(11, '2', 25500, '2017-04-22 19:17:35', 'sin_pagar'),
(12, 'usuario', 25500, '2017-04-22 19:28:45', 'liquidado'),
(13, 'usuario', 3000, '2017-04-26 14:25:55', 'sin_pagar'),
(14, 'usuario', 3000, '2017-04-26 14:38:05', 'sin_pagar'),
(15, 'usuario', 10500, '2017-04-26 14:45:31', 'sin_pagar'),
(16, 'usuario', 100000, '2017-04-26 14:49:41', 'sin_pagar'),
(17, 'usuario', 100000, '2017-04-26 14:50:34', 'liquidado'),
(18, 'usuario', 100000, '2017-04-26 14:57:55', 'liquidado'),
(19, 'usuario', 100000, '2017-04-26 15:34:02', 'liquidado'),
(20, 'usuario', 0, '2017-04-26 15:34:28', 'liquidado'),
(21, 'usuario', 0, '2017-04-26 15:39:43', 'sin_pagar'),
(22, 'usuario', 0, '2017-04-26 15:46:35', 'sin_pagar'),
(23, 'usuario', 0, '2017-04-26 15:47:07', 'sin_pagar'),
(24, 'yeison.velasquez@gmail.com', 16000, '2017-04-26 16:16:56', 'liquidado'),
(25, 'usuario', 5000, '2017-04-26 16:17:23', 'liquidado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` date NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `intentos` varchar(10) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `hora_ingreso` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=137 ;

--
-- Volcar la base de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `fecha_ingreso`, `usuario`, `intentos`, `ip`, `hora_ingreso`) VALUES
(1, '2017-04-18', 'asdasd', 'Fallo', '127.0.0.1', '20:29:05'),
(2, '2017-04-18', 'admin', 'ok', '127.0.0.1', '20:29:11'),
(3, '2017-04-18', 'admin', 'ok', '127.0.0.1', '20:33:37'),
(4, '2017-04-18', 'asd', 'Fallo', '127.0.0.1', '20:34:27'),
(5, '2017-04-18', 'admin', 'ok', '127.0.0.1', '20:34:34'),
(6, '2017-04-18', 'admin', 'ok', '127.0.0.1', '20:38:39'),
(7, '2017-04-18', 'admin', 'ok', '127.0.0.1', '20:39:36'),
(8, '2017-04-18', 'admin', 'ok', '127.0.0.1', '20:41:25'),
(9, '2017-04-18', 'admin', 'ok', '127.0.0.1', '20:46:07'),
(10, '2017-04-18', 'admin', 'ok', '127.0.0.1', '20:46:45'),
(11, '2017-04-18', 'admin', 'ok', '127.0.0.1', '20:48:11'),
(12, '2017-04-18', 'admin', 'ok', '127.0.0.1', '20:51:29'),
(13, '2017-04-18', 'admin', 'ok', '127.0.0.1', '20:51:51'),
(14, '2017-04-18', 'usuario', 'ok', '127.0.0.1', '20:52:13'),
(15, '2017-04-18', 'admin', 'ok', '127.0.0.1', '21:11:11'),
(16, '2017-04-18', 'admin', 'ok', '127.0.0.1', '21:28:09'),
(17, '2017-04-18', 'admin', 'ok', '127.0.0.1', '21:28:44'),
(18, '2017-04-18', 'admin', 'ok', '127.0.0.1', '21:29:22'),
(19, '2017-04-18', 'admin', 'ok', '127.0.0.1', '21:31:38'),
(20, '2017-04-18', 'admin', 'ok', '127.0.0.1', '21:41:24'),
(21, '2017-04-18', 'usuario', 'ok', '127.0.0.1', '21:41:33'),
(22, '2017-04-18', 'admin', 'ok', '127.0.0.1', '21:58:48'),
(23, '2017-04-18', 'usuario', 'ok', '127.0.0.1', '21:58:58'),
(24, '2017-04-18', 'usuario', 'ok', '127.0.0.1', '22:00:07'),
(25, '2017-04-18', 'usuario', 'ok', '127.0.0.1', '22:04:28'),
(26, '2017-04-18', 'usuario', 'ok', '127.0.0.1', '22:05:20'),
(27, '2017-04-18', 'admin', 'ok', '127.0.0.1', '22:19:56'),
(28, '2017-04-18', 'usuario', 'ok', '127.0.0.1', '22:20:13'),
(29, '2017-04-22', 'admin', 'ok', '127.0.0.1', '16:15:28'),
(30, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '16:15:37'),
(31, '2017-04-22', 'uaurio', 'Fallo', '127.0.0.1', '16:18:39'),
(32, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '16:18:51'),
(33, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '17:04:00'),
(34, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '17:07:23'),
(35, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '17:08:18'),
(36, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '17:09:17'),
(37, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '17:47:10'),
(38, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '17:48:22'),
(39, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '17:49:54'),
(40, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '17:53:10'),
(41, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '18:10:16'),
(42, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '18:11:14'),
(43, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '18:15:46'),
(44, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '18:16:56'),
(45, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '18:41:10'),
(46, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '18:43:09'),
(47, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '19:05:24'),
(48, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '19:06:24'),
(49, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '19:08:10'),
(50, '2017-04-22', 'usuario', 'Fallo', '127.0.0.1', '19:09:24'),
(51, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '19:09:29'),
(52, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '19:10:30'),
(53, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '19:11:27'),
(54, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '19:11:54'),
(55, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '19:12:45'),
(56, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '19:14:53'),
(57, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '19:17:32'),
(58, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '19:28:09'),
(59, '2017-04-22', 'usuario', 'ok', '127.0.0.1', '19:28:40'),
(60, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:04:06'),
(61, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:07:09'),
(62, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:08:03'),
(63, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:08:39'),
(64, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:09:00'),
(65, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:10:59'),
(66, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:12:59'),
(67, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:14:08'),
(68, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:15:24'),
(69, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:16:34'),
(70, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:19:29'),
(71, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:20:18'),
(72, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:21:00'),
(73, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:22:41'),
(74, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:24:44'),
(75, '2017-04-25', 'usuario', 'ok', '127.0.0.1', '20:25:39'),
(76, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '08:04:09'),
(77, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '08:11:18'),
(78, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '08:11:45'),
(79, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '08:12:47'),
(80, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '08:13:25'),
(81, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '08:13:48'),
(82, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '08:25:38'),
(83, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '08:26:48'),
(84, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '08:38:45'),
(85, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '08:42:57'),
(86, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '08:44:25'),
(87, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '08:59:30'),
(88, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '09:13:43'),
(89, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '09:15:16'),
(90, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '09:15:35'),
(91, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '09:20:49'),
(92, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '09:27:29'),
(93, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '09:42:23'),
(94, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '09:46:39'),
(95, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '09:48:45'),
(96, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '09:52:33'),
(97, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '09:53:31'),
(98, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '09:54:45'),
(99, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '10:37:14'),
(100, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '10:45:43'),
(101, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '10:50:57'),
(102, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '10:52:26'),
(103, '2017-04-26', 'admin', 'ok', '127.0.0.1', '10:52:59'),
(104, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '11:30:26'),
(105, '2017-04-26', 'admin', 'ok', '127.0.0.1', '11:30:33'),
(106, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '11:45:47'),
(107, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '14:25:36'),
(108, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '14:28:07'),
(109, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '14:29:10'),
(110, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '14:30:28'),
(111, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '14:31:10'),
(112, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '14:43:55'),
(113, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '14:46:23'),
(114, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '14:48:22'),
(115, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '14:49:19'),
(116, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '14:50:23'),
(117, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '14:57:39'),
(118, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:14:37'),
(119, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:15:04'),
(120, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:16:02'),
(121, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:16:31'),
(122, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:17:12'),
(123, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:18:01'),
(124, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:33:48'),
(125, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:37:08'),
(126, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:37:46'),
(127, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:39:36'),
(128, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:44:20'),
(129, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:46:31'),
(130, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:47:03'),
(131, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '15:47:55'),
(132, '2017-04-26', 'admin', 'ok', '127.0.0.1', '15:50:20'),
(133, '2017-04-26', '7', 'Fallo', '127.0.0.1', '16:15:31'),
(134, '2017-04-26', 'yeison.velasquez@gmail.com', 'ok', '127.0.0.1', '16:15:41'),
(135, '2017-04-26', 'yeison.velasquez@gmail.com', 'ok', '127.0.0.1', '16:16:04'),
(136, '2017-04-26', 'usuario', 'ok', '127.0.0.1', '16:16:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premios`
--

CREATE TABLE IF NOT EXISTS `premios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `premio` varchar(100) NOT NULL,
  `puntos` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `premios`
--

INSERT INTO `premios` (`id`, `premio`, `puntos`) VALUES
(1, 'Olla Arrocera', 20),
(2, 'Lampara de Techo', 15),
(3, 'Juego de Cocina', 25),
(4, 'Televisor 14 Pulgadas', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premios_cambiados`
--

CREATE TABLE IF NOT EXISTS `premios_cambiados` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `idpremio` int(4) NOT NULL,
  `user` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `premios_cambiados`
--

INSERT INTO `premios_cambiados` (`id`, `idpremio`, `user`, `fecha`) VALUES
(1, 3, 'usuario', '2017-04-26'),
(2, 1, 'usuario', '2017-04-26'),
(3, 1, 'usuario', '2017-04-26'),
(4, 2, 'usuario', '2017-04-26'),
(5, 3, 'usuario', '2017-04-26'),
(6, 2, 'usuario', '2017-04-26'),
(7, 2, 'usuario', '2017-04-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `producto` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `val_unit` varchar(10) NOT NULL,
  `stock` int(10) NOT NULL,
  `stock_minimo` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Volcar la base de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `producto`, `descripcion`, `val_unit`, `stock`, `stock_minimo`) VALUES
(1, 'manza', 'mod', '1340', 123, 5),
(2, 'poma madura', 'freca fruta del campo', '2310', 8, 5),
(3, 'axion', 'lavaplatos', '15000', 10, 5),
(4, 'flores', 'rojas', '1000', 20, 5),
(5, 'mango', 'verde', '1000', 10, 5),
(6, 'rosas', 'blancas', '1000', 12, 5),
(7, 'arroz', 'roa', '1600', 10, 5),
(8, 'fresas', 'verdes', '1000', 9, 5),
(9, 'moras', 'congeladas', '16000', 9, 5),
(10, 'peras', 'peras', '1000', 899, 5),
(11, 'papaya', '', '2000', 10, 5),
(12, 'Aguacate', 'Maduro', '1500', 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `tipo`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'CLIENTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `tipo_user` int(2) NOT NULL,
  `fecha_registro` date NOT NULL,
  `puntos` int(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `pass`, `nombre`, `tipo_user`, `fecha_registro`, `puntos`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Jhon James Cano', 1, '2017-04-15', 0),
(2, 'usuario', '827ccb0eea8a706c4c34a16891f84e7b', 'Vianey Patricia Ceballos', 2, '2017-04-17', 330),
(3, 'yeison.velasquez@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'yeison velasquez', 2, '2017-04-18', 16),
(4, 'a', '0cc175b9c0f1b6a831c399e269772661', 'a', 1, '2017-04-26', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
