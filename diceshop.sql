-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2020 a las 16:17:55
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `diceshop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_receipt`
--

CREATE TABLE `det_receipt` (
  `CodDic` int(11) NOT NULL,
  `CodRec` int(11) NOT NULL,
  `PreVen` float NOT NULL,
  `CanDic` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `det_receipt`
--

INSERT INTO `det_receipt` (`CodDic`, `CodRec`, `PreVen`, `CanDic`) VALUES
(1, 1, 14.5, 1),
(2, 1, 19.9, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dicesets`
--

CREATE TABLE `dicesets` (
  `CodDic` int(11) NOT NULL,
  `NomDic` varchar(45) NOT NULL,
  `PreDic` float NOT NULL,
  `CanDic` int(11) NOT NULL,
  `DesDic` text DEFAULT NULL COMMENT 'A short dice description',
  `ImgDad` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dicesets`
--

INSERT INTO `dicesets` (`CodDic`, `NomDic`, `PreDic`, `CanDic`, `DesDic`, `ImgDad`) VALUES
(1, 'Astral Set', 14.5, 4, 'Purple transparent dice set with a space effect inside ', 'dice1.jpg'),
(2, 'Emerald Set', 19.9, 9, 'green set perfect for a druid', 'dice3.jpg'),
(3, 'Candy Set', 9.99, 18, 'colorful set perfect for sweet characters', 'dice5.jpg'),
(4, 'Gold Sea', 6.99, 13, 'A sea colored D20 with fake gold inside, perfect for your pirates', 'dice2.jpg'),
(5, 'Pink set', 11.5, 20, 'A pink set of dice perfect for happy and sweet characters', 'dice6.jpg'),
(6, 'Galaxy set', 19.9, 14, 'A space inspired set, perfect for adventures in other plains of existance', 'dice4.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receipt`
--

CREATE TABLE `receipt` (
  `CodRec` int(11) NOT NULL,
  `CodUse` int(11) NOT NULL,
  `DatRec` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `receipt`
--

INSERT INTO `receipt` (`CodRec`, `CodUse`, `DatRec`) VALUES
(1, 1, '2020-03-08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `CodUse` int(11) NOT NULL,
  `NomUse` varchar(45) NOT NULL,
  `ApeUse` varchar(45) NOT NULL,
  `NicUse` varchar(20) NOT NULL,
  `CreUse` float NOT NULL DEFAULT 0 COMMENT 'User credit',
  `PasUse` varchar(45) NOT NULL,
  `EmaUse` varchar(45) NOT NULL,
  `CiuUse` varchar(45) NOT NULL,
  `StrUse` varchar(45) NOT NULL,
  `NumUse` int(11) NOT NULL,
  `DatUse` date DEFAULT NULL COMMENT 'Date for when the user was born',
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`CodUse`, `NomUse`, `ApeUse`, `NicUse`, `CreUse`, `PasUse`, `EmaUse`, `CiuUse`, `StrUse`, `NumUse`, `DatUse`, `admin`) VALUES
(1, 'admin', 'admin', 'root', 99699.6, '63A9F0EA7BB98050796B649E85481845', 'fake@fake.com', 'Malaga', 'Fake Street', 420, '0001-01-01', 1),
(2, 'usuario', 'usuario', 'user', 35.71, 'EE11CBB19052E40B07AAC0CA060C23EE', 'nonono@ffff.com', 'Malaga', 'None', 0, '2000-01-02', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `det_receipt`
--
ALTER TABLE `det_receipt`
  ADD PRIMARY KEY (`CodDic`,`CodRec`),
  ADD KEY `fk_dicesets_has_receipt_receipt1_idx` (`CodRec`),
  ADD KEY `fk_dicesets_has_receipt_dicesets1_idx` (`CodDic`);

--
-- Indices de la tabla `dicesets`
--
ALTER TABLE `dicesets`
  ADD PRIMARY KEY (`CodDic`);

--
-- Indices de la tabla `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`CodRec`),
  ADD KEY `fk_receipt_user1_idx` (`CodUse`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`CodUse`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `det_receipt`
--
ALTER TABLE `det_receipt`
  ADD CONSTRAINT `fk_dicesets_has_receipt_dicesets1` FOREIGN KEY (`CodDic`) REFERENCES `dicesets` (`CodDic`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dicesets_has_receipt_receipt1` FOREIGN KEY (`CodRec`) REFERENCES `receipt` (`CodRec`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `fk_receipt_user1` FOREIGN KEY (`CodUse`) REFERENCES `user` (`CodUse`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
