-- phpMyAdmin SQL Dump
-- version 4.6.6deb1+deb.cihar.com~xenial.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 06, 2018 at 04:44 PM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.2.2-1+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_cv`
--

-- --------------------------------------------------------

--
-- Table structure for table `Groupe`
--

CREATE TABLE `Groupe` (
  `id_grp` int(100) NOT NULL,
  `grp_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `grp_descrp` text COLLATE utf8_bin NOT NULL,
  `id_team` varchar(120) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Groupe`
--

INSERT INTO `Groupe` (`id_grp`, `grp_name`, `grp_descrp`, `id_team`) VALUES
(1, 'SZ Group ZS', 'groupe S2 Creation', 'TEAM SZ'),
(2, 'SA Group AS', 'groupe SA Prod', 'Team SA'),
(3, 'HoTiNnA Groupe HOTinnA', 'Groupe HotInna', 'Team HoTinNA');

-- --------------------------------------------------------

--
-- Table structure for table `Hobbies`
--

CREATE TABLE `Hobbies` (
  `id_hobbies` int(11) NOT NULL,
  `Name` varchar(120) COLLATE utf8_bin NOT NULL,
  `id_profil` varchar(120) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Hobbies`
--

INSERT INTO `Hobbies` (`id_hobbies`, `Name`, `id_profil`) VALUES
(1, 'Films', 'Pro_Hob'),
(2, 'Series', 'Pro_Hob'),
(3, 'Basket-Ball', 'Pro_Hob_Sport'),
(4, 'Football', 'Pro_Hob_Sport'),
(5, 'Famille', 'Pro_Hob');

-- --------------------------------------------------------

--
-- Table structure for table `Human`
--

CREATE TABLE `Human` (
  `id_human` int(100) NOT NULL,
  `code_viz` varchar(120) COLLATE utf8_bin NOT NULL,
  `name` varchar(120) COLLATE utf8_bin NOT NULL,
  `first_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `mobile` varchar(20) COLLATE utf8_bin NOT NULL,
  `mail` varchar(120) COLLATE utf8_bin NOT NULL,
  `job` varchar(120) COLLATE utf8_bin NOT NULL,
  `Facebook` varchar(250) COLLATE utf8_bin NOT NULL,
  `Anniversaire` date DEFAULT '1980-01-31',
  `id_team` varchar(120) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Human`
--

INSERT INTO `Human` (`id_human`, `code_viz`, `name`, `first_name`, `mobile`, `mail`, `job`, `Facebook`, `Anniversaire`, `id_team`) VALUES
(1, 'Design-Ziegler', 'Ziegler', 'Stéphane', '0656834361', 'magentallteller@gmail.com', 'Designer', 'https://www.facebook.com/stephane.magentall.545', '1980-08-16', 'TEAM SZ'),
(2, 'DevWeb-Ziegler', 'Ziegler', 'Stéphane', '0656834361', 'magentallteller@gmail.com', 'Web Dev 2018', 'https://www.facebook.com/stephane.magentall.545', '1980-01-31', 'TEAM SZ'),
(3, 'Monteur-Ziegler', 'Ziegler', 'Stéphane', '0656834361', 'magentallteller@gmail.com', 'Monteur Vidéo\r\nPost Production', 'https://www.facebook.com/stephane.magentall.545', '1980-02-14', 'Team SA'),
(4, 'usertest1', 'user1', 'us', '145******', 'dsfs@dsf.com', 'dooolk', 'http', '1944-01-17', 'Team HoTinNA'),
(5, 'usertest2', 'user2', 'us', '456546**', '@', 'fffrg', 'http', '1985-07-21', 'Team HoTinNA');

-- --------------------------------------------------------

--
-- Table structure for table `HumansProfils`
--

CREATE TABLE `HumansProfils` (
  `id_profil` varchar(120) COLLATE utf8_bin NOT NULL,
  `code_viz` varchar(120) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `HumansProfils`
--

INSERT INTO `HumansProfils` (`id_profil`, `code_viz`) VALUES
('Pro_2D', 'Design-Ziegler'),
('Pro_2D', 'DevWeb-Ziegler'),
('Pro_3D', 'DevWeb-Ziegler'),
('Pro_Hob', 'DevWeb-Ziegler'),
('Pro_Social', 'DevWeb-Ziegler'),
('Pro_Social', 'Monteur-Ziegler'),
('Pro_Web_Design', 'DevWeb-Ziegler'),
('Pro_Web_dev', 'DevWeb-Ziegler'),
('Pro_vidéo', 'DevWeb-Ziegler'),
('Pro_vidéo', 'Monteur-Ziegler');

-- --------------------------------------------------------

--
-- Table structure for table `PC`
--

CREATE TABLE `PC` (
  `id_pc` int(50) NOT NULL,
  `nom_pc` varchar(120) COLLATE utf8_bin NOT NULL,
  `se_pc` varchar(120) COLLATE utf8_bin NOT NULL,
  `code_viz` varchar(120) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `PC`
--

INSERT INTO `PC` (`id_pc`, `nom_pc`, `se_pc`, `code_viz`) VALUES
(1, 'Asus', 'Windows 10', 'DevWeb-Ziegler'),
(2, 'Asus', 'Ubuntu Gnome', 'DevWeb-Ziegler'),
(3, 'Hp', 'Ubuntu Mint', 'DevWeb-Ziegler'),
(4, '', 'Windows 7 ou 8', 'Design-Ziegler'),
(5, 'BEAST', 'Linux', 'usertest1');

-- --------------------------------------------------------

--
-- Table structure for table `Profil`
--

CREATE TABLE `Profil` (
  `id_profil` varchar(120) COLLATE utf8_bin NOT NULL,
  `name_profil` varchar(120) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Profil`
--

INSERT INTO `Profil` (`id_profil`, `name_profil`, `description`) VALUES
('Pro_2D', 'Profil 2D', 'Représente mes compétences dans l\'utilisation des logiciels 2D'),
('Pro_3D', 'Profil 3D', 'Représente mes compétences dans l\'utilisation des logiciels 3D'),
('Pro_Hob', 'Profil Hobbies', 'représente mes hobbies'),
('Pro_Hob_Sport', 'Profil Sport', 'Sports pratiqués'),
('Pro_Social', 'Profil Social', 'représente mes caractères sociaux'),
('Pro_Web_Design', 'Profil Web Design', 'représente mes compétences dans l\'utilisation des logiciels pour le Web Design'),
('Pro_Web_dev', 'Profil Web Développeur', 'représente mes compétences dans l\'utilisation des logiciels pour la réalisation de contenu Web'),
('Pro_vidéo', 'Profil Vidéo', 'représente mes compétences dans la production vidéo');

-- --------------------------------------------------------

--
-- Table structure for table `SE`
--

CREATE TABLE `SE` (
  `id_se` int(11) NOT NULL,
  `name_se` varchar(150) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `SE`
--

INSERT INTO `SE` (`id_se`, `name_se`) VALUES
(5, 'Linux'),
(2, 'Ubuntu Gnome'),
(3, 'Ubuntu Mint'),
(1, 'Windows 10'),
(4, 'Windows 7 ou 8');

-- --------------------------------------------------------

--
-- Table structure for table `Skillz`
--

CREATE TABLE `Skillz` (
  `id_skill` int(11) NOT NULL,
  `skill` varchar(120) COLLATE utf8_bin NOT NULL,
  `level` int(11) NOT NULL,
  `id_profil` varchar(120) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Skillz`
--

INSERT INTO `Skillz` (`id_skill`, `skill`, `level`, `id_profil`) VALUES
(1, 'Montage Image\r\n', 80, 'Pro_2D'),
(2, 'Retouche Image\r\n', 75, 'Pro_2D'),
(3, 'Développeur Web\r\n', 71, 'Pro_Web_dev'),
(4, 'Montage Vidéo\r\n', 82, 'Pro_vidéo'),
(5, 'Post Production\r\n', 45, 'Pro_vidéo'),
(6, 'Production 3D\r\n', 31, 'Pro_3D'),
(7, 'Autonome', 75, 'Pro_Social'),
(8, 'Head Programmer', 24, 'Pro_Web_dev'),
(9, 'Mission Programmer', 75, 'Pro_Web_dev'),
(10, 'Web Design', 67, 'Pro_Web_Design'),
(11, 'Dev Front-End', 75, 'Pro_Web_dev'),
(12, 'Dev Back-end', 61, 'Pro_Web_dev'),
(13, 'Indulgent', 80, 'Pro_Social'),
(14, 'Méthodique', 89, 'Pro_Social'),
(15, 'Respectueux', 97, 'Pro_Social'),
(16, 'Minutieux', 75, 'Pro_Social'),
(17, 'Adaptivité', 80, 'Pro_Social'),
(18, 'Méticuleux', 97, 'Pro_Social'),
(19, 'Concis', 87, 'Pro_Social');

-- --------------------------------------------------------

--
-- Table structure for table `Softz`
--

CREATE TABLE `Softz` (
  `id_soft` int(11) NOT NULL,
  `soft` varchar(120) COLLATE utf8_bin NOT NULL,
  `level` int(11) NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  `id_profil` varchar(120) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Softz`
--

INSERT INTO `Softz` (`id_soft`, `soft`, `level`, `comment`, `id_profil`) VALUES
(1, 'Photoshop\r\n', 88, '', 'Pro_2D'),
(2, 'Gimp\r\n', 55, '', 'Pro_2D'),
(3, 'HTML5', 93, '', 'Pro_Web_dev'),
(4, 'CSS3', 78, '', 'Pro_Web_dev'),
(5, 'BootStrap\r\n', 47, '', 'Pro_Web_dev'),
(6, 'Php\r\n', 65, '', 'Pro_Web_dev'),
(10, 'Edius\r\n', 77, '', 'Pro_vidéo'),
(11, 'Premiere\r\n', 33, '', 'Pro_vidéo'),
(12, 'After Effect\r\n', 27, '', 'Pro_vidéo'),
(13, 'SoftImage XSI\r\n', 37, '', 'Pro_3D'),
(14, 'SolidWorks\r\n', 46, '', 'Pro_3D'),
(15, 'Atom', 88, 'Mon utilisation de Atom est lié à la programmation web', 'Pro_Web_dev'),
(16, 'Ubuntu', 71, 'Utilisation du Terminal pour mettre à jour et installer les packages', 'Pro_Web_dev');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Groupe`
--
ALTER TABLE `Groupe`
  ADD PRIMARY KEY (`id_grp`),
  ADD KEY `id_team` (`id_team`);

--
-- Indexes for table `Hobbies`
--
ALTER TABLE `Hobbies`
  ADD PRIMARY KEY (`id_hobbies`),
  ADD KEY `id_profil` (`id_profil`);

--
-- Indexes for table `Human`
--
ALTER TABLE `Human`
  ADD PRIMARY KEY (`id_human`),
  ADD UNIQUE KEY `id_person` (`code_viz`),
  ADD KEY `id_team` (`id_team`);

--
-- Indexes for table `HumansProfils`
--
ALTER TABLE `HumansProfils`
  ADD PRIMARY KEY (`id_profil`,`code_viz`),
  ADD KEY `id_profil_2` (`id_profil`),
  ADD KEY `code_viz` (`code_viz`);

--
-- Indexes for table `PC`
--
ALTER TABLE `PC`
  ADD PRIMARY KEY (`id_pc`),
  ADD KEY `id_person` (`code_viz`),
  ADD KEY `se_pc` (`se_pc`);

--
-- Indexes for table `Profil`
--
ALTER TABLE `Profil`
  ADD PRIMARY KEY (`id_profil`),
  ADD KEY `id_profil` (`id_profil`);

--
-- Indexes for table `SE`
--
ALTER TABLE `SE`
  ADD PRIMARY KEY (`id_se`),
  ADD KEY `name_se` (`name_se`);

--
-- Indexes for table `Skillz`
--
ALTER TABLE `Skillz`
  ADD PRIMARY KEY (`id_skill`),
  ADD KEY `id_person` (`id_profil`),
  ADD KEY `id_profil` (`id_profil`);

--
-- Indexes for table `Softz`
--
ALTER TABLE `Softz`
  ADD PRIMARY KEY (`id_soft`),
  ADD KEY `id_person` (`id_profil`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Groupe`
--
ALTER TABLE `Groupe`
  MODIFY `id_grp` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Hobbies`
--
ALTER TABLE `Hobbies`
  MODIFY `id_hobbies` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Human`
--
ALTER TABLE `Human`
  MODIFY `id_human` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `PC`
--
ALTER TABLE `PC`
  MODIFY `id_pc` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `SE`
--
ALTER TABLE `SE`
  MODIFY `id_se` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `Skillz`
--
ALTER TABLE `Skillz`
  MODIFY `id_skill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `Softz`
--
ALTER TABLE `Softz`
  MODIFY `id_soft` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Hobbies`
--
ALTER TABLE `Hobbies`
  ADD CONSTRAINT `Hobbies_ibfk_1` FOREIGN KEY (`id_profil`) REFERENCES `Profil` (`id_profil`);

--
-- Constraints for table `Human`
--
ALTER TABLE `Human`
  ADD CONSTRAINT `Human_ibfk_1` FOREIGN KEY (`id_team`) REFERENCES `Groupe` (`id_team`);

--
-- Constraints for table `HumansProfils`
--
ALTER TABLE `HumansProfils`
  ADD CONSTRAINT `HumansProfils_ibfk_1` FOREIGN KEY (`id_profil`) REFERENCES `Profil` (`id_profil`),
  ADD CONSTRAINT `HumansProfils_ibfk_2` FOREIGN KEY (`code_viz`) REFERENCES `Human` (`code_viz`);

--
-- Constraints for table `PC`
--
ALTER TABLE `PC`
  ADD CONSTRAINT `PC_ibfk_1` FOREIGN KEY (`code_viz`) REFERENCES `Human` (`code_viz`),
  ADD CONSTRAINT `PC_ibfk_2` FOREIGN KEY (`se_pc`) REFERENCES `SE` (`name_se`);

--
-- Constraints for table `Skillz`
--
ALTER TABLE `Skillz`
  ADD CONSTRAINT `Skillz_ibfk_1` FOREIGN KEY (`id_profil`) REFERENCES `Profil` (`id_profil`);

--
-- Constraints for table `Softz`
--
ALTER TABLE `Softz`
  ADD CONSTRAINT `Softz_ibfk_1` FOREIGN KEY (`id_profil`) REFERENCES `Profil` (`id_profil`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
