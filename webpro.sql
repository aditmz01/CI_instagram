-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2020 at 07:00 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webpro`
--

-- --------------------------------------------------------

--
-- Table structure for table `photo`
--

CREATE TABLE `photo` (
  `url` varchar(50) NOT NULL,
  `caption` varchar(100) NOT NULL,
  `like_photo` int(6) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `photo`
--

INSERT INTO `photo` (`url`, `caption`, `like_photo`, `username`) VALUES
('kucing.jpg', 'Ini Kucing Aku', 412, 'aditmz01'),
('maung.jpg', 'Ini Maung Aku', 123, 'aditmz01'),
('onta.jpg', 'Ini Unta Aku', 100, 'aditmz01'),
('manuk.jpg', 'Burung Elang Rajawali', 1, 'aditmz01'),
('foto.jpg', 'INI FOTO PERTAMAKU', 290, 'yuni');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `name` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `website` varchar(30) NOT NULL,
  `bio` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `gender` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`name`, `username`, `website`, `bio`, `email`, `nohp`, `gender`) VALUES
('Aditya Mahendra - 1301184388', 'aditmz01', 'http://github.com/aditmz01', 'TERUSLAH MENJADI VERSI TERBAIK DARI DIRIMU', 'mahendrazaditya@gmail.com', '081224623157', 1),
('Yuni Nurhayani', 'yuni', 'yuninurhayani.com', 'START YOUR DAY WITH BISMILLAH', 'yuninurhayani@gmail.com', '089626144711', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `email`) VALUES
('aditmz01', 'aditmz01', 'mahendrazaditya@gmail.com'),
('yuni', 'yuni', 'yuninurhayani@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`name`),
  ADD KEY `profile_FK` (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `profile_FK` FOREIGN KEY (`username`) REFERENCES `user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
