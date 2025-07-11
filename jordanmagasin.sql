-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 11 juil. 2025 à 15:11
-- Version du serveur : 9.1.0
-- Version de PHP : 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `jordanmagasin`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250711084624', '2025-07-11 08:46:49', 44),
('DoctrineMigrations\\Version20250711091033', '2025-07-11 09:10:47', 17),
('DoctrineMigrations\\Version20250711101223', '2025-07-11 10:12:33', 64),
('DoctrineMigrations\\Version20250711105329', '2025-07-11 10:53:39', 14);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modele` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `name`, `modele`, `prix`, `image`, `type`, `stock`) VALUES
(41, 'produit0', 'modele0', 1286.18, 'https://media.ouest-france.fr/v1/pictures/MjAyNDA2YmJmMTJjOTYwMjlkYWYzN2I3YTBlZGFjNzg4YTExN2I?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=bbaeb37e6580f11d529d1cf59b49212b529ec98d9c0e3091acf4d45392551026', 'Chaussure', 0),
(42, 'produit1', 'modele1', 283.38, 'https://www.marmonsports.com/64348-home_default/retro-jordan-crew-set.jpg', 'Vétement', 6),
(43, 'produit2', 'modele2', 20.99, 'https://media.ouest-france.fr/v1/pictures/MjAyNDA2YmJmMTJjOTYwMjlkYWYzN2I3YTBlZGFjNzg4YTExN2I?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=bbaeb37e6580f11d529d1cf59b49212b529ec98d9c0e3091acf4d45392551026', 'Chaussure', 13),
(44, 'produit3', 'modele3', 1899.46, 'https://www.marmonsports.com/64348-home_default/retro-jordan-crew-set.jpg', 'Vétement', 6),
(45, 'produit4', 'modele4', 1106.32, 'https://media.ouest-france.fr/v1/pictures/MjAyNDA2YmJmMTJjOTYwMjlkYWYzN2I3YTBlZGFjNzg4YTExN2I?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=bbaeb37e6580f11d529d1cf59b49212b529ec98d9c0e3091acf4d45392551026', 'Chaussure', 18),
(46, 'produit5', 'modele5', 201.43, 'https://www.marmonsports.com/64348-home_default/retro-jordan-crew-set.jpg', 'Vétement', 9),
(47, 'produit6', 'modele6', 105.42, 'https://media.ouest-france.fr/v1/pictures/MjAyNDA2YmJmMTJjOTYwMjlkYWYzN2I3YTBlZGFjNzg4YTExN2I?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=bbaeb37e6580f11d529d1cf59b49212b529ec98d9c0e3091acf4d45392551026', 'Chaussure', 1),
(48, 'produit7', 'modele7', 407.09, 'https://www.marmonsports.com/64348-home_default/retro-jordan-crew-set.jpg', 'Vétement', 3),
(49, 'produit8', 'modele8', 1586.47, 'https://media.ouest-france.fr/v1/pictures/MjAyNDA2YmJmMTJjOTYwMjlkYWYzN2I3YTBlZGFjNzg4YTExN2I?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=bbaeb37e6580f11d529d1cf59b49212b529ec98d9c0e3091acf4d45392551026', 'Chaussure', 12),
(50, 'produit9', 'modele9', 559.82, 'https://www.marmonsports.com/64348-home_default/retro-jordan-crew-set.jpg', 'Vétement', 13),
(51, 'produit10', 'modele10', 408.51, 'https://media.ouest-france.fr/v1/pictures/MjAyNDA2YmJmMTJjOTYwMjlkYWYzN2I3YTBlZGFjNzg4YTExN2I?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=bbaeb37e6580f11d529d1cf59b49212b529ec98d9c0e3091acf4d45392551026', 'Chaussure', 15),
(52, 'produit11', 'modele11', 143.25, 'https://www.marmonsports.com/64348-home_default/retro-jordan-crew-set.jpg', 'Vétement', 20),
(53, 'produit12', 'modele12', 468.97, 'https://media.ouest-france.fr/v1/pictures/MjAyNDA2YmJmMTJjOTYwMjlkYWYzN2I3YTBlZGFjNzg4YTExN2I?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=bbaeb37e6580f11d529d1cf59b49212b529ec98d9c0e3091acf4d45392551026', 'Chaussure', 1),
(54, 'produit13', 'modele13', 1574.58, 'https://www.marmonsports.com/64348-home_default/retro-jordan-crew-set.jpg', 'Vétement', 13),
(55, 'produit14', 'modele14', 377.30, 'https://media.ouest-france.fr/v1/pictures/MjAyNDA2YmJmMTJjOTYwMjlkYWYzN2I3YTBlZGFjNzg4YTExN2I?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=bbaeb37e6580f11d529d1cf59b49212b529ec98d9c0e3091acf4d45392551026', 'Chaussure', 9),
(56, 'produit15', 'modele15', 1285.11, 'https://www.marmonsports.com/64348-home_default/retro-jordan-crew-set.jpg', 'Vétement', 3),
(57, 'produit16', 'modele16', 236.22, 'https://media.ouest-france.fr/v1/pictures/MjAyNDA2YmJmMTJjOTYwMjlkYWYzN2I3YTBlZGFjNzg4YTExN2I?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=bbaeb37e6580f11d529d1cf59b49212b529ec98d9c0e3091acf4d45392551026', 'Chaussure', 1),
(58, 'produit17', 'modele17', 457.36, 'https://www.marmonsports.com/64348-home_default/retro-jordan-crew-set.jpg', 'Vétement', 13),
(59, 'produit18', 'modele18', 923.97, 'https://media.ouest-france.fr/v1/pictures/MjAyNDA2YmJmMTJjOTYwMjlkYWYzN2I3YTBlZGFjNzg4YTExN2I?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=bbaeb37e6580f11d529d1cf59b49212b529ec98d9c0e3091acf4d45392551026', 'Chaussure', 9),
(60, 'produit19', 'modele19', 1511.28, 'https://www.marmonsports.com/64348-home_default/retro-jordan-crew-set.jpg', 'Vétement', 11);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`) VALUES
(1, 're@re.re', '[\"ROLE_ADMIN\"]', '$2y$13$27EGfgLYnzhmwHQ.3q/dkODvcyiJ1IfA6b.osTaUwc9l4W/iQvDDG', 1),
(2, 're@hotmail.fr', '[\"ROLE_USER\"]', '$2y$13$NGVjktFTNEJdPpDUURo5yOBH03ptFZHrVu8nQNhtDm2/.6Ie0J6fO', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
