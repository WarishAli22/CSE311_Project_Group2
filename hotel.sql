-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2022 at 11:18 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `admin_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`first_name`, `last_name`, `email`, `admin_password`) VALUES
('Maria', 'Oishee', 'maria.oishee@northsouth.edu', 'password2'),
('Sakib', 'Jawad', 'sakib.jawad@northsouth.edu', 'password1');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `child_number` int(11) DEFAULT NULL,
  `adult_number` int(11) DEFAULT NULL,
  `room_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `cid`, `start_date`, `end_date`, `child_number`, `adult_number`, `room_number`) VALUES
(1, 1, '2022-01-01', '2022-01-05', 2, 2, 101),
(2, 2, '2022-01-06', '2022-01-10', 1, 2, 103),
(3, 3, '2022-01-11', '2022-01-15', 0, 2, 102);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cid` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nid` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cid`, `first_name`, `last_name`, `email`, `nid`, `date_of_birth`, `password`) VALUES
(1, 'Mark', 'Doe', 'john.doe@example.com', '1234567890', '1980-01-01', 'password1'),
(2, 'Jane', 'Doe', 'jane.doe@example.com', '0987654321', '1985-02-14', 'password2'),
(3, 'Jon', 'Smith', 'bob.smith@example.com', '1111111111', '1990-03-21', 'password3');

-- --------------------------------------------------------

--
-- Table structure for table `customer_phone`
--

CREATE TABLE `customer_phone` (
  `cid` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_phone`
--

INSERT INTO `customer_phone` (`cid`, `phone`) VALUES
(1, '123-456-7890'),
(1, '234-567-8901'),
(2, '345-678-9012'),
(3, '456-789-0123');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_number` int(11) NOT NULL,
  `room_type` varchar(255) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_number`, `room_type`, `availability`) VALUES
(101, 'Standard', 1),
(102, 'Standard', 1),
(103, 'Deluxe', 1),
(104, 'Suite', 0);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `sid` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`sid`, `first_name`, `last_name`, `email`, `age`, `designation`) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', 35, 'Manager'),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 32, 'Assistant Manager'),
(3, 'Bob', 'Smith', 'bob.smith@example.com', 28, 'Front Desk Clerk');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `room_number` (`room_number`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `customer_phone`
--
ALTER TABLE `customer_phone`
  ADD PRIMARY KEY (`cid`,`phone`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_number`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`sid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`room_number`) REFERENCES `room` (`room_number`);

--
-- Constraints for table `customer_phone`
--
ALTER TABLE `customer_phone`
  ADD CONSTRAINT `customer_phone_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `customer` (`cid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
