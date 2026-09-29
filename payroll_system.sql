-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2026 at 08:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payroll_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `ID` int(11) NOT NULL,
  `Employee_Name` varchar(100) NOT NULL,
  `Job_Role` varchar(100) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Basic_Salary` int(11) NOT NULL,
  `Allowance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`ID`, `Employee_Name`, `Job_Role`, `Department`, `Basic_Salary`, `Allowance`) VALUES
(1, 'Farshad Fazeen', 'Payroll Officer', 'Finance', 85000, 15000);

-- --------------------------------------------------------

--
-- Table structure for table `salary_details`
--

CREATE TABLE `salary_details` (
  `ID` int(11) NOT NULL,
  `Employee_ID` int(11) NOT NULL,
  `Employee_Name` varchar(100) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Basic_Salary` int(11) NOT NULL,
  `Allowance` int(11) NOT NULL,
  `Overtime_Hours` int(11) NOT NULL,
  `Overtime_Rate` int(11) NOT NULL,
  `EPF` int(11) NOT NULL,
  `ETF` int(11) NOT NULL,
  `Tax` int(11) NOT NULL,
  `Loan` int(11) NOT NULL,
  `Net_Salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salary_details`
--

INSERT INTO `salary_details` (`ID`, `Employee_ID`, `Employee_Name`, `Department`, `Basic_Salary`, `Allowance`, `Overtime_Hours`, `Overtime_Rate`, `EPF`, `ETF`, `Tax`, `Loan`, `Net_Salary`) VALUES
(1, 1, 'Farshad Fazeen', 'Finance', 85000, 15000, 8, 800, 6800, 2550, 3000, 5000, 89050);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `salary_details`
--
ALTER TABLE `salary_details`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `salary_details`
--
ALTER TABLE `salary_details`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
