-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2020 at 01:51 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crudapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_12_15_125150_create_user_register_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_register`
--

CREATE TABLE `user_register` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_register`
--

INSERT INTO `user_register` (`id`, `name`, `email`, `password`, `mobile_no`, `device_type`, `device_id`, `device_token`, `created_at`, `updated_at`) VALUES
(1, 'Anand Gaur', 'anand@gmail.com', '123456', '9807407363', 'Android', '64984genkgnhi', 'gfweuguweurgb49949gjjhrh9hrh8', '2020-12-15 23:35:03', '2020-12-16 05:35:28'),
(2, 'Vikas', 'vikas@gmail.com', '123456', '9807489232', 'Android', 'irgehigbigreighb', 'igeighgihhgig3g465494gregroj', '2020-12-15 23:37:01', '2020-12-15 23:37:01'),
(4, 'Anandgaur', 'vikas1@gmail.com', '123456', '49794494851', 'Android', 'irgehigbigreighb', 'igeighgihhgig3g465494gregroj', '2020-12-15 23:40:24', '2020-12-16 04:43:31'),
(5, 'Anandgaur', 'vikas2@gmail.com', '123456', '980740789', 'Android', 'irgehigbigreighb', 'igeighgihhgig3g465494gregroj', '2020-12-15 23:41:15', '2020-12-16 00:53:40'),
(6, 'Vikas', 'vikas4@gmail.com', '123456', '9807489232', 'Android', 'irgehigbigreighb', 'igeighgihhgig3g465494gregroj', '2020-12-15 23:43:26', '2020-12-15 23:43:26'),
(13, 'Anand', 'anand6@gmail.com', '123456', '9807407363', 'Android', '64984genkgnhi', 'gfweuguweurgb49949gjjhrh9hrh8', '2020-12-16 02:29:33', '2020-12-16 02:29:33'),
(15, 'Anand', 'anand7@gmail.com', '123456', '9807407369', 'Android', '64984genkgnhi', 'gfweuguweurgb49949gjjhrh9hrh8', '2020-12-16 04:10:56', '2020-12-16 04:10:56'),
(16, 'Anand', 'anand8@gmail.com', '123456', '9807407377', 'Android', '64984genkgnhi', 'gfweuguweurgb49949gjjhrh9hrh8', '2020-12-16 04:28:40', '2020-12-16 04:28:40'),
(17, 'Anand', 'anand9@gmail.com', '123456', '9807407372', 'Android', '64984genkgnhi', 'gfweuguweurgb49949gjjhrh9hrh8', '2020-12-16 04:32:49', '2020-12-16 04:32:49'),
(18, 'Anand', 'anand19@gmail.com', '123456', '9807407963', 'Android', '64984genkgnhi', 'gfweuguweurgb49949gjjhrh9hrh8', '2020-12-16 04:39:38', '2020-12-16 04:39:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_register`
--
ALTER TABLE `user_register`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_register_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_register`
--
ALTER TABLE `user_register`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
