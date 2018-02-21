-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 21, 2018 at 08:50 AM
-- Server version: 10.1.26-MariaDB-0+deb9u1
-- PHP Version: 7.0.27-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recursive_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions`
--

CREATE TABLE `actions` (
  `user_id` int(10) NOT NULL,
  `process_id` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `quantity` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actions`
--

INSERT INTO `actions` (`user_id`, `process_id`, `status`, `quantity`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(1, 2, 1, 1),
(3, 3, 1, 1),
(2, 3, 1, 1),
(1, 3, 1, 1),
(4, 4, 1, 1),
(3, 4, 1, 1),
(2, 4, 1, 1),
(1, 4, 1, 1),
(5, 5, 1, 1),
(4, 5, 1, 1),
(3, 5, 1, 1),
(2, 5, 1, 1),
(1, 5, 1, 1),
(6, 6, 1, 1),
(5, 6, 1, 1),
(4, 6, 1, 1),
(3, 6, 1, 1),
(2, 6, 1, 1),
(6, 7, 1, 1),
(5, 7, 1, 1),
(4, 7, 1, 1),
(3, 7, 1, 1),
(2, 7, 1, 1),
(6, 8, 1, 1),
(5, 8, 1, 1),
(4, 8, 1, 1),
(3, 8, 1, 1),
(2, 8, 1, 1),
(6, 9, 1, 1),
(5, 9, 1, 1),
(4, 9, 1, 1),
(3, 9, 1, 1),
(2, 9, 1, 1),
(6, 10, 1, 1),
(5, 10, 1, 1),
(4, 10, 1, 1),
(3, 10, 1, 1),
(2, 10, 1, 1),
(6, 11, 1, 1),
(5, 11, 1, 1),
(4, 11, 1, 1),
(3, 11, 1, 1),
(6, 12, 1, 1),
(5, 12, 1, 1),
(4, 12, 1, 1),
(3, 12, 1, 1),
(13, 13, 1, 1),
(6, 13, 1, 1),
(5, 13, 1, 1),
(4, 13, 1, 1),
(13, 14, 1, 1),
(6, 14, 1, 1),
(5, 14, 1, 1),
(4, 14, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `balances`
--

CREATE TABLE `balances` (
  `user_id` int(10) NOT NULL,
  `balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `balances`
--

INSERT INTO `balances` (`user_id`, `balance`) VALUES
(1, 5),
(2, 9),
(3, 10),
(4, 11),
(5, 10),
(6, 9),
(13, 2);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `process_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `operation` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `details` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`process_id`, `status`, `operation`, `created_at`, `updated_at`, `details`) VALUES
(1, 1, 1, '2018-02-20 10:42:00', '2018-02-20 10:42:00', 'test'),
(2, 1, 1, '2018-02-20 10:42:22', '2018-02-20 10:42:22', 'test'),
(3, 1, 1, '2018-02-20 10:42:50', '2018-02-20 10:42:50', 'test'),
(4, 1, 1, '2018-02-20 10:43:13', '2018-02-20 10:43:13', 'test'),
(5, 1, 1, '2018-02-20 10:43:24', '2018-02-20 10:43:24', 'test'),
(6, 1, 1, '2018-02-20 10:43:45', '2018-02-20 10:43:45', 'test'),
(7, 1, 1, '2018-02-20 10:44:19', '2018-02-20 10:44:19', 'test'),
(8, 1, 1, '2018-02-20 10:46:02', '2018-02-20 10:46:02', 'test'),
(9, 1, 1, '2018-02-20 10:46:18', '2018-02-20 10:46:18', 'test'),
(10, 1, 1, '2018-02-20 10:47:13', '2018-02-20 10:47:13', 'test'),
(11, 1, 1, '2018-02-20 10:48:21', '2018-02-20 10:48:21', 'test'),
(12, 1, 1, '2018-02-20 10:48:33', '2018-02-20 10:48:33', 'test'),
(13, 1, 1, '2018-02-21 04:36:06', '2018-02-21 04:36:06', 'test'),
(14, 1, 1, '2018-02-21 04:37:24', '2018-02-21 04:37:24', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `short_code` varchar(12) NOT NULL,
  `parent_id` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `short_code`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'ABCD', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'G1MQE', 1, '2018-02-20 10:42:00', '2018-02-20 10:42:00'),
(3, 'R7VV7', 2, '2018-02-20 10:42:21', '2018-02-20 10:42:21'),
(4, 'ZQL2G', 3, '2018-02-20 10:42:50', '2018-02-20 10:42:50'),
(5, 'QSVQP', 4, '2018-02-20 10:43:12', '2018-02-20 10:43:12'),
(6, 'FEOYX', 5, '2018-02-20 10:43:24', '2018-02-20 10:43:24'),
(7, 'SEFPV', 6, '2018-02-20 10:43:45', '2018-02-20 10:43:45'),
(8, 'Q2K97', 6, '2018-02-20 10:44:19', '2018-02-20 10:44:19'),
(9, 'E5ZHG', 6, '2018-02-20 10:46:02', '2018-02-20 10:46:02'),
(10, 'HIWHD', 6, '2018-02-20 10:46:18', '2018-02-20 10:46:18'),
(11, '90KYS', 6, '2018-02-20 10:47:13', '2018-02-20 10:47:13'),
(12, 'BTJSD', 6, '2018-02-20 10:48:21', '2018-02-20 10:48:21'),
(13, '2A8GB', 6, '2018-02-20 10:48:33', '2018-02-20 10:48:33'),
(14, 'OKDPG', 13, '2018-02-21 04:36:06', '2018-02-21 04:36:06'),
(15, 'W0DTU', 13, '2018-02-21 04:37:24', '2018-02-21 04:37:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions`
--
ALTER TABLE `actions`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `actions_ibfk_1` (`process_id`);

--
-- Indexes for table `balances`
--
ALTER TABLE `balances`
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`process_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `process_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actions`
--
ALTER TABLE `actions`
  ADD CONSTRAINT `actions_ibfk_1` FOREIGN KEY (`process_id`) REFERENCES `transactions` (`process_id`),
  ADD CONSTRAINT `actions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `balances`
--
ALTER TABLE `balances`
  ADD CONSTRAINT `balances_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
