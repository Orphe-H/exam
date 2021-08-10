-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 10 août 2021 à 12:25
-- Version du serveur :  5.7.33
-- Version de PHP : 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cluster`
--

-- --------------------------------------------------------

--
-- Structure de la table `arrondissements`
--

CREATE TABLE `arrondissements` (
  `idarrondissement` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `idcommune` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `arrondissements`
--

INSERT INTO `arrondissements` (`idarrondissement`, `nom`, `idcommune`) VALUES
(1, '10 eme arrondissement', 1),
(2, '3 eme arrondissement', 1);

-- --------------------------------------------------------

--
-- Structure de la table `clusters`
--

CREATE TABLE `clusters` (
  `idcluster` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `idfiliere` int(11) DEFAULT NULL,
  `idvillage` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `clusters`
--

INSERT INTO `clusters` (`idcluster`, `nom`, `idfiliere`, `idvillage`) VALUES
(1, 'Cluster de test', 1, 1),
(2, 'a- cluster', 1, 1),
(4, 'mon nouveau cluster', 1, 1),
(5, 'Bmon nouveau cluster 2', 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `communes`
--

CREATE TABLE `communes` (
  `idcommune` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `iddepartement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `communes`
--

INSERT INTO `communes` (`idcommune`, `nom`, `iddepartement`) VALUES
(1, 'commune no 1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `departements`
--

CREATE TABLE `departements` (
  `iddepartement` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `departements`
--

INSERT INTO `departements` (`iddepartement`, `nom`) VALUES
(1, 'Littoral'),
(2, 'Atlantique');

-- --------------------------------------------------------

--
-- Structure de la table `filieres`
--

CREATE TABLE `filieres` (
  `idfiliere` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `filieres`
--

INSERT INTO `filieres` (`idfiliere`, `nom`) VALUES
(1, 'SIL'),
(2, 'RIT');

-- --------------------------------------------------------

--
-- Structure de la table `villages`
--

CREATE TABLE `villages` (
  `idvillage` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `idarrondissement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `villages`
--

INSERT INTO `villages` (`idvillage`, `nom`, `idarrondissement`) VALUES
(1, 'Le petit village', 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `arrondissements`
--
ALTER TABLE `arrondissements`
  ADD PRIMARY KEY (`idarrondissement`),
  ADD KEY `idcommune` (`idcommune`);

--
-- Index pour la table `clusters`
--
ALTER TABLE `clusters`
  ADD PRIMARY KEY (`idcluster`),
  ADD KEY `idfiliere` (`idfiliere`),
  ADD KEY `idvillage` (`idvillage`);

--
-- Index pour la table `communes`
--
ALTER TABLE `communes`
  ADD PRIMARY KEY (`idcommune`),
  ADD KEY `iddepartement` (`iddepartement`);

--
-- Index pour la table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`iddepartement`);

--
-- Index pour la table `filieres`
--
ALTER TABLE `filieres`
  ADD PRIMARY KEY (`idfiliere`);

--
-- Index pour la table `villages`
--
ALTER TABLE `villages`
  ADD PRIMARY KEY (`idvillage`),
  ADD KEY `idarrondissement` (`idarrondissement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `arrondissements`
--
ALTER TABLE `arrondissements`
  MODIFY `idarrondissement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `clusters`
--
ALTER TABLE `clusters`
  MODIFY `idcluster` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `communes`
--
ALTER TABLE `communes`
  MODIFY `idcommune` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `departements`
--
ALTER TABLE `departements`
  MODIFY `iddepartement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `filieres`
--
ALTER TABLE `filieres`
  MODIFY `idfiliere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `villages`
--
ALTER TABLE `villages`
  MODIFY `idvillage` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `arrondissements`
--
ALTER TABLE `arrondissements`
  ADD CONSTRAINT `arrondissements_ibfk_1` FOREIGN KEY (`idcommune`) REFERENCES `communes` (`idcommune`);

--
-- Contraintes pour la table `clusters`
--
ALTER TABLE `clusters`
  ADD CONSTRAINT `clusters_ibfk_1` FOREIGN KEY (`idfiliere`) REFERENCES `filieres` (`idfiliere`),
  ADD CONSTRAINT `clusters_ibfk_2` FOREIGN KEY (`idvillage`) REFERENCES `villages` (`idvillage`);

--
-- Contraintes pour la table `communes`
--
ALTER TABLE `communes`
  ADD CONSTRAINT `communes_ibfk_1` FOREIGN KEY (`iddepartement`) REFERENCES `departements` (`iddepartement`);

--
-- Contraintes pour la table `villages`
--
ALTER TABLE `villages`
  ADD CONSTRAINT `villages_ibfk_1` FOREIGN KEY (`idarrondissement`) REFERENCES `arrondissements` (`idarrondissement`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
