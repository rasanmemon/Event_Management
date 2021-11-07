-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2021 at 10:06 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `event_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountant`
--

CREATE TABLE `accountant` (
  `Accountant_id` int(11) NOT NULL,
  `Total_Payment` int(11) NOT NULL,
  `Client_Profit` int(11) NOT NULL,
  `Event_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `artist`
--

CREATE TABLE `artist` (
  `Artist_id` int(11) NOT NULL,
  `Artist_Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Artist_Email` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `Client_id` int(11) NOT NULL,
  `Client_Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Client_Phone` int(11) NOT NULL,
  `Client_Email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Client_Address` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `Organization_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `eventdetail`
--

CREATE TABLE `eventdetail` (
  `Event_Id` int(11) NOT NULL,
  `Event_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Event_Time` time NOT NULL,
  `Event_Date` date NOT NULL,
  `Event_Location` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `Audience` int(11) DEFAULT NULL,
  `Event_Budget` int(11) DEFAULT NULL,
  `Event_Ticket_Price` int(11) DEFAULT NULL,
  `Client_Client_id` int(11) DEFAULT NULL,
  `Sponser_Sponser_id` int(11) DEFAULT NULL,
  `Artist_Artist_id` int(11) DEFAULT NULL,
  `Volunteer_Volunteer_ID` int(11) DEFAULT NULL,
  `Guest_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `eventdetail`
--

INSERT INTO `eventdetail` (`Event_Id`, `Event_Name`, `Event_Time`, `Event_Date`, `Event_Location`, `Audience`, `Event_Budget`, `Event_Ticket_Price`, `Client_Client_id`, `Sponser_Sponser_id`, `Artist_Artist_id`, `Volunteer_Volunteer_ID`, `Guest_Id`) VALUES
(2, 'birthday', '14:00:00', '2021-11-12', 'Sea View', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'birthday', '18:04:00', '2021-11-18', 'Sea View', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `Guest_Id` int(11) NOT NULL,
  `Guest_FName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Guest_LName` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Guest_email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Guest_phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Guest_CNIC` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `Guest_Password` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`Guest_Id`, `Guest_FName`, `Guest_LName`, `Guest_email`, `Guest_phone`, `Guest_CNIC`, `Guest_Password`) VALUES
(1, 'Muhammad Rasan', 'Rafiq', 'rasan.memon@gmail.com', '03212775578', '42301-2400000', 12345),
(2, 'uzair', 'alam', 'john.smith@botble.com', '132432', '214142', 1234),
(3, 'uzair', 'alam', 'john.smith@botble.com', '132432', '214142', 2345);

-- --------------------------------------------------------

--
-- Table structure for table `sponser`
--

CREATE TABLE `sponser` (
  `Sponser_id` int(11) NOT NULL,
  `Sponser_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Sponser_email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `Sponser_phoneno` int(11) NOT NULL,
  `Sponser_Company` varchar(225) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `volunteer`
--

CREATE TABLE `volunteer` (
  `Volunteer_ID` int(11) NOT NULL,
  `Volunteer_Name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Volunteer_Phone` int(11) NOT NULL,
  `Volunteer_Email` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountant`
--
ALTER TABLE `accountant`
  ADD PRIMARY KEY (`Accountant_id`),
  ADD KEY `FK_Acc_Event` (`Event_Id`);

--
-- Indexes for table `artist`
--
ALTER TABLE `artist`
  ADD PRIMARY KEY (`Artist_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Client_id`);

--
-- Indexes for table `eventdetail`
--
ALTER TABLE `eventdetail`
  ADD PRIMARY KEY (`Event_Id`),
  ADD KEY `Event_Guest_FK` (`Guest_Id`),
  ADD KEY `Event_Client_FK` (`Client_Client_id`),
  ADD KEY `Event_Artist_FK` (`Artist_Artist_id`),
  ADD KEY `Event_Volunteer_FK` (`Volunteer_Volunteer_ID`),
  ADD KEY `Event_Sponser_FK` (`Sponser_Sponser_id`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`Guest_Id`);

--
-- Indexes for table `sponser`
--
ALTER TABLE `sponser`
  ADD PRIMARY KEY (`Sponser_id`);

--
-- Indexes for table `volunteer`
--
ALTER TABLE `volunteer`
  ADD PRIMARY KEY (`Volunteer_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountant`
--
ALTER TABLE `accountant`
  MODIFY `Accountant_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `artist`
--
ALTER TABLE `artist`
  MODIFY `Artist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `Client_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `eventdetail`
--
ALTER TABLE `eventdetail`
  MODIFY `Event_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `Guest_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sponser`
--
ALTER TABLE `sponser`
  MODIFY `Sponser_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volunteer`
--
ALTER TABLE `volunteer`
  MODIFY `Volunteer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accountant`
--
ALTER TABLE `accountant`
  ADD CONSTRAINT `FK_Acc_Event` FOREIGN KEY (`Event_Id`) REFERENCES `eventdetail` (`Event_Id`);

--
-- Constraints for table `eventdetail`
--
ALTER TABLE `eventdetail`
  ADD CONSTRAINT `Event_Artist_FK` FOREIGN KEY (`Artist_Artist_id`) REFERENCES `artist` (`Artist_id`),
  ADD CONSTRAINT `Event_Client_FK` FOREIGN KEY (`Client_Client_id`) REFERENCES `client` (`Client_id`),
  ADD CONSTRAINT `Event_Guest_FK` FOREIGN KEY (`Guest_Id`) REFERENCES `guest` (`Guest_Id`),
  ADD CONSTRAINT `Event_Sponser_FK` FOREIGN KEY (`Sponser_Sponser_id`) REFERENCES `sponser` (`Sponser_id`),
  ADD CONSTRAINT `Event_Volunteer_FK` FOREIGN KEY (`Volunteer_Volunteer_ID`) REFERENCES `volunteer` (`Volunteer_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
