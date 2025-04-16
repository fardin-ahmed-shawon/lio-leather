-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 15, 2025 at 09:08 PM
-- Server version: 10.6.21-MariaDB-cll-lve-log
-- PHP Version: 8.3.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `liooxzpx_lioo_leather`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(11) NOT NULL,
  `admin_username` varchar(50) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `admin_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_username`, `admin_password`, `admin_picture`) VALUES
(1, 'lioo_39_', 'l87654321o', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `main_category`
--

CREATE TABLE `main_category` (
  `main_ctg_id` int(11) NOT NULL,
  `main_ctg_name` varchar(100) NOT NULL,
  `main_ctg_des` text DEFAULT NULL,
  `main_ctg_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `main_category`
--

INSERT INTO `main_category` (`main_ctg_id`, `main_ctg_name`, `main_ctg_des`, `main_ctg_img`) VALUES
(5, 'Wallets', 'All The Wallets Product You Will Find Here', '../img/compressed_3mr7w_512-ezgif.com-webp-to-png-converter.png'),
(6, 'Card Wallet', 'All The Card Wallet Product You Will Find Here', '../img/compressed_J_3.jpg'),
(7, 'Belts', 'All The Belts Product You Will Find Here', '../img/compressed_cross-border-versatile-double-side-belt_.jpg'),
(8, 'Office & Travel', 'All The Office & Travel Product You Will Find Here', '../img/compressed_9460433_1.jpg'),
(9, 'Accessories', 'All The Leather Accessories You Will Find Here', '../img/compressed_brkr1.jpg'),
(10, 'Customize Zone', 'Here you can customize your dream design.', '../img/compressed_Custom-Made-Sign.jpg'),
(15, 'Limited Edition', '\"Find unique, limited-edition pieces before they\'re gone.\"', '../img/compressed_depositphotos_54969261-stock-illustration-limited-edition-red-leather-label.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `order_info`
--

CREATE TABLE `order_info` (
  `order_no` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_first_name` varchar(50) NOT NULL,
  `user_last_name` varchar(50) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_address` text NOT NULL,
  `city_address` varchar(50) NOT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `product_size` varchar(50) DEFAULT 'Default',
  `total_price` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `order_status` varchar(50) DEFAULT 'Pending',
  `order_visibility` varchar(50) DEFAULT 'Show'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `order_info`
--

INSERT INTO `order_info` (`order_no`, `user_id`, `user_first_name`, `user_last_name`, `user_phone`, `user_email`, `user_address`, `city_address`, `invoice_no`, `product_id`, `product_title`, `product_quantity`, `product_size`, `total_price`, `payment_method`, `order_date`, `order_status`, `order_visibility`) VALUES
(1, 0, 'Fardin', 'Ahmed', '01944667441', 'fardinahmed7443@gmail.com', 'Arshinogor', 'Inside Dhaka', 'INV-66DCG4F10', 13, 'Bi-fold Wallet', 2, 'Default', 3300, 'bKash', '2025-03-21 16:38:47', 'Completed', 'Hide'),
(2, 0, 'Fardin', 'Ahmed', '01944667441', 'fardinahmed7443@gmail.com', 'Arshinogor', 'Inside Dhaka', 'INV-66DCG4F10', 8, 'Classic Long Wallet', 2, 'Default', 3700, 'bKash', '2025-03-21 16:38:47', 'Completed', 'Hide'),
(3, 1, 'Tanvin', 'Ahmed', '01787809', '', 'Pachdona', 'Outside Dhaka', 'INV-66DCGXPX2', 11, 'Classic Money Clip Wallet', 1, 'Default', 1550, 'bKash', '2025-03-21 16:41:04', 'Canceled', 'Hide'),
(4, 1, 'Tanvin', 'Ahmed', '01787809', '', 'Pachdona', 'Outside Dhaka', 'INV-66DCGXPX2', 9, 'Classic Passport Wallet', 1, 'Default', 1450, 'bKash', '2025-03-21 16:41:04', 'Processing', 'Hide'),
(5, 1, 'Fardin', 'Ahmed', '01944667441', '', 'awet', 'Inside Dhaka', 'INV-66DCI70GV', 11, 'Classic Money Clip Wallet', 1, 'Default', 1550, 'Rocket', '2025-03-21 16:44:35', 'Canceled', 'Hide'),
(6, 1, 'Fardin', 'Ahmed', '01944667441', '', 'awet', 'Inside Dhaka', 'INV-66DCI70GV', 10, 'Classic Pouch  (Unisex)', 1, 'Default', 2050, 'Rocket', '2025-03-21 16:44:35', 'Canceled', 'Hide'),
(7, 0, 'Fardin', 'Ahmed', '01944667441', '', 'Apishpara', 'Inside Dhaka', 'INV-66DI6CKFZ', 12, 'Classic Card Holder', 2, 'Default', 1600, 'bKash', '2025-03-22 02:16:05', 'Canceled', 'Hide'),
(8, 0, 'Fardin', 'Ahmed', '01944667441', '', 'Apishpara', 'Inside Dhaka', 'INV-66DI6CKFZ', 11, 'Classic Money Clip Wallet', 3, 'Default', 4650, 'bKash', '2025-03-22 02:16:05', 'Canceled', 'Hide'),
(9, 0, 'Muhammad', 'salekin', '01611989240', 'serazeessalekin@gmail.com', 'dhaka', 'Inside Dhaka', 'INV-66DJ2NDPU', 12, 'Classic Card Holder', 1, 'Default', 800, 'Cash On Delivery', '2025-03-22 03:46:30', 'Pending', 'Hide'),
(10, 0, 'Muhammad', 'salekin', '01611989240', 'serazeessalekin@gmail.com', 'dhaka', 'Inside Dhaka', 'INV-66DJ2NDPU', 8, 'Classic Long Wallet', 1, 'Default', 1850, 'Cash On Delivery', '2025-03-22 03:46:30', 'Pending', 'Hide'),
(11, 0, 'Muhammad', 'salekin', '01611989240', 'serazeessalekin@gmail.com', 'Khilkhet,Dhaka', 'Inside Dhaka', 'INV-66DKE03GN', 12, 'Classic Card Holder', 1, 'Default', 800, 'Cash On Delivery', '2025-03-22 05:59:04', 'Pending', 'Hide'),
(12, 0, 'Fardin', 'Ahmed', '019999999', '', 'Apishpara', 'Inside Dhaka', 'INV-66DROM538', 13, 'Bi-fold Wallet', 2, 'Default', 3300, 'bKash', '2025-03-22 18:14:13', 'Completed', 'Hide'),
(13, 0, 'Fardin', 'Ahmed', '019999999', '', 'Apishpara', 'Inside Dhaka', 'INV-66DROM538', 12, 'Classic Card Holder', 3, 'Default', 2400, 'bKash', '2025-03-22 18:14:13', 'Completed', 'Hide'),
(14, 0, 'Fardin', 'Ahmed', '019999999', '', 'Apishpara', 'Inside Dhaka', 'INV-66DROM538', 11, 'Classic Money Clip Wallet', 5, 'Default', 7750, 'bKash', '2025-03-22 18:14:13', 'Completed', 'Hide'),
(15, 0, 'Muhammad', 'Salekin', '01911989240', 'lioobangladesh@gmail.com', 'Dhaka', 'Inside Dhaka', 'INV-66DRQGAQR', 4, 'Leather Card Holder', 1, 'Default', 1200, 'Cash On Delivery', '2025-03-22 18:19:21', 'Completed', 'Hide'),
(16, 0, 'Muhammad', 'Salekin', '01911989240', 'lioobangladesh@gmail.com', 'Dhaka', 'Inside Dhaka', 'INV-66DRQGAQR', 12, 'Classic Card Holder', 1, 'Default', 800, 'Cash On Delivery', '2025-03-22 18:19:21', 'Completed', 'Hide'),
(17, 0, 'muhammad', ' srijon', '01911989240', '', 'dhaka', 'Inside Dhaka', 'INV-66DYBV3IK', 8, 'Classic Long Wallet', 1, 'Default', 1850, 'Cash On Delivery', '2025-03-23 05:23:57', 'Canceled', 'Hide'),
(18, 0, 'Muhammad', 'salekin', '01611989240', 'serazeessalekin@gmail.com', 'dhaka', 'Inside Dhaka', 'INV-66E0WGI5Z', 10, 'Classic Pouch  (Unisex)', 1, 'Default', 2050, 'Cash On Delivery', '2025-03-23 09:43:09', 'Pending', 'Hide'),
(19, 8, 'Muhammad', 'salekin', '01611989240', 'serazeessalekin@gmail.com', 'Khilkhet,Dhaka', 'Outside Dhaka', 'INV-66E4UVTEM', 12, 'Classic Card Holder', 1, 'Default', 800, 'Cash On Delivery', '2025-03-23 16:21:51', 'Completed', 'Hide'),
(20, 8, 'Muhammad', 'salekin', '01611989240', 'serazeessalekin@gmail.com', 'Khilkhet,Dhaka', 'Outside Dhaka', 'INV-66E4UVTEM', 11, 'Classic Money Clip Wallet', 1, 'Default', 1550, 'Cash On Delivery', '2025-03-23 16:21:51', 'Completed', 'Hide'),
(21, 8, 'Muhammad', 'salekin', '01611989240', 'serazeessalekin@gmail.com', 'Khilkhet,Dhaka', 'Outside Dhaka', 'INV-66E4UVTEM', 10, 'Classic Pouch  (Unisex)', 1, 'Default', 2050, 'Cash On Delivery', '2025-03-23 16:21:51', 'Completed', 'Hide'),
(22, 8, 'Muhammad', 'salekin', '01611989240', 'serazeessalekin@gmail.com', 'Khilkhet,Dhaka', 'Outside Dhaka', 'INV-66E4UVTEM', 9, 'Classic Passport Wallet', 1, 'Default', 1450, 'Cash On Delivery', '2025-03-23 16:21:51', 'Completed', 'Hide'),
(23, 0, 'Mehedi', 'Jony', '01861685153', 'mehedihasanjony2001@gmail.com', 'Sadek khan Krishi market road', 'Inside Dhaka', 'INV-66ECTPRTC', 12, 'Classic Card Holder', 2, 'Default', 1600, 'bKash', '2025-03-24 05:44:48', 'Completed', 'Hide'),
(24, 0, 'Mehedi', 'Jony', '01861685153', 'mehedihasanjony2001@gmail.com', 'Sadek khan Krishi market road', 'Inside Dhaka', 'INV-66ECTPRTC', 11, 'Classic Money Clip Wallet', 3, 'Default', 4650, 'bKash', '2025-03-24 05:44:48', 'Completed', 'Hide'),
(25, 0, 'Mehedi', 'Jony', '01861685153', 'mehedihasanjony2001@gmail.com', 'Sadek khan Krishi market road', 'Inside Dhaka', 'INV-66ECTPRTC', 10, 'Classic Pouch  (Unisex)', 5, 'Default', 10250, 'bKash', '2025-03-24 05:44:48', 'Completed', 'Hide'),
(26, 0, 'Muhammad', 'salekin', '01611989240', 'serazeessalekin@gmail.com', 'dhaka', 'Inside Dhaka', 'INV-66EJ5E5PV', 11, 'Classic Money Clip Wallet', 1, 'Default', 1550, 'Cash On Delivery', '2025-03-24 16:22:09', 'Pending', 'Show'),
(27, 0, 'Arefin', 'Rijon', '01965569991', 'rijonneel@gmail.com', 'Lake City, Khilkhet, Dhaka 1229', 'Inside Dhaka', 'INV-66EYUJ88I', 12, 'Classic Card Holder', 1, 'Default', 800, 'Cash On Delivery', '2025-03-25 18:44:11', 'Pending', 'Show');

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `serial_no` int(11) NOT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `order_no` int(11) NOT NULL,
  `order_status` varchar(50) DEFAULT 'Pending',
  `order_visibility` varchar(50) DEFAULT 'Show',
  `payment_method` varchar(50) NOT NULL,
  `acc_number` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `payment_date` datetime DEFAULT current_timestamp(),
  `payment_status` varchar(50) DEFAULT 'Unpaid'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment_info`
--

INSERT INTO `payment_info` (`serial_no`, `invoice_no`, `order_no`, `order_status`, `order_visibility`, `payment_method`, `acc_number`, `transaction_id`, `payment_date`, `payment_status`) VALUES
(1, 'INV-66DCG4F10', 1, 'Completed', 'Hide', 'bKash', '01724923067', 'AMMUD', '2025-03-21 16:38:47', 'Paid'),
(2, 'INV-66DCG4F10', 2, 'Completed', 'Hide', 'bKash', '01724923067', 'AMMUD', '2025-03-21 16:38:47', 'Paid'),
(3, 'INV-66DCGXPX2', 3, 'Canceled', 'Hide', 'bKash', '017249785', 'XXXYYY', '2025-03-21 16:41:04', 'Not Available'),
(4, 'INV-66DCGXPX2', 4, 'Processing', 'Hide', 'bKash', '017249785', 'XXXYYY', '2025-03-21 16:41:04', 'Not Available'),
(5, 'INV-66DCI70GV', 5, 'Canceled', 'Hide', 'Rocket', '01724923067', 'NAGUI', '2025-03-21 16:44:35', 'Paid'),
(6, 'INV-66DCI70GV', 6, 'Canceled', 'Hide', 'Rocket', '01724923067', 'NAGUI', '2025-03-21 16:44:35', 'Paid'),
(7, 'INV-66DI6CKFZ', 7, 'Canceled', 'Hide', 'bKash', '0123463426', 'XTHUI7383', '2025-03-22 02:16:05', 'Paid'),
(8, 'INV-66DI6CKFZ', 8, 'Canceled', 'Hide', 'bKash', '0123463426', 'XTHUI7383', '2025-03-22 02:16:05', 'Paid'),
(9, 'INV-66DROM538', 12, 'Completed', 'Hide', 'bKash', '0199999999', 'XOIUHF', '2025-03-22 18:14:13', 'Paid'),
(10, 'INV-66DROM538', 13, 'Completed', 'Hide', 'bKash', '0199999999', 'XOIUHF', '2025-03-22 18:14:13', 'Paid'),
(11, 'INV-66DROM538', 14, 'Completed', 'Hide', 'bKash', '0199999999', 'XOIUHF', '2025-03-22 18:14:13', 'Paid'),
(12, 'INV-66ECTPRTC', 23, 'Completed', 'Hide', 'bKash', '016587656', 'ghdht67', '2025-03-24 05:44:48', 'Paid'),
(13, 'INV-66ECTPRTC', 24, 'Completed', 'Hide', 'bKash', '016587656', 'ghdht67', '2025-03-24 05:44:48', 'Paid'),
(14, 'INV-66ECTPRTC', 25, 'Completed', 'Hide', 'bKash', '016587656', 'ghdht67', '2025-03-24 05:44:48', 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `product_info`
--

CREATE TABLE `product_info` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_regular_price` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `main_ctg_id` int(11) NOT NULL,
  `sub_ctg_id` int(11) NOT NULL,
  `available_stock` int(11) NOT NULL,
  `size_option` varchar(50) DEFAULT NULL,
  `product_keyword` varchar(255) DEFAULT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_description` text DEFAULT NULL,
  `product_img1` varchar(255) DEFAULT NULL,
  `product_img2` varchar(255) DEFAULT NULL,
  `product_img3` varchar(255) DEFAULT NULL,
  `product_img4` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_info`
--

INSERT INTO `product_info` (`product_id`, `product_title`, `product_regular_price`, `product_price`, `main_ctg_id`, `sub_ctg_id`, `available_stock`, `size_option`, `product_keyword`, `product_code`, `product_description`, `product_img1`, `product_img2`, `product_img3`, `product_img4`, `created_at`) VALUES
(6, 'Classic Minimalist Wallet', 1000, 900, 6, 9, 10, 'Default', 'Card holdder', '', '<div>A timeless accessory made from export-quality oil pull-up leather, ensuring durability and sophistication.</div><div><br></div><div><b>Features:</b></div><div><br></div><div>âœ” 2 cash chamber&nbsp;</div><div>âœ” 3 card slots</div><div>âœ” 1 Document Chamber (Outside)</div><div>&nbsp;</div><div><br></div><div><b>Product Colour:</b> \"Stone Grey\"</div><div><br></div><div><b>Product Size:</b></div><div><br></div><div>Height: 4.5 inches</div><div>Width: 3.3 inches</div><div><br></div><div><br></div> ', '../img/compressed_Classic Minimalist Wallet (1).jpg', '../img/compressed_Classic Minimalist Wallet (7).jpg', '../img/compressed_Classic Minimalist Wallet (8).jpg', '../img/compressed_Classic Minimalist Wallet (9).jpg', '2025-03-21 15:25:37'),
(7, 'Classic Bi-fold Wallet', 2199, 1850, 5, 5, 10, 'Default', 'Bifold wallet', '3465645', '<div>A timeless accessory made from export-quality oil pull-up leather, ensuring durability and sophistication.</div><div><br></div><div><b>Features:</b></div><div><br></div><div>âœ” 2 cash compartment&nbsp;</div><div>âœ” 4 card slots&nbsp;</div><div>âœ” 2 hidden chamber&nbsp;</div><div><br></div><div><b>Product Colour: </b>\"Stone Grey\"</div><div><br></div><div><b>Product Size:</b></div><div><br></div><div>Height: 3.4 inches</div><div>Width: 4.3 inches</div> ', '../img/compressed_Classic Bi-fold wallet (1).jpg', '../img/compressed_Classic Bi-fold wallet (6).jpg', '../img/compressed_Classic Bi-fold wallet (5).jpg', '../img/compressed_Classic Bi-fold wallet (4).jpg', '2025-03-21 15:25:37'),
(8, 'Classic Long Wallet', 2000, 1850, 5, 3, 10, 'Default', 'Long wallet', '', '<div>A timeless accessory made from export-quality oil pull-up leather, ensuring durability and sophistication.</div><div><br></div><div><b>Features:</b></div><div><br></div><div>âœ” 1 mobile compartment&nbsp;</div><div>âœ” 1 cash compartment&nbsp;</div><div>âœ” 8 card slots&nbsp;</div><div><br></div><div><b>Product Colour:</b> \"Stone Grey\"</div><div><br></div><div><b>Product Size:</b></div><div><br></div><div>Height: 7.6 inches</div><div>Width: 3.6 inches</div> ', '../img/compressed_Classic Long Wallet (6).jpg', '../img/compressed_Classic Long Wallet (1).jpg', '../img/compressed_Classic Long Wallet (3).jpg', '../img/compressed_Classic Long Wallet (4).jpg', '2025-03-21 15:25:37'),
(9, 'Classic Passport Wallet', 1500, 1450, 5, 12, 10, 'Default', 'Passport holder', '', '<div>A timeless accessory made from export-quality oil pull-up leather, ensuring durability and sophistication.</div><div><br></div><div><b>Features:</b></div><div><br></div><div>âœ”&nbsp; 1 passport compartment ( 3 or 4 passport can be carried )</div><div>âœ” 1 bill compartment</div><div>âœ” 1 boarding pass compartment&nbsp;</div><div>âœ” 2 card slots</div><div><br></div><div><b>Product Colour: </b>\"Stone Grey\"</div><div><br></div><div><b>Product Size:</b></div><div><br></div><div>Height: 5.5 inches</div><div>Width: 4.1 inches</div><div><br></div> ', '../img/compressed_Classic Passport Wallet (1).jpg', '../img/compressed_Classic Passport Wallet (5).jpg', '../img/compressed_Classic Passport Wallet (3).jpg', '../img/compressed_Classic Passport Wallet (7).jpg', '2025-03-21 15:25:37'),
(10, 'Classic Pouch  (Unisex)', 2300, 2050, 5, 3, 10, 'Default', 'Pouch', '', '<div>A timeless accessory made from export-quality oil pull-up leather, ensuring durability and sophistication.</div><div><br></div><div><b>Features:</b></div><div><br></div><div>âœ” 1 mobile compartment</div><div>âœ” 1 cash compartment&nbsp;</div><div>âœ” 2 card slots</div><div><br></div><div><b>Product Colour:</b> Stone Grey</div><div><br></div><div><b>Product Size:</b></div><div><br></div><div>Height: 4&nbsp; inches</div><div>Width: 7.6&nbsp; inches</div><div><br></div> ', '../img/compressed_Unisex Classic Pouch (1).jpg', '../img/compressed_Unisex Classic Pouch (7).jpg', '../img/compressed_Unisex Classic Pouch (3).jpg', '../img/compressed_Unisex Classic Pouch (9).jpg', '2025-03-21 15:25:37'),
(11, 'Classic Money Clip Wallet', 1750, 1550, 5, 6, 10, 'Default', 'wallet', '', '<div>A timeless accessory made from export-quality oil pull-up leather, ensuring durability and sophistication.</div><div><br></div><div><b>Features:</b></div><div><br></div><div>âœ” 1 Clip For Cash</div><div>âœ” 4 card slots&nbsp;</div><div>&nbsp;</div><div><b>Product Colour:</b> \"Stone Grey\"</div><div><br></div><div><b>Product Size:</b></div><div><br></div><div>Height: 4.5 inches</div><div>Width: 3.1 inches</div><div><br></div> ', '../img/compressed_Classic Money Clip Wallet (1).jpg', '../img/compressed_Classic Money Clip Wallet (5).jpg', '../img/compressed_Classic Money Clip Wallet (7).jpg', '../img/compressed_Classic Money Clip Wallet (6).jpg', '2025-03-21 15:25:37'),
(12, 'Classic Card Holder', 999, 800, 6, 10, 10, 'Default', 'Card holder', '', '<div>A timeless accessory made from export-quality oil pull-up leather, ensuring durability and sophistication.</div><div><br></div><div><b>Features:</b></div><div><br></div><div>âœ” 4 card slots or 2 card slot with 2 cash slot ( Depends on your user experience)</div><div>&nbsp;</div><div><b>Product Colour: </b>\"Stone Grey\"</div><div><br></div><div><b>Product Size:</b></div><div><br></div><div>Height: 4.1 inches</div><div>Width: 3.2 inches</div> ', '../img/compressed_Classic Card Holder (1).jpg', '../img/compressed_Classic Card Holder (3).jpg', '../img/compressed_Classic Card Holder (2).jpg', '../img/compressed_Classic Card Holder (4).jpg', '2025-03-21 15:25:37');

-- --------------------------------------------------------

--
-- Table structure for table `review_table`
--

CREATE TABLE `review_table` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_rating` int(11) NOT NULL CHECK (`user_rating` between 1 and 5),
  `user_review` text NOT NULL,
  `datetime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review_table`
--

INSERT INTO `review_table` (`review_id`, `product_id`, `user_id`, `user_name`, `user_rating`, `user_review`, `datetime`) VALUES
(10, 7, 0, 'Fardin', 2, 'Very Good Product', 1742568498),
(16, 6, 0, 'Srijon', 5, 'Alhamdulillah valo product.', 1742584923),
(17, 6, 0, 'Rijon', 4, 'Mashallah Good service', 1742585021),
(18, 10, 0, 'Fardin', 2, 'nice product', 1742593667),
(19, 12, 0, 'rafi', 3, 'nice product\n', 1742618396),
(20, 9, 0, 'Fardin', 2, 'Great', 1742684348),
(21, 9, 8, 'Rijon', 2, 'Wow.....', 1742760987);

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slider_id` int(11) NOT NULL,
  `slider_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slider_id`, `slider_img`) VALUES
(24, '../img/compressed_slider5.png'),
(25, '../img/compressed_slider4.png'),
(26, '../img/compressed_slider1.png'),
(27, '../img/compressed_slider8.png'),
(28, '../img/compressed_slider7.png');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `sub_ctg_id` int(11) NOT NULL,
  `sub_ctg_name` varchar(100) NOT NULL,
  `main_ctg_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`sub_ctg_id`, `sub_ctg_name`, `main_ctg_name`) VALUES
(3, 'Long wallet', 'Wallets'),
(4, 'Semi-Long Wallet', 'Wallets'),
(5, 'Bi-fold Wallet', 'Wallets'),
(6, 'Money ClipWallet', 'Wallets'),
(7, 'Tri-fold Wallet', 'Wallets'),
(8, 'Vertical Wallet', 'Wallets'),
(9, 'Minimalist Wallet', 'Card Wallet'),
(10, 'Card Holder', 'Card Wallet'),
(11, 'Single card holder', 'Card Wallet'),
(12, 'Passport Wallet', 'Office & Travel'),
(13, 'Notebook Cover', 'Office & Travel'),
(14, 'Mouse & Desk Pad', 'Office & Travel'),
(15, 'Key wallet', 'Accessories'),
(16, 'Eyeglass Pouch', 'Accessories'),
(17, 'Key Chain', 'Accessories');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(11) NOT NULL,
  `user_fName` varchar(50) NOT NULL,
  `user_lName` varchar(50) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_gender` varchar(20) NOT NULL,
  `user_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `user_fName`, `user_lName`, `user_phone`, `user_email`, `user_gender`, `user_password`) VALUES
(1, 'Fardin', 'Ahmed', '01944667441', 'f@gmail.com', 'Male', '$2y$10$hElO1sTMeaWoJDEvgDgKUO8bG/vlNG9mUZoKgCLWii1tJ2m0Vv.Bi'),
(2, 'Tanvin', 'Ahmed', '01556602995', 'tanvin@gmail.com', 'Male', '$2y$10$a4B5ZWUdJN1TsAoqumH.2.7rUSD1zQiTWYoKjhY2h8F3yoeinVF1O'),
(3, 'Muhammad', 'Salekin', '01911989240', 'lioobangladesh@gmail.com', 'Male', '$2y$10$AuMmojRaLkdSv6vlQ946Fe9YaIkKU2PiQYo7z34eV2L/wGt3N2Y5G'),
(4, 'muhammad', 'salekin', '01611989240', 'serazeessalekin@gmail.com', 'Male', '$2y$10$WAWZ5.krfmrgf8hBPIU7eONpdX7Ev6r/aPpWTnaOLZiPyrqquR3bu'),
(5, 'Arefin', 'Rijon', '01965569991', 'srijonniloy@gmail.com', 'Male', '$2y$10$4yhUtfki8SDbZ8fxVnAvrODL4SGDQIUZEt7PbF1BVP2CKhn3zSLTm'),
(8, 'choyon', 'Rijon', '01965569992', 'salehinchoyon99@gmail.com', 'Male', '$2y$10$.wfxIHrtJPrTSICCp53swe9KVh/OY.pDDK.dK3CRqvB8AIh9fJHxu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_username` (`admin_username`);

--
-- Indexes for table `main_category`
--
ALTER TABLE `main_category`
  ADD PRIMARY KEY (`main_ctg_id`),
  ADD UNIQUE KEY `main_ctg_name` (`main_ctg_name`);

--
-- Indexes for table `order_info`
--
ALTER TABLE `order_info`
  ADD PRIMARY KEY (`order_no`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD PRIMARY KEY (`serial_no`),
  ADD UNIQUE KEY `order_no` (`order_no`);

--
-- Indexes for table `product_info`
--
ALTER TABLE `product_info`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `main_ctg_id` (`main_ctg_id`);

--
-- Indexes for table `review_table`
--
ALTER TABLE `review_table`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slider_id`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD PRIMARY KEY (`sub_ctg_id`),
  ADD UNIQUE KEY `sub_ctg_name` (`sub_ctg_name`),
  ADD KEY `main_ctg_name` (`main_ctg_name`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_phone` (`user_phone`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `main_category`
--
ALTER TABLE `main_category`
  MODIFY `main_ctg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_info`
--
ALTER TABLE `order_info`
  MODIFY `order_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `payment_info`
--
ALTER TABLE `payment_info`
  MODIFY `serial_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_info`
--
ALTER TABLE `product_info`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `review_table`
--
ALTER TABLE `review_table`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slider_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sub_category`
--
ALTER TABLE `sub_category`
  MODIFY `sub_ctg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_info`
--
ALTER TABLE `product_info`
  ADD CONSTRAINT `product_info_ibfk_1` FOREIGN KEY (`main_ctg_id`) REFERENCES `main_category` (`main_ctg_id`) ON DELETE CASCADE;

--
-- Constraints for table `review_table`
--
ALTER TABLE `review_table`
  ADD CONSTRAINT `review_table_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_category`
--
ALTER TABLE `sub_category`
  ADD CONSTRAINT `sub_category_ibfk_1` FOREIGN KEY (`main_ctg_name`) REFERENCES `main_category` (`main_ctg_name`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
