-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 02, 2023 at 11:05 AM
-- Server version: 5.7.33
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `accommodation`
--

CREATE TABLE `accommodation` (
  `id` int(11) NOT NULL COMMENT 'первичный ключ таблицы accommodation',
  `room_id` int(11) NOT NULL COMMENT 'id_комнаты из таблицы rooms',
  `guest_id` int(11) NOT NULL COMMENT 'id_гостя из таблицы guests',
  `start_date` date NOT NULL COMMENT 'дата_начала',
  `end_date` date NOT NULL COMMENT 'дата_окончания',
  `number_of_persons` int(11) NOT NULL COMMENT 'количество_человек'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL COMMENT 'первичный ключ таблицы booking',
  `room_id` int(11) NOT NULL COMMENT 'внешний ключ, id_комнаты из тблицы rooms',
  `guest_id` int(11) NOT NULL COMMENT 'внешний ключ, id_гостя из тблицы guests',
  `start_date` date NOT NULL COMMENT 'дата_начала',
  `end_date` date NOT NULL COMMENT 'дата_окончания',
  `number_of_persons` int(11) NOT NULL COMMENT 'количество_человек'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `buildings`
--

CREATE TABLE `buildings` (
  `id` int(11) NOT NULL COMMENT 'первичный ключ таблицы buildings',
  `name` varchar(255) NOT NULL COMMENT 'наименование'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `id` int(11) NOT NULL COMMENT 'первичный ключ таблицы guests',
  `full_name` varchar(255) NOT NULL COMMENT 'ФИО гостя'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `building_id` int(11) NOT NULL COMMENT 'Внешний ключ, указывающий на строку с соответствующим первичным ключом таблицы buildings',
  `room_number` int(11) NOT NULL COMMENT 'номер комнаты',
  `number_of_beds` int(11) NOT NULL COMMENT 'количество мест',
  `price` decimal(10,2) NOT NULL COMMENT 'цена',
  `id` int(11) NOT NULL COMMENT 'первичный ключ таблицы rooms'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accommodation`
--
ALTER TABLE `accommodation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guest_id` (`guest_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guest_id` (`guest_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building_id` (`building_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accommodation`
--
ALTER TABLE `accommodation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ таблицы accommodation';

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ таблицы booking';

--
-- AUTO_INCREMENT for table `buildings`
--
ALTER TABLE `buildings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ таблицы buildings';

--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ таблицы guests';

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'первичный ключ таблицы rooms';

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accommodation`
--
ALTER TABLE `accommodation`
  ADD CONSTRAINT `accommodation_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`),
  ADD CONSTRAINT `accommodation_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `buildings` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
