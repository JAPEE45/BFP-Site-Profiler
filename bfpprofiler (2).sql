-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2025 at 07:05 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bfpprofiler`
--

-- --------------------------------------------------------

--
-- Table structure for table `establishment`
--

CREATE TABLE `establishment` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createdAt` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL,
  `x_coordinate` varchar(50) NOT NULL,
  `y_coordinate` varchar(50) NOT NULL,
  `registration_no` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `establishment`
--

INSERT INTO `establishment` (`id`, `owner_id`, `address`, `type`, `name`, `createdAt`, `status`, `x_coordinate`, `y_coordinate`, `registration_no`) VALUES
(2, 2, 'sa gilid la', 'comercial', 'Sampaguita', '2025-09-19', '', '', '', ''),
(3, 2, 'jk', 'hi', 'mama mo', '2025-09-24', 'active', '124.271000', '13.599706', 'Not Registered'),
(4, 2, 'as', 'habo ko na', 'mama nya', '2025-09-24', 'active', '124.214119', '13.572155', 'Not Registered'),
(5, 2, 'asas', '1', 'asa', '2025-09-24', 'active', '124.179077', '13.599186', 'asas'),
(6, 2, 'asdasjdkl;', '1', 'sa', '2025-09-24', 'active', '124.220646', '13.570654', 'asa');

-- --------------------------------------------------------

--
-- Table structure for table `inspection`
--

CREATE TABLE `inspection` (
  `id` int(11) NOT NULL,
  `inspector` int(11) NOT NULL,
  `inspection_type` varchar(20) NOT NULL,
  `inspection_date` varchar(30) NOT NULL,
  `priority_level` varchar(30) NOT NULL,
  `notes` varchar(500) NOT NULL,
  `time_slot` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  `createdAt` date NOT NULL DEFAULT current_timestamp(),
  `establishment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inspection`
--

INSERT INTO `inspection` (`id`, `inspector`, `inspection_type`, `inspection_date`, `priority_level`, `notes`, `time_slot`, `status`, `createdAt`, `establishment_id`) VALUES
(1, 4, 'follow-up', '2025-09-23', 'high', 'asas', 'full-day', 'approved', '2025-09-25', 3),
(2, 5, 'routine', '2025-10-10', 'low', 'basta dito', 'afternoon', 'status-pen', '2025-10-08', 5),
(3, 4, 'routine', '2025-10-10', 'medium', 'hi', 'morning', 'status-pen', '2025-10-08', 2),
(4, 4, 'follow-up', '2025-10-18', 'medium', 'hi', 'morning', 'status-pen', '2025-10-08', 6),
(5, 10, 'follow-up', '2025-10-11', 'high', 'sas', 'morning', 'status-pen', '2025-10-08', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `createdAt` date NOT NULL DEFAULT current_timestamp(),
  `role` varchar(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'active',
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `address`, `phone_number`, `createdAt`, `role`, `username`, `password`, `status`, `email`) VALUES
(1, 'jasper fernandez', 'Silang', '09197960151', '2025-09-19', 'admin', 'admin', 'admin', 'active', 'admin@gmail.com'),
(2, 'Christian Briol', 'Masbate City', '09106266497', '2025-09-19', 'owner', 'chan', 'chan', 'active', 'owner@gmail.com'),
(4, 'sas', 'sa', '', '2025-09-19', 'inspector', '', 'aa', 'active', 'asas@'),
(5, 'noway', 'sa puso nya', '', '2025-09-19', 'inspector', '', '', 'inactive', 'sa@fa'),
(10, 'japee', 'sa puso mo', '', '2025-09-22', 'Inspector', '', 'japee', 'active', 'fernandezmayma@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `violation`
--

CREATE TABLE `violation` (
  `id` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `corrective_action` varchar(500) NOT NULL,
  `deadline_of_compliance` date NOT NULL,
  `createdAt` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `establishment`
--
ALTER TABLE `establishment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inspection`
--
ALTER TABLE `inspection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `violation`
--
ALTER TABLE `violation`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `establishment`
--
ALTER TABLE `establishment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inspection`
--
ALTER TABLE `inspection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `violation`
--
ALTER TABLE `violation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
