-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 03 juin 2021 à 08:59
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `stockage`
--
CREATE DATABASE IF NOT EXISTS `stockage` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `stockage`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` char(50) NOT NULL,
  `idparent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idparent` (`idparent`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `nom`, `idparent`) VALUES
(1, 'Périphérique', NULL),
(2, 'Connectique', NULL),
(7, 'Composant', NULL),
(8, 'Divers', NULL),
(9, 'Appareils', NULL),
(10, 'Consomable imprimante', NULL),
(11, 'Adaptateur électrique', NULL),
(14, 'Souris', 1),
(15, 'Clavier', 1),
(16, 'Kit clavier-souris', 1),
(17, 'Écran', 1),
(18, 'Lecteur', 1),
(19, 'Alimentation(IEC)', 2),
(20, 'Ethernet (RJ45)', 2),
(26, 'Audio (Jack)', 2),
(27, 'Affichage', 2),
(28, 'USB', 2),
(29, 'Adaptateur', 2),
(30, 'Duplicateur', 2),
(31, 'Stockage', 7),
(32, 'Carte graphique', 7),
(33, 'Alimentation', 7),
(34, 'Lecteur CD', 7),
(35, 'RAM', 7),
(36, 'Batterie PC portable', 7),
(37, 'Autres', 7),
(38, 'Stockage', 8),
(39, 'Autres', 8),
(40, 'Entretien', 8),
(41, 'PC portable', 9),
(42, 'Réplicateur de port', 9),
(43, 'Unité centrale', 9),
(44, 'Divers', 9),
(45, 'Téléphone', 9),
(46, 'Client Léger', 9),
(47, 'Répartiteur', 9),
(48, 'Pare-feu', 9),
(49, 'Équipement VoIP', 9),
(50, '6600/400/405', 10),
(51, '7020/7025/7030', 10),
(52, 'Autres', 10),
(53, 'Tous', 11);

-- --------------------------------------------------------

--
-- Structure de la table `flux`
--

DROP TABLE IF EXISTS `flux`;
CREATE TABLE IF NOT EXISTS `flux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` char(1) NOT NULL,
  `idobject` int(11) NOT NULL,
  `idpers` int(11) NOT NULL,
  `nombre` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idobject` (`idobject`),
  KEY `idpers` (`idpers`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `flux`
--

INSERT INTO `flux` (`id`, `mode`, `idobject`, `idpers`, `nombre`, `date`) VALUES
(15, 'D', 69, 1, 1, '2021-04-28'),
(16, 'D', 68, 1, 2, '2021-04-28'),
(17, 'D', 79, 1, 2, '2021-04-28'),
(18, 'D', 73, 1, 1, '2021-04-28'),
(19, 'D', 80, 1, 1, '2021-04-28'),
(20, 'D', 66, 1, 1, '2021-04-28'),
(21, 'D', 79, 1, 1, '2021-04-28'),
(22, 'D', 104, 1, 1, '2021-04-28'),
(23, 'D', 217, 1, 3, '2021-04-28'),
(24, 'D', 75, 1, 1, '2021-04-28'),
(25, 'D', 67, 1, 1, '2021-04-28'),
(26, 'D', 205, 1, 1, '2021-04-28'),
(27, 'D', 27, 1, 1, '2021-04-28'),
(28, 'D', 191, 1, 1, '2021-04-28'),
(29, 'D', 92, 1, 1, '2021-04-28'),
(30, 'D', 79, 1, 1, '2021-04-28'),
(31, 'D', 226, 1, 1, '2021-04-28'),
(32, 'D', 277, 1, 1, '2021-04-28'),
(33, 'D', 276, 1, 1, '2021-04-28'),
(34, 'D', 275, 1, 1, '2021-04-28'),
(35, 'D', 76, 1, 1, '2021-04-28'),
(36, 'D', 352, 1, 1, '2021-04-28'),
(37, 'D', 67, 1, 1, '2021-04-28'),
(38, 'D', 361, 1, 1, '2021-04-28'),
(39, 'D', 68, 2, 1, '2021-04-28'),
(40, 'R', 231, 1, 1, '2021-04-29'),
(41, 'D', 231, 1, 1, '2021-04-29'),
(42, 'D', 154, 1, 1, '2021-04-29'),
(43, 'R', 355, 1, 1, '2021-04-30'),
(44, 'R', 344, 1, 1, '2021-04-30'),
(45, 'R', 67, 1, 1, '2021-04-30'),
(46, 'R', 356, 1, 1, '2021-04-30'),
(47, 'R', 347, 1, 1, '2021-04-30'),
(48, 'R', 67, 1, 1, '2021-04-30'),
(49, 'R', 278, 1, 1, '2021-05-03'),
(50, 'R', 277, 1, 1, '2021-05-03'),
(51, 'R', 276, 1, 1, '2021-05-03'),
(52, 'R', 275, 1, 1, '2021-05-03'),
(53, 'R', 12, 8, 1, '2021-05-03'),
(54, 'R', 165, 8, 1, '2021-05-03'),
(55, 'R', 9, 9, 1, '2021-05-03'),
(56, 'D', 343, 1, 1, '2021-05-03'),
(57, 'D', 66, 1, 1, '2021-05-03'),
(58, 'D', 79, 1, 1, '2021-05-03'),
(59, 'R', 375, 1, 1, '2021-05-03'),
(60, 'R', 66, 1, 1, '2021-05-03'),
(61, 'D', 75, 1, 1, '2021-05-03'),
(62, 'D', 76, 1, 1, '2021-05-03'),
(63, 'D', 66, 1, 1, '2021-05-03'),
(64, 'R', 44, 3, 1, '2021-05-03'),
(65, 'R', 43, 3, 1, '2021-05-03'),
(66, 'R', 167, 3, 2, '2021-05-03'),
(67, 'R', 66, 3, 1, '2021-05-03'),
(68, 'R', 24, 9, 1, '2021-05-03'),
(69, 'D', 377, 1, 6, '2021-05-03'),
(70, 'D', 377, 1, 1, '2021-05-04'),
(71, 'D', 343, 1, 1, '2021-05-04'),
(72, 'D', 67, 1, 1, '2021-05-04'),
(73, 'R', 167, 3, 1, '2021-05-04'),
(74, 'D', 79, 3, 1, '2021-05-04'),
(75, 'D', 67, 3, 1, '2021-05-04'),
(76, 'D', 76, 3, 6, '2021-05-04'),
(77, 'D', 75, 3, 1, '2021-05-04'),
(78, 'D', 89, 3, 6, '2021-05-04'),
(79, 'D', 73, 3, 1, '2021-05-04'),
(80, 'R', 75, 3, 1, '2021-05-04'),
(81, 'D', 373, 1, 2, '2021-05-04'),
(82, 'D', 97, 1, 1, '2021-05-04'),
(83, 'R', 40, 7, 1, '2021-05-05'),
(84, 'D', 118, 1, 1, '2021-05-05'),
(85, 'R', 92, 3, 1, '2021-05-05'),
(86, 'R', 231, 3, 1, '2021-05-06'),
(87, 'R', 69, 3, 1, '2021-05-06'),
(88, 'R', 67, 3, 1, '2021-05-06'),
(89, 'R', 66, 3, 1, '2021-05-06'),
(90, 'R', 166, 3, 1, '2021-05-06'),
(91, 'R', 21, 3, 1, '2021-05-06'),
(92, 'R', 76, 3, 1, '2021-05-06'),
(93, 'R', 273, 1, 1, '2021-05-07'),
(94, 'D', 81, 5, 26, '2021-05-10'),
(95, 'R', 76, 3, 1, '2021-05-10'),
(96, 'D', 76, 3, 1, '2021-05-10'),
(97, 'R', 375, 4, 1, '2021-05-10'),
(98, 'D', 274, 1, 1, '2021-05-10'),
(99, 'D', 66, 1, 1, '2021-05-10'),
(100, 'D', 75, 1, 1, '2021-05-10'),
(101, 'R', 305, 1, 1, '2021-05-10'),
(102, 'R', 68, 1, 1, '2021-05-11'),
(103, 'D', 92, 1, 1, '2021-05-11'),
(104, 'D', 373, 1, 1, '2021-05-11'),
(106, 'R', 79, 4, 1, '2021-05-11'),
(107, 'R', 276, 1, 1, '2021-05-11'),
(108, 'D', 5, 2, 9, '2021-05-12'),
(109, 'R', 386, 3, 1, '2021-05-12'),
(110, 'D', 27, 3, 1, '2021-05-12'),
(111, 'R', 80, 3, 1, '2021-05-14'),
(112, 'R', 305, 3, 1, '2021-05-14'),
(113, 'R', 80, 3, 1, '2021-05-14'),
(114, 'R', 75, 3, 1, '2021-05-14'),
(115, 'D', 96, 3, 2, '2021-05-17'),
(116, 'D', 79, 3, 2, '2021-05-17'),
(117, 'D', 73, 3, 2, '2021-05-17'),
(118, 'D', 76, 3, 4, '2021-05-17'),
(119, 'D', 81, 3, 23, '2021-05-17'),
(120, 'D', 66, 3, 3, '2021-05-17'),
(121, 'D', 89, 3, 1, '2021-05-17'),
(122, 'D', 286, 3, 1, '2021-05-17'),
(123, 'D', 217, 3, 1, '2021-05-17'),
(124, 'D', 74, 3, 1, '2021-05-17'),
(125, 'D', 67, 3, 1, '2021-05-17'),
(126, 'D', 343, 3, 1, '2021-05-17'),
(127, 'D', 209, 3, 2, '2021-05-17'),
(128, 'D', 367, 3, 1, '2021-05-17'),
(129, 'D', 226, 3, 1, '2021-05-17'),
(130, 'D', 80, 3, 5, '2021-05-17'),
(131, 'D', 69, 3, 1, '2021-05-17'),
(132, 'D', 68, 3, 5, '2021-05-17'),
(133, 'D', 70, 3, 2, '2021-05-17'),
(134, 'D', 92, 3, 3, '2021-05-17'),
(135, 'D', 75, 3, 3, '2021-05-17'),
(136, 'D', 73, 3, 1, '2021-05-17'),
(137, 'D', 79, 3, 1, '2021-05-17'),
(138, 'D', 66, 3, 1, '2021-05-17'),
(139, 'D', 205, 3, 1, '2021-05-17'),
(140, 'D', 28, 3, 1, '2021-05-17'),
(141, 'D', 79, 3, 1, '2021-05-17'),
(142, 'D', 66, 3, 1, '2021-05-17'),
(143, 'D', 88, 3, 1, '2021-05-17'),
(144, 'D', 41, 4, 1, '2021-05-17'),
(145, 'R', 397, 4, 1, '2021-05-17'),
(146, 'R', 92, 4, 1, '2021-05-17'),
(147, 'R', 73, 3, 1, '2021-05-17'),
(148, 'R', 75, 3, 1, '2021-05-17'),
(149, 'R', 76, 3, 1, '2021-05-17'),
(150, 'R', 66, 3, 1, '2021-05-17'),
(151, 'R', 235, 3, 1, '2021-05-17'),
(152, 'R', 339, 1, 1, '2021-05-18'),
(153, 'R', 67, 1, 1, '2021-05-18'),
(154, 'D', 339, 1, 1, '2021-05-18'),
(155, 'R', 364, 1, 1, '2021-05-18'),
(156, 'R', 80, 3, 1, '2021-05-18'),
(157, 'R', 397, 3, 1, '2021-05-18'),
(158, 'R', 92, 3, 1, '2021-05-18'),
(159, 'R', 395, 3, 1, '2021-05-18'),
(160, 'R', 52, 3, 1, '2021-05-18'),
(161, 'R', 66, 3, 2, '2021-05-18'),
(162, 'R', 67, 4, 1, '2021-05-19'),
(163, 'R', 2, 3, 1, '2021-05-19'),
(164, 'D', 48, 3, 1, '2021-05-19'),
(165, 'D', 397, 3, 1, '2021-05-19'),
(166, 'R', 96, 3, 1, '2021-05-19'),
(167, 'R', 69, 3, 1, '2021-05-19'),
(168, 'R', 68, 6, 3, '2021-05-19'),
(169, 'R', 69, 3, 3, '2021-05-20'),
(170, 'R', 69, 1, 2, '2021-05-20'),
(171, 'R', 353, 2, 1, '2021-05-20'),
(172, 'D', 353, 2, 1, '2021-05-20'),
(173, 'R', 351, 3, 1, '2021-05-21'),
(174, 'R', 69, 1, 1, '2021-05-21'),
(175, 'R', 68, 1, 1, '2021-05-21'),
(176, 'R', 352, 2, 1, '2021-05-21'),
(177, 'R', 68, 2, 1, '2021-05-21'),
(178, 'D', 226, 1, 1, '2021-05-25'),
(179, 'D', 286, 1, 1, '2021-05-25'),
(180, 'R', 68, 4, 1, '2021-05-25'),
(181, 'R', 68, 4, 1, '2021-05-26'),
(182, 'R', 69, 4, 1, '2021-05-26'),
(183, 'R', 70, 1, 1, '2021-05-26'),
(184, 'R', 63, 1, 1, '2021-05-26'),
(185, 'R', 396, 1, 1, '2021-05-26'),
(186, 'D', 70, 4, 1, '2021-05-26'),
(187, 'D', 69, 4, 1, '2021-05-26'),
(188, 'R', 353, 9, 2, '2021-05-26'),
(189, 'R', 69, 1, 1, '2021-05-26'),
(190, 'D', 68, 1, 1, '2021-05-26'),
(191, 'R', 68, 7, 4, '2021-05-27'),
(192, 'R', 96, 3, 1, '2021-05-28'),
(193, 'R', 66, 3, 1, '2021-05-28'),
(194, 'R', 51, 3, 1, '2021-05-28'),
(195, 'R', 7, 1, 1, '2021-05-28'),
(196, 'R', 21, 1, 1, '2021-05-28'),
(197, 'R', 231, 1, 1, '2021-05-28'),
(198, 'R', 67, 1, 1, '2021-05-28'),
(199, 'R', 66, 1, 1, '2021-05-28'),
(200, 'R', 76, 1, 1, '2021-05-28'),
(201, 'R', 47, 1, 1, '2021-05-28'),
(202, 'R', 68, 1, 2, '2021-05-28'),
(203, 'R', 25, 2, 1, '2021-05-28'),
(204, 'R', 165, 1, 1, '2021-05-28'),
(205, 'R', 51, 3, 1, '2021-05-28'),
(206, 'R', 62, 3, 1, '2021-05-28'),
(207, 'R', 66, 3, 2, '2021-05-28'),
(208, 'R', 88, 3, 2, '2021-05-28'),
(209, 'R', 71, 1, 1, '2021-06-01'),
(210, 'R', 69, 1, 1, '2021-06-01'),
(211, 'R', 46, 7, 1, '2021-06-01'),
(212, 'R', 76, 7, 1, '2021-06-01'),
(213, 'R', 66, 7, 1, '2021-06-01'),
(214, 'R', 76, 1, 1, '2021-06-01'),
(215, 'R', 217, 2, 1, '2021-06-02'),
(216, 'R', 75, 3, 1, '2021-06-02'),
(217, 'R', 275, 1, 1, '2021-06-02'),
(218, 'R', 66, 1, 3, '2021-06-02'),
(219, 'R', 41, 1, 3, '2021-06-02'),
(220, 'R', 73, 1, 1, '2021-06-02'),
(221, 'R', 69, 1, 2, '2021-06-03'),
(222, 'D', 76, 1, 1, '2021-06-03');

-- --------------------------------------------------------

--
-- Structure de la table `object`
--

DROP TABLE IF EXISTS `object`;
CREATE TABLE IF NOT EXISTS `object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcategory` int(11) NOT NULL,
  `nom` char(50) NOT NULL,
  `marque` char(50) NOT NULL,
  `model` char(50) NOT NULL,
  `cout` float NOT NULL,
  `nombre` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idcategory` (`idcategory`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `object`
--

INSERT INTO `object` (`id`, `idcategory`, `nom`, `marque`, `model`, `cout`, `nombre`) VALUES
(1, 14, 'Souris USB', 'DELL', 'OMY897', 9, 1),
(2, 14, 'Souris USB', 'Logitech', 'B100', 9, 2),
(3, 14, 'Souris USB', 'Logitech', 'RX250', 1, 1),
(4, 14, 'Souris USB', 'HP', 'MOFYUD', 9, 1),
(5, 14, 'Souris USB', 'Microsoft', 'Optical Mouse 200', 9, 12),
(6, 14, 'Souris USB', 'HP', 'sm-2022', 25, 1),
(7, 14, 'Souris USB', 'Genius', 'NetScroll120', 7, 0),
(8, 14, 'Souris USB', 'Logitech', 'L0026', 7, 1),
(9, 14, 'Souris USB', 'HP', 'X1200', 17, 1),
(10, 14, 'Souris USB', 'DELL', 'MS111-P', 10, 0),
(11, 14, 'Souris USB', 'DELL', 'M056UD1', 9, 1),
(12, 14, 'Souris USB', 'Microsoft', '', 5, 1),
(13, 14, 'Souris USB', 'Lenovo', 'M-UAE119', 9, 1),
(14, 14, 'Souris USB', 'Lenovo', 'M0EAU', 9, 0),
(15, 14, 'Souris sans-fil', 'Logitech', 'M185', 11, 5),
(16, 14, 'Souris sans-fil', 'DELL', 'WM514', 44, 1),
(17, 14, 'Souris sans-fil', 'HP', 'SM-2064', 18, 1),
(18, 14, 'Souris sans-fil', 'Bluestork', '', 9, 1),
(19, 14, 'Souris sans-fil', 'Logitech', 'M150', 35, 1),
(20, 14, 'Souris PS/2', 'Wyse', 'Mo42kop', 26, 5),
(21, 15, 'Clavier USB', 'Logitech', 'K120', 17, 1),
(22, 15, 'Clavier USB', 'Microsoft', 'Wired Keyboard 200', 12, 2),
(23, 15, 'Clavier USB', 'Lenovo', 'Ku-0225', 19, 6),
(24, 15, 'Clavier USB', 'HP', 'Ku-1156', 15, 0),
(25, 15, 'Clavier USB', 'DELL', 'Kb216', 33, 0),
(26, 15, 'Clavier sans-fil', 'Victsing', 'pc162b', 20, 1),
(27, 15, 'Clavier sans-fil', 'Logitech', 'K270', 30, 9),
(28, 15, 'Clavier sans-fil', 'Logitech', 'K235', 25, 2),
(29, 15, 'Clavier sans-fil', 'Microsoft', 'Wireless keyboard 3000', 15, 2),
(30, 15, 'Clavier sans-fil', 'HP', '5k2064', 20, 1),
(31, 15, 'Clavier sans-fil', 'Bluestork', '', 15, 2),
(32, 15, 'Clavier PS/2', 'Wyse', 'kb-2971', 8, 2),
(33, 15, 'Clavier PS/2', 'Labtec', '876571-1010', 10, 1),
(34, 15, 'Clavier PS/2', '', 'ACK-269FR', 10, 3),
(35, 15, 'Clavier PS/2', 'IBM', '5k-8820', 20, 2),
(36, 15, 'Clavier PS/2', 'Logitech', 'Deluxe 250', 18, 1),
(37, 15, 'Clavier PS/2', 'DELL', '5k-8810', 15, 4),
(38, 15, 'Clavier PS/2', 'IBM', 'kb-9910', 30, 1),
(39, 15, 'Clavier PS/2', 'HP', 'kb-9965', 20, 1),
(40, 16, 'Kit clavier souris', 'MSI', '', 1, 45),
(41, 17, 'Ecran 3840x2160', 'HP', 'Z27', 600, 0),
(42, 17, 'Ecran 1920x1080', 'LG', '22M45HQ-B', 240, 0),
(43, 17, 'Ecran 1920x1080', 'HP', 'E24 G4', 240, 1),
(44, 17, 'Ecran 1920x1080', 'iiyama', 'Prolite X2474HS', 200, 0),
(45, 17, 'Ecran 1920x1080', 'Lenovo', 'L2321xwD', 100, 1),
(46, 17, 'Ecran 1600x900', 'iiyama', 'Prolite E2083HSD-B1', 90, 2),
(47, 17, 'Ecran 1600x900', 'Lenovo', 'LT2013swA', 40, 0),
(48, 17, 'Ecran 1440x900', 'Lenovo', 'LT1952p wide', 35, 3),
(49, 17, 'Ecran 1440x900', 'Lenovo', 'LT1951pwD', 109, 1),
(50, 17, 'Ecran 1440x900', 'Lenovo', 'LS1951wA', 80, 1),
(51, 17, 'Ecran 1440x900', 'DELL', 'P1911b', 70, 0),
(52, 17, 'Ecran 1440x900', 'Lenovo', 'LT1952pwD', 60, 2),
(53, 17, 'Ecran 1366x768', 'Samsung', 'S19D300NY', 100, 1),
(54, 17, 'Ecran 1280x1024', 'ACER', 'V173', 125, 1),
(55, 17, 'Ecran 1280x1024', 'ACER', 'V176L', 110, 3),
(56, 17, 'Ecran 1280x1024', 'ViewSonic', 'VA951S', 100, 1),
(57, 17, 'Ecran 1280x1024', 'Lenovo', 'LP1900pA', 40, 1),
(58, 17, 'Ecran 1280x1024', 'Lenovo', 'L1711pc', 40, 2),
(59, 17, 'Ecran 1280x1024', 'Lenovo', 'L1900pA', 30, 3),
(60, 17, 'Ecran 1280x1024', 'Philips', 'HNS7170T', 10, 3),
(61, 17, 'Ecran 1024x768', 'HP', '20555 SH249', 20, 1),
(62, 17, 'Ecran 1024x768', 'DELL', 'E156FPF', 20, 0),
(63, 18, 'Lecteur disquette', 'DELL', 'PD01S', 20, 0),
(64, 18, 'Lecteur disquette', 'Freecom', '', 22, 0),
(65, 18, 'Lecteur disquette', 'iomega', '', 30, 0),
(66, 19, 'Cable alimentation PC et ecran', '', 'IEC 60320 C9/C13', 10, 187),
(67, 19, 'Cable alimentation PC portable et autre', '', 'IEC 60320 C5/C7', 8, 68),
(68, 20, 'Cable RJ45  =< 2m', '', '8PC8C', 4, 333),
(69, 20, 'Cable RJ45  > 2m et < 5m', '', '8PC8C', 10, 57),
(70, 20, 'Cable RJ45  => 5m', '', '8PC8C', 20, 29),
(71, 26, 'Cable Jack 3.5mm', '', '', 8, 15),
(72, 26, 'Cable Jack 2.5mm', '', '', 6, 1),
(73, 27, 'Cable DisplayPort', '', '', 10, 21),
(74, 27, 'Cable DVI', '', '', 8, 20),
(75, 27, 'Cable HDMI', '', '', 15, 24),
(76, 27, 'Cable VGA', '', '', 8, 188),
(77, 27, 'Long cable VGA (+20m)', '', '', 100, 1),
(78, 27, 'Long cable HDMI (+20m)', '', '', 150, 1),
(79, 28, 'Cable imprimante (USB B)', '', '', 5, 48),
(80, 28, 'Rallonge USB2', '', '', 5, 38),
(81, 29, 'VGA(M)-RJ11(M)', '', '', 3, 75),
(82, 29, 'VGA(F)-DVI(M)', '', '', 10, 8),
(83, 29, 'VGA(M)-DVI(F)', '', '', 10, 3),
(84, 29, 'VGA(F)-Micro USB(M)', '', '', 15, 1),
(85, 29, 'VGA(M)-USB2(F)', '', '', 15, 2),
(86, 29, 'DisplayPort(F)-USB B(M)', '', '', 16, 4),
(87, 29, 'DisplayPort(M)-DVI(F)', '', '', 8, 2),
(88, 29, 'DisplayPort(M)-DVI(M)', '', '', 8, 3),
(89, 29, 'USB2(M)-Mini USB(M)', '', '', 4, 14),
(90, 29, 'USB2(F)-Mini USB(M)', '', '', 4, 1),
(91, 29, 'USB2(F)-PS/2(M)', '', '', 8, 4),
(92, 29, 'USB2(M)-Micro USB(M)', '', '', 5, 5),
(93, 29, 'USB2(M)-SATA(M)', '', '', 6, 1),
(94, 29, 'Prise en T(F-010)(M)-RJ11(M)', '', '', 3, 1),
(95, 29, 'DVI(M)-DVI(F)', '', '', 6, 1),
(96, 29, 'DVI(M)-HDMI(M)', '', '', 7, 3),
(97, 29, 'Mini USB(M) -Micro USB(M)', '', '', 4, 2),
(98, 29, 'Cable TV(M)-Cable TV(F)', '', '', 2, 1),
(99, 30, 'Duplicateur VGA', '', '', 12, 2),
(100, 30, 'Duplicateur DVI', '', '', 11, 2),
(101, 30, 'Duplicateur  2xUSB 2/VGA', '', '', 20, 1),
(102, 30, 'Duplicateur PS/2', '', '', 5, 1),
(103, 31, 'HDD 1To', 'Western Digital', 'WD10JPVT', 70, 2),
(104, 31, 'HDD 1To', 'Thoshiba', 'MQ01ABD100', 65, 4),
(105, 31, 'HDD 1To', 'Western Digital', 'WD10EZRK', 65, 1),
(106, 31, 'HDD 1To', 'HGST', 'SSGWMZEK', 65, 2),
(107, 31, 'HDD 640Go', 'Thoshiba', 'MK6459GSXP', 52, 1),
(108, 31, 'HDD 500Go', 'Seagate', 'Barracuda500', 48, 4),
(109, 31, 'HDD 500Go', 'Western Digital', 'WD5000LPCX', 46, 1),
(110, 31, 'HDD 500Go', 'Thoshiba', 'DT01ACA050', 45, 1),
(111, 31, 'HDD 500Go', 'Thoshiba', 'MQ01ACF050', 41, 1),
(112, 31, 'HDD 500Go', 'Western Digital', 'WD5000AAKK', 30, 1),
(113, 31, 'HDD 250Go', 'Fujitsu', 'MJA2250BH', 35, 1),
(114, 31, 'HDD 250Go', 'Western Digital', 'WD2500AAKK', 20, 1),
(115, 31, 'HDD 82,3Go', 'HITACHI', 'HD5728080PLA380', 10, 1),
(116, 31, 'HDD 80Go', 'Western Digital', 'WD800', 57, 1),
(117, 31, 'HDD 40Go', 'HITACHI', 'IC35L06AVV207', 5, 1),
(118, 31, 'SSDH 500Go', 'Seagate', '0N7GG6', 70, 2),
(119, 32, 'Carte graphique', 'ATI Radeon', 'Model B403', 10, 1),
(120, 32, 'Carte graphique', 'ATI Radeon', 'ATI-102-B62902', 25, 1),
(121, 32, 'Carte graphique', 'Nividia', 'Model 8890', 15, 1),
(122, 32, 'Carte graphique', 'AMD', 'Firepro W4100', 75, 1),
(123, 32, 'Carte graphique', 'Nividia', 'Quadpro P400', 400, 1),
(124, 33, 'Alimentation PC Fixe', 'LDLC', 'ATX400W', 25, 1),
(125, 33, 'Alimentation Serveur', 'DELL', 'PSU E750-S1', 30, 1),
(126, 33, 'Alimentation Imprimante', '', '', 20, 0),
(127, 34, 'Lecteur CD', 'Samsung', 'Model SC-148', 25, 1),
(128, 34, 'Lecteur CD', 'Sony', 'MPF-920-L', 50, 1),
(129, 35, 'RAM 1Go DDR3 PC Fixe', 'HYNIX', '', 6, 6),
(130, 35, 'RAM 2Go DDR3 PC Fixe', 'HYNIX', '', 10, 1),
(131, 35, 'RAM 4Go DDR3 PC Fixe', 'HYNIX', '', 20, 2),
(132, 35, 'RAM 256Mo PC Fixe', 'HYNIX', '', 8, 1),
(133, 35, 'RAM 512Mo PC Fixe', 'IBM', '', 31, 1),
(134, 35, 'RAM 256Mo PC Fixe', 'IBM', '', 21, 2),
(135, 35, 'RAM 512Mo PC Fixe', 'Samsung', '', 13, 1),
(136, 35, 'RAM 2Go DDR3 PC Fixe', 'ACER', '', 25, 1),
(137, 35, 'RAM 2Go DDR3 PC Fixe', 'DELL', '', 17, 1),
(138, 35, 'RAM 2Go DDR2 PC Fixe', 'PNY', '', 20, 1),
(139, 35, 'RAM 2Go DDR3 PC Fixe', 'Transcend', '', 10, 1),
(140, 35, 'RAM 4Go DDR3 PC Fixe', 'Samsung', '', 23, 1),
(141, 35, 'RAM 128Mo PC Fixe', 'NCP', '', 5, 1),
(142, 35, 'RAM 8Go DDR4 PC Fixe', 'Crucial', '', 41, 1),
(143, 35, 'RAM 1Go PC Portable', 'UNIFOSA', '', 6, 1),
(144, 35, 'RAM 4Go  PC Portable', 'RAMALEX', '', 30, 1),
(145, 35, 'RAM 4Go PC Portable', 'SK-HYNNIX', '', 24, 1),
(146, 35, 'RAM 1Go PC Portable', 'Samsung', '', 10, -2),
(147, 35, 'RAM 2Go PC Portable', 'NANYA', '', 15, 1),
(148, 36, 'Batterie PC Portable', 'DTK', '', 28, 1),
(149, 36, 'Batterie PC Portable', 'FSKE', '', 32, 1),
(150, 37, 'Cache Imprimante', '', '', 10, 0),
(151, 38, 'Cartouche Ruban 800Mo', '', '', 18, 3),
(152, 38, 'Boite disquette x11', '', '', 15, 5),
(153, 38, 'CD Vierge', '', '', 2, 100),
(154, 39, 'Sacoche PC Portable', '', '', 20, 2),
(155, 39, 'Telecommande Minix', 'Minix', '', 30, 13),
(156, 39, 'Telecommande TV', '', '', 10, 5),
(157, 39, 'Telecommande ViewSonic', 'ViewSonic', '', 20, 1),
(158, 39, 'Station de chargement powerscan', 'Datalogic', '', 185, 4),
(159, 39, 'Protection pour scanner', 'Datalogic', '', 25, 1),
(160, 39, 'Batterie pour scanner', 'Datalogic', '', 47, 1),
(161, 39, 'Scanner powerscan', 'Datalogic', '', 639, 4),
(162, 39, 'Station d\'acceuil pour scanneruu', 'Motorola', 'Symbol', 139, 1),
(163, 39, 'Scanner symbol', 'Motorola', 'Symbol', 67, 2),
(164, 39, 'Kit reparation Iphone', '', '', 20, 1),
(165, 39, 'Tapis de souris', 'Hama', '54766', 24, 1),
(166, 39, 'Tapis de souris', 'ailrinni', 'x0019qzlfl', 3, 0),
(167, 39, 'Support ordinateur portable', 'IKEA', '601.501.76', 18, 0),
(168, 39, 'Ruban Zebra 110mm X74M', '', '', 9, 11),
(169, 40, 'Bombe depoussierante', 'Dacomex', '', 29, 0),
(170, 41, 'PC Portable', 'DELL', 'Latitude E5540', 465, 1),
(171, 41, 'PC Portable', 'DELL', '9DXZ162', 100, 1),
(172, 41, 'PC Portable', 'DELL', 'Latitude E5570', 500, 1),
(173, 41, 'PC Portable', 'DELL', 'P26E', 200, 1),
(174, 41, 'PC Portable', 'ASUS', 'UX310U', 550, 1),
(175, 41, 'PC Portable', 'SONY', 'PCG-4121EM', 320, 1),
(176, 42, 'Replicateur de port', 'SONY', 'VGP-PRTX1', 120, 1),
(177, 42, 'Replicateur de port', 'SONY', 'VGP-PRS20', 60, 1),
(178, 42, 'Replicateur de port', 'DELL', 'PR02X', 30, 1),
(179, 42, 'Replicateur de port', 'Lenovo', 'Type 4438', 30, 4),
(180, 43, 'Unite Centrale', 'Lenovo', 'M93P', 300, 1),
(181, 43, 'Unite Centrale', 'DELL', 'OPTIPLEX 390', 220, 1),
(182, 43, 'Unite Centrale', 'DELL', 'OPTIPLEX 380', 180, 2),
(183, 43, 'Unite Centrale', 'DELL', 'PRECISION 390', 200, 2),
(184, 43, 'Unite Centrale', 'DELL', 'PRECISION 470', 300, 1),
(185, 43, 'Unite Centrale', 'IBM', '', 300, 1),
(186, 43, 'Unite Centrale', 'Lenovo', 'ThinkCentre', 400, 2),
(187, 43, 'Unite Centrale', 'LDLC', '', 600, 1),
(188, 44, 'Imprimante', 'HP', 'OfficeJet 6100', 70, 1),
(189, 44, 'Adapateur wifi', 'NetGear', 'AC1200', 48, 6),
(190, 44, 'Enregistreur video', 'Alhua', 'dh-xvrs116h-4kl-x', 200, 1),
(191, 44, 'Concentrateur multimedia', 'Minix neo', '7x', 100, 6),
(192, 44, 'Amplificateur reseau', 'SFR', 'Femto', 20, 2),
(193, 44, 'Routeur', 'NetGear', 'DG834G', 30, 1),
(194, 44, 'Serveur NAS', 'Qnap', 'TS-419P', 500, 1),
(195, 44, 'Serveur NAS', 'D-Link', 'DNS-323', 200, 1),
(196, 44, 'Routeur', 'D-Link', 'N300', 50, 3),
(197, 44, 'Projecteur', 'EPSON', 'EBX9', 200, 1),
(198, 44, 'Borne wifi', 'Fortinet', 'FAP-321c', 0, 1),
(199, 44, 'Testeur cable RJ74', 'Bucheloy', 'NS-468', 0, 1),
(200, 44, 'Lecteur carte', 'PNY', 'AXP724', 0, 2),
(201, 44, 'Borne wifi', 'Fortinet', 'FAP-221C', 0, 1),
(202, 44, 'Borne wifi', 'Fortinet', 'FAP-211B', 0, 1),
(203, 44, 'Lecteur code-barre', 'Opticon', 'OPN-2006', 25, 1),
(204, 44, 'Onduleur', 'EATON', 'Ellipse MAX 850', 300, 1),
(205, 44, 'Webcam', '', '', 20, 3),
(206, 44, 'Module barco', 'Barco', 'CSE-200', 1500, 2),
(207, 44, 'Station de chargement', 'Psion', 'WA4003-G2', 120, 5),
(208, 44, 'Module sans-fil', 'Anybus', 'Wireless bolt', 400, 3),
(209, 44, 'Camera mural', 'Dahua', '', 80, 2),
(210, 44, 'Enregistreur video', 'Sistel', 'HCVR511e', 146, 1),
(211, 44, 'GPS', 'Coyote', '', 150, 1),
(212, 45, 'Telephone fixe', 'Mitel', '6865i', 105, 3),
(213, 45, 'Telephone fixe rouge', 'Depaepe', 'HD2000 SIP', 98, 2),
(214, 45, 'Telephone portable', 'Samsung', 'Galaxy A5', 150, 1),
(215, 45, 'Telephone portable', 'Samsung', '', 100, 1),
(216, 45, 'Telephone portable', 'AASTRA', '610d', 90, 5),
(217, 45, 'Telephone portable', 'Mitel', '622d', 153, 15),
(218, 45, 'Telephone portable', 'Nokia', '', 40, 1),
(219, 45, 'Telephone de conference', 'POLYCOM', 'VoiceStation300', 200, 3),
(220, 45, 'Telephone de conference', 'Aethra', 'ConferenceUnit', 150, 1),
(221, 45, 'Telephone de conference', 'POLYCOM', 'SoundStation', 350, 1),
(222, 45, 'Chargeur', 'POLYCOM', 'VoiceStation300', 50, 3),
(223, 45, 'Poste Chargeur', 'AASTRA', '600', 18, 17),
(224, 45, 'Poste Chargeur', 'AASTRA', '610/620/630', 19, 8),
(225, 45, 'Poste Chargeur', 'AASTRA', '', 15, 1),
(226, 45, 'Poste Chargeur', 'Mitel', '142d', 21, 8),
(227, 45, 'poste Chargeur', 'Depaepe', '', 30, 1),
(228, 45, 'Chargeur', 'Aethra', 'ConferenceUnit', 40, 1),
(229, 46, 'Platine', 'WYSE', 'SX0', 15, 1),
(230, 46, 'Platine', 'WYSE', 'VX0', 15, 1),
(231, 46, 'Platine', 'Axel', 'Terminal 85', 250, 17),
(232, 46, 'Platine', 'Intel', 'Shuttle DS61', 198, 2),
(233, 46, 'Platine', 'Axel', 'Model 90', 315, 1),
(234, 46, 'Platine', 'DELL', 'OPTIPLEX 3020', 200, 1),
(235, 46, 'Client leger', 'Raspberry pie', '', 40, 0),
(236, 46, 'Client leger', 'Minisforum', 'Z83-F', 130, 1),
(237, 46, 'Platine', 'HP', 'T520', 50, 2),
(238, 47, 'Repartiteur', 'Netis', 'ST3105G', 35, 3),
(239, 47, 'Repartiteur', 'M@ituo', '', 30, 1),
(240, 47, 'Repartiteur', 'LevelOne', 'FSW-0807TX', 50, 1),
(241, 47, 'Repartiteur', 'NetGear', 'GS205', 15, 1),
(242, 47, 'Repartiteur', 'ACCTON', '', 30, 1),
(243, 47, 'Repartiteur', 'Edimax', 'ES-5500G', 30, 1),
(244, 47, 'Repartiteur', 'Buffalo', 'DBS-XP2008', 629, 1),
(245, 47, 'Repartiteur', 'TP-Link', 'TL-SG2216WEB', 144, 1),
(246, 47, 'Repartiteur', 'Aruba', 'J9772A', 3000, 1),
(247, 47, 'Repartiteur', 'Aruba', 'J9773A', 700, 1),
(248, 47, 'Repartiteur', 'TP-Link', 'TL-SG2452', 306, 1),
(249, 47, 'Repartiteur', 'D-Link', 'DES-1210-28P', 268, 1),
(250, 47, 'Repartiteur', 'HP', 'ProCurve  2520G-8-Poe', 95, 2),
(251, 47, 'Repartiteur', 'Aruba', 'J9778A', 1668, 1),
(252, 47, 'Repartiteur', 'KVM', 'Tranxio', 30, 1),
(253, 47, 'Repartiteur', 'Aten', 'CS84U', 104, 1),
(254, 47, 'Repartiteur', 'TP-Link', 'TL-SG1005D', 15, 2),
(255, 47, 'Repartiteur', 'D-Link', 'DGS-1008P', 73, 1),
(256, 47, 'Repartiteur', '', '', 0, 0),
(257, 47, 'Repartiteur', 'D-Link', '1100-08P', 101, 3),
(258, 48, 'Pare-feu', '3COM', '', 50, 1),
(259, 48, 'Pare-feu', 'Zyxel', 'ZyWall USG50', 1002, 2),
(260, 48, 'Pare-feu', 'Zyxel', 'ZyWall 50', 98, 1),
(261, 48, 'Pare-feu', 'Fortinet', 'Fortigate-80C', 180, 1),
(262, 48, 'Pare-feu', 'Netasq', 'U150S', 500, 1),
(263, 49, 'Equipement VoIP', 'AASTRA', 'RFP32 IP', 400, 2),
(264, 49, 'Equipement VoIP', 'Mediatrix', '4102', 91, 1),
(265, 49, 'Equipement VoIP', 'Mediatrix', 'C710', 210, 1),
(266, 49, 'Equipement VoIP', 'Mitel', 'TA7104', 490, 2),
(267, 50, 'Cartouche tambour', 'Xerox', '101R000554', 80, 9),
(268, 50, 'Bac dechet', 'Xerox', '108R01124', 30, 7),
(269, 50, 'Cartouche d\'encre jaune', 'Xerox', '106R03537', 140, 1),
(270, 50, 'Cartouche d\'encre cyan', 'Xerox', '106R03538', 140, 2),
(271, 50, 'Cartouche d\'encre magenta', 'Xerox', '106R03539', 140, 2),
(272, 50, 'Kit cartouche tambour', 'Xerox', '108R01121', 209, 1),
(273, 50, 'Cartouche d\'encre', 'Xerox', '106R03586', 120, 9),
(274, 51, 'Bac dechet', 'Xerox', '115R00128', 32, 27),
(275, 51, 'Cartouche d\'encre noir', 'Xerox', '106R03733', 70, 16),
(276, 51, 'Cartouche d\'encre jaune', 'Xerox', '106R03734', 70, 14),
(277, 51, 'Cartouche d\'encre magenta', 'Xerox', '106R03735', 70, 24),
(278, 51, 'Cartouche d\'encre cyan', 'Xerox', '106R03736', 70, 16),
(279, 51, 'Fusible 220V', 'Xerox', '115R00115', 300, 1),
(280, 51, 'Cartouche tambour', 'Xerox', '106R03586', 110, 14),
(281, 52, 'Bac dechet', 'Xerox', '008R13061', 25, 1),
(282, 52, 'Cartouche d\'encre magenta', 'Xerox', '006R01511', 50, 2),
(283, 52, 'Cartouche d\'encre noir', 'Xerox', '006R01509', 50, 1),
(284, 52, 'Cartouche d\'encre jaune', 'Xerox', '006R01510', 50, 2),
(285, 52, 'Cartouche d\'encre cyan', 'Xerox', '006R01512', 50, 2),
(286, 53, 'Adaptateur electrique', 'Phihong', 'PSM01R-075', 20, 18),
(287, 53, 'Adaptateur electrique', 'Ktech', 'KSAD0900160W1UV-1', 15, 1),
(288, 53, 'Adaptateur electrique', 'Ktech', 'KSAC0500200W1UV-1', 15, 12),
(289, 53, 'Adaptateur electrique', 'Tayitech', 'KSAS012500200DS', 16, 10),
(290, 53, 'Adaptateur electrique', 'APD', 'WA-12H-12', 14, 2),
(291, 53, 'Adaptateur electrique', 'DELL', 'ha65nm130', 20, 1),
(292, 53, 'Adaptateur electrique', 'TP-Link', 'T090060-2C1', 20, 1),
(293, 53, 'Adaptateur electrique', 'Huawei', 'HW-050100E1W', 14, 1),
(294, 53, 'Adaptateur electrique', 'Shenzen', 'FJ-SW1203000E', 14, 1),
(295, 53, 'Adaptateur electrique', 'DVE', 'DV-751AUP', 16, 1),
(296, 53, 'Adaptateur electrique', 'HOOTO', 'ADS-25FSG-19', 20, 1),
(297, 53, 'Adaptateur electrique', 'LG', 'ADS-40FSG-19', 16, 1),
(298, 53, 'Adaptateur electrique', 'DVE', 'DV-1280-3UPM', 20, 1),
(299, 53, 'Adaptateur electrique', 'Shenzen', 'JHD-120200BAA', 15, 1),
(300, 53, 'Adaptateur electrique', 'Silicore', 'SLA40810-3', 20, 1),
(301, 53, 'Adaptateur electrique', 'Logitech', 'HU1018C-11079', 13, 1),
(302, 53, 'Adaptateur electrique', 'DVE', 'DSA-SPFFU-05', 16, 1),
(303, 53, 'Adaptateur electrique', 'Franmar', 'SA7E-050-1500FD', 14, 1),
(304, 53, 'Adaptateur electrique', 'FWGB', 'FW7710EU07', 15, 2),
(305, 53, 'Adaptateur electrique', 'Minix', 'Y502-05200E', 30, 4),
(306, 53, 'Adaptateur electrique', 'Sony', 'VGP-AC19V32', 25, 1),
(307, 53, 'Adaptateur electrique', 'LG', 'LCAP28BE', 16, 1),
(308, 53, 'Adaptateur electrique', 'DVE', 'DSA-12CB-05', 14, 1),
(309, 53, 'Adaptateur electrique', 'ASUS', 'ADP-65EW', 16, 1),
(310, 53, 'Adaptateur electrique', 'ASUS', 'AD883020', 23, 2),
(311, 53, 'Adaptateur electrique', 'DVE', 'DSA-12PFA-05 FEU', 10, 2),
(312, 53, 'Adaptateur electrique', 'Axel', 'AEL20U505', 15, 1),
(313, 53, 'Adaptateur electrique', 'PEC', 'PA1040-480IB080', 18, 1),
(314, 53, 'Adaptateur electrique', 'LEI', 'MU08-6090085-C5', 21, 2),
(315, 53, 'Adaptateur electrique', 'Depaepe', 'XB41-07', 25, 1),
(316, 53, 'Adaptateur electrique', 'Salcomp', 'M-CA35-095140F', 22, 1),
(317, 53, 'Adaptateur electrique', 'OLITECH', 'LG0754EP', 20, 1),
(318, 53, 'Adaptateur electrique', 'Stontronic', 'DSA-13FPL-05-FCA', 23, 1),
(319, 53, 'Adaptateur electrique', 'Shenzen', 'SUN-1200300B1', 18, 1),
(320, 53, 'Adaptateur electrique', 'HP', 'TPC-CA54', 15, 2),
(321, 53, 'Adaptateur electrique', 'AcBel', 'ADB002', 13, 1),
(322, 53, 'Adaptateur electrique', 'LiteON', 'PA-1051-0', 16, 1),
(323, 53, 'Adaptateur electrique', 'DELL', 'AA20031', 30, 2),
(324, 53, 'Adaptateur electrique', 'DELL', 'LA65N52-01', 25, 1),
(325, 53, 'Adaptateur electrique', 'Sony', 'VGP-AC16V8', 20, 1),
(326, 53, 'Adaptateur electrique', 'NetBit', 'NBS248120150B3', 30, 1),
(327, 53, 'Adaptateur electrique', 'Lenovo', '45N0353', 26, 1),
(328, 53, 'Adaptateur electrique', 'MW', 'GS120A24', 24, 1),
(329, 53, 'Adaptateur electrique', 'HP', 'VAN90C-480-1A', 25, 1),
(330, 53, 'Adaptateur electrique', 'JenTec', 'JTA0512', 25, 1),
(331, 53, 'Adaptateur electrique', 'OLITECH', 'A30740G', 12, 1),
(332, 53, 'Adaptateur electrique', 'LTE', 'LTE90ESS-1', 15, 1),
(333, 53, 'Adaptateur electrique', 'Samsung', 'A1514-DSM', 18, 1),
(334, 53, 'Adaptateur electrique', 'GlobalTec', 'GT-46180-1812', 17, 1),
(335, 53, 'Adaptateur electrique', 'Sunny', 'SYS1359-3612-T3', 14, 1),
(336, 53, 'Adaptateur electrique', 'Axel', 'AEL20US05-XE1012', 16, 0),
(337, 53, 'Adaptateur electrique', 'XYE', 'XY-1203000-E', 20, 1),
(338, 53, 'Adaptateur electrique', 'LiteON', 'PA-1031-0', 22, 1),
(339, 53, 'Adaptateur electrique', 'EAC', 'Model 1627', 24, 1),
(340, 53, 'Adaptateur electrique', 'APD', 'DA-30E12', 18, 3),
(341, 53, 'Adaptateur electrique', 'GlobalTec', 'GT-41082-1814-T3', 19, 1),
(342, 53, 'Adaptateur electrique', 'DELL', 'HA65N525-00', 14, 1),
(343, 53, 'Adaptateur electrique', 'DeltaElec', 'ADP-65JH', 28, 4),
(344, 53, 'Adaptateur electrique', 'DELL', 'DA65NM111-00', 30, 0),
(345, 53, 'Adaptateur electrique', 'DVE', 'DSA-C4215-12', 25, 4),
(346, 53, 'Adaptateur electrique', 'DeltaElec', 'ADP-90CB AB', 17, 1),
(347, 53, 'Adaptateur electrique', '2Power', 'CAA0689B', 20, 0),
(348, 46, 'Platine', 'Lenovo', 'Thinkcentre M600', 200, 1),
(349, 15, 'Clavier sans fil', 'victsing', 'pc126b', 30, 1),
(350, 46, 'Platine', 'DS device', 'DSCJ18', 90, 1),
(351, 31, 'SSD 250Go', 'CRUCIAL', 'LCS-256L9S-11', 50, 0),
(352, 45, 'Kit Téléphone + base', 'AASTRA', '600C', 20, 1),
(353, 45, 'Kit Téléphone + base+ batterie', 'Mitel', '142D', 30, 1),
(354, 45, 'Batterie Téléphone', 'Varta', 'A6XX', 2, 8),
(355, 41, 'PC portable', 'DELL', 'INSPIRON P93G', 600, 0),
(356, 41, 'PC portable', 'DELL', 'Latitude 3550', 900, 0),
(357, 44, 'Lecteur disque dure', 'Icy box', 'IB-121 CL-6G', 200, 1),
(358, 33, 'Chargeur pc portable', 'DELL', 'LA65NS0', 30, 1),
(359, 44, 'Douchette', 'Fuzziscan', 'FBC-6860-BL', 90, 1),
(360, 33, 'Chargeur pc portable', 'Lenovo', 'ADLX65NCC3A', 30, 1),
(361, 14, 'Souris sans fil', 'logitech', 'm185', 40, 2),
(362, 14, 'Souris sans fil', 'logitech', 'm170', 20, 1),
(363, 14, 'Souris USB', 'Poss', 'psom05bk', 5, 1),
(364, 53, 'Adaptateur pc portable', 'DELL', 'ha45nm140', 30, 0),
(365, 44, 'Batterie externe', 'DELL', 'PW7015w', 50, 1),
(367, 46, 'CLIENT PLAYER', 'DS DEVICE', 'DSCS9', 75, 2),
(369, 44, 'Convertisseur de frequence', 'SIEMENS', 'MICROMASTER MM420', 120, 1),
(373, 45, 'téléphone portable', 'Samsung', 'inconnue', 85, 4),
(375, 19, 'Multiprise', 'cogex outillage', '486971', 5, 2),
(376, 44, 'Projecteur', 'Canon', 'LV-WX300', 300, 1),
(377, 44, 'Panel windows A3I', 'MSI', '', 630, 11),
(378, 39, 'Pedale programable', '', '', 2, 1),
(379, 45, 'téléphone portable', 'Samsung', 'galaxy A40', 250, 2),
(380, 53, 'Adaptateur', 'Samsung', 'ETAU3U30EBE', 5, 1),
(381, 31, 'HDD 500 Go', 'Seagate', 'laptop thin', 20, 1),
(382, 14, 'HDD 500 Go', 'HGST', '', 20, 1),
(383, 39, 'Pied Panel', 'kimex', '', 90, 4),
(384, 39, 'adaptateur vesa-MSI', '', '', 1, 3),
(385, 53, 'Adaptateur', 'Samsung', 'EP-TA50EWE', 20, 1),
(386, 14, 'Souris filaire', 'logitech', 'HS712HB', 15, 0),
(387, 36, 'batterie pc portable', 'DELL', 'G5M10', 50, 1),
(388, 35, 'RAM 8Go', 'Samsung', '', 50, 1),
(389, 32, 'Stockage SSD', 'KIOXA', 'KBG40ZNS256G', 60, 1),
(390, 44, 'Douchette', 'Datalogic', 'TD1100', 200, 4),
(391, 41, 'PC portable', 'HP', 'élite book', 200, 1),
(392, 41, 'PC portable', 'DELL', 'Inspiron 15-3521', 300, 1),
(393, 44, 'Scanneur', 'Psion', '', 100, 1),
(394, 53, 'Adaptateur', 'Samsung', 'A2514_KSM', 15, 1),
(395, 15, 'Clavier filaire', 'MSI', 'KU-1019', 35, 0),
(396, 14, 'Souris filaire', 'HP', 'Wired mouse X1200', 35, 0),
(397, 29, 'Displayport(M)-HDMI(M)', '', '', 10, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`) VALUES
(1, 'Adrien CHANOVE'),
(2, 'Lilian STIVALET M. le chef de projet'),
(3, 'Alexandre PROVENDIE'),
(4, 'Maxime KARABABA'),
(5, 'Clément PERNOUD'),
(6, 'Sami GOUASMI'),
(7, 'Alexis VULLIEZ'),
(8, 'Célestine MOURIES'),
(9, 'Clément PIERSON');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`idparent`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `flux`
--
ALTER TABLE `flux`
  ADD CONSTRAINT `flux_ibfk_1` FOREIGN KEY (`idobject`) REFERENCES `object` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `flux_ibfk_2` FOREIGN KEY (`idpers`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
