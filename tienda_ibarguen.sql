-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-10-2016 a las 06:21:08
-- Versión del servidor: 5.5.28-log
-- Versión de PHP: 5.4.9

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tienda_ibarguen`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `referencia` varchar(45) NOT NULL,
  `valor` float NOT NULL,
  `adjunto_producto` varchar(45) NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `referencia` (`referencia`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `referencia`, `valor`, `adjunto_producto`, `usuario_id`, `fecha_registro`) VALUES
(1, 'NIKE MERCURIAL 651', '5801', 325000, 'nikemercurial.jpg', 1, '2016-10-10 03:36:15'),
(7, 'Under Armour Speedform CRM FG', '963', 250000, 'under.jpg', 9, '0000-00-00 00:00:00'),
(9, 'Guayos Adidas Predato', '1235', 280000, 'images01.jpg', 20, '0000-00-00 00:00:00'),
(10, 'ADIDAS NITROCHARGE 40 FG', '29915', 128999, 'images (3).jpg', 9, '0000-00-00 00:00:00'),
(11, 'Puma Universal II IN', '1739', 150500, '121706.jpg', 9, '0000-00-00 00:00:00'),
(12, 'didas ACE 16.3 Cage', '1359', 99999, '119097.jpg', 9, '0000-00-00 00:00:00'),
(14, 'Nike MagistaX Pro IC', '9498', 129900, '122494.jpg', 9, '0000-00-00 00:00:00'),
(15, 'Lotto Zhero Gravity VII 700 TF -Azul/Amarillo', 'R8575', 135900, '117584.jpg', 9, '0000-00-00 00:00:00'),
(16, 'Guayos Nike Total 90 Laser lll', 'CTR360', 180000, 'nike-ctr360-maestri-review.jpg', 9, '0000-00-00 00:00:00'),
(17, 'GUAYOS PATRICK JAMES/RB-H2', 'JR00110', 149900, 'images (4).jpg', 9, '0000-00-00 00:00:00'),
(20, 'PUMA evoPOWER 1 "Pool Green"', '8885', 350000, 'puma-evopower-green-img-tab.jpg', 9, '0000-00-00 00:00:00'),
(21, 'Nike Tech Craft Pack ', '2 FG ', 380000, 'nike-tech-300x300.jpg', 9, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes`
--

CREATE TABLE IF NOT EXISTS `reportes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `opreaciones` enum('iniciar sesion','cerrar sesion','compra','actualizacion','crear','eliminar','contrasena') NOT NULL,
  `datos_computador` mediumtext NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `observaciones` mediumtext NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tipo_usuario` enum('administrador','cliente') NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `tipo_usuario`, `contrasena`, `fecha_creacion`) VALUES
(1, 'lucho', 'ibarguen', 'ibarguen1294@gmail.com', 'administrador', '123456', '2016-10-10 21:59:30'),
(9, 'luis', 'ibarguen', 'lucho_man13@hotmail.com', 'administrador', '7c4a8d09ca3762af61e59520943dc26494f8941b', '2016-10-10 20:47:04'),
(13, 'luis', 'ibarg', 'lucho94@hotmail.com', 'cliente', 'fee1d0babf243a49d9a3a5cd56493ca48c0c3b41', '2016-10-11 23:04:58'),
(20, 'andres', 'velez', 'andresyou@hotmail.com', 'cliente', 'b7ed088190c204b31cd71484e6a1c538986b5f77', '2016-10-10 23:56:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE IF NOT EXISTS `ventas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usuario_id` int(10) unsigned NOT NULL,
  `producto_id` int(10) unsigned NOT NULL,
  `valor` float NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `producto_id` (`producto_id`),
  KEY `usuario_id` (`usuario_id`,`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `reportes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
