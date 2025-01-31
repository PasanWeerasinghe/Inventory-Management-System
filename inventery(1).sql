-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2025 at 03:03 PM
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
-- Database: `inventery`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddItem` (IN `p_itemName` VARCHAR(255), IN `p_description` TEXT, IN `p_quantity` INT, IN `p_price` DECIMAL(10,2))   BEGIN
    INSERT INTO items (itemName, description, quantity, price)
    VALUES (p_itemName, p_description, p_quantity, p_price);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteItem` (IN `p_itemID` INT)   BEGIN
    DELETE FROM items
    WHERE itemID = p_itemID;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `itemID` int(11) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemID`, `itemName`, `description`, `quantity`, `price`) VALUES
(9, 'ball', 'fghjkl', 10000, 234567.00),
(10, 'shirt', 'hello shirt', 12345667, 1000.00),
(12, 'cricket', 'sdfgh', 40, 345673.00),
(14, 'dfghjk', 'sdfghj', 556, 45789.00),
(15, 'Notebook', 'A5 ruled notebook', 50, 2.99),
(19, 'Laptop', 'High-performance laptop', 10, 1500.99),
(20, 'ring', 'good', 45, 678.00),
(22, 'Laptop', 'High laptop', 10, 1500.99),
(24, 'prmila', 'ghjujiuoiughfjhjhk,k', 32, 32425.00);

--
-- Triggers `items`
--
DELIMITER $$
CREATE TRIGGER `after_item_delete` AFTER DELETE ON `items` FOR EACH ROW BEGIN
    INSERT INTO notifications (message, created_at)
    VALUES (CONCAT('Item deleted: ', OLD.itemName), NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_item_insert` AFTER INSERT ON `items` FOR EACH ROW BEGIN
    INSERT INTO notifications (message, created_at)
    VALUES (CONCAT('New item added: ', NEW.itemName, ' (Quantity: ', NEW.quantity, ')'), NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_item_update` AFTER UPDATE ON `items` FOR EACH ROW BEGIN
    INSERT INTO notifications (message, created_at)
    VALUES (CONCAT('Item updated: ', NEW.itemName, 
                   ' (Old Quantity: ', OLD.quantity, 
                   ', New Quantity: ', NEW.quantity, ')'), NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `message`, `created_at`) VALUES
(2, 'hi', 'hello', '2024-12-12 00:03:00'),
(3, '', 'New item added: Laptop (Quantity: 10)', '2024-12-19 00:18:43'),
(4, '', 'New item added: ring (Quantity: 45)', '2024-12-19 00:20:06'),
(5, '', 'Item updated: ring (Old Quantity: 45, New Quantity: 45)', '2024-12-19 00:22:26'),
(6, '', 'Item deleted: Sample Item', '2024-12-19 00:28:33'),
(7, '', 'New item added: Laptop (Quantity: 10)', '2024-12-19 03:00:39'),
(8, '', 'New item added: Laptop (Quantity: 10)', '2024-12-19 03:00:50'),
(9, '', 'Item deleted: Laptop', '2024-12-19 03:01:21'),
(10, '', 'New item added: hello (Quantity: 456)', '2024-12-19 06:40:15'),
(11, '', 'Item deleted: bat', '2024-12-19 06:46:14'),
(12, '', 'New item added: prmila (Quantity: 32)', '2025-01-31 13:10:28'),
(13, '', 'Item updated: prmila (Old Quantity: 32, New Quantity: 32)', '2025-01-31 13:10:54'),
(14, '', 'Item deleted: hello', '2025-01-31 13:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_name`, `order_date`, `status`, `total`) VALUES
(3, 'mnnhh', '2024-12-12', 'Pending', 7856.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'pasan', 'pasan@gmail.com', '12345', 'Admin'),
(2, 'malshan', 'malshan@gmail.com', '1234', 'user'),
(8, 'pasanma', 'pasan@gmail.com', '12345678', 'Admin'),
(10, 'pasan', 'pasan@gmail.com', '12345678', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
