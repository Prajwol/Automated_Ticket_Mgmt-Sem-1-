-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 13, 2020 at 11:15 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `profile_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `psw_hint` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`profile_id`, `description`, `psw_hint`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'hellos', 'uff22', NULL, NULL, 7);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `ticket_type` enum('system','other') DEFAULT NULL,
  `ticket_title` varchar(255) DEFAULT NULL,
  `ticket_description` text DEFAULT NULL,
  `ticket_image` varchar(255) DEFAULT NULL,
  `ticket_status` enum('issued','approved','in-progress','reject','assigned','solved') DEFAULT NULL,
  `ticket_priority` enum('low','medium','high') DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `ticket_type`, `ticket_title`, `ticket_description`, `ticket_image`, `ticket_status`, `ticket_priority`, `due_date`, `info`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'system', 'hello', 'world', NULL, 'solved', 'low', '2020-10-08 00:00:00', 'o', '2020-10-08 00:00:00', '2020-10-08 00:00:00', 7),
(2, 'system', 'sss', 's', NULL, 'solved', 'medium', '2020-10-09 00:00:00', '', '2020-10-08 08:22:24', '2020-10-08 08:22:24', 7),
(3, 'other', 'sss', 's', NULL, 'reject', 'medium', '2020-10-08 00:00:00', 's', '2020-10-08 08:22:39', '2020-10-08 08:27:39', 7),
(4, 'system', 'hello again', 'sa', NULL, 'assigned', 'high', '2020-10-15 00:00:00', 'now', '2020-10-08 08:24:48', '2020-10-08 08:24:48', 7),
(5, 'system', 'aaa', 'a', NULL, 'reject', 'low', '2020-10-08 00:00:00', 'a', '2020-10-08 10:15:21', '2020-10-08 10:15:21', 6),
(6, 'system', 'bbb', 'wqerke v jbefwvbjqkr;f bwfo bcqihbvqijbrv; wbf;qfrb;1k3fkqer', NULL, 'approved', 'low', '2020-10-08 00:00:00', 'ww', '2020-10-08 10:16:51', '2020-10-08 10:16:51', 6);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('client','admin','engineer') NOT NULL,
  `activation_code` varchar(255) NOT NULL,
  `email_status` enum('0','1') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `email`, `password`, `user_type`, `activation_code`, `email_status`, `created_at`, `updated_at`) VALUES
(4, 'test', 'test', 'praju23@gmail.com', '$2y$04$Wltvrc6jMFvEmyJ5vZxUCOp74inzMy9bTMvsRxDb5WLaJpfrgPCP6', 'client', '12d234f1cd6853bb23acffb3259e7c31', '1', '2020-09-16 18:44:22', '2020-09-16 18:44:22'),
(6, 'Prajwol', 'Parajuli', 'prajol003@gmail.com', '$2y$04$Wltvrc6jMFvEmyJ5vZxUCOp74inzMy9bTMvsRxDb5WLaJpfrgPCP6', 'client', '17b206cfa2b509fabf9a71ce480be95a', '1', '2020-09-17 19:32:15', '2020-09-17 19:32:15'),
(7, 'suryapanday1.sp@gmail.com', 'my passwords surya1dv2', 'suryapanday1.sp@gmail.com', '$2y$04$Wltvrc6jMFvEmyJ5vZxUCOp74inzMy9bTMvsRxDb5WLaJpfrgPCP6', 'client', '59a4f8f8a215de53517438e34355521d', '1', '2020-09-30 06:48:50', '2020-09-30 06:48:50'),
(8, 'surya', 'panday', 'test@nepal.com', '$2y$04$18neoNF9Y9b03mD.0I7oHOPXhiDNnVKMyzXxRNcsBdzh7x2t62LK6', 'client', '24afd90d5a67678cfd4f91aabc64b90d', '0', '2020-10-12 04:18:16', '2020-10-12 04:18:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`profile_id`,`user_id`),
  ADD KEY `fk_profile_user1_idx` (`user_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`,`user_id`),
  ADD KEY `fk_ticket_user_idx` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `profile`
--
ALTER TABLE `profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_profile_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
