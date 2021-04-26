-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 26 avr. 2021 à 11:55
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `nom`, `idparent`) VALUES
(1, 'périphérique', NULL),
(2, 'connéctique', NULL),
(3, 'souris', 1),
(4, 'clavier', 1),
(5, 'alimentation', 2),
(6, 'ethernet', 2),
(7, 'composant', NULL),
(8, 'Divers', NULL),
(9, 'Appareils', NULL),
(10, 'Consomable imprimante', NULL),
(11, 'Adaptateur électrique', NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `object`
--

INSERT INTO `object` (`id`, `idcategory`, `nom`, `marque`, `model`, `cout`, `nombre`) VALUES
(1, 3, 'souris usb', 'Dell', 'omy897', 9, 1),
(2, 3, 'souris usb', 'Logitech', 'B100', 9, 3);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`) VALUES
(1, 'achanove'),
(2, 'lstivallet');

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
