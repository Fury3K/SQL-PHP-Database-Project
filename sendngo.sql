-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2024 at 08:48 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sendngo`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` varchar(20) NOT NULL,
  `FName` varchar(50) NOT NULL,
  `MidInitial` varchar(3) NOT NULL,
  `LName` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FName`, `MidInitial`, `LName`, `password`) VALUES
('1321321', 'NJJJJJJJJ', 'G', 'James', '543543'),
('32', 'NJ', 'G', 'Orlanes', '3212'),
('32134', 'NJJJ', 'F', 'Fghwe', '32'),
('432', 'fhwfwoa', 'j', 'fiwhfa', 'fwafa'),
('testuser', 'test', 'ttt', 'test', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `customer_email`
--

CREATE TABLE `customer_email` (
  `CustomerID` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_phonenumber`
--

CREATE TABLE `customer_phonenumber` (
  `PhoneNum` int(20) NOT NULL,
  `CustomerID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_shipping`
--

CREATE TABLE `customer_shipping` (
  `CustomerID` varchar(20) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `ZipCode` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `DetailsID` varchar(20) NOT NULL,
  `Quantity` int(5) NOT NULL,
  `Price` int(10) NOT NULL,
  `OrderID` varchar(20) NOT NULL,
  `ProductID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `InventoryID` varchar(20) NOT NULL,
  `QuantityAvail` int(5) NOT NULL,
  `SupplierID` varchar(20) NOT NULL,
  `ProductID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderr`
--

CREATE TABLE `orderr` (
  `OrderID` varchar(20) NOT NULL,
  `OrderDate` date NOT NULL,
  `ShipDate` date NOT NULL,
  `Status` varchar(20) NOT NULL,
  `TotalAmount` int(10) NOT NULL,
  `CustomerID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` varchar(20) NOT NULL,
  `Amount` int(10) NOT NULL,
  `PaymentMethod` varchar(20) NOT NULL,
  `PaymentDate` date NOT NULL,
  `OrderID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` varchar(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text NOT NULL,
  `Price` int(10) NOT NULL,
  `Category` varchar(20) NOT NULL,
  `InventoryID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `ReviewID` varchar(20) NOT NULL,
  `Rating` varchar(20) NOT NULL,
  `Comment` text NOT NULL,
  `ReviewDate` date NOT NULL,
  `CustomerID` varchar(20) NOT NULL,
  `ProductID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping`
--

CREATE TABLE `shipping` (
  `ShippingID` varchar(20) NOT NULL,
  `ShippingMethod` varchar(20) NOT NULL,
  `Cost` int(10) NOT NULL,
  `ETADelivery` date NOT NULL,
  `OrderID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` varchar(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `Province` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_email`
--

CREATE TABLE `supplier_email` (
  `SupplierID` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_phonenumber`
--

CREATE TABLE `supplier_phonenumber` (
  `SupplierID` varchar(20) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `customer_email`
--
ALTER TABLE `customer_email`
  ADD PRIMARY KEY (`Email`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `customer_phonenumber`
--
ALTER TABLE `customer_phonenumber`
  ADD PRIMARY KEY (`PhoneNum`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `customer_shipping`
--
ALTER TABLE `customer_shipping`
  ADD PRIMARY KEY (`Street`,`City`,`ZipCode`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`DetailsID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`InventoryID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Indexes for table `orderr`
--
ALTER TABLE `orderr`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `InventoryID` (`InventoryID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`ShippingID`),
  ADD KEY `OrderID` (`OrderID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`,`Name`,`Street`,`City`,`Province`);

--
-- Indexes for table `supplier_email`
--
ALTER TABLE `supplier_email`
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Indexes for table `supplier_phonenumber`
--
ALTER TABLE `supplier_phonenumber`
  ADD PRIMARY KEY (`PhoneNumber`),
  ADD KEY `SupplierID` (`SupplierID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer_email`
--
ALTER TABLE `customer_email`
  ADD CONSTRAINT `customer_email_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `customer_phonenumber`
--
ALTER TABLE `customer_phonenumber`
  ADD CONSTRAINT `customer_phonenumber_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `customer_shipping`
--
ALTER TABLE `customer_shipping`
  ADD CONSTRAINT `customer_shipping_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `details_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orderr` (`OrderID`),
  ADD CONSTRAINT `details_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`);

--
-- Constraints for table `orderr`
--
ALTER TABLE `orderr`
  ADD CONSTRAINT `orderr_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orderr` (`OrderID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`InventoryID`) REFERENCES `inventory` (`InventoryID`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orderr` (`OrderID`);

--
-- Constraints for table `supplier_email`
--
ALTER TABLE `supplier_email`
  ADD CONSTRAINT `supplier_email_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`);

--
-- Constraints for table `supplier_phonenumber`
--
ALTER TABLE `supplier_phonenumber`
  ADD CONSTRAINT `supplier_phonenumber_ibfk_1` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
