-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 14, 2020 at 09:52 AM
-- Server version: 8.0.17
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `logindemo`
--

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `encrypted_password` varchar(150) NOT NULL,
  `salt` varchar(100) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `encrypted_password` varchar(150) NOT NULL,
  `salt` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`name`, `email`, `encrypted_password`, `salt`) VALUES
('Ar', 'abdul.rahuman@mrasoftec.com', 'e74562ff3c9a3ef7b8a8cafd68ec671dc7b8b1e4cbbddf06988edcb8955ebc880ab2bb88308a830cb3f62cf50bf3c289a613e7ffb62e80b496fd621bab6d9675', 'b0fd89b74ccc516cb0e9'),
('abdul', 'ar@mrasoftec.com', '032a2d016ebcfff605d147983c4bac71fa126c3aed62140b647abf6094705368daf054bbba522bb6218a9ab074883b8015731c7d89ee68272625601a96f569b3', 'fa17171dd1b9f0233f90'),
('vignesh', 'vignesh@mrasoftec.com', '521ccdc9836143a5fe3c5cf11da76cd3d5f64e6626817b559160331efc54c08c2acd953c201bc38d30443ebc40126d2af7f7dd4e32e4113f2e57e7ba7db87aaf', 'a932b974dcb05532c7c7'),
('mansoor', 'mansoor@mrasoftec.com', '9b462e257d0a23bdd5940960df3988b4a46bb8ac893a65c2e9c895c522f8ffa1fbae5483555a49bae410b61cb66327992b3db6921227edf7c054abcf303673c4', 'fe6f0d65ef11427187b6');

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE `userinfo` (
  `id` int(3) NOT NULL,
  `email` varchar(100) NOT NULL,
  `encrypted_password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) NOT NULL,
  `createdat` datetime NOT NULL,
  `updatedat` datetime NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`id`, `email`, `encrypted_password`, `salt`, `createdat`, `updatedat`, `name`) VALUES
(1, 'abdul.rahuman@mrassoftec.com', 'abdul', '', '2020-05-09 00:00:00', '2020-05-09 10:38:43', 'AR'),
(2, 'mohammed.mansoor@mrasoftec.com', 'mansoor', '', '2020-05-09 00:00:00', '2020-05-09 10:48:40', 'Mohammed Mansoor'),
(3, '.mansoor@mrasoftec.com', 'mansoor', '', '2020-05-09 00:00:00', '2020-05-09 14:07:00', 'Mohammed Mansoor'),
(4, 'abdul@mrasoftec.com', 'abdul', 'abdul', '2020-05-11 00:00:00', '2020-05-11 14:12:45', 'ar'),
(5, 'moha.mansoor@mrasoftec.com', 'mansoor', '', '2020-05-11 14:45:21', '2020-05-11 14:45:21', 'Mohammed Mansoor');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`unique_id`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userinfo`
--
ALTER TABLE `userinfo`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
