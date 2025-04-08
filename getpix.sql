-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2023 at 02:52 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `getpix`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int UNSIGNED NOT NULL,
  `address_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int UNSIGNED DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int UNSIGNED DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int UNSIGNED NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `api_token`, `status`, `role_id`, `remember_token`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Getpix', 'admin@example.com', '$2y$10$HAuiUHF7FP4pBQ6BNhFG0.j8riMTOMMmatCbVFLIJZ7mSgKDSMS8m', '6Bu7gjl1oKawttVcp9CYNVxkHaLOXyR1TbFKRjC9REtWqxypoAytNB66VTiCG2lWK9yCtnNhedCfnaw7', 1, 1, NULL, '2023-07-26 12:37:09', '2023-10-08 21:28:34', NULL),
(2, 'PManager', 'thaihien@getpix.vn', '$2y$10$FYNdRm1vbHgwKBZzMZn.6eQB.jpMObQIZOVoXDVIqMuQLecwQstaa', '3wOEYu7pp0LFlSiA1PTKOijDbEdY4KSLeRVg7tERfjgRVvnVNVPbnVCIPns2DlQ9yxhIrT2Z8MX6OEm7', 1, 2, NULL, '2023-10-09 16:09:46', '2023-12-03 06:35:17', NULL),
(3, 'Đàm Thìn', 'damthin@getpix.vn', '$2y$10$o2YuCdybfGeJl.b6makaO.sE/YeotaSga.DMyQNNO8patY7VRbYD2', '3A8ktogzCHJWQTwU4MdVXVakd1MOfFZaiCqTiJrQvyeQ82pEOb9BnjheDInt4Go0RkwLD480Unp2e4LS', 1, 3, NULL, '2023-10-09 16:10:28', '2023-10-10 14:29:34', 'admins/3/0kh7b7YIjeJkTPQ8y9pYmDHMznnWAEu2SLDKmNaN.png');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `swatch_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `validation`, `position`, `is_required`, `is_unique`, `value_per_locale`, `value_per_channel`, `is_filterable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `created_at`, `updated_at`, `swatch_type`, `is_comparable`, `enable_wysiwyg`) VALUES
(1, 'sku', 'SKU', 'text', NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(2, 'name', 'Name', 'text', NULL, 3, 1, 0, 1, 1, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 1, 0),
(3, 'url_key', 'URL Key', 'text', NULL, 4, 1, 1, 0, 0, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(4, 'tax_category_id', 'Tax Category', 'select', NULL, 5, 0, 0, 0, 1, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(5, 'new', 'New', 'boolean', NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(6, 'featured', 'Featured', 'boolean', NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(7, 'visible_individually', 'Visible Individually', 'boolean', NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(8, 'status', 'Status', 'boolean', NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(9, 'short_description', 'Short Description', 'textarea', NULL, 11, 1, 0, 1, 1, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(10, 'description', 'Description', 'textarea', NULL, 12, 1, 0, 1, 1, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 1, 0),
(11, 'price', 'Price', 'price', 'decimal', 13, 1, 0, 0, 0, 1, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 1, 0),
(12, 'cost', 'Cost', 'price', 'decimal', 14, 0, 0, 0, 1, 0, 0, 1, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(13, 'special_price', 'Special Price', 'price', 'decimal', 15, 0, 0, 0, 0, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(14, 'special_price_from', 'Special Price From', 'date', NULL, 16, 0, 0, 0, 1, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(15, 'special_price_to', 'Special Price To', 'date', NULL, 17, 0, 0, 0, 1, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(16, 'meta_title', 'Meta Title', 'textarea', NULL, 18, 0, 0, 1, 1, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(17, 'meta_keywords', 'Meta Keywords', 'textarea', NULL, 20, 0, 0, 1, 1, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(18, 'meta_description', 'Meta Description', 'textarea', NULL, 21, 0, 0, 1, 1, 0, 0, 1, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(19, 'length', 'Length', 'text', 'decimal', 22, 0, 0, 0, 0, 0, 0, 1, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(20, 'width', 'Width', 'text', 'decimal', 23, 0, 0, 0, 0, 0, 0, 1, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(21, 'height', 'Height', 'text', 'decimal', 24, 0, 0, 0, 0, 0, 0, 1, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(22, 'weight', 'Weight', 'text', 'decimal', 25, 1, 0, 0, 0, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(23, 'color', 'Color', 'select', NULL, 26, 0, 0, 0, 0, 1, 1, 1, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(24, 'size', 'Size', 'select', NULL, 27, 0, 0, 0, 0, 1, 1, 1, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(25, 'brand', 'Brand', 'select', NULL, 28, 0, 0, 0, 0, 1, 0, 1, 1, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(26, 'guest_checkout', 'Guest Checkout', 'boolean', NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(27, 'product_number', 'Product Number', 'text', NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, '2023-07-26 12:37:09', '2023-07-26 12:37:09', NULL, 0, 0),
(28, 'license', 'license', 'text', 'url', NULL, 1, 0, 0, 0, 0, 0, 1, 1, '2023-10-23 01:07:27', '2023-10-23 01:07:27', NULL, 1, 0),
(29, 'Filetype', 'File type', 'text', '', NULL, 1, 0, 1, 1, 0, 0, 1, 1, '2023-10-23 01:08:33', '2023-10-23 01:08:33', NULL, 1, 0),
(30, 'Attribute', 'Attribute', 'text', 'url', NULL, 0, 0, 0, 0, 0, 0, 1, 1, '2023-10-23 01:09:54', '2023-10-23 01:12:55', NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_families`
--

CREATE TABLE `attribute_families` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_families`
--

INSERT INTO `attribute_families` (`id`, `code`, `name`, `status`, `is_user_defined`) VALUES
(1, 'default', 'Images Free', 0, 1),
(3, 'GEFA001', 'Images Premium', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_groups`
--

CREATE TABLE `attribute_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `attribute_family_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_groups`
--

INSERT INTO `attribute_groups` (`id`, `name`, `position`, `is_user_defined`, `attribute_family_id`) VALUES
(1, 'General', 1, 0, 1),
(2, 'Description', 2, 0, 1),
(3, 'Meta Description', 3, 0, 1),
(4, 'Price', 4, 0, 1),
(5, 'Shipping', 5, 0, 1),
(11, 'General', 1, 0, 3),
(12, 'Description', 2, 0, 3),
(13, 'Meta Description', 3, 0, 3),
(14, 'Price', 4, 0, 3),
(15, 'Shipping', 5, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group_mappings`
--

CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int UNSIGNED NOT NULL,
  `attribute_group_id` int UNSIGNED NOT NULL,
  `position` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_group_mappings`
--

INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES
(1, 1, 1),
(1, 11, 1),
(2, 1, 3),
(2, 11, 3),
(3, 1, 4),
(3, 11, 4),
(4, 1, 5),
(4, 11, 5),
(5, 1, 6),
(5, 11, 6),
(6, 1, 7),
(6, 11, 7),
(7, 1, 8),
(7, 11, 8),
(8, 1, 10),
(8, 11, 10),
(9, 2, 1),
(9, 12, 1),
(10, 2, 2),
(10, 12, 2),
(11, 4, 1),
(11, 14, 1),
(12, 4, 2),
(13, 4, 3),
(13, 14, 3),
(14, 4, 4),
(14, 14, 4),
(15, 4, 5),
(15, 14, 5),
(16, 3, 1),
(16, 13, 1),
(17, 3, 2),
(17, 13, 2),
(18, 3, 3),
(18, 13, 3),
(22, 5, 4),
(22, 15, 4),
(26, 1, 9),
(26, 11, 9),
(27, 1, 2),
(27, 11, 2),
(28, 1, 11),
(28, 11, 11),
(29, 1, 12),
(29, 11, 12),
(30, 1, 13),
(30, 11, 13);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int UNSIGNED NOT NULL,
  `admin_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int DEFAULT NULL,
  `attribute_id` int UNSIGNED NOT NULL,
  `swatch_value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `admin_name`, `sort_order`, `attribute_id`, `swatch_value`) VALUES
(1, 'Red', 1, 23, NULL),
(2, 'Green', 2, 23, NULL),
(3, 'Yellow', 3, 23, NULL),
(4, 'Black', 4, 23, NULL),
(5, 'White', 5, 23, NULL),
(6, 'S', 1, 24, NULL),
(7, 'M', 2, 24, NULL),
(8, 'L', 3, 24, NULL),
(9, 'XL', 4, 24, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_option_translations`
--

CREATE TABLE `attribute_option_translations` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attribute_option_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_option_translations`
--

INSERT INTO `attribute_option_translations` (`id`, `locale`, `label`, `attribute_option_id`) VALUES
(1, 'en', 'Red', 1),
(2, 'en', 'Green', 2),
(3, 'en', 'Yellow', 3),
(4, 'en', 'Black', 4),
(5, 'en', 'White', 5),
(6, 'en', 'S', 6),
(7, 'en', 'M', 7),
(8, 'en', 'L', 8),
(9, 'en', 'XL', 9);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_translations`
--

CREATE TABLE `attribute_translations` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attribute_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `attribute_translations`
--

INSERT INTO `attribute_translations` (`id`, `locale`, `name`, `attribute_id`) VALUES
(1, 'en', 'SKU', 1),
(2, 'en', 'Name', 2),
(3, 'en', 'URL Key', 3),
(4, 'en', 'Tax Category', 4),
(5, 'en', 'New', 5),
(6, 'en', 'Featured', 6),
(7, 'en', 'Visible Individually', 7),
(8, 'en', 'Status', 8),
(9, 'en', 'Short Description', 9),
(10, 'en', 'Description', 10),
(11, 'en', 'Price', 11),
(12, 'en', 'Cost', 12),
(13, 'en', 'Special Price', 13),
(14, 'en', 'Special Price From', 14),
(15, 'en', 'Special Price To', 15),
(16, 'en', 'Meta Description', 16),
(17, 'en', 'Meta Keywords', 17),
(18, 'en', 'Meta Description', 18),
(19, 'en', 'Width', 19),
(20, 'en', 'Height', 20),
(21, 'en', 'Depth', 21),
(22, 'en', 'Weight', 22),
(23, 'en', 'Color', 23),
(24, 'en', 'Size', 24),
(25, 'en', 'Brand', 25),
(26, 'en', 'Allow Guest Checkout', 26),
(27, 'en', 'Product Number', 27),
(28, 'en', 'license', 28),
(29, 'Vi', 'Bản quyền', 28),
(30, 'en', 'File type', 29),
(31, 'Vi', 'Định dạng', 29),
(32, 'en', 'Attribute', 30),
(33, 'Vi', 'Áp dụng', 30);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint UNSIGNED NOT NULL,
  `qty` int DEFAULT '0',
  `from` int DEFAULT NULL,
  `to` int DEFAULT NULL,
  `order_item_id` int UNSIGNED DEFAULT NULL,
  `booking_product_event_ticket_id` int UNSIGNED DEFAULT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `booking_products`
--

CREATE TABLE `booking_products` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int DEFAULT '0',
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT '0',
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `booking_product_appointment_slots`
--

CREATE TABLE `booking_product_appointment_slots` (
  `id` int UNSIGNED NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `booking_product_default_slots`
--

CREATE TABLE `booking_product_default_slots` (
  `id` int UNSIGNED NOT NULL,
  `booking_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int DEFAULT NULL,
  `break_time` int DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `booking_product_event_tickets`
--

CREATE TABLE `booking_product_event_tickets` (
  `id` int UNSIGNED NOT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int DEFAULT '0',
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` datetime DEFAULT NULL,
  `special_price_to` datetime DEFAULT NULL,
  `booking_product_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `booking_product_event_ticket_translations`
--

CREATE TABLE `booking_product_event_ticket_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `booking_product_event_ticket_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `booking_product_rental_slots`
--

CREATE TABLE `booking_product_rental_slots` (
  `id` int UNSIGNED NOT NULL,
  `renting_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12,4) DEFAULT '0.0000',
  `hourly_price` decimal(12,4) DEFAULT '0.0000',
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `booking_product_table_slots`
--

CREATE TABLE `booking_product_table_slots` (
  `id` int UNSIGNED NOT NULL,
  `price_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int NOT NULL DEFAULT '0',
  `duration` int NOT NULL,
  `break_time` int NOT NULL,
  `prevent_scheduling_before` int NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `booking_product_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int UNSIGNED NOT NULL,
  `customer_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `checkout_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `conversion_time` datetime DEFAULT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `checkout_method`, `is_guest`, `is_active`, `conversion_time`, `customer_id`, `channel_id`, `created_at`, `updated_at`, `applied_cart_rule_ids`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 0, 1, 4.0000, NULL, 'USD', 'USD', 'USD', 'USD', 80.0000, 80.0000, 80.0000, 80.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2023-10-09 01:29:21', '2023-10-09 01:34:06', ''),
(2, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 11.0000, 11.0000, 11.0000, 11.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 1, NULL, NULL, 1, '2023-10-09 15:40:57', '2023-10-09 15:40:57', '');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL DEFAULT '0',
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `additional` json DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `cart_id` int UNSIGNED NOT NULL,
  `tax_category_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_item_inventories`
--

CREATE TABLE `cart_item_inventories` (
  `id` int UNSIGNED NOT NULL,
  `qty` int UNSIGNED NOT NULL DEFAULT '0',
  `inventory_source_id` int UNSIGNED DEFAULT NULL,
  `cart_item_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_payment`
--

CREATE TABLE `cart_payment` (
  `id` int UNSIGNED NOT NULL,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rules`
--

CREATE TABLE `cart_rules` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int NOT NULL DEFAULT '0',
  `uses_per_coupon` int NOT NULL DEFAULT '0',
  `times_used` int UNSIGNED NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int NOT NULL DEFAULT '1',
  `discount_step` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_channels`
--

CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_coupons`
--

CREATE TABLE `cart_rule_coupons` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int UNSIGNED NOT NULL DEFAULT '0',
  `usage_per_customer` int UNSIGNED NOT NULL DEFAULT '0',
  `times_used` int UNSIGNED NOT NULL DEFAULT '0',
  `type` int UNSIGNED NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_coupon_usage`
--

CREATE TABLE `cart_rule_coupon_usage` (
  `id` int UNSIGNED NOT NULL,
  `times_used` int NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_customers`
--

CREATE TABLE `cart_rule_customers` (
  `id` int UNSIGNED NOT NULL,
  `times_used` bigint UNSIGNED NOT NULL DEFAULT '0',
  `cart_rule_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_customer_groups`
--

CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_translations`
--

CREATE TABLE `cart_rule_translations` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cart_shipping_rates`
--

CREATE TABLE `cart_shipping_rates` (
  `id` int UNSIGNED NOT NULL,
  `carrier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `cart_address_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rules`
--

CREATE TABLE `catalog_rules` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_channels`
--

CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_customer_groups`
--

CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_products`
--

CREATE TABLE `catalog_rule_products` (
  `id` int UNSIGNED NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL,
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_product_prices`
--

CREATE TABLE `catalog_rule_product_prices` (
  `id` int UNSIGNED NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED NOT NULL,
  `catalog_rule_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `_lft` int UNSIGNED NOT NULL DEFAULT '0',
  `_rgt` int UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `display_mode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `category_icon_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `additional` json DEFAULT NULL,
  `category_banner` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `position`, `image`, `status`, `_lft`, `_rgt`, `parent_id`, `created_at`, `updated_at`, `display_mode`, `category_icon_path`, `additional`, `category_banner`) VALUES
(1, 1, NULL, 1, 1, 60, NULL, '2023-07-26 12:37:08', '2023-10-11 19:06:18', 'products_and_description', NULL, NULL, 'category/1/NmBhaXn14bmRVfkELFyg0LNEpZdwH9ouYYJ4LFmZ.jpg'),
(8, 1, 'category/8/IVnSFELuRy7DSZo1TqnBPcyP1tXBbG9gfU8wDWUn.jpg', 1, 14, 23, 1, '2023-10-11 19:14:56', '2023-10-31 08:01:36', 'description_only', 'velocity/category_icon_path/8/oAL45KFvpWK7cNqXVjgnceBzpZ5QHdz7N9A1jMmu.jpg', NULL, 'category/8/b0bFTHWcq3oBCnEYSOPEfIXuHoUFTMEBhRZpnj2d.jpg'),
(9, 2, NULL, 1, 15, 16, 8, '2023-10-11 19:21:46', '2023-10-31 08:01:36', 'description_only', NULL, NULL, NULL),
(10, 2, 'category/10/dm56us9dblZtivnY5lKoGr3RMVQ06cd1LKEgKB71.jpg', 1, 24, 29, 1, '2023-10-16 01:55:10', '2023-10-23 01:30:14', 'products_and_description', 'velocity/category_icon_path/10/2TvLw2UCbeOuruqQZf2vqAF6r00pgcXVAZ5fchP1.png', NULL, 'category/10/KYKtx0ZeDXLd1InswEswikP3m2ydpIg45PkmKouU.jpg'),
(11, 2, 'category/11/zwwRxrjrmcbx2XYylMHMbPfcujdDLS082os93FN3.jpg', 1, 30, 35, 1, '2023-10-16 01:56:14', '2023-10-31 08:02:08', 'products_and_description', 'velocity/category_icon_path/11/FVAKMmhJdgGpIHfnYcNO3l4HVEZkTj5WGh3Nw4w6.jpg', NULL, 'category/11/Ym60GAzDzcztPmkrhYHuAI9w2kyggMe9xbiDLqob.jpg'),
(12, 2, 'category/12/XdXhJaemusAYkd6k2akTBYE6evERdyWOL1xDLK0K.jpg', 1, 36, 45, 1, '2023-10-16 01:57:05', '2023-10-25 02:41:49', 'products_and_description', 'velocity/category_icon_path/12/umPIJgEcMyEN1n3vwV1BuHc2Ojy1qb8sw68HBQKs.jpg', NULL, 'category/12/Sq4Bl2TeHRyzmRrPcUWHTqjLMEBKEgynxuxJntBI.jpg'),
(13, 1, 'category/13/NNfYq6h8LfMoIGsKgd02VMIPO6oWmWyXEv1RuhNy.jpg', 1, 41, 42, 12, '2023-10-23 02:32:40', '2023-10-28 13:53:38', 'products_and_description', 'velocity/category_icon_path/13/mbBgltwjDRFPCtBT8PENiNlzIT8s5qKQSFiwYYjG.png', NULL, NULL),
(14, 1, 'category/14/4EHq5bGBEamBIhH0E5SrNHGpaHREjgrxIY2Wfykd.jpg', 1, 17, 18, 8, '2023-10-23 14:49:33', '2023-10-31 08:01:36', 'products_and_description', 'velocity/category_icon_path/14/sytBMKHBsXC5GHPzWQdlW6TWIXvUHPaWbUC7UWDa.png', NULL, 'category/14/oR3ujVY1LPrOU531eLAuQo8gpBcGeuV3AjikUsdt.jpg'),
(15, 1, 'category/15/NNu3OxDDZuFgSNXn4Wy4DgcaGGnMa54Ny10wRBqb.jpg', 1, 19, 20, 8, '2023-10-23 14:53:23', '2023-10-31 08:01:36', 'products_and_description', 'velocity/category_icon_path/15/rWXuzzvmrLD6XDJ6aqJxxPiBcLW63p4xpPDP9JAP.jpg', NULL, 'category/15/1pOXqUwDuZjlUNnaiTNcmAQzZAmD2m0eSwXTyWay.jpg'),
(16, 1, 'category/16/dvM8vlmUqqv2isz0GnkM22Qz4Z2on4PRAlexpixJ.jpg', 1, 21, 22, 8, '2023-10-23 15:00:01', '2023-10-31 08:01:36', 'products_and_description', 'velocity/category_icon_path/16/xJ6CKR2zgR0wVjMwpVaUNJ4X0dlQqkkfDOJH16Tj.jpg', NULL, 'category/16/L6WAfC6dLeyP11wnmH1gLV66QVfPg73uutN8tqB3.jpg'),
(17, 1, 'category/17/JcugVKVT6jBgQp3bGFJQ0LzaxTRRAtBf81RsiWWn.jpg', 1, 39, 40, 12, '2023-10-23 15:07:34', '2023-10-28 13:50:19', 'products_and_description', 'velocity/category_icon_path/17/a1EVs8z1iU5GBSIRvN6ZhNGEm7Ea94HkIYTGdF3O.png', NULL, 'category/17/tCNuZem2X8Snw5xNLqwT5vLNVBONgJwmGH9W072H.jpg'),
(18, 1, 'category/18/Fj0gWoBpHgL0ezq4hgkGhAwymte5P231TJNvtR4N.jpg', 1, 37, 38, 12, '2023-10-23 15:09:05', '2023-10-28 13:49:57', 'products_and_description', 'velocity/category_icon_path/18/u1fgqi7kXhNEJTPVsIzTbm93Uwc27LVF54xAdSvj.png', NULL, 'category/18/DbJKBv0Lw2D1l7kzPOSQWXy9qQMZWaz0D2UwlRGA.png'),
(19, 1, 'category/19/Ics67NSs6NoOKKyjKPvcPHZmkBAQjsXYf8B55OVk.jpg', 1, 43, 44, 12, '2023-10-28 13:54:28', '2023-10-28 13:54:28', 'products_and_description', 'velocity/category_icon_path/19/euDSJA7622iUbkIUgdrd8MK9ZCL6ZaeGS40mUlNt.jpg', NULL, 'category/19/ggaX7ztTWp72wmurTIJgTzjIm2Z0doe1oc6F8aaK.jpg'),
(20, 1, 'category/20/DHRhKoOWjUFu8jYCiWJZCRYx3MOYTcuzCUTYXBYV.jpg', 1, 46, 53, 1, '2023-10-31 06:26:03', '2023-11-20 13:22:27', 'products_and_description', 'velocity/category_icon_path/20/uRQNB24uWDdZQTZRg9ArFa5puKBQqp0LwWKDjPW5.jpg', NULL, 'category/20/evhd7h8qjzKAeiKcnpCB8sVSGetvUel51eK8jGoi.jpg'),
(21, 1, 'category/21/fif0D2AcnxPSMDBe3LDHKGtML5P5XzFDFoYXEOa9.jpg', 1, 54, 59, 1, '2023-10-31 06:36:33', '2023-10-31 06:36:33', 'products_and_description', 'velocity/category_icon_path/21/GVNxHKtP5EO4zKwNxbwZuXWc1Z8G7Mz583JTqDt6.jpg', NULL, 'category/21/4kLEVeEGijpOo8NIaJ7XLel7AOhKJborOLdmZIQW.jpg'),
(22, 2, 'category/22/nT0mVFk80bz2EZL8CpUiRnUJKsaa8LpQzGVQsouU.jpg', 1, 55, 56, 21, '2023-10-31 09:27:01', '2023-10-31 09:27:01', 'products_and_description', 'velocity/category_icon_path/22/HixCiHrNVDQHz1dw3PbjJHctdxhl2IhfKD0FY4q1.jpg', NULL, 'category/22/2kdi9nenC5RdYKkKS8FzJB7iVmx5H5IuNrUNO71J.jpg'),
(23, 2, 'category/23/FrqMtfpyidVm0hQs2yla6Fo5zawKFTchIzoax3ft.jpg', 1, 57, 58, 21, '2023-10-31 09:27:38', '2023-11-19 07:41:00', 'products_and_description', 'velocity/category_icon_path/23/XnyDGXdHkpirNY9aTzVJDMU6vDc5eRrDYXHKIGdN.jpg', NULL, 'category/23/X1AvOf4kDYEjIa13EmHgqrV8ZVYFSwODBF3bJBR8.jpg'),
(24, 2, 'category/24/6CMZFqXoXGqifu0ibJn5BsYPYWR2j7ZmANj4Q9va.jpg', 1, 31, 32, 11, '2023-10-31 09:28:11', '2023-10-31 09:28:11', 'products_and_description', 'velocity/category_icon_path/24/WGISrqcMz2JyRzNT7GRRhrPInPWcYaVIJMIQaQbq.jpg', NULL, 'category/24/WZJ9CNkndep76sJaMSd1N2RLoLpTaxfFb2uJ5pEF.jpg'),
(25, 2, 'category/25/0fxtTOrMTfpxdwCu28Fcj0eJ5thvnwVRncCMTlWR.jpg', 1, 33, 34, 11, '2023-10-31 09:28:40', '2023-11-19 07:43:14', 'products_and_description', 'velocity/category_icon_path/25/6gk6l1X1uTQybvjRY30LYBucUempxXoODd9aES6C.jpg', NULL, 'category/25/2aJCQvRleoeFkZTrKUAlswG8TY2QVpYf4mEB9c7W.jpg'),
(26, 2, 'category/26/LN4z8FplTzQjdqkLxjrsgI4FivRwaj6i6uKveQRW.jpg', 1, 25, 26, 10, '2023-10-31 09:29:18', '2023-11-19 07:37:43', 'products_and_description', 'velocity/category_icon_path/26/QUhWhnpzs9CnM01lJ0XSrEAUeoACihOvJklrXygJ.jpg', NULL, 'category/26/7jbD36Boot6OVmhSJlk74LxK2BdhBCZwzvHrxRIC.jpg'),
(27, 2, 'category/27/jDuztQkyvM91kvRAT3FWdrrWfAicy2G4Ahk5C5JD.jpg', 1, 27, 28, 10, '2023-10-31 09:29:48', '2023-11-19 07:30:24', 'products_and_description', 'velocity/category_icon_path/27/ok4ren3WARrMNWltywjOmydFvgQEksbBc9wvFhuI.jpg', NULL, 'category/27/uboEKvK7pMUth9jOyoVvLC4CdzNosyRX4CQIOMda.jpg'),
(28, 2, 'category/28/3staj4fA4syFJCPiCDgSz70E7JPBGV0DPW7ZwUq0.jpg', 1, 47, 48, 20, '2023-10-31 09:30:37', '2023-11-20 13:22:27', 'products_and_description', 'velocity/category_icon_path/28/dZy3uiosmdsClBLlwcmXLh53hYG4uD74oujrdVaS.jpg', NULL, 'category/28/L04mruStgoZnzDUmWiuIVYIJKCnjg27nHRbsRu6y.jpg'),
(29, 2, 'category/29/zFUO3Oh3ZrWRYYYwtcrfvUh935gNRcLMrZSP3ycR.jpg', 1, 49, 52, 20, '2023-10-31 09:31:23', '2023-11-20 13:22:27', 'products_and_description', 'velocity/category_icon_path/29/0hQiiMC3OehN9lxA0UzAZjVocenLXjRYuBZssQnz.jpg', NULL, 'category/29/VGoHrfGAbdlc6SsMTLkRDpGWWUCICLGWAMo0ONFP.jpg'),
(30, 2, 'category/30/eMlp3hFXEg92pwG9Nc5VoJHJ01RKcDE47cTCAcgz.jpg', 1, 50, 51, 29, '2023-11-06 22:23:39', '2023-11-20 13:22:27', 'products_and_description', 'velocity/category_icon_path/30/NVcpgSDw16rDkuJlULNObMurKSPsAFyUNyFgimMv.jpg', NULL, 'category/30/2x7SRaM5zozwQdVc5MO1PgwjIIxYUB2ySPU7hsOe.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `category_filterable_attributes`
--

CREATE TABLE `category_filterable_attributes` (
  `category_id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category_filterable_attributes`
--

INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES
(1, 11),
(8, 11),
(9, 11),
(10, 11),
(11, 11),
(12, 25),
(10, 23),
(10, 24),
(10, 25),
(13, 11),
(14, 11),
(15, 11),
(16, 11),
(17, 24),
(18, 11),
(19, 11),
(20, 11),
(21, 11),
(22, 11),
(23, 11),
(24, 11),
(25, 11),
(26, 11),
(27, 11),
(28, 11),
(29, 11),
(30, 11);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int UNSIGNED NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale_id` int UNSIGNED DEFAULT NULL,
  `url_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `name`, `slug`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `category_id`, `locale`, `locale_id`, `url_path`) VALUES
(6, 'All Categories', 'all-categories', '<p>All Categories</p>', 'Getpix', '', '', 1, 'en', NULL, ''),
(7, 'Raíz', 'root', 'Raíz', '', '', '', 1, 'es', NULL, ''),
(8, 'Racine', 'root', 'Racine', '', '', '', 1, 'fr', NULL, ''),
(9, 'Hoofdcategorie', 'root', 'Hoofdcategorie', '', '', '', 1, 'nl', NULL, ''),
(10, 'Kök', 'root', 'Kök', '', '', '', 1, 'tr', NULL, ''),
(40, 'Tất Cả', 'all-categories', '<p>Tất Cả</p>', '', '', '', 1, 'Vi', NULL, ''),
(47, 'Vector', 'vector', '<p>Vector</p>', '', '', '', 8, 'en', 1, 'vector'),
(48, 'Vector', 'vector', '<p>Vector</p>', '', '', '', 8, 'Vi', 6, 'vector'),
(49, 'Icons', 'icons', '<p>Icons</p>', '', '', '', 9, 'en', 1, 'vector/icons'),
(50, 'Icons', 'icons', '<p>Icons</p>', '', '', '', 9, 'Vi', 6, 'vector/icons'),
(51, 'Images', 'images', '<p>Images</p>', '', '', '', 10, 'en', 1, 'images'),
(52, 'Images', 'images', '<p>Images</p>', '', '', '', 10, 'Vi', 6, 'images'),
(53, 'PSD', 'psd', '<p>PSD</p>', '', '', '', 11, 'en', 1, 'psd'),
(54, 'PSD', 'psd', '<p>PSD</p>', '', '', '', 11, 'Vi', 6, 'psd'),
(55, 'Thiết Kế', 'thiet-ke', '<p>Thiết kế</p>', '', '', '', 12, 'en', 1, 'thiet-ke'),
(56, 'Thiết Kế', 'thiet-ke', '<p>Thiết kế</p>', '', '', '', 12, 'Vi', 6, 'thiet-ke'),
(57, 'Thiên Nhiên', 'thien-nhien', '<p>Thi&ecirc;n Nhi&ecirc;n</p>', '', '', '', 13, 'en', 1, 'thiet-ke/thien-nhien'),
(58, 'Thiên Nhiên', 'thien-nhien', '<p>Thi&ecirc;n Nhi&ecirc;n</p>', '', '', '', 13, 'Vi', 6, 'thiet-ke/thien-nhien'),
(59, 'Sự Kiện', 'su-kien', '<p>Sự Kiện - Events</p>', '', '', '', 14, 'en', 1, 'vector/su-kien'),
(60, 'Sự Kiện', 'su-kien', '<p>Sự Kiện - Events</p>', '', '', '', 14, 'Vi', 6, 'vector/su-kien'),
(61, 'Giáo Dục', 'giao-duc', '<p>Gi&aacute;o Dục</p>', '', '', '', 15, 'en', 1, 'vector/giao-duc'),
(62, 'Giáo Dục', 'giao-duc', '<p>Gi&aacute;o Dục</p>', '', '', '', 15, 'Vi', 6, 'vector/giao-duc'),
(63, 'Vector Khác', 'vector-khac', '<p>Vector Kh&aacute;c</p>', '', '', '', 16, 'en', 1, 'vector/vector-khac'),
(64, 'Vector Khác', 'vector-khac', '<p>Vector Kh&aacute;c</p>', '', '', '', 16, 'Vi', 6, 'vector/vector-khac'),
(65, 'Giáng Sinh', 'giang-sinh', '<p>Gi&aacute;ng Sinh</p>', '', '', '', 17, 'en', 1, 'thiet-ke/giang-sinh'),
(66, 'Giáng Sinh', 'giang-sinh', '<p>Gi&aacute;ng Sinh</p>', '', '', '', 17, 'Vi', 6, 'thiet-ke/giang-sinh'),
(67, 'Lễ Tết', 'le-tet', '<p>Lễ Tết</p>', '', '', '', 18, 'en', 1, 'thiet-ke/le-tet'),
(68, 'Lễ Tết', 'le-tet', '<p>Lễ Tết</p>', '', '', '', 18, 'Vi', 6, 'thiet-ke/le-tet'),
(69, 'Lịch và Thiệp', 'lich-va-thiep', '<p>Lịch v&agrave; Thiệp</p>', '', '', '', 19, 'en', 1, 'thiet-ke/lich-va-thiep'),
(70, 'Lịch và Thiệp', 'lich-va-thiep', '<p>Lịch v&agrave; Thiệp</p>', '', '', '', 19, 'Vi', 6, 'thiet-ke/lich-va-thiep'),
(71, 'Template', 'template', '<p>Template</p>', '', '', '', 20, 'en', 1, 'template'),
(72, 'Template', 'template', '<p>Template</p>', '', '', '', 20, 'Vi', 6, 'template'),
(73, '3D', '3d', '<p>3d</p>', '', '', '', 21, 'en', 1, '3d'),
(74, '3D', '3d', '<p>3d</p>', '', '', '', 21, 'Vi', 6, '3d'),
(75, '3D1', '3d1', '<p>3D1</p>', '', '', '', 22, 'en', 1, '3d/3d1'),
(76, '3D1', '3d1', '<p>3D1</p>', '', '', '', 22, 'Vi', 6, '3d/3d1'),
(77, 'Ngày Tết', 'ngay-tet', '<p>Ng&agrave;y Tết</p>', 'Ngày Tết', 'Ngày Tết', 'Ngày Tết', 23, 'en', 1, '3d/ngay-tet'),
(78, '3D2', '3d2', '<p>3D2</p>', '', '', '', 23, 'Vi', 6, '3d/3d2'),
(79, 'PSD1', 'psd1', '<p>PSD1</p>', '', '', '', 24, 'en', 1, 'psd/psd1'),
(80, 'PSD1', 'psd1', '<p>PSD1</p>', '', '', '', 24, 'Vi', 6, 'psd/psd1'),
(81, 'Tranh Đông Hồ', 'tranh-dong-ho', '<p>Tranh Đ&ocirc;ng Hồ</p>', 'Tranh Đông Hồ', 'Tranh Đông Hồ', 'Tranh Đông Hồ', 25, 'en', 1, 'psd/tranh-dong-ho'),
(82, 'PSD2', 'psd2', '<p>PSD2</p>', '', '', '', 25, 'Vi', 6, 'psd/psd2'),
(83, 'Black Friday', 'black-friday', '<p>Black Friday</p>', 'Black Friday', 'Black Friday', 'Black Friday', 26, 'en', 1, 'images/black-friday'),
(84, 'Image1', 'image1', '<p>Image1</p>', '', '', '', 26, 'Vi', 6, 'images/image1'),
(85, 'Mùa Giáng Sinh', 'mua-giang-sinh', '<p>M&ugrave;a Gi&aacute;ng Sinh</p>', 'Mùa Giáng Sinh', 'Mùa Giáng Sinh', 'Mùa Giáng Sinh', 27, 'en', 1, 'images/mua-giang-sinh'),
(86, 'Image2', 'image2', '<p>Image2</p>', '', '', '', 27, 'Vi', 6, 'images/image2'),
(87, 'Template1', 'template1', '<p>Template1</p>', '', '', '', 28, 'en', 1, 'template/template1'),
(88, 'Template1', 'template1', '<p>Template1</p>', '', '', '', 28, 'Vi', 6, 'template/template1'),
(89, 'Cánh Đồng Quê', 'canh-dong-que', '<p>C&aacute;nh Đồng Qu&ecirc;</p>', 'Cánh Đồng Quê', 'Cánh Đồng Quê', 'Cánh Đồng Quê', 29, 'en', 1, 'template/canh-dong-que'),
(90, 'Template2', 'template2', '<p>Template2</p>', '', '', '', 29, 'Vi', 6, 'template/template2'),
(91, 'Tem3', 'tem3', '<p>Tem3</p>', '', '', '', 30, 'en', 1, 'template/canh-dong-que/tem3'),
(92, 'Tem3', 'tem3', '<p>Tem3</p>', '', '', '', 30, 'Vi', 6, 'template/template2/tem3');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `default_locale_id` int UNSIGNED NOT NULL,
  `base_currency_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `root_category_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `code`, `timezone`, `theme`, `hostname`, `logo`, `favicon`, `is_maintenance_on`, `allowed_ips`, `default_locale_id`, `base_currency_id`, `created_at`, `updated_at`, `root_category_id`) VALUES
(1, 'default', NULL, 'velocity', 'http://localhost/getpix', NULL, NULL, 0, '', 6, 3, NULL, '2023-10-09 16:04:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_currencies`
--

CREATE TABLE `channel_currencies` (
  `channel_id` int UNSIGNED NOT NULL,
  `currency_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_currencies`
--

INSERT INTO `channel_currencies` (`channel_id`, `currency_id`) VALUES
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `channel_inventory_sources`
--

CREATE TABLE `channel_inventory_sources` (
  `channel_id` int UNSIGNED NOT NULL,
  `inventory_source_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_inventory_sources`
--

INSERT INTO `channel_inventory_sources` (`channel_id`, `inventory_source_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_locales`
--

CREATE TABLE `channel_locales` (
  `channel_id` int UNSIGNED NOT NULL,
  `locale_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_locales`
--

INSERT INTO `channel_locales` (`channel_id`, `locale_id`) VALUES
(1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `channel_translations`
--

CREATE TABLE `channel_translations` (
  `id` bigint UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `home_page_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `footer_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `channel_translations`
--

INSERT INTO `channel_translations` (`id`, `channel_id`, `locale`, `name`, `description`, `home_page_content`, `footer_content`, `maintenance_mode_text`, `home_seo`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'GETPIX', '', '', '<div class=\"list-container\"><span class=\"list-heading\">Quick Links</span>\r\n<ul class=\"list-group\">\r\n<li><a href=\"http://localhost/bagisto-master/page/about-us\">About Us</a></li>\r\n<li><a href=\"http://localhost/bagisto-master/page/return-policy\">Return Policy</a></li>\r\n<li><a href=\"http://localhost/bagisto-master/page/refund-policy\">Refund Policy</a></li>\r\n<li><a href=\"http://localhost/bagisto-master/page/terms-conditions\">Terms and conditions</a></li>\r\n<li><a href=\"http://localhost/bagisto-master/page/terms-of-use\">Terms of Use</a></li>\r\n<li><a href=\"http://localhost/bagisto-master/page/contact-us\">Contact Us</a></li>\r\n</ul>\r\n</div>\r\n<div class=\"list-container\"><span class=\"list-heading\">Connect With Us</span>\r\n<ul class=\"list-group\">\r\n<li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\r\n<li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\r\n<li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\r\n<li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\r\n<li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\r\n</ul>\r\n</div>', '', '{\"meta_title\": \"Getpix\", \"meta_keywords\": \"Getpix\", \"meta_description\": \"Getpix\"}', NULL, '2023-10-11 19:12:57'),
(2, 1, 'fr', 'Default', NULL, '                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\r\n                        <div class=\"banner-container\">\r\n                        <div class=\"left-banner\">\r\n                            <img src=http://localhost/bagisto-master/themes/default/assets/images/1.webp data-src=http://localhost/bagisto-master/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\r\n                        </div>\r\n                        <div class=\"right-banner\">\r\n                            <img src=http://localhost/bagisto-master/themes/default/assets/images/2.webp data-src=http://localhost/bagisto-master/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\r\n                            <img src=http://localhost/bagisto-master/themes/default/assets/images/3.webp data-src=http://localhost/bagisto-master/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\r\n                        </div>\r\n                    </div>\r\n                ', '                    <div class=\"list-container\">\r\n                        <span class=\"list-heading\">Quick Links</span>\r\n                        <ul class=\"list-group\">\r\n                            <li><a href=\"http://localhost/bagisto-master/page/about-us\">About Us</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/return-policy\">Return Policy</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/refund-policy\">Refund Policy</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/terms-conditions\">Terms and conditions</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/terms-of-use\">Terms of Use</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/contact-us\">Contact Us</a></li>\r\n                        </ul>\r\n                    </div>\r\n                    <div class=\"list-container\">\r\n                        <span class=\"list-heading\">Connect With Us</span>\r\n                            <ul class=\"list-group\">\r\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\r\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\r\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\r\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\r\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\r\n                            </ul>\r\n                        </div>\r\n                ', NULL, '{\"meta_title\": \"Getpix\", \"meta_keywords\": \"Getpix meta keyword\", \"meta_description\": \"Getpix meta description\"}', NULL, NULL),
(3, 1, 'nl', 'Default', NULL, '                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\r\n                        <div class=\"banner-container\">\r\n                        <div class=\"left-banner\">\r\n                            <img src=http://localhost/bagisto-master/themes/default/assets/images/1.webp data-src=http://localhost/bagisto-master/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\r\n                        </div>\r\n                        <div class=\"right-banner\">\r\n                            <img src=http://localhost/bagisto-master/themes/default/assets/images/2.webp data-src=http://localhost/bagisto-master/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\r\n                            <img src=http://localhost/bagisto-master/themes/default/assets/images/3.webp data-src=http://localhost/bagisto-master/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\r\n                        </div>\r\n                    </div>\r\n                ', '                    <div class=\"list-container\">\r\n                        <span class=\"list-heading\">Quick Links</span>\r\n                        <ul class=\"list-group\">\r\n                            <li><a href=\"http://localhost/bagisto-master/page/about-us\">About Us</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/return-policy\">Return Policy</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/refund-policy\">Refund Policy</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/terms-conditions\">Terms and conditions</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/terms-of-use\">Terms of Use</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/contact-us\">Contact Us</a></li>\r\n                        </ul>\r\n                    </div>\r\n                    <div class=\"list-container\">\r\n                        <span class=\"list-heading\">Connect With Us</span>\r\n                            <ul class=\"list-group\">\r\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\r\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\r\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\r\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\r\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\r\n                            </ul>\r\n                        </div>\r\n                ', NULL, '{\"meta_title\": \"Getpix\", \"meta_keywords\": \"Getpix meta keyword\", \"meta_description\": \"Getpix meta description\"}', NULL, NULL),
(4, 1, 'tr', 'Default', NULL, '                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\r\n                        <div class=\"banner-container\">\r\n                        <div class=\"left-banner\">\r\n                            <img src=http://localhost/bagisto-master/themes/default/assets/images/1.webp data-src=http://localhost/bagisto-master/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\r\n                        </div>\r\n                        <div class=\"right-banner\">\r\n                            <img src=http://localhost/bagisto-master/themes/default/assets/images/2.webp data-src=http://localhost/bagisto-master/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\r\n                            <img src=http://localhost/bagisto-master/themes/default/assets/images/3.webp data-src=http://localhost/bagisto-master/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\r\n                        </div>\r\n                    </div>\r\n                ', '                    <div class=\"list-container\">\r\n                        <span class=\"list-heading\">Quick Links</span>\r\n                        <ul class=\"list-group\">\r\n                            <li><a href=\"http://localhost/bagisto-master/page/about-us\">About Us</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/return-policy\">Return Policy</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/refund-policy\">Refund Policy</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/terms-conditions\">Terms and conditions</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/terms-of-use\">Terms of Use</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/contact-us\">Contact Us</a></li>\r\n                        </ul>\r\n                    </div>\r\n                    <div class=\"list-container\">\r\n                        <span class=\"list-heading\">Connect With Us</span>\r\n                            <ul class=\"list-group\">\r\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\r\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\r\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\r\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\r\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\r\n                            </ul>\r\n                        </div>\r\n                ', NULL, '{\"meta_title\": \"Getpix\", \"meta_keywords\": \"Getpix meta keyword\", \"meta_description\": \"Getpix meta description\"}', NULL, NULL),
(5, 1, 'es', 'Default', NULL, '                    <p>@include(\"shop::home.slider\") @include(\"shop::home.featured-products\") @include(\"shop::home.new-products\")</p>\r\n                        <div class=\"banner-container\">\r\n                        <div class=\"left-banner\">\r\n                            <img src=http://localhost/bagisto-master/themes/default/assets/images/1.webp data-src=http://localhost/bagisto-master/themes/default/assets/images/1.webp class=\"lazyload\" alt=\"test\" width=\"720\" height=\"720\" />\r\n                        </div>\r\n                        <div class=\"right-banner\">\r\n                            <img src=http://localhost/bagisto-master/themes/default/assets/images/2.webp data-src=http://localhost/bagisto-master/themes/default/assets/images/2.webp class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\r\n                            <img src=http://localhost/bagisto-master/themes/default/assets/images/3.webp data-src=http://localhost/bagisto-master/themes/default/assets/images/3.webp  class=\"lazyload\" alt=\"test\" width=\"460\" height=\"330\" />\r\n                        </div>\r\n                    </div>\r\n                ', '                    <div class=\"list-container\">\r\n                        <span class=\"list-heading\">Quick Links</span>\r\n                        <ul class=\"list-group\">\r\n                            <li><a href=\"http://localhost/bagisto-master/page/about-us\">About Us</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/return-policy\">Return Policy</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/refund-policy\">Refund Policy</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/terms-conditions\">Terms and conditions</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/terms-of-use\">Terms of Use</a></li>\r\n                            <li><a href=\"http://localhost/bagisto-master/page/contact-us\">Contact Us</a></li>\r\n                        </ul>\r\n                    </div>\r\n                    <div class=\"list-container\">\r\n                        <span class=\"list-heading\">Connect With Us</span>\r\n                            <ul class=\"list-group\">\r\n                                <li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\r\n                                <li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\r\n                                <li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\r\n                                <li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\r\n                                <li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\r\n                            </ul>\r\n                        </div>\r\n                ', NULL, '{\"meta_title\": \"Getpix\", \"meta_keywords\": \"Getpix meta keyword\", \"meta_description\": \"Getpix meta description\"}', NULL, NULL),
(6, 1, 'Vi', 'Mặc Định', '', '', '<div class=\"list-container\"><span class=\"list-heading\">Quick Links</span>\r\n<ul class=\"list-group\">\r\n<li><a href=\"http://localhost/bagisto-master/page/about-us\">About Us</a></li>\r\n<li><a href=\"http://localhost/bagisto-master/page/return-policy\">Return Policy</a></li>\r\n<li><a href=\"http://localhost/bagisto-master/page/refund-policy\">Refund Policy</a></li>\r\n<li><a href=\"http://localhost/bagisto-master/page/terms-conditions\">Terms and conditions</a></li>\r\n<li><a href=\"http://localhost/bagisto-master/page/terms-of-use\">Terms of Use</a></li>\r\n<li><a href=\"http://localhost/bagisto-master/page/contact-us\">Contact Us</a></li>\r\n</ul>\r\n</div>\r\n<div class=\"list-container\"><span class=\"list-heading\">Connect With Us</span>\r\n<ul class=\"list-group\">\r\n<li><a href=\"#\"><span class=\"icon icon-facebook\"></span>Facebook </a></li>\r\n<li><a href=\"#\"><span class=\"icon icon-twitter\"></span> Twitter </a></li>\r\n<li><a href=\"#\"><span class=\"icon icon-instagram\"></span> Instagram </a></li>\r\n<li><a href=\"#\"> <span class=\"icon icon-google-plus\"></span>Google+ </a></li>\r\n<li><a href=\"#\"> <span class=\"icon icon-linkedin\"></span>LinkedIn </a></li>\r\n</ul>\r\n</div>', '', '{\"meta_title\": \"Getpix\", \"meta_keywords\": \"Getpix meta keyword\", \"meta_description\": \"Getpix meta description\"}', '2023-10-09 16:04:56', '2023-10-09 16:04:56');

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `id` int UNSIGNED NOT NULL,
  `layout` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES
(1, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(2, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(3, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(4, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(5, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(6, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(7, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(8, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(9, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(10, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(11, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_channels`
--

CREATE TABLE `cms_page_channels` (
  `cms_page_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_translations`
--

CREATE TABLE `cms_page_translations` (
  `id` int UNSIGNED NOT NULL,
  `page_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cms_page_translations`
--

INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES
(12, 'About Us', 'about-us', '<div class=\"static-container\"><div class=\"mb-5\">About us page content</div></div>', 'about us', '', 'aboutus', 'en', 1),
(13, 'Return Policy', 'return-policy', '<div class=\"static-container\"><div class=\"mb-5\">Return policy page content</div></div>', 'return policy', '', 'return, policy', 'en', 2),
(14, 'Refund Policy', 'refund-policy', '<div class=\"static-container\"><div class=\"mb-5\">Refund policy page content</div></div>', 'Refund policy', '', 'refund, policy', 'en', 3),
(15, 'Terms & Conditions', 'terms-conditions', '<div class=\"static-container\"><div class=\"mb-5\">Terms & conditions page content</div></div>', 'Terms & Conditions', '', 'term, conditions', 'en', 4),
(16, 'Terms of use', 'terms-of-use', '<div class=\"static-container\"><div class=\"mb-5\">Terms of use page content</div></div>', 'Terms of use', '', 'term, use', 'en', 5),
(17, 'Contact Us', 'contact-us', '<div class=\"static-container\"><div class=\"mb-5\">Contact us page content</div></div>', 'Contact Us', '', 'contact, us', 'en', 6),
(18, 'Customer Service', 'cutomer-service', '<div class=\"static-container\"><div class=\"mb-5\">Customer service  page content</div></div>', 'Customer Service', '', 'customer, service', 'en', 7),
(19, 'What\'s New', 'whats-new', '<div class=\"static-container\"><div class=\"mb-5\">What\'s New page content</div></div>', 'What\'s New', '', 'new', 'en', 8),
(20, 'Payment Policy', 'payment-policy', '<div class=\"static-container\"><div class=\"mb-5\">Payment Policy page content</div></div>', 'Payment Policy', '', 'payment, policy', 'en', 9),
(21, 'Shipping Policy', 'shipping-policy', '<div class=\"static-container\"><div class=\"mb-5\">Shipping Policy  page content</div></div>', 'Shipping Policy', '', 'shipping, policy', 'en', 10),
(22, 'Privacy Policy', 'privacy-policy', '<div class=\"static-container\"><div class=\"mb-5\">Privacy Policy  page content</div></div>', 'Privacy Policy', '', 'privacy, policy', 'en', 11);

-- --------------------------------------------------------

--
-- Table structure for table `core_config`
--

CREATE TABLE `core_config` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `core_config`
--

INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES
(1, 'catalog.products.guest-checkout.allow-guest-checkout', '1', NULL, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(2, 'emails.general.notifications.emails.general.notifications.verification', '1', NULL, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(3, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(4, 'emails.general.notifications.emails.general.notifications.customer', '1', NULL, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(5, 'emails.general.notifications.emails.general.notifications.new-order', '1', NULL, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(6, 'emails.general.notifications.emails.general.notifications.new-admin', '1', NULL, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(7, 'emails.general.notifications.emails.general.notifications.new-invoice', '1', NULL, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(8, 'emails.general.notifications.emails.general.notifications.new-refund', '1', NULL, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(9, 'emails.general.notifications.emails.general.notifications.new-shipment', '1', NULL, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(10, 'emails.general.notifications.emails.general.notifications.new-inventory-source', '1', NULL, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(11, 'emails.general.notifications.emails.general.notifications.cancel-order', '1', NULL, NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(53, 'customer.settings.social_login.enable_facebook', '1', 'default', NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(54, 'customer.settings.social_login.enable_twitter', '1', 'default', NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(55, 'customer.settings.social_login.enable_google', '1', 'default', NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(56, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(57, 'customer.settings.social_login.enable_github', '1', 'default', NULL, '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(58, 'general.content.shop.compare_option', '1', 'default', 'en', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(59, 'general.content.shop.compare_option', '1', 'default', 'fr', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(60, 'general.content.shop.compare_option', '1', 'default', 'ar', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(61, 'general.content.shop.compare_option', '1', 'default', 'de', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(62, 'general.content.shop.compare_option', '1', 'default', 'es', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(63, 'general.content.shop.compare_option', '1', 'default', 'fa', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(64, 'general.content.shop.compare_option', '1', 'default', 'it', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(65, 'general.content.shop.compare_option', '1', 'default', 'ja', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(66, 'general.content.shop.compare_option', '1', 'default', 'nl', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(67, 'general.content.shop.compare_option', '1', 'default', 'pl', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(68, 'general.content.shop.compare_option', '1', 'default', 'pt_BR', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(69, 'general.content.shop.compare_option', '1', 'default', 'tr', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(70, 'general.content.shop.wishlist_option', '1', 'default', 'en', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(71, 'general.content.shop.wishlist_option', '1', 'default', 'fr', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(72, 'general.content.shop.wishlist_option', '1', 'default', 'ar', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(73, 'general.content.shop.wishlist_option', '1', 'default', 'de', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(74, 'general.content.shop.wishlist_option', '1', 'default', 'es', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(75, 'general.content.shop.wishlist_option', '1', 'default', 'fa', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(76, 'general.content.shop.wishlist_option', '1', 'default', 'it', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(77, 'general.content.shop.wishlist_option', '1', 'default', 'ja', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(78, 'general.content.shop.wishlist_option', '1', 'default', 'nl', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(79, 'general.content.shop.wishlist_option', '1', 'default', 'pl', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(80, 'general.content.shop.wishlist_option', '1', 'default', 'pt_BR', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(81, 'general.content.shop.wishlist_option', '1', 'default', 'tr', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(82, 'general.content.shop.image_search', '1', 'default', 'en', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(83, 'general.content.shop.image_search', '1', 'default', 'fr', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(84, 'general.content.shop.image_search', '1', 'default', 'ar', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(85, 'general.content.shop.image_search', '1', 'default', 'de', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(86, 'general.content.shop.image_search', '1', 'default', 'es', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(87, 'general.content.shop.image_search', '1', 'default', 'fa', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(88, 'general.content.shop.image_search', '1', 'default', 'it', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(89, 'general.content.shop.image_search', '1', 'default', 'ja', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(90, 'general.content.shop.image_search', '1', 'default', 'nl', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(91, 'general.content.shop.image_search', '1', 'default', 'pl', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(92, 'general.content.shop.image_search', '1', 'default', 'pt_BR', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(93, 'general.content.shop.image_search', '1', 'default', 'tr', '2023-07-26 12:37:09', '2023-07-26 12:37:09'),
(96, 'general.design.admin_logo.logo_image', 'configuration/EvkJOClq22CNqbv25J8Olh5nNxZqxbYyYP2PwTWR.png', 'default', NULL, '2023-08-20 09:24:33', '2023-08-20 09:26:23'),
(97, 'taxes.catalogue.pricing.tax_inclusive', '0', NULL, NULL, '2023-10-09 01:16:51', '2023-10-09 01:16:51'),
(98, 'taxes.catalogue.default-location-calculation.country', 'VN', NULL, NULL, '2023-10-09 01:16:51', '2023-10-09 01:16:51'),
(99, 'taxes.catalogue.default-location-calculation.state', 'TP.Hồ Chí Minh', NULL, NULL, '2023-10-09 01:16:51', '2023-10-09 01:16:51'),
(100, 'taxes.catalogue.default-location-calculation.post_code', '700000', NULL, NULL, '2023-10-09 01:16:51', '2023-10-09 01:16:51'),
(102, 'sales.shipping.origin.country', 'VN', 'default', 'Vi', '2023-10-09 16:27:57', '2023-10-09 16:27:57'),
(103, 'sales.shipping.origin.state', 'HCMC', 'default', 'Vi', '2023-10-09 16:27:57', '2023-10-09 16:27:57'),
(104, 'sales.shipping.origin.city', 'Thành phố Hồ Chí Minh', 'default', NULL, '2023-10-09 16:27:57', '2023-10-09 16:27:57'),
(105, 'sales.shipping.origin.address1', '19 Thống Nhất', 'default', NULL, '2023-10-09 16:27:57', '2023-10-09 16:27:57'),
(106, 'sales.shipping.origin.zipcode', '700000', 'default', NULL, '2023-10-09 16:27:57', '2023-10-09 16:27:57'),
(107, 'sales.shipping.origin.store_name', 'SGN', 'default', NULL, '2023-10-09 16:27:57', '2023-10-09 16:27:57'),
(108, 'sales.shipping.origin.vat_number', 'SG', 'default', NULL, '2023-10-09 16:27:57', '2023-10-09 16:27:57'),
(109, 'sales.shipping.origin.contact', '0903448207', 'default', NULL, '2023-10-09 16:27:57', '2023-10-09 16:27:57'),
(110, 'sales.shipping.origin.bank_details', '', 'default', NULL, '2023-10-09 16:27:57', '2023-10-09 16:27:57'),
(111, 'sales.paymentmethods.paypal_smart_button.title', 'PayPal Getpix', 'default', 'Vi', '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(112, 'sales.paymentmethods.paypal_smart_button.description', 'PayPal', 'default', 'Vi', '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(113, 'sales.paymentmethods.paypal_smart_button.client_id', 'paypal', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(114, 'sales.paymentmethods.paypal_smart_button.client_secret', 'ndhuy77@gmail.com', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(115, 'sales.paymentmethods.paypal_smart_button.accepted_currencies', 'USD', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(116, 'sales.paymentmethods.paypal_smart_button.active', '1', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(117, 'sales.paymentmethods.paypal_smart_button.sandbox', '1', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(118, 'sales.paymentmethods.paypal_smart_button.sort', '3', NULL, NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(119, 'sales.paymentmethods.cashondelivery.title', 'Tiền Mặt', 'default', 'Vi', '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(120, 'sales.paymentmethods.cashondelivery.description', 'Tiền Mặt', 'default', 'Vi', '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(121, 'sales.paymentmethods.cashondelivery.instructions', '', 'default', 'Vi', '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(122, 'sales.paymentmethods.cashondelivery.generate_invoice', '1', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(123, 'sales.paymentmethods.cashondelivery.invoice_status', 'pending', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(124, 'sales.paymentmethods.cashondelivery.order_status', 'pending', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(125, 'sales.paymentmethods.cashondelivery.active', '1', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(126, 'sales.paymentmethods.cashondelivery.sort', '1', NULL, NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(127, 'sales.paymentmethods.moneytransfer.title', 'Internet Banking', 'default', 'Vi', '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(128, 'sales.paymentmethods.moneytransfer.description', 'Internet Banking', 'default', 'Vi', '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(129, 'sales.paymentmethods.moneytransfer.generate_invoice', '0', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(130, 'sales.paymentmethods.moneytransfer.invoice_status', 'pending', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(131, 'sales.paymentmethods.moneytransfer.order_status', 'pending', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(132, 'sales.paymentmethods.moneytransfer.mailing_address', '', 'default', 'Vi', '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(133, 'sales.paymentmethods.moneytransfer.active', '1', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(134, 'sales.paymentmethods.moneytransfer.sort', '2', NULL, NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(135, 'sales.paymentmethods.paypal_standard.title', 'PayPal', 'default', 'Vi', '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(136, 'sales.paymentmethods.paypal_standard.description', 'Chuẩn Paypal', 'default', 'Vi', '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(137, 'sales.paymentmethods.paypal_standard.business_account', 'ndhuy77@gmail.com', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(138, 'sales.paymentmethods.paypal_standard.active', '1', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(139, 'sales.paymentmethods.paypal_standard.sandbox', '1', 'default', NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(140, 'sales.paymentmethods.paypal_standard.sort', '1', NULL, NULL, '2023-10-09 16:31:22', '2023-10-09 16:31:22'),
(141, 'emails.configure.email_settings.sender_name', 'info@getpix.vn', 'default', NULL, '2023-10-09 16:33:22', '2023-10-09 16:33:22'),
(142, 'emails.configure.email_settings.shop_email_from', 'sales@getpix.vn', 'default', NULL, '2023-10-09 16:33:22', '2023-10-09 16:33:22'),
(143, 'emails.configure.email_settings.admin_name', 'Getpix', 'default', NULL, '2023-10-09 16:33:22', '2023-10-09 16:33:22'),
(144, 'emails.configure.email_settings.admin_email', 'int.vnus@gmail.com', 'default', NULL, '2023-10-09 16:33:22', '2023-10-09 16:33:22'),
(145, 'general.general.locale_options.weight_unit', 'kgs', 'CGE001', NULL, '2023-10-10 13:35:44', '2023-10-10 13:35:44'),
(146, 'general.content.shop.compare_option', '0', 'CGE001', 'Vi', '2023-10-10 13:36:01', '2023-10-10 13:36:01'),
(147, 'general.content.shop.wishlist_option', '0', 'CGE001', 'Vi', '2023-10-10 13:36:01', '2023-10-10 13:36:01'),
(148, 'general.content.shop.image_search', '0', 'CGE001', 'Vi', '2023-10-10 13:36:01', '2023-10-10 13:36:01'),
(149, 'general.content.footer.footer_content', '', 'CGE001', 'Vi', '2023-10-10 13:36:01', '2023-10-10 13:36:01'),
(150, 'general.content.footer.footer_toggle', '0', 'CGE001', 'Vi', '2023-10-10 13:36:01', '2023-10-10 13:36:01'),
(151, 'general.content.custom_scripts.custom_css', '', 'CGE001', NULL, '2023-10-10 13:36:01', '2023-10-10 13:36:01'),
(152, 'general.content.custom_scripts.custom_javascript', '', 'CGE001', NULL, '2023-10-10 13:36:01', '2023-10-10 13:36:01'),
(153, 'catalog.inventory.stock_options.backorders', '1', 'default', NULL, '2023-10-23 01:40:08', '2023-10-23 01:40:08'),
(154, 'customer.settings.wishlist.share', '1', NULL, NULL, '2023-11-19 08:23:21', '2023-11-19 08:23:21'),
(155, 'customer.settings.newsletter.subscription', '1', NULL, NULL, '2023-11-19 08:23:21', '2023-11-19 08:23:21'),
(156, 'customer.settings.email.verification', '1', NULL, NULL, '2023-11-19 08:23:21', '2023-11-19 08:23:21'),
(157, 'customer.captcha.credentials.site_key', '', 'default', NULL, '2023-11-19 08:23:36', '2023-11-19 08:23:36'),
(158, 'customer.captcha.credentials.secret_key', '', 'default', NULL, '2023-11-19 08:23:36', '2023-11-19 08:23:36'),
(159, 'customer.captcha.credentials.status', '1', 'default', NULL, '2023-11-19 08:23:36', '2023-11-19 08:23:36'),
(160, 'customer.address.requirements.country', '1', 'default', NULL, '2023-11-19 08:23:47', '2023-11-19 08:23:47'),
(161, 'customer.address.requirements.state', '1', 'default', NULL, '2023-11-19 08:23:47', '2023-11-19 08:23:47'),
(162, 'customer.address.requirements.postcode', '1', 'default', NULL, '2023-11-19 08:23:47', '2023-11-19 08:23:47'),
(163, 'customer.address.information.street_lines', '', 'default', NULL, '2023-11-19 08:23:47', '2023-11-19 08:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AX', 'Åland Islands'),
(3, 'AL', 'Albania'),
(4, 'DZ', 'Algeria'),
(5, 'AS', 'American Samoa'),
(6, 'AD', 'Andorra'),
(7, 'AO', 'Angola'),
(8, 'AI', 'Anguilla'),
(9, 'AQ', 'Antarctica'),
(10, 'AG', 'Antigua & Barbuda'),
(11, 'AR', 'Argentina'),
(12, 'AM', 'Armenia'),
(13, 'AW', 'Aruba'),
(14, 'AC', 'Ascension Island'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia & Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BR', 'Brazil'),
(32, 'IO', 'British Indian Ocean Territory'),
(33, 'VG', 'British Virgin Islands'),
(34, 'BN', 'Brunei'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CA', 'Canada'),
(41, 'IC', 'Canary Islands'),
(42, 'CV', 'Cape Verde'),
(43, 'BQ', 'Caribbean Netherlands'),
(44, 'KY', 'Cayman Islands'),
(45, 'CF', 'Central African Republic'),
(46, 'EA', 'Ceuta & Melilla'),
(47, 'TD', 'Chad'),
(48, 'CL', 'Chile'),
(49, 'CN', 'China'),
(50, 'CX', 'Christmas Island'),
(51, 'CC', 'Cocos (Keeling) Islands'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoros'),
(54, 'CG', 'Congo - Brazzaville'),
(55, 'CD', 'Congo - Kinshasa'),
(56, 'CK', 'Cook Islands'),
(57, 'CR', 'Costa Rica'),
(58, 'CI', 'Côte d’Ivoire'),
(59, 'HR', 'Croatia'),
(60, 'CU', 'Cuba'),
(61, 'CW', 'Curaçao'),
(62, 'CY', 'Cyprus'),
(63, 'CZ', 'Czechia'),
(64, 'DK', 'Denmark'),
(65, 'DG', 'Diego Garcia'),
(66, 'DJ', 'Djibouti'),
(67, 'DM', 'Dominica'),
(68, 'DO', 'Dominican Republic'),
(69, 'EC', 'Ecuador'),
(70, 'EG', 'Egypt'),
(71, 'SV', 'El Salvador'),
(72, 'GQ', 'Equatorial Guinea'),
(73, 'ER', 'Eritrea'),
(74, 'EE', 'Estonia'),
(75, 'ET', 'Ethiopia'),
(76, 'EZ', 'Eurozone'),
(77, 'FK', 'Falkland Islands'),
(78, 'FO', 'Faroe Islands'),
(79, 'FJ', 'Fiji'),
(80, 'FI', 'Finland'),
(81, 'FR', 'France'),
(82, 'GF', 'French Guiana'),
(83, 'PF', 'French Polynesia'),
(84, 'TF', 'French Southern Territories'),
(85, 'GA', 'Gabon'),
(86, 'GM', 'Gambia'),
(87, 'GE', 'Georgia'),
(88, 'DE', 'Germany'),
(89, 'GH', 'Ghana'),
(90, 'GI', 'Gibraltar'),
(91, 'GR', 'Greece'),
(92, 'GL', 'Greenland'),
(93, 'GD', 'Grenada'),
(94, 'GP', 'Guadeloupe'),
(95, 'GU', 'Guam'),
(96, 'GT', 'Guatemala'),
(97, 'GG', 'Guernsey'),
(98, 'GN', 'Guinea'),
(99, 'GW', 'Guinea-Bissau'),
(100, 'GY', 'Guyana'),
(101, 'HT', 'Haiti'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong SAR China'),
(104, 'HU', 'Hungary'),
(105, 'IS', 'Iceland'),
(106, 'IN', 'India'),
(107, 'ID', 'Indonesia'),
(108, 'IR', 'Iran'),
(109, 'IQ', 'Iraq'),
(110, 'IE', 'Ireland'),
(111, 'IM', 'Isle of Man'),
(112, 'IL', 'Israel'),
(113, 'IT', 'Italy'),
(114, 'JM', 'Jamaica'),
(115, 'JP', 'Japan'),
(116, 'JE', 'Jersey'),
(117, 'JO', 'Jordan'),
(118, 'KZ', 'Kazakhstan'),
(119, 'KE', 'Kenya'),
(120, 'KI', 'Kiribati'),
(121, 'XK', 'Kosovo'),
(122, 'KW', 'Kuwait'),
(123, 'KG', 'Kyrgyzstan'),
(124, 'LA', 'Laos'),
(125, 'LV', 'Latvia'),
(126, 'LB', 'Lebanon'),
(127, 'LS', 'Lesotho'),
(128, 'LR', 'Liberia'),
(129, 'LY', 'Libya'),
(130, 'LI', 'Liechtenstein'),
(131, 'LT', 'Lithuania'),
(132, 'LU', 'Luxembourg'),
(133, 'MO', 'Macau SAR China'),
(134, 'MK', 'Macedonia'),
(135, 'MG', 'Madagascar'),
(136, 'MW', 'Malawi'),
(137, 'MY', 'Malaysia'),
(138, 'MV', 'Maldives'),
(139, 'ML', 'Mali'),
(140, 'MT', 'Malta'),
(141, 'MH', 'Marshall Islands'),
(142, 'MQ', 'Martinique'),
(143, 'MR', 'Mauritania'),
(144, 'MU', 'Mauritius'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'Mexico'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldova'),
(149, 'MC', 'Monaco'),
(150, 'MN', 'Mongolia'),
(151, 'ME', 'Montenegro'),
(152, 'MS', 'Montserrat'),
(153, 'MA', 'Morocco'),
(154, 'MZ', 'Mozambique'),
(155, 'MM', 'Myanmar (Burma)'),
(156, 'NA', 'Namibia'),
(157, 'NR', 'Nauru'),
(158, 'NP', 'Nepal'),
(159, 'NL', 'Netherlands'),
(160, 'NC', 'New Caledonia'),
(161, 'NZ', 'New Zealand'),
(162, 'NI', 'Nicaragua'),
(163, 'NE', 'Niger'),
(164, 'NG', 'Nigeria'),
(165, 'NU', 'Niue'),
(166, 'NF', 'Norfolk Island'),
(167, 'KP', 'North Korea'),
(168, 'MP', 'Northern Mariana Islands'),
(169, 'NO', 'Norway'),
(170, 'OM', 'Oman'),
(171, 'PK', 'Pakistan'),
(172, 'PW', 'Palau'),
(173, 'PS', 'Palestinian Territories'),
(174, 'PA', 'Panama'),
(175, 'PG', 'Papua New Guinea'),
(176, 'PY', 'Paraguay'),
(177, 'PE', 'Peru'),
(178, 'PH', 'Philippines'),
(179, 'PN', 'Pitcairn Islands'),
(180, 'PL', 'Poland'),
(181, 'PT', 'Portugal'),
(182, 'PR', 'Puerto Rico'),
(183, 'QA', 'Qatar'),
(184, 'RE', 'Réunion'),
(185, 'RO', 'Romania'),
(186, 'RU', 'Russia'),
(187, 'RW', 'Rwanda'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'São Tomé & Príncipe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SX', 'Sint Maarten'),
(198, 'SK', 'Slovakia'),
(199, 'SI', 'Slovenia'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia & South Sandwich Islands'),
(204, 'KR', 'South Korea'),
(205, 'SS', 'South Sudan'),
(206, 'ES', 'Spain'),
(207, 'LK', 'Sri Lanka'),
(208, 'BL', 'St. Barthélemy'),
(209, 'SH', 'St. Helena'),
(210, 'KN', 'St. Kitts & Nevis'),
(211, 'LC', 'St. Lucia'),
(212, 'MF', 'St. Martin'),
(213, 'PM', 'St. Pierre & Miquelon'),
(214, 'VC', 'St. Vincent & Grenadines'),
(215, 'SD', 'Sudan'),
(216, 'SR', 'Suriname'),
(217, 'SJ', 'Svalbard & Jan Mayen'),
(218, 'SZ', 'Swaziland'),
(219, 'SE', 'Sweden'),
(220, 'CH', 'Switzerland'),
(221, 'SY', 'Syria'),
(222, 'TW', 'Taiwan'),
(223, 'TJ', 'Tajikistan'),
(224, 'TZ', 'Tanzania'),
(225, 'TH', 'Thailand'),
(226, 'TL', 'Timor-Leste'),
(227, 'TG', 'Togo'),
(228, 'TK', 'Tokelau'),
(229, 'TO', 'Tonga'),
(230, 'TT', 'Trinidad & Tobago'),
(231, 'TA', 'Tristan da Cunha'),
(232, 'TN', 'Tunisia'),
(233, 'TR', 'Turkey'),
(234, 'TM', 'Turkmenistan'),
(235, 'TC', 'Turks & Caicos Islands'),
(236, 'TV', 'Tuvalu'),
(237, 'UM', 'U.S. Outlying Islands'),
(238, 'VI', 'U.S. Virgin Islands'),
(239, 'UG', 'Uganda'),
(240, 'UA', 'Ukraine'),
(241, 'AE', 'United Arab Emirates'),
(242, 'GB', 'United Kingdom'),
(243, 'UN', 'United Nations'),
(244, 'US', 'United States'),
(245, 'UY', 'Uruguay'),
(246, 'UZ', 'Uzbekistan'),
(247, 'VU', 'Vanuatu'),
(248, 'VA', 'Vatican City'),
(249, 'VE', 'Venezuela'),
(250, 'VN', 'Vietnam'),
(251, 'WF', 'Wallis & Futuna'),
(252, 'EH', 'Western Sahara'),
(253, 'YE', 'Yemen'),
(254, 'ZM', 'Zambia'),
(255, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `country_states`
--

CREATE TABLE `country_states` (
  `id` int UNSIGNED NOT NULL,
  `country_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `country_states`
--

INSERT INTO `country_states` (`id`, `country_code`, `code`, `default_name`, `country_id`) VALUES
(1, 'US', 'AL', 'Alabama', 244),
(2, 'US', 'AK', 'Alaska', 244),
(3, 'US', 'AS', 'American Samoa', 244),
(4, 'US', 'AZ', 'Arizona', 244),
(5, 'US', 'AR', 'Arkansas', 244),
(6, 'US', 'AE', 'Armed Forces Africa', 244),
(7, 'US', 'AA', 'Armed Forces Americas', 244),
(8, 'US', 'AE', 'Armed Forces Canada', 244),
(9, 'US', 'AE', 'Armed Forces Europe', 244),
(10, 'US', 'AE', 'Armed Forces Middle East', 244),
(11, 'US', 'AP', 'Armed Forces Pacific', 244),
(12, 'US', 'CA', 'California', 244),
(13, 'US', 'CO', 'Colorado', 244),
(14, 'US', 'CT', 'Connecticut', 244),
(15, 'US', 'DE', 'Delaware', 244),
(16, 'US', 'DC', 'District of Columbia', 244),
(17, 'US', 'FM', 'Federated States Of Micronesia', 244),
(18, 'US', 'FL', 'Florida', 244),
(19, 'US', 'GA', 'Georgia', 244),
(20, 'US', 'GU', 'Guam', 244),
(21, 'US', 'HI', 'Hawaii', 244),
(22, 'US', 'ID', 'Idaho', 244),
(23, 'US', 'IL', 'Illinois', 244),
(24, 'US', 'IN', 'Indiana', 244),
(25, 'US', 'IA', 'Iowa', 244),
(26, 'US', 'KS', 'Kansas', 244),
(27, 'US', 'KY', 'Kentucky', 244),
(28, 'US', 'LA', 'Louisiana', 244),
(29, 'US', 'ME', 'Maine', 244),
(30, 'US', 'MH', 'Marshall Islands', 244),
(31, 'US', 'MD', 'Maryland', 244),
(32, 'US', 'MA', 'Massachusetts', 244),
(33, 'US', 'MI', 'Michigan', 244),
(34, 'US', 'MN', 'Minnesota', 244),
(35, 'US', 'MS', 'Mississippi', 244),
(36, 'US', 'MO', 'Missouri', 244),
(37, 'US', 'MT', 'Montana', 244),
(38, 'US', 'NE', 'Nebraska', 244),
(39, 'US', 'NV', 'Nevada', 244),
(40, 'US', 'NH', 'New Hampshire', 244),
(41, 'US', 'NJ', 'New Jersey', 244),
(42, 'US', 'NM', 'New Mexico', 244),
(43, 'US', 'NY', 'New York', 244),
(44, 'US', 'NC', 'North Carolina', 244),
(45, 'US', 'ND', 'North Dakota', 244),
(46, 'US', 'MP', 'Northern Mariana Islands', 244),
(47, 'US', 'OH', 'Ohio', 244),
(48, 'US', 'OK', 'Oklahoma', 244),
(49, 'US', 'OR', 'Oregon', 244),
(50, 'US', 'PW', 'Palau', 244),
(51, 'US', 'PA', 'Pennsylvania', 244),
(52, 'US', 'PR', 'Puerto Rico', 244),
(53, 'US', 'RI', 'Rhode Island', 244),
(54, 'US', 'SC', 'South Carolina', 244),
(55, 'US', 'SD', 'South Dakota', 244),
(56, 'US', 'TN', 'Tennessee', 244),
(57, 'US', 'TX', 'Texas', 244),
(58, 'US', 'UT', 'Utah', 244),
(59, 'US', 'VT', 'Vermont', 244),
(60, 'US', 'VI', 'Virgin Islands', 244),
(61, 'US', 'VA', 'Virginia', 244),
(62, 'US', 'WA', 'Washington', 244),
(63, 'US', 'WV', 'West Virginia', 244),
(64, 'US', 'WI', 'Wisconsin', 244),
(65, 'US', 'WY', 'Wyoming', 244),
(66, 'CA', 'AB', 'Alberta', 40),
(67, 'CA', 'BC', 'British Columbia', 40),
(68, 'CA', 'MB', 'Manitoba', 40),
(69, 'CA', 'NL', 'Newfoundland and Labrador', 40),
(70, 'CA', 'NB', 'New Brunswick', 40),
(71, 'CA', 'NS', 'Nova Scotia', 40),
(72, 'CA', 'NT', 'Northwest Territories', 40),
(73, 'CA', 'NU', 'Nunavut', 40),
(74, 'CA', 'ON', 'Ontario', 40),
(75, 'CA', 'PE', 'Prince Edward Island', 40),
(76, 'CA', 'QC', 'Quebec', 40),
(77, 'CA', 'SK', 'Saskatchewan', 40),
(78, 'CA', 'YT', 'Yukon Territory', 40),
(79, 'DE', 'NDS', 'Niedersachsen', 88),
(80, 'DE', 'BAW', 'Baden-Württemberg', 88),
(81, 'DE', 'BAY', 'Bayern', 88),
(82, 'DE', 'BER', 'Berlin', 88),
(83, 'DE', 'BRG', 'Brandenburg', 88),
(84, 'DE', 'BRE', 'Bremen', 88),
(85, 'DE', 'HAM', 'Hamburg', 88),
(86, 'DE', 'HES', 'Hessen', 88),
(87, 'DE', 'MEC', 'Mecklenburg-Vorpommern', 88),
(88, 'DE', 'NRW', 'Nordrhein-Westfalen', 88),
(89, 'DE', 'RHE', 'Rheinland-Pfalz', 88),
(90, 'DE', 'SAR', 'Saarland', 88),
(91, 'DE', 'SAS', 'Sachsen', 88),
(92, 'DE', 'SAC', 'Sachsen-Anhalt', 88),
(93, 'DE', 'SCN', 'Schleswig-Holstein', 88),
(94, 'DE', 'THE', 'Thüringen', 88),
(95, 'AT', 'WI', 'Wien', 16),
(96, 'AT', 'NO', 'Niederösterreich', 16),
(97, 'AT', 'OO', 'Oberösterreich', 16),
(98, 'AT', 'SB', 'Salzburg', 16),
(99, 'AT', 'KN', 'Kärnten', 16),
(100, 'AT', 'ST', 'Steiermark', 16),
(101, 'AT', 'TI', 'Tirol', 16),
(102, 'AT', 'BL', 'Burgenland', 16),
(103, 'AT', 'VB', 'Vorarlberg', 16),
(104, 'CH', 'AG', 'Aargau', 220),
(105, 'CH', 'AI', 'Appenzell Innerrhoden', 220),
(106, 'CH', 'AR', 'Appenzell Ausserrhoden', 220),
(107, 'CH', 'BE', 'Bern', 220),
(108, 'CH', 'BL', 'Basel-Landschaft', 220),
(109, 'CH', 'BS', 'Basel-Stadt', 220),
(110, 'CH', 'FR', 'Freiburg', 220),
(111, 'CH', 'GE', 'Genf', 220),
(112, 'CH', 'GL', 'Glarus', 220),
(113, 'CH', 'GR', 'Graubünden', 220),
(114, 'CH', 'JU', 'Jura', 220),
(115, 'CH', 'LU', 'Luzern', 220),
(116, 'CH', 'NE', 'Neuenburg', 220),
(117, 'CH', 'NW', 'Nidwalden', 220),
(118, 'CH', 'OW', 'Obwalden', 220),
(119, 'CH', 'SG', 'St. Gallen', 220),
(120, 'CH', 'SH', 'Schaffhausen', 220),
(121, 'CH', 'SO', 'Solothurn', 220),
(122, 'CH', 'SZ', 'Schwyz', 220),
(123, 'CH', 'TG', 'Thurgau', 220),
(124, 'CH', 'TI', 'Tessin', 220),
(125, 'CH', 'UR', 'Uri', 220),
(126, 'CH', 'VD', 'Waadt', 220),
(127, 'CH', 'VS', 'Wallis', 220),
(128, 'CH', 'ZG', 'Zug', 220),
(129, 'CH', 'ZH', 'Zürich', 220),
(130, 'ES', 'A Coruсa', 'A Coruña', 206),
(131, 'ES', 'Alava', 'Alava', 206),
(132, 'ES', 'Albacete', 'Albacete', 206),
(133, 'ES', 'Alicante', 'Alicante', 206),
(134, 'ES', 'Almeria', 'Almeria', 206),
(135, 'ES', 'Asturias', 'Asturias', 206),
(136, 'ES', 'Avila', 'Avila', 206),
(137, 'ES', 'Badajoz', 'Badajoz', 206),
(138, 'ES', 'Baleares', 'Baleares', 206),
(139, 'ES', 'Barcelona', 'Barcelona', 206),
(140, 'ES', 'Burgos', 'Burgos', 206),
(141, 'ES', 'Caceres', 'Caceres', 206),
(142, 'ES', 'Cadiz', 'Cadiz', 206),
(143, 'ES', 'Cantabria', 'Cantabria', 206),
(144, 'ES', 'Castellon', 'Castellon', 206),
(145, 'ES', 'Ceuta', 'Ceuta', 206),
(146, 'ES', 'Ciudad Real', 'Ciudad Real', 206),
(147, 'ES', 'Cordoba', 'Cordoba', 206),
(148, 'ES', 'Cuenca', 'Cuenca', 206),
(149, 'ES', 'Girona', 'Girona', 206),
(150, 'ES', 'Granada', 'Granada', 206),
(151, 'ES', 'Guadalajara', 'Guadalajara', 206),
(152, 'ES', 'Guipuzcoa', 'Guipuzcoa', 206),
(153, 'ES', 'Huelva', 'Huelva', 206),
(154, 'ES', 'Huesca', 'Huesca', 206),
(155, 'ES', 'Jaen', 'Jaen', 206),
(156, 'ES', 'La Rioja', 'La Rioja', 206),
(157, 'ES', 'Las Palmas', 'Las Palmas', 206),
(158, 'ES', 'Leon', 'Leon', 206),
(159, 'ES', 'Lleida', 'Lleida', 206),
(160, 'ES', 'Lugo', 'Lugo', 206),
(161, 'ES', 'Madrid', 'Madrid', 206),
(162, 'ES', 'Malaga', 'Malaga', 206),
(163, 'ES', 'Melilla', 'Melilla', 206),
(164, 'ES', 'Murcia', 'Murcia', 206),
(165, 'ES', 'Navarra', 'Navarra', 206),
(166, 'ES', 'Ourense', 'Ourense', 206),
(167, 'ES', 'Palencia', 'Palencia', 206),
(168, 'ES', 'Pontevedra', 'Pontevedra', 206),
(169, 'ES', 'Salamanca', 'Salamanca', 206),
(170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife', 206),
(171, 'ES', 'Segovia', 'Segovia', 206),
(172, 'ES', 'Sevilla', 'Sevilla', 206),
(173, 'ES', 'Soria', 'Soria', 206),
(174, 'ES', 'Tarragona', 'Tarragona', 206),
(175, 'ES', 'Teruel', 'Teruel', 206),
(176, 'ES', 'Toledo', 'Toledo', 206),
(177, 'ES', 'Valencia', 'Valencia', 206),
(178, 'ES', 'Valladolid', 'Valladolid', 206),
(179, 'ES', 'Vizcaya', 'Vizcaya', 206),
(180, 'ES', 'Zamora', 'Zamora', 206),
(181, 'ES', 'Zaragoza', 'Zaragoza', 206),
(182, 'FR', '1', 'Ain', 81),
(183, 'FR', '2', 'Aisne', 81),
(184, 'FR', '3', 'Allier', 81),
(185, 'FR', '4', 'Alpes-de-Haute-Provence', 81),
(186, 'FR', '5', 'Hautes-Alpes', 81),
(187, 'FR', '6', 'Alpes-Maritimes', 81),
(188, 'FR', '7', 'Ardèche', 81),
(189, 'FR', '8', 'Ardennes', 81),
(190, 'FR', '9', 'Ariège', 81),
(191, 'FR', '10', 'Aube', 81),
(192, 'FR', '11', 'Aude', 81),
(193, 'FR', '12', 'Aveyron', 81),
(194, 'FR', '13', 'Bouches-du-Rhône', 81),
(195, 'FR', '14', 'Calvados', 81),
(196, 'FR', '15', 'Cantal', 81),
(197, 'FR', '16', 'Charente', 81),
(198, 'FR', '17', 'Charente-Maritime', 81),
(199, 'FR', '18', 'Cher', 81),
(200, 'FR', '19', 'Corrèze', 81),
(201, 'FR', '2A', 'Corse-du-Sud', 81),
(202, 'FR', '2B', 'Haute-Corse', 81),
(203, 'FR', '21', 'Côte-d\'Or', 81),
(204, 'FR', '22', 'Côtes-d\'Armor', 81),
(205, 'FR', '23', 'Creuse', 81),
(206, 'FR', '24', 'Dordogne', 81),
(207, 'FR', '25', 'Doubs', 81),
(208, 'FR', '26', 'Drôme', 81),
(209, 'FR', '27', 'Eure', 81),
(210, 'FR', '28', 'Eure-et-Loir', 81),
(211, 'FR', '29', 'Finistère', 81),
(212, 'FR', '30', 'Gard', 81),
(213, 'FR', '31', 'Haute-Garonne', 81),
(214, 'FR', '32', 'Gers', 81),
(215, 'FR', '33', 'Gironde', 81),
(216, 'FR', '34', 'Hérault', 81),
(217, 'FR', '35', 'Ille-et-Vilaine', 81),
(218, 'FR', '36', 'Indre', 81),
(219, 'FR', '37', 'Indre-et-Loire', 81),
(220, 'FR', '38', 'Isère', 81),
(221, 'FR', '39', 'Jura', 81),
(222, 'FR', '40', 'Landes', 81),
(223, 'FR', '41', 'Loir-et-Cher', 81),
(224, 'FR', '42', 'Loire', 81),
(225, 'FR', '43', 'Haute-Loire', 81),
(226, 'FR', '44', 'Loire-Atlantique', 81),
(227, 'FR', '45', 'Loiret', 81),
(228, 'FR', '46', 'Lot', 81),
(229, 'FR', '47', 'Lot-et-Garonne', 81),
(230, 'FR', '48', 'Lozère', 81),
(231, 'FR', '49', 'Maine-et-Loire', 81),
(232, 'FR', '50', 'Manche', 81),
(233, 'FR', '51', 'Marne', 81),
(234, 'FR', '52', 'Haute-Marne', 81),
(235, 'FR', '53', 'Mayenne', 81),
(236, 'FR', '54', 'Meurthe-et-Moselle', 81),
(237, 'FR', '55', 'Meuse', 81),
(238, 'FR', '56', 'Morbihan', 81),
(239, 'FR', '57', 'Moselle', 81),
(240, 'FR', '58', 'Nièvre', 81),
(241, 'FR', '59', 'Nord', 81),
(242, 'FR', '60', 'Oise', 81),
(243, 'FR', '61', 'Orne', 81),
(244, 'FR', '62', 'Pas-de-Calais', 81),
(245, 'FR', '63', 'Puy-de-Dôme', 81),
(246, 'FR', '64', 'Pyrénées-Atlantiques', 81),
(247, 'FR', '65', 'Hautes-Pyrénées', 81),
(248, 'FR', '66', 'Pyrénées-Orientales', 81),
(249, 'FR', '67', 'Bas-Rhin', 81),
(250, 'FR', '68', 'Haut-Rhin', 81),
(251, 'FR', '69', 'Rhône', 81),
(252, 'FR', '70', 'Haute-Saône', 81),
(253, 'FR', '71', 'Saône-et-Loire', 81),
(254, 'FR', '72', 'Sarthe', 81),
(255, 'FR', '73', 'Savoie', 81),
(256, 'FR', '74', 'Haute-Savoie', 81),
(257, 'FR', '75', 'Paris', 81),
(258, 'FR', '76', 'Seine-Maritime', 81),
(259, 'FR', '77', 'Seine-et-Marne', 81),
(260, 'FR', '78', 'Yvelines', 81),
(261, 'FR', '79', 'Deux-Sèvres', 81),
(262, 'FR', '80', 'Somme', 81),
(263, 'FR', '81', 'Tarn', 81),
(264, 'FR', '82', 'Tarn-et-Garonne', 81),
(265, 'FR', '83', 'Var', 81),
(266, 'FR', '84', 'Vaucluse', 81),
(267, 'FR', '85', 'Vendée', 81),
(268, 'FR', '86', 'Vienne', 81),
(269, 'FR', '87', 'Haute-Vienne', 81),
(270, 'FR', '88', 'Vosges', 81),
(271, 'FR', '89', 'Yonne', 81),
(272, 'FR', '90', 'Territoire-de-Belfort', 81),
(273, 'FR', '91', 'Essonne', 81),
(274, 'FR', '92', 'Hauts-de-Seine', 81),
(275, 'FR', '93', 'Seine-Saint-Denis', 81),
(276, 'FR', '94', 'Val-de-Marne', 81),
(277, 'FR', '95', 'Val-d\'Oise', 81),
(278, 'RO', 'AB', 'Alba', 185),
(279, 'RO', 'AR', 'Arad', 185),
(280, 'RO', 'AG', 'Argeş', 185),
(281, 'RO', 'BC', 'Bacău', 185),
(282, 'RO', 'BH', 'Bihor', 185),
(283, 'RO', 'BN', 'Bistriţa-Năsăud', 185),
(284, 'RO', 'BT', 'Botoşani', 185),
(285, 'RO', 'BV', 'Braşov', 185),
(286, 'RO', 'BR', 'Brăila', 185),
(287, 'RO', 'B', 'Bucureşti', 185),
(288, 'RO', 'BZ', 'Buzău', 185),
(289, 'RO', 'CS', 'Caraş-Severin', 185),
(290, 'RO', 'CL', 'Călăraşi', 185),
(291, 'RO', 'CJ', 'Cluj', 185),
(292, 'RO', 'CT', 'Constanţa', 185),
(293, 'RO', 'CV', 'Covasna', 185),
(294, 'RO', 'DB', 'Dâmboviţa', 185),
(295, 'RO', 'DJ', 'Dolj', 185),
(296, 'RO', 'GL', 'Galaţi', 185),
(297, 'RO', 'GR', 'Giurgiu', 185),
(298, 'RO', 'GJ', 'Gorj', 185),
(299, 'RO', 'HR', 'Harghita', 185),
(300, 'RO', 'HD', 'Hunedoara', 185),
(301, 'RO', 'IL', 'Ialomiţa', 185),
(302, 'RO', 'IS', 'Iaşi', 185),
(303, 'RO', 'IF', 'Ilfov', 185),
(304, 'RO', 'MM', 'Maramureş', 185),
(305, 'RO', 'MH', 'Mehedinţi', 185),
(306, 'RO', 'MS', 'Mureş', 185),
(307, 'RO', 'NT', 'Neamţ', 185),
(308, 'RO', 'OT', 'Olt', 185),
(309, 'RO', 'PH', 'Prahova', 185),
(310, 'RO', 'SM', 'Satu-Mare', 185),
(311, 'RO', 'SJ', 'Sălaj', 185),
(312, 'RO', 'SB', 'Sibiu', 185),
(313, 'RO', 'SV', 'Suceava', 185),
(314, 'RO', 'TR', 'Teleorman', 185),
(315, 'RO', 'TM', 'Timiş', 185),
(316, 'RO', 'TL', 'Tulcea', 185),
(317, 'RO', 'VS', 'Vaslui', 185),
(318, 'RO', 'VL', 'Vâlcea', 185),
(319, 'RO', 'VN', 'Vrancea', 185),
(320, 'FI', 'Lappi', 'Lappi', 80),
(321, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa', 80),
(322, 'FI', 'Kainuu', 'Kainuu', 80),
(323, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala', 80),
(324, 'FI', 'Pohjois-Savo', 'Pohjois-Savo', 80),
(325, 'FI', 'Etelä-Savo', 'Etelä-Savo', 80),
(326, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa', 80),
(327, 'FI', 'Pohjanmaa', 'Pohjanmaa', 80),
(328, 'FI', 'Pirkanmaa', 'Pirkanmaa', 80),
(329, 'FI', 'Satakunta', 'Satakunta', 80),
(330, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa', 80),
(331, 'FI', 'Keski-Suomi', 'Keski-Suomi', 80),
(332, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi', 80),
(333, 'FI', 'Etelä-Karjala', 'Etelä-Karjala', 80),
(334, 'FI', 'Päijät-Häme', 'Päijät-Häme', 80),
(335, 'FI', 'Kanta-Häme', 'Kanta-Häme', 80),
(336, 'FI', 'Uusimaa', 'Uusimaa', 80),
(337, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa', 80),
(338, 'FI', 'Kymenlaakso', 'Kymenlaakso', 80),
(339, 'FI', 'Ahvenanmaa', 'Ahvenanmaa', 80),
(340, 'EE', 'EE-37', 'Harjumaa', 74),
(341, 'EE', 'EE-39', 'Hiiumaa', 74),
(342, 'EE', 'EE-44', 'Ida-Virumaa', 74),
(343, 'EE', 'EE-49', 'Jõgevamaa', 74),
(344, 'EE', 'EE-51', 'Järvamaa', 74),
(345, 'EE', 'EE-57', 'Läänemaa', 74),
(346, 'EE', 'EE-59', 'Lääne-Virumaa', 74),
(347, 'EE', 'EE-65', 'Põlvamaa', 74),
(348, 'EE', 'EE-67', 'Pärnumaa', 74),
(349, 'EE', 'EE-70', 'Raplamaa', 74),
(350, 'EE', 'EE-74', 'Saaremaa', 74),
(351, 'EE', 'EE-78', 'Tartumaa', 74),
(352, 'EE', 'EE-82', 'Valgamaa', 74),
(353, 'EE', 'EE-84', 'Viljandimaa', 74),
(354, 'EE', 'EE-86', 'Võrumaa', 74),
(355, 'LV', 'LV-DGV', 'Daugavpils', 125),
(356, 'LV', 'LV-JEL', 'Jelgava', 125),
(357, 'LV', 'Jēkabpils', 'Jēkabpils', 125),
(358, 'LV', 'LV-JUR', 'Jūrmala', 125),
(359, 'LV', 'LV-LPX', 'Liepāja', 125),
(360, 'LV', 'LV-LE', 'Liepājas novads', 125),
(361, 'LV', 'LV-REZ', 'Rēzekne', 125),
(362, 'LV', 'LV-RIX', 'Rīga', 125),
(363, 'LV', 'LV-RI', 'Rīgas novads', 125),
(364, 'LV', 'Valmiera', 'Valmiera', 125),
(365, 'LV', 'LV-VEN', 'Ventspils', 125),
(366, 'LV', 'Aglonas novads', 'Aglonas novads', 125),
(367, 'LV', 'LV-AI', 'Aizkraukles novads', 125),
(368, 'LV', 'Aizputes novads', 'Aizputes novads', 125),
(369, 'LV', 'Aknīstes novads', 'Aknīstes novads', 125),
(370, 'LV', 'Alojas novads', 'Alojas novads', 125),
(371, 'LV', 'Alsungas novads', 'Alsungas novads', 125),
(372, 'LV', 'LV-AL', 'Alūksnes novads', 125),
(373, 'LV', 'Amatas novads', 'Amatas novads', 125),
(374, 'LV', 'Apes novads', 'Apes novads', 125),
(375, 'LV', 'Auces novads', 'Auces novads', 125),
(376, 'LV', 'Babītes novads', 'Babītes novads', 125),
(377, 'LV', 'Baldones novads', 'Baldones novads', 125),
(378, 'LV', 'Baltinavas novads', 'Baltinavas novads', 125),
(379, 'LV', 'LV-BL', 'Balvu novads', 125),
(380, 'LV', 'LV-BU', 'Bauskas novads', 125),
(381, 'LV', 'Beverīnas novads', 'Beverīnas novads', 125),
(382, 'LV', 'Brocēnu novads', 'Brocēnu novads', 125),
(383, 'LV', 'Burtnieku novads', 'Burtnieku novads', 125),
(384, 'LV', 'Carnikavas novads', 'Carnikavas novads', 125),
(385, 'LV', 'Cesvaines novads', 'Cesvaines novads', 125),
(386, 'LV', 'Ciblas novads', 'Ciblas novads', 125),
(387, 'LV', 'LV-CE', 'Cēsu novads', 125),
(388, 'LV', 'Dagdas novads', 'Dagdas novads', 125),
(389, 'LV', 'LV-DA', 'Daugavpils novads', 125),
(390, 'LV', 'LV-DO', 'Dobeles novads', 125),
(391, 'LV', 'Dundagas novads', 'Dundagas novads', 125),
(392, 'LV', 'Durbes novads', 'Durbes novads', 125),
(393, 'LV', 'Engures novads', 'Engures novads', 125),
(394, 'LV', 'Garkalnes novads', 'Garkalnes novads', 125),
(395, 'LV', 'Grobiņas novads', 'Grobiņas novads', 125),
(396, 'LV', 'LV-GU', 'Gulbenes novads', 125),
(397, 'LV', 'Iecavas novads', 'Iecavas novads', 125),
(398, 'LV', 'Ikšķiles novads', 'Ikšķiles novads', 125),
(399, 'LV', 'Ilūkstes novads', 'Ilūkstes novads', 125),
(400, 'LV', 'Inčukalna novads', 'Inčukalna novads', 125),
(401, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads', 125),
(402, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads', 125),
(403, 'LV', 'Jaunpils novads', 'Jaunpils novads', 125),
(404, 'LV', 'LV-JL', 'Jelgavas novads', 125),
(405, 'LV', 'LV-JK', 'Jēkabpils novads', 125),
(406, 'LV', 'Kandavas novads', 'Kandavas novads', 125),
(407, 'LV', 'Kokneses novads', 'Kokneses novads', 125),
(408, 'LV', 'Krimuldas novads', 'Krimuldas novads', 125),
(409, 'LV', 'Krustpils novads', 'Krustpils novads', 125),
(410, 'LV', 'LV-KR', 'Krāslavas novads', 125),
(411, 'LV', 'LV-KU', 'Kuldīgas novads', 125),
(412, 'LV', 'Kārsavas novads', 'Kārsavas novads', 125),
(413, 'LV', 'Lielvārdes novads', 'Lielvārdes novads', 125),
(414, 'LV', 'LV-LM', 'Limbažu novads', 125),
(415, 'LV', 'Lubānas novads', 'Lubānas novads', 125),
(416, 'LV', 'LV-LU', 'Ludzas novads', 125),
(417, 'LV', 'Līgatnes novads', 'Līgatnes novads', 125),
(418, 'LV', 'Līvānu novads', 'Līvānu novads', 125),
(419, 'LV', 'LV-MA', 'Madonas novads', 125),
(420, 'LV', 'Mazsalacas novads', 'Mazsalacas novads', 125),
(421, 'LV', 'Mālpils novads', 'Mālpils novads', 125),
(422, 'LV', 'Mārupes novads', 'Mārupes novads', 125),
(423, 'LV', 'Naukšēnu novads', 'Naukšēnu novads', 125),
(424, 'LV', 'Neretas novads', 'Neretas novads', 125),
(425, 'LV', 'Nīcas novads', 'Nīcas novads', 125),
(426, 'LV', 'LV-OG', 'Ogres novads', 125),
(427, 'LV', 'Olaines novads', 'Olaines novads', 125),
(428, 'LV', 'Ozolnieku novads', 'Ozolnieku novads', 125),
(429, 'LV', 'LV-PR', 'Preiļu novads', 125),
(430, 'LV', 'Priekules novads', 'Priekules novads', 125),
(431, 'LV', 'Priekuļu novads', 'Priekuļu novads', 125),
(432, 'LV', 'Pārgaujas novads', 'Pārgaujas novads', 125),
(433, 'LV', 'Pāvilostas novads', 'Pāvilostas novads', 125),
(434, 'LV', 'Pļaviņu novads', 'Pļaviņu novads', 125),
(435, 'LV', 'Raunas novads', 'Raunas novads', 125),
(436, 'LV', 'Riebiņu novads', 'Riebiņu novads', 125),
(437, 'LV', 'Rojas novads', 'Rojas novads', 125),
(438, 'LV', 'Ropažu novads', 'Ropažu novads', 125),
(439, 'LV', 'Rucavas novads', 'Rucavas novads', 125),
(440, 'LV', 'Rugāju novads', 'Rugāju novads', 125),
(441, 'LV', 'Rundāles novads', 'Rundāles novads', 125),
(442, 'LV', 'LV-RE', 'Rēzeknes novads', 125),
(443, 'LV', 'Rūjienas novads', 'Rūjienas novads', 125),
(444, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads', 125),
(445, 'LV', 'Salas novads', 'Salas novads', 125),
(446, 'LV', 'Salaspils novads', 'Salaspils novads', 125),
(447, 'LV', 'LV-SA', 'Saldus novads', 125),
(448, 'LV', 'Saulkrastu novads', 'Saulkrastu novads', 125),
(449, 'LV', 'Siguldas novads', 'Siguldas novads', 125),
(450, 'LV', 'Skrundas novads', 'Skrundas novads', 125),
(451, 'LV', 'Skrīveru novads', 'Skrīveru novads', 125),
(452, 'LV', 'Smiltenes novads', 'Smiltenes novads', 125),
(453, 'LV', 'Stopiņu novads', 'Stopiņu novads', 125),
(454, 'LV', 'Strenču novads', 'Strenču novads', 125),
(455, 'LV', 'Sējas novads', 'Sējas novads', 125),
(456, 'LV', 'LV-TA', 'Talsu novads', 125),
(457, 'LV', 'LV-TU', 'Tukuma novads', 125),
(458, 'LV', 'Tērvetes novads', 'Tērvetes novads', 125),
(459, 'LV', 'Vaiņodes novads', 'Vaiņodes novads', 125),
(460, 'LV', 'LV-VK', 'Valkas novads', 125),
(461, 'LV', 'LV-VM', 'Valmieras novads', 125),
(462, 'LV', 'Varakļānu novads', 'Varakļānu novads', 125),
(463, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads', 125),
(464, 'LV', 'Vecumnieku novads', 'Vecumnieku novads', 125),
(465, 'LV', 'LV-VE', 'Ventspils novads', 125),
(466, 'LV', 'Viesītes novads', 'Viesītes novads', 125),
(467, 'LV', 'Viļakas novads', 'Viļakas novads', 125),
(468, 'LV', 'Viļānu novads', 'Viļānu novads', 125),
(469, 'LV', 'Vārkavas novads', 'Vārkavas novads', 125),
(470, 'LV', 'Zilupes novads', 'Zilupes novads', 125),
(471, 'LV', 'Ādažu novads', 'Ādažu novads', 125),
(472, 'LV', 'Ērgļu novads', 'Ērgļu novads', 125),
(473, 'LV', 'Ķeguma novads', 'Ķeguma novads', 125),
(474, 'LV', 'Ķekavas novads', 'Ķekavas novads', 125),
(475, 'LT', 'LT-AL', 'Alytaus Apskritis', 131),
(476, 'LT', 'LT-KU', 'Kauno Apskritis', 131),
(477, 'LT', 'LT-KL', 'Klaipėdos Apskritis', 131),
(478, 'LT', 'LT-MR', 'Marijampolės Apskritis', 131),
(479, 'LT', 'LT-PN', 'Panevėžio Apskritis', 131),
(480, 'LT', 'LT-SA', 'Šiaulių Apskritis', 131),
(481, 'LT', 'LT-TA', 'Tauragės Apskritis', 131),
(482, 'LT', 'LT-TE', 'Telšių Apskritis', 131),
(483, 'LT', 'LT-UT', 'Utenos Apskritis', 131),
(484, 'LT', 'LT-VL', 'Vilniaus Apskritis', 131),
(485, 'BR', 'AC', 'Acre', 31),
(486, 'BR', 'AL', 'Alagoas', 31),
(487, 'BR', 'AP', 'Amapá', 31),
(488, 'BR', 'AM', 'Amazonas', 31),
(489, 'BR', 'BA', 'Bahia', 31),
(490, 'BR', 'CE', 'Ceará', 31),
(491, 'BR', 'ES', 'Espírito Santo', 31),
(492, 'BR', 'GO', 'Goiás', 31),
(493, 'BR', 'MA', 'Maranhão', 31),
(494, 'BR', 'MT', 'Mato Grosso', 31),
(495, 'BR', 'MS', 'Mato Grosso do Sul', 31),
(496, 'BR', 'MG', 'Minas Gerais', 31),
(497, 'BR', 'PA', 'Pará', 31),
(498, 'BR', 'PB', 'Paraíba', 31),
(499, 'BR', 'PR', 'Paraná', 31),
(500, 'BR', 'PE', 'Pernambuco', 31),
(501, 'BR', 'PI', 'Piauí', 31),
(502, 'BR', 'RJ', 'Rio de Janeiro', 31),
(503, 'BR', 'RN', 'Rio Grande do Norte', 31),
(504, 'BR', 'RS', 'Rio Grande do Sul', 31),
(505, 'BR', 'RO', 'Rondônia', 31),
(506, 'BR', 'RR', 'Roraima', 31),
(507, 'BR', 'SC', 'Santa Catarina', 31),
(508, 'BR', 'SP', 'São Paulo', 31),
(509, 'BR', 'SE', 'Sergipe', 31),
(510, 'BR', 'TO', 'Tocantins', 31),
(511, 'BR', 'DF', 'Distrito Federal', 31),
(512, 'HR', 'HR-01', 'Zagrebačka županija', 59),
(513, 'HR', 'HR-02', 'Krapinsko-zagorska županija', 59),
(514, 'HR', 'HR-03', 'Sisačko-moslavačka županija', 59),
(515, 'HR', 'HR-04', 'Karlovačka županija', 59),
(516, 'HR', 'HR-05', 'Varaždinska županija', 59),
(517, 'HR', 'HR-06', 'Koprivničko-križevačka županija', 59),
(518, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija', 59),
(519, 'HR', 'HR-08', 'Primorsko-goranska županija', 59),
(520, 'HR', 'HR-09', 'Ličko-senjska županija', 59),
(521, 'HR', 'HR-10', 'Virovitičko-podravska županija', 59),
(522, 'HR', 'HR-11', 'Požeško-slavonska županija', 59),
(523, 'HR', 'HR-12', 'Brodsko-posavska županija', 59),
(524, 'HR', 'HR-13', 'Zadarska županija', 59),
(525, 'HR', 'HR-14', 'Osječko-baranjska županija', 59),
(526, 'HR', 'HR-15', 'Šibensko-kninska županija', 59),
(527, 'HR', 'HR-16', 'Vukovarsko-srijemska županija', 59),
(528, 'HR', 'HR-17', 'Splitsko-dalmatinska županija', 59),
(529, 'HR', 'HR-18', 'Istarska županija', 59),
(530, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija', 59),
(531, 'HR', 'HR-20', 'Međimurska županija', 59),
(532, 'HR', 'HR-21', 'Grad Zagreb', 59),
(533, 'IN', 'AN', 'Andaman and Nicobar Islands', 106),
(534, 'IN', 'AP', 'Andhra Pradesh', 106),
(535, 'IN', 'AR', 'Arunachal Pradesh', 106),
(536, 'IN', 'AS', 'Assam', 106),
(537, 'IN', 'BR', 'Bihar', 106),
(538, 'IN', 'CH', 'Chandigarh', 106),
(539, 'IN', 'CT', 'Chhattisgarh', 106),
(540, 'IN', 'DN', 'Dadra and Nagar Haveli', 106),
(541, 'IN', 'DD', 'Daman and Diu', 106),
(542, 'IN', 'DL', 'Delhi', 106),
(543, 'IN', 'GA', 'Goa', 106),
(544, 'IN', 'GJ', 'Gujarat', 106),
(545, 'IN', 'HR', 'Haryana', 106),
(546, 'IN', 'HP', 'Himachal Pradesh', 106),
(547, 'IN', 'JK', 'Jammu and Kashmir', 106),
(548, 'IN', 'JH', 'Jharkhand', 106),
(549, 'IN', 'KA', 'Karnataka', 106),
(550, 'IN', 'KL', 'Kerala', 106),
(551, 'IN', 'LD', 'Lakshadweep', 106),
(552, 'IN', 'MP', 'Madhya Pradesh', 106),
(553, 'IN', 'MH', 'Maharashtra', 106),
(554, 'IN', 'MN', 'Manipur', 106),
(555, 'IN', 'ML', 'Meghalaya', 106),
(556, 'IN', 'MZ', 'Mizoram', 106),
(557, 'IN', 'NL', 'Nagaland', 106),
(558, 'IN', 'OR', 'Odisha', 106),
(559, 'IN', 'PY', 'Puducherry', 106),
(560, 'IN', 'PB', 'Punjab', 106),
(561, 'IN', 'RJ', 'Rajasthan', 106),
(562, 'IN', 'SK', 'Sikkim', 106),
(563, 'IN', 'TN', 'Tamil Nadu', 106),
(564, 'IN', 'TG', 'Telangana', 106),
(565, 'IN', 'TR', 'Tripura', 106),
(566, 'IN', 'UP', 'Uttar Pradesh', 106),
(567, 'IN', 'UT', 'Uttarakhand', 106),
(568, 'IN', 'WB', 'West Bengal', 106),
(569, 'PY', 'PY-16', 'Alto Paraguay', 176),
(570, 'PY', 'PY-10', 'Alto Paraná', 176),
(571, 'PY', 'PY-13', 'Amambay', 176),
(572, 'PY', 'PY-ASU', 'Asunción', 176),
(573, 'PY', 'PY-19', 'Boquerón', 176),
(574, 'PY', 'PY-5', 'Caaguazú', 176),
(575, 'PY', 'PY-6', 'Caazapá', 176),
(576, 'PY', 'PY-14', 'Canindeyú', 176),
(577, 'PY', 'PY-11', 'Central', 176),
(578, 'PY', 'PY-1', 'Concepción', 176),
(579, 'PY', 'PY-3', 'Cordillera', 176),
(580, 'PY', 'PY-4', 'Guairá', 176),
(581, 'PY', 'PY-7', 'Itapúa', 176),
(582, 'PY', 'PY-8', 'Misiones', 176),
(583, 'PY', 'PY-9', 'Paraguarí', 176),
(584, 'PY', 'PY-15', 'Presidente Hayes', 176),
(585, 'PY', 'PY-2', 'San Pedro', 176),
(586, 'PY', 'PY-12', 'Ñeembucú', 176);

-- --------------------------------------------------------

--
-- Table structure for table `country_state_translations`
--

CREATE TABLE `country_state_translations` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `country_state_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `country_state_translations`
--

INSERT INTO `country_state_translations` (`id`, `locale`, `default_name`, `country_state_id`) VALUES
(2291, 'ar', 'ألاباما', 1),
(2292, 'ar', 'ألاسكا', 2),
(2293, 'ar', 'ساموا الأمريكية', 3),
(2294, 'ar', 'أريزونا', 4),
(2295, 'ar', 'أركنساس', 5),
(2296, 'ar', 'القوات المسلحة أفريقيا', 6),
(2297, 'ar', 'القوات المسلحة الأمريكية', 7),
(2298, 'ar', 'القوات المسلحة الكندية', 8),
(2299, 'ar', 'القوات المسلحة أوروبا', 9),
(2300, 'ar', 'القوات المسلحة الشرق الأوسط', 10),
(2301, 'ar', 'القوات المسلحة في المحيط الهادئ', 11),
(2302, 'ar', 'كاليفورنيا', 12),
(2303, 'ar', 'كولورادو', 13),
(2304, 'ar', 'كونيتيكت', 14),
(2305, 'ar', 'ديلاوير', 15),
(2306, 'ar', 'مقاطعة كولومبيا', 16),
(2307, 'ar', 'ولايات ميكرونيزيا الموحدة', 17),
(2308, 'ar', 'فلوريدا', 18),
(2309, 'ar', 'جورجيا', 19),
(2310, 'ar', 'غوام', 20),
(2311, 'ar', 'هاواي', 21),
(2312, 'ar', 'ايداهو', 22),
(2313, 'ar', 'إلينوي', 23),
(2314, 'ar', 'إنديانا', 24),
(2315, 'ar', 'أيوا', 25),
(2316, 'ar', 'كانساس', 26),
(2317, 'ar', 'كنتاكي', 27),
(2318, 'ar', 'لويزيانا', 28),
(2319, 'ar', 'مين', 29),
(2320, 'ar', 'جزر مارشال', 30),
(2321, 'ar', 'ماريلاند', 31),
(2322, 'ar', 'ماساتشوستس', 32),
(2323, 'ar', 'ميشيغان', 33),
(2324, 'ar', 'مينيسوتا', 34),
(2325, 'ar', 'ميسيسيبي', 35),
(2326, 'ar', 'ميسوري', 36),
(2327, 'ar', 'مونتانا', 37),
(2328, 'ar', 'نبراسكا', 38),
(2329, 'ar', 'نيفادا', 39),
(2330, 'ar', 'نيو هامبشاير', 40),
(2331, 'ar', 'نيو جيرسي', 41),
(2332, 'ar', 'المكسيك جديدة', 42),
(2333, 'ar', 'نيويورك', 43),
(2334, 'ar', 'شمال كارولينا', 44),
(2335, 'ar', 'شمال داكوتا', 45),
(2336, 'ar', 'جزر مريانا الشمالية', 46),
(2337, 'ar', 'أوهايو', 47),
(2338, 'ar', 'أوكلاهوما', 48),
(2339, 'ar', 'ولاية أوريغون', 49),
(2340, 'ar', 'بالاو', 50),
(2341, 'ar', 'بنسلفانيا', 51),
(2342, 'ar', 'بورتوريكو', 52),
(2343, 'ar', 'جزيرة رود', 53),
(2344, 'ar', 'كارولينا الجنوبية', 54),
(2345, 'ar', 'جنوب داكوتا', 55),
(2346, 'ar', 'تينيسي', 56),
(2347, 'ar', 'تكساس', 57),
(2348, 'ar', 'يوتا', 58),
(2349, 'ar', 'فيرمونت', 59),
(2350, 'ar', 'جزر فيرجن', 60),
(2351, 'ar', 'فرجينيا', 61),
(2352, 'ar', 'واشنطن', 62),
(2353, 'ar', 'فرجينيا الغربية', 63),
(2354, 'ar', 'ولاية ويسكونسن', 64),
(2355, 'ar', 'وايومنغ', 65),
(2356, 'ar', 'ألبرتا', 66),
(2357, 'ar', 'كولومبيا البريطانية', 67),
(2358, 'ar', 'مانيتوبا', 68),
(2359, 'ar', 'نيوفاوندلاند ولابرادور', 69),
(2360, 'ar', 'برونزيك جديد', 70),
(2361, 'ar', 'مقاطعة نفوفا سكوشيا', 71),
(2362, 'ar', 'الاقاليم الشمالية الغربية', 72),
(2363, 'ar', 'نونافوت', 73),
(2364, 'ar', 'أونتاريو', 74),
(2365, 'ar', 'جزيرة الأمير ادوارد', 75),
(2366, 'ar', 'كيبيك', 76),
(2367, 'ar', 'ساسكاتشوان', 77),
(2368, 'ar', 'إقليم يوكون', 78),
(2369, 'ar', 'Niedersachsen', 79),
(2370, 'ar', 'بادن فورتمبيرغ', 80),
(2371, 'ar', 'بايرن ميونيخ', 81),
(2372, 'ar', 'برلين', 82),
(2373, 'ar', 'براندنبورغ', 83),
(2374, 'ar', 'بريمن', 84),
(2375, 'ar', 'هامبورغ', 85),
(2376, 'ar', 'هيسن', 86),
(2377, 'ar', 'مكلنبورغ-فوربومرن', 87),
(2378, 'ar', 'نوردراين فيستفالن', 88),
(2379, 'ar', 'راينلاند-بفالز', 89),
(2380, 'ar', 'سارلاند', 90),
(2381, 'ar', 'ساكسن', 91),
(2382, 'ar', 'سكسونيا أنهالت', 92),
(2383, 'ar', 'شليسفيغ هولشتاين', 93),
(2384, 'ar', 'تورنغن', 94),
(2385, 'ar', 'فيينا', 95),
(2386, 'ar', 'النمسا السفلى', 96),
(2387, 'ar', 'النمسا العليا', 97),
(2388, 'ar', 'سالزبورغ', 98),
(2389, 'ar', 'Каринтия', 99),
(2390, 'ar', 'STEIERMARK', 100),
(2391, 'ar', 'تيرول', 101),
(2392, 'ar', 'بورغنلاند', 102),
(2393, 'ar', 'فورارلبرغ', 103),
(2394, 'ar', 'أرجاو', 104),
(2395, 'ar', 'Appenzell Innerrhoden', 105),
(2396, 'ar', 'أبنزل أوسيرهودن', 106),
(2397, 'ar', 'برن', 107),
(2398, 'ar', 'كانتون ريف بازل', 108),
(2399, 'ar', 'بازل شتات', 109),
(2400, 'ar', 'فرايبورغ', 110),
(2401, 'ar', 'Genf', 111),
(2402, 'ar', 'جلاروس', 112),
(2403, 'ar', 'غراوبوندن', 113),
(2404, 'ar', 'العصر الجوارسي أو الجوري', 114),
(2405, 'ar', 'لوزيرن', 115),
(2406, 'ar', 'في Neuenburg', 116),
(2407, 'ar', 'نيدوالدن', 117),
(2408, 'ar', 'أوبوالدن', 118),
(2409, 'ar', 'سانت غالن', 119),
(2410, 'ar', 'شافهاوزن', 120),
(2411, 'ar', 'سولوتورن', 121),
(2412, 'ar', 'شفيتس', 122),
(2413, 'ar', 'ثورجو', 123),
(2414, 'ar', 'تيتشينو', 124),
(2415, 'ar', 'أوري', 125),
(2416, 'ar', 'وادت', 126),
(2417, 'ar', 'اليس', 127),
(2418, 'ar', 'زوغ', 128),
(2419, 'ar', 'زيورخ', 129),
(2420, 'ar', 'Corunha', 130),
(2421, 'ar', 'ألافا', 131),
(2422, 'ar', 'الباسيتي', 132),
(2423, 'ar', 'اليكانتي', 133),
(2424, 'ar', 'الميريا', 134),
(2425, 'ar', 'أستورياس', 135),
(2426, 'ar', 'أفيلا', 136),
(2427, 'ar', 'بطليوس', 137),
(2428, 'ar', 'البليار', 138),
(2429, 'ar', 'برشلونة', 139),
(2430, 'ar', 'برغش', 140),
(2431, 'ar', 'كاسيريس', 141),
(2432, 'ar', 'كاديز', 142),
(2433, 'ar', 'كانتابريا', 143),
(2434, 'ar', 'كاستيلون', 144),
(2435, 'ar', 'سبتة', 145),
(2436, 'ar', 'سيوداد ريال', 146),
(2437, 'ar', 'قرطبة', 147),
(2438, 'ar', 'كوينكا', 148),
(2439, 'ar', 'جيرونا', 149),
(2440, 'ar', 'غرناطة', 150),
(2441, 'ar', 'غوادالاخارا', 151),
(2442, 'ar', 'بجويبوزكوا', 152),
(2443, 'ar', 'هويلفا', 153),
(2444, 'ar', 'هويسكا', 154),
(2445, 'ar', 'خاين', 155),
(2446, 'ar', 'لاريوخا', 156),
(2447, 'ar', 'لاس بالماس', 157),
(2448, 'ar', 'ليون', 158),
(2449, 'ar', 'يدا', 159),
(2450, 'ar', 'لوغو', 160),
(2451, 'ar', 'مدريد', 161),
(2452, 'ar', 'ملقة', 162),
(2453, 'ar', 'مليلية', 163),
(2454, 'ar', 'مورسيا', 164),
(2455, 'ar', 'نافارا', 165),
(2456, 'ar', 'أورينس', 166),
(2457, 'ar', 'بلنسية', 167),
(2458, 'ar', 'بونتيفيدرا', 168),
(2459, 'ar', 'سالامانكا', 169),
(2460, 'ar', 'سانتا كروز دي تينيريفي', 170),
(2461, 'ar', 'سيغوفيا', 171),
(2462, 'ar', 'اشبيلية', 172),
(2463, 'ar', 'سوريا', 173),
(2464, 'ar', 'تاراغونا', 174),
(2465, 'ar', 'تيرويل', 175),
(2466, 'ar', 'توليدو', 176),
(2467, 'ar', 'فالنسيا', 177),
(2468, 'ar', 'بلد الوليد', 178),
(2469, 'ar', 'فيزكايا', 179),
(2470, 'ar', 'زامورا', 180),
(2471, 'ar', 'سرقسطة', 181),
(2472, 'ar', 'عين', 182),
(2473, 'ar', 'أيسن', 183),
(2474, 'ar', 'اليي', 184),
(2475, 'ar', 'ألب البروفنس العليا', 185),
(2476, 'ar', 'أوتس ألب', 186),
(2477, 'ar', 'ألب ماريتيم', 187),
(2478, 'ar', 'ARDECHE', 188),
(2479, 'ar', 'Ardennes', 189),
(2480, 'ar', 'آردن', 190),
(2481, 'ar', 'أوب', 191),
(2482, 'ar', 'اود', 192),
(2483, 'ar', 'أفيرون', 193),
(2484, 'ar', 'بوكاس دو رون', 194),
(2485, 'ar', 'كالفادوس', 195),
(2486, 'ar', 'كانتال', 196),
(2487, 'ar', 'شارانت', 197),
(2488, 'ar', 'سيين إت مارن', 198),
(2489, 'ar', 'شير', 199),
(2490, 'ar', 'كوريز', 200),
(2491, 'ar', 'سود كورس-دو-', 201),
(2492, 'ar', 'هوت كورس', 202),
(2493, 'ar', 'كوستا دوركوريز', 203),
(2494, 'ar', 'كوتس دورمور', 204),
(2495, 'ar', 'كروز', 205),
(2496, 'ar', 'دوردوني', 206),
(2497, 'ar', 'دوبس', 207),
(2498, 'ar', 'DrômeFinistère', 208),
(2499, 'ar', 'أور', 209),
(2500, 'ar', 'أور ولوار', 210),
(2501, 'ar', 'فينيستير', 211),
(2502, 'ar', 'جارد', 212),
(2503, 'ar', 'هوت غارون', 213),
(2504, 'ar', 'الخيام', 214),
(2505, 'ar', 'جيروند', 215),
(2506, 'ar', 'هيرولت', 216),
(2507, 'ar', 'إيل وفيلان', 217),
(2508, 'ar', 'إندر', 218),
(2509, 'ar', 'أندر ولوار', 219),
(2510, 'ar', 'إيسر', 220),
(2511, 'ar', 'العصر الجوارسي أو الجوري', 221),
(2512, 'ar', 'اندز', 222),
(2513, 'ar', 'لوار وشير', 223),
(2514, 'ar', 'لوار', 224),
(2515, 'ar', 'هوت-لوار', 225),
(2516, 'ar', 'وار أتلانتيك', 226),
(2517, 'ar', 'لورا', 227),
(2518, 'ar', 'كثيرا', 228),
(2519, 'ar', 'الكثير غارون', 229),
(2520, 'ar', 'لوزر', 230),
(2521, 'ar', 'مين-إي-لوار', 231),
(2522, 'ar', 'المانش', 232),
(2523, 'ar', 'مارن', 233),
(2524, 'ar', 'هوت مارن', 234),
(2525, 'ar', 'مايين', 235),
(2526, 'ar', 'مورت وموزيل', 236),
(2527, 'ar', 'ميوز', 237),
(2528, 'ar', 'موربيهان', 238),
(2529, 'ar', 'موسيل', 239),
(2530, 'ar', 'نيفر', 240),
(2531, 'ar', 'نورد', 241),
(2532, 'ar', 'إيل دو فرانس', 242),
(2533, 'ar', 'أورن', 243),
(2534, 'ar', 'با-دو-كاليه', 244),
(2535, 'ar', 'بوي دي دوم', 245),
(2536, 'ar', 'البرانيس ​​الأطلسية', 246),
(2537, 'ar', 'أوتس-بيرينيهs', 247),
(2538, 'ar', 'بيرينيه-أورينتال', 248),
(2539, 'ar', 'بس رين', 249),
(2540, 'ar', 'أوت رين', 250),
(2541, 'ar', 'رون [3]', 251),
(2542, 'ar', 'هوت-سون', 252),
(2543, 'ar', 'سون ولوار', 253),
(2544, 'ar', 'سارت', 254),
(2545, 'ar', 'سافوا', 255),
(2546, 'ar', 'هاوت سافوي', 256),
(2547, 'ar', 'باريس', 257),
(2548, 'ar', 'سين البحرية', 258),
(2549, 'ar', 'سيين إت مارن', 259),
(2550, 'ar', 'إيفلين', 260),
(2551, 'ar', 'دوكس سفرس', 261),
(2552, 'ar', 'السوم', 262),
(2553, 'ar', 'تارن', 263),
(2554, 'ar', 'تارن وغارون', 264),
(2555, 'ar', 'فار', 265),
(2556, 'ar', 'فوكلوز', 266),
(2557, 'ar', 'تارن', 267),
(2558, 'ar', 'فيين', 268),
(2559, 'ar', 'هوت فيين', 269),
(2560, 'ar', 'الفوج', 270),
(2561, 'ar', 'يون', 271),
(2562, 'ar', 'تيريتوير-دي-بلفور', 272),
(2563, 'ar', 'إيسون', 273),
(2564, 'ar', 'هوت دو سين', 274),
(2565, 'ar', 'سين سان دوني', 275),
(2566, 'ar', 'فال دو مارن', 276),
(2567, 'ar', 'فال دواز', 277),
(2568, 'ar', 'ألبا', 278),
(2569, 'ar', 'اراد', 279),
(2570, 'ar', 'ARGES', 280),
(2571, 'ar', 'باكاو', 281),
(2572, 'ar', 'بيهور', 282),
(2573, 'ar', 'بيستريتا ناسود', 283),
(2574, 'ar', 'بوتوساني', 284),
(2575, 'ar', 'براشوف', 285),
(2576, 'ar', 'برايلا', 286),
(2577, 'ar', 'بوخارست', 287),
(2578, 'ar', 'بوزاو', 288),
(2579, 'ar', 'كاراس سيفيرين', 289),
(2580, 'ar', 'كالاراسي', 290),
(2581, 'ar', 'كلوج', 291),
(2582, 'ar', 'كونستانتا', 292),
(2583, 'ar', 'كوفاسنا', 293),
(2584, 'ar', 'دامبوفيتا', 294),
(2585, 'ar', 'دولج', 295),
(2586, 'ar', 'جالاتي', 296),
(2587, 'ar', 'Giurgiu', 297),
(2588, 'ar', 'غيورغيو', 298),
(2589, 'ar', 'هارغيتا', 299),
(2590, 'ar', 'هونيدوارا', 300),
(2591, 'ar', 'ايالوميتا', 301),
(2592, 'ar', 'ياشي', 302),
(2593, 'ar', 'إيلفوف', 303),
(2594, 'ar', 'مارامريس', 304),
(2595, 'ar', 'MEHEDINTI', 305),
(2596, 'ar', 'موريس', 306),
(2597, 'ar', 'نيامتس', 307),
(2598, 'ar', 'أولت', 308),
(2599, 'ar', 'براهوفا', 309),
(2600, 'ar', 'ساتو ماري', 310),
(2601, 'ar', 'سالاج', 311),
(2602, 'ar', 'سيبيو', 312),
(2603, 'ar', 'سوسيفا', 313),
(2604, 'ar', 'تيليورمان', 314),
(2605, 'ar', 'تيم هو', 315),
(2606, 'ar', 'تولسيا', 316),
(2607, 'ar', 'فاسلوي', 317),
(2608, 'ar', 'فالسيا', 318),
(2609, 'ar', 'فرانتشا', 319),
(2610, 'ar', 'Lappi', 320),
(2611, 'ar', 'Pohjois-Pohjanmaa', 321),
(2612, 'ar', 'كاينو', 322),
(2613, 'ar', 'Pohjois-كارجالا', 323),
(2614, 'ar', 'Pohjois-سافو', 324),
(2615, 'ar', 'Etelä-سافو', 325),
(2616, 'ar', 'Etelä-Pohjanmaa', 326),
(2617, 'ar', 'Pohjanmaa', 327),
(2618, 'ar', 'بيركنما', 328),
(2619, 'ar', 'ساتا كونتا', 329),
(2620, 'ar', 'كسكي-Pohjanmaa', 330),
(2621, 'ar', 'كسكي-سومي', 331),
(2622, 'ar', 'Varsinais-سومي', 332),
(2623, 'ar', 'Etelä-كارجالا', 333),
(2624, 'ar', 'Päijät-Häme', 334),
(2625, 'ar', 'كانتا-HAME', 335),
(2626, 'ar', 'أوسيما', 336),
(2627, 'ar', 'أوسيما', 337),
(2628, 'ar', 'كومنلاكسو', 338),
(2629, 'ar', 'Ahvenanmaa', 339),
(2630, 'ar', 'Harjumaa', 340),
(2631, 'ar', 'هيوما', 341),
(2632, 'ar', 'المؤسسة الدولية للتنمية فيروما', 342),
(2633, 'ar', 'جوغفما', 343),
(2634, 'ar', 'يارفا', 344),
(2635, 'ar', 'انيما', 345),
(2636, 'ar', 'اني فيريوما', 346),
(2637, 'ar', 'بولفاما', 347),
(2638, 'ar', 'بارنوما', 348),
(2639, 'ar', 'Raplamaa', 349),
(2640, 'ar', 'Saaremaa', 350),
(2641, 'ar', 'Tartumaa', 351),
(2642, 'ar', 'Valgamaa', 352),
(2643, 'ar', 'Viljandimaa', 353),
(2644, 'ar', 'روايات Salacgr novvas', 354),
(2645, 'ar', 'داوجافبيلس', 355),
(2646, 'ar', 'يلغافا', 356),
(2647, 'ar', 'يكاب', 357),
(2648, 'ar', 'يورمال', 358),
(2649, 'ar', 'يابايا', 359),
(2650, 'ar', 'ليباج أبريس', 360),
(2651, 'ar', 'ريزكن', 361),
(2652, 'ar', 'ريغا', 362),
(2653, 'ar', 'مقاطعة ريغا', 363),
(2654, 'ar', 'فالميرا', 364),
(2655, 'ar', 'فنتسبيلز', 365),
(2656, 'ar', 'روايات Aglonas', 366),
(2657, 'ar', 'Aizkraukles novads', 367),
(2658, 'ar', 'Aizkraukles novads', 368),
(2659, 'ar', 'Aknīstes novads', 369),
(2660, 'ar', 'Alojas novads', 370),
(2661, 'ar', 'روايات Alsungas', 371),
(2662, 'ar', 'ألكسنس أبريز', 372),
(2663, 'ar', 'روايات أماتاس', 373),
(2664, 'ar', 'قرود الروايات', 374),
(2665, 'ar', 'روايات أوسيس', 375),
(2666, 'ar', 'بابيت الروايات', 376),
(2667, 'ar', 'Baldones الروايات', 377),
(2668, 'ar', 'بالتينافاس الروايات', 378),
(2669, 'ar', 'روايات بالفو', 379),
(2670, 'ar', 'Bauskas الروايات', 380),
(2671, 'ar', 'Beverīnas novads', 381),
(2672, 'ar', 'Novads Brocēnu', 382),
(2673, 'ar', 'Novads Burtnieku', 383),
(2674, 'ar', 'Carnikavas novads', 384),
(2675, 'ar', 'Cesvaines novads', 385),
(2676, 'ar', 'Ciblas novads', 386),
(2677, 'ar', 'تسو أبريس', 387),
(2678, 'ar', 'Dagdas novads', 388),
(2679, 'ar', 'Daugavpils novads', 389),
(2680, 'ar', 'روايات دوبيليس', 390),
(2681, 'ar', 'ديربيس الروايات', 391),
(2682, 'ar', 'ديربيس الروايات', 392),
(2683, 'ar', 'يشرك الروايات', 393),
(2684, 'ar', 'Garkalnes novads', 394),
(2685, 'ar', 'Grobiņas novads', 395),
(2686, 'ar', 'غولبينيس الروايات', 396),
(2687, 'ar', 'إيكافاس روايات', 397),
(2688, 'ar', 'Ikškiles novads', 398),
(2689, 'ar', 'Ilūkstes novads', 399),
(2690, 'ar', 'روايات Inčukalna', 400),
(2691, 'ar', 'Jaunjelgavas novads', 401),
(2692, 'ar', 'Jaunpiebalgas novads', 402),
(2693, 'ar', 'روايات Jaunpiebalgas', 403),
(2694, 'ar', 'Jelgavas novads', 404),
(2695, 'ar', 'جيكابيلس أبريز', 405),
(2696, 'ar', 'روايات كاندافاس', 406),
(2697, 'ar', 'Kokneses الروايات', 407),
(2698, 'ar', 'Krimuldas novads', 408),
(2699, 'ar', 'Krustpils الروايات', 409),
(2700, 'ar', 'Krāslavas Apriņķis', 410),
(2701, 'ar', 'كولدوغاس أبريز', 411),
(2702, 'ar', 'Kārsavas novads', 412),
(2703, 'ar', 'روايات ييلفاريس', 413),
(2704, 'ar', 'ليمباو أبريز', 414),
(2705, 'ar', 'روايات لباناس', 415),
(2706, 'ar', 'روايات لودزاس', 416),
(2707, 'ar', 'مقاطعة ليجاتني', 417),
(2708, 'ar', 'مقاطعة ليفاني', 418),
(2709, 'ar', 'مادونا روايات', 419),
(2710, 'ar', 'Mazsalacas novads', 420),
(2711, 'ar', 'روايات مالبلز', 421),
(2712, 'ar', 'Mārupes novads', 422),
(2713, 'ar', 'نوفاو نوكشنو', 423),
(2714, 'ar', 'روايات نيريتاس', 424),
(2715, 'ar', 'روايات نيكاس', 425),
(2716, 'ar', 'أغنام الروايات', 426),
(2717, 'ar', 'أولينيس الروايات', 427),
(2718, 'ar', 'روايات Ozolnieku', 428),
(2719, 'ar', 'بريسيو أبرييس', 429),
(2720, 'ar', 'Priekules الروايات', 430),
(2721, 'ar', 'كوندادو دي بريكوي', 431),
(2722, 'ar', 'Pärgaujas novads', 432),
(2723, 'ar', 'روايات بافيلوستاس', 433),
(2724, 'ar', 'بلافيناس مقاطعة', 434),
(2725, 'ar', 'روناس روايات', 435),
(2726, 'ar', 'Riebiņu novads', 436),
(2727, 'ar', 'روجاس روايات', 437),
(2728, 'ar', 'Novads روباو', 438),
(2729, 'ar', 'روكافاس روايات', 439),
(2730, 'ar', 'روغاجو روايات', 440),
(2731, 'ar', 'رندلس الروايات', 441),
(2732, 'ar', 'Radzeknes novads', 442),
(2733, 'ar', 'Rūjienas novads', 443),
(2734, 'ar', 'بلدية سالاسغريفا', 444),
(2735, 'ar', 'روايات سالاس', 445),
(2736, 'ar', 'Salaspils novads', 446),
(2737, 'ar', 'روايات سالدوس', 447),
(2738, 'ar', 'Novuls Saulkrastu', 448),
(2739, 'ar', 'سيغولداس روايات', 449),
(2740, 'ar', 'Skrundas novads', 450),
(2741, 'ar', 'مقاطعة Skrīveri', 451),
(2742, 'ar', 'يبتسم الروايات', 452),
(2743, 'ar', 'روايات Stopiņu', 453),
(2744, 'ar', 'روايات Stren novu', 454),
(2745, 'ar', 'سجاس روايات', 455),
(2746, 'ar', 'روايات تالسو', 456),
(2747, 'ar', 'توكوما الروايات', 457),
(2748, 'ar', 'Tērvetes novads', 458),
(2749, 'ar', 'Vaiņodes novads', 459),
(2750, 'ar', 'فالكاس الروايات', 460),
(2751, 'ar', 'فالميراس الروايات', 461),
(2752, 'ar', 'مقاطعة فاكلاني', 462),
(2753, 'ar', 'Vecpiebalgas novads', 463),
(2754, 'ar', 'روايات Vecumnieku', 464),
(2755, 'ar', 'فنتسبيلس الروايات', 465),
(2756, 'ar', 'Viesītes Novads', 466),
(2757, 'ar', 'Viļakas novads', 467),
(2758, 'ar', 'روايات فيناو', 468),
(2759, 'ar', 'Vārkavas novads', 469),
(2760, 'ar', 'روايات زيلوبس', 470),
(2761, 'ar', 'مقاطعة أدازي', 471),
(2762, 'ar', 'مقاطعة Erglu', 472),
(2763, 'ar', 'مقاطعة كيغمس', 473),
(2764, 'ar', 'مقاطعة كيكافا', 474),
(2765, 'ar', 'Alytaus Apskritis', 475),
(2766, 'ar', 'كاونو ابكريتيس', 476),
(2767, 'ar', 'Klaipėdos apskritis', 477),
(2768, 'ar', 'Marijampol\'s apskritis', 478),
(2769, 'ar', 'Panevėžio apskritis', 479),
(2770, 'ar', 'uliaulių apskritis', 480),
(2771, 'ar', 'Taurag\'s apskritis', 481),
(2772, 'ar', 'Telšių apskritis', 482),
(2773, 'ar', 'Utenos apskritis', 483),
(2774, 'ar', 'فيلنياوس ابكريتيس', 484),
(2775, 'ar', 'فدان', 485),
(2776, 'ar', 'ألاغواس', 486),
(2777, 'ar', 'أمابا', 487),
(2778, 'ar', 'أمازوناس', 488),
(2779, 'ar', 'باهيا', 489),
(2780, 'ar', 'سيارا', 490),
(2781, 'ar', 'إسبيريتو سانتو', 491),
(2782, 'ar', 'غوياس', 492),
(2783, 'ar', 'مارانهاو', 493),
(2784, 'ar', 'ماتو جروسو', 494),
(2785, 'ar', 'ماتو جروسو دو سول', 495),
(2786, 'ar', 'ميناس جريس', 496),
(2787, 'ar', 'بارا', 497),
(2788, 'ar', 'بارايبا', 498),
(2789, 'ar', 'بارانا', 499),
(2790, 'ar', 'بيرنامبوكو', 500),
(2791, 'ar', 'بياوي', 501),
(2792, 'ar', 'ريو دي جانيرو', 502),
(2793, 'ar', 'ريو غراندي دو نورتي', 503),
(2794, 'ar', 'ريو غراندي دو سول', 504),
(2795, 'ar', 'روندونيا', 505),
(2796, 'ar', 'رورايما', 506),
(2797, 'ar', 'سانتا كاتارينا', 507),
(2798, 'ar', 'ساو باولو', 508),
(2799, 'ar', 'سيرغيبي', 509),
(2800, 'ar', 'توكانتينز', 510),
(2801, 'ar', 'وفي مقاطعة الاتحادية', 511),
(2802, 'ar', 'Zagrebačka زوبانيا', 512),
(2803, 'ar', 'Krapinsko-zagorska زوبانيا', 513),
(2804, 'ar', 'Sisačko-moslavačka زوبانيا', 514),
(2805, 'ar', 'كارلوفيتش شوبانيا', 515),
(2806, 'ar', 'فارادينسكا زوبانيجا', 516),
(2807, 'ar', 'Koprivničko-križevačka زوبانيجا', 517),
(2808, 'ar', 'بيلوفارسكو-بيلوجورسكا', 518),
(2809, 'ar', 'بريمورسكو غورانسكا سوبانيا', 519),
(2810, 'ar', 'ليكو سينيسكا زوبانيا', 520),
(2811, 'ar', 'Virovitičko-podravska زوبانيا', 521),
(2812, 'ar', 'Požeško-slavonska županija', 522),
(2813, 'ar', 'Brodsko-posavska županija', 523),
(2814, 'ar', 'زادارسكا زوبانيجا', 524),
(2815, 'ar', 'Osječko-baranjska županija', 525),
(2816, 'ar', 'شيبنسكو-كنينسكا سوبانيا', 526),
(2817, 'ar', 'Virovitičko-podravska زوبانيا', 527),
(2818, 'ar', 'Splitsko-dalmatinska زوبانيا', 528),
(2819, 'ar', 'Istarska زوبانيا', 529),
(2820, 'ar', 'Dubrovačko-neretvanska زوبانيا', 530),
(2821, 'ar', 'Međimurska زوبانيا', 531),
(2822, 'ar', 'غراد زغرب', 532),
(2823, 'ar', 'جزر أندامان ونيكوبار', 533),
(2824, 'ar', 'ولاية اندرا براديش', 534),
(2825, 'ar', 'اروناتشال براديش', 535),
(2826, 'ar', 'أسام', 536),
(2827, 'ar', 'بيهار', 537),
(2828, 'ar', 'شانديغار', 538),
(2829, 'ar', 'تشهاتيسجاره', 539),
(2830, 'ar', 'دادرا ونجار هافيلي', 540),
(2831, 'ar', 'دامان وديو', 541),
(2832, 'ar', 'دلهي', 542),
(2833, 'ar', 'غوا', 543),
(2834, 'ar', 'غوجارات', 544),
(2835, 'ar', 'هاريانا', 545),
(2836, 'ar', 'هيماشال براديش', 546),
(2837, 'ar', 'جامو وكشمير', 547),
(2838, 'ar', 'جهارخاند', 548),
(2839, 'ar', 'كارناتاكا', 549),
(2840, 'ar', 'ولاية كيرالا', 550),
(2841, 'ar', 'اكشادويب', 551),
(2842, 'ar', 'ماديا براديش', 552),
(2843, 'ar', 'ماهاراشترا', 553),
(2844, 'ar', 'مانيبور', 554),
(2845, 'ar', 'ميغالايا', 555),
(2846, 'ar', 'ميزورام', 556),
(2847, 'ar', 'ناجالاند', 557),
(2848, 'ar', 'أوديشا', 558),
(2849, 'ar', 'بودوتشيري', 559),
(2850, 'ar', 'البنجاب', 560),
(2851, 'ar', 'راجستان', 561),
(2852, 'ar', 'سيكيم', 562),
(2853, 'ar', 'تاميل نادو', 563),
(2854, 'ar', 'تيلانجانا', 564),
(2855, 'ar', 'تريبورا', 565),
(2856, 'ar', 'ولاية اوتار براديش', 566),
(2857, 'ar', 'أوتارانتشال', 567),
(2858, 'ar', 'البنغال الغربية', 568),
(2859, 'es', 'Alabama', 1),
(2860, 'es', 'Alaska', 2),
(2861, 'es', 'American Samoa', 3),
(2862, 'es', 'Arizona', 4),
(2863, 'es', 'Arkansas', 5),
(2864, 'es', 'Armed Forces Africa', 6),
(2865, 'es', 'Armed Forces Americas', 7),
(2866, 'es', 'Armed Forces Canada', 8),
(2867, 'es', 'Armed Forces Europe', 9),
(2868, 'es', 'Armed Forces Middle East', 10),
(2869, 'es', 'Armed Forces Pacific', 11),
(2870, 'es', 'California', 12),
(2871, 'es', 'Colorado', 13),
(2872, 'es', 'Connecticut', 14),
(2873, 'es', 'Delaware', 15),
(2874, 'es', 'District of Columbia', 16),
(2875, 'es', 'Federated States Of Micronesia', 17),
(2876, 'es', 'Florida', 18),
(2877, 'es', 'Georgia', 19),
(2878, 'es', 'Guam', 20),
(2879, 'es', 'Hawaii', 21),
(2880, 'es', 'Idaho', 22),
(2881, 'es', 'Illinois', 23),
(2882, 'es', 'Indiana', 24),
(2883, 'es', 'Iowa', 25),
(2884, 'es', 'Kansas', 26),
(2885, 'es', 'Kentucky', 27),
(2886, 'es', 'Louisiana', 28),
(2887, 'es', 'Maine', 29),
(2888, 'es', 'Marshall Islands', 30),
(2889, 'es', 'Maryland', 31),
(2890, 'es', 'Massachusetts', 32),
(2891, 'es', 'Michigan', 33),
(2892, 'es', 'Minnesota', 34),
(2893, 'es', 'Mississippi', 35),
(2894, 'es', 'Missouri', 36),
(2895, 'es', 'Montana', 37),
(2896, 'es', 'Nebraska', 38),
(2897, 'es', 'Nevada', 39),
(2898, 'es', 'New Hampshire', 40),
(2899, 'es', 'New Jersey', 41),
(2900, 'es', 'New Mexico', 42),
(2901, 'es', 'New York', 43),
(2902, 'es', 'North Carolina', 44),
(2903, 'es', 'North Dakota', 45),
(2904, 'es', 'Northern Mariana Islands', 46),
(2905, 'es', 'Ohio', 47),
(2906, 'es', 'Oklahoma', 48),
(2907, 'es', 'Oregon', 49),
(2908, 'es', 'Palau', 50),
(2909, 'es', 'Pennsylvania', 51),
(2910, 'es', 'Puerto Rico', 52),
(2911, 'es', 'Rhode Island', 53),
(2912, 'es', 'South Carolina', 54),
(2913, 'es', 'South Dakota', 55),
(2914, 'es', 'Tennessee', 56),
(2915, 'es', 'Texas', 57),
(2916, 'es', 'Utah', 58),
(2917, 'es', 'Vermont', 59),
(2918, 'es', 'Virgin Islands', 60),
(2919, 'es', 'Virginia', 61),
(2920, 'es', 'Washington', 62),
(2921, 'es', 'West Virginia', 63),
(2922, 'es', 'Wisconsin', 64),
(2923, 'es', 'Wyoming', 65),
(2924, 'es', 'Alberta', 66),
(2925, 'es', 'British Columbia', 67),
(2926, 'es', 'Manitoba', 68),
(2927, 'es', 'Newfoundland and Labrador', 69),
(2928, 'es', 'New Brunswick', 70),
(2929, 'es', 'Nova Scotia', 71),
(2930, 'es', 'Northwest Territories', 72),
(2931, 'es', 'Nunavut', 73),
(2932, 'es', 'Ontario', 74),
(2933, 'es', 'Prince Edward Island', 75),
(2934, 'es', 'Quebec', 76),
(2935, 'es', 'Saskatchewan', 77),
(2936, 'es', 'Yukon Territory', 78),
(2937, 'es', 'Niedersachsen', 79),
(2938, 'es', 'Baden-Württemberg', 80),
(2939, 'es', 'Bayern', 81),
(2940, 'es', 'Berlin', 82),
(2941, 'es', 'Brandenburg', 83),
(2942, 'es', 'Bremen', 84),
(2943, 'es', 'Hamburg', 85),
(2944, 'es', 'Hessen', 86),
(2945, 'es', 'Mecklenburg-Vorpommern', 87),
(2946, 'es', 'Nordrhein-Westfalen', 88),
(2947, 'es', 'Rheinland-Pfalz', 89),
(2948, 'es', 'Saarland', 90),
(2949, 'es', 'Sachsen', 91),
(2950, 'es', 'Sachsen-Anhalt', 92),
(2951, 'es', 'Schleswig-Holstein', 93),
(2952, 'es', 'Thüringen', 94),
(2953, 'es', 'Wien', 95),
(2954, 'es', 'Niederösterreich', 96),
(2955, 'es', 'Oberösterreich', 97),
(2956, 'es', 'Salzburg', 98),
(2957, 'es', 'Kärnten', 99),
(2958, 'es', 'Steiermark', 100),
(2959, 'es', 'Tirol', 101),
(2960, 'es', 'Burgenland', 102),
(2961, 'es', 'Vorarlberg', 103),
(2962, 'es', 'Aargau', 104),
(2963, 'es', 'Appenzell Innerrhoden', 105),
(2964, 'es', 'Appenzell Ausserrhoden', 106),
(2965, 'es', 'Bern', 107),
(2966, 'es', 'Basel-Landschaft', 108),
(2967, 'es', 'Basel-Stadt', 109),
(2968, 'es', 'Freiburg', 110),
(2969, 'es', 'Genf', 111),
(2970, 'es', 'Glarus', 112),
(2971, 'es', 'Graubünden', 113),
(2972, 'es', 'Jura', 114),
(2973, 'es', 'Luzern', 115),
(2974, 'es', 'Neuenburg', 116),
(2975, 'es', 'Nidwalden', 117),
(2976, 'es', 'Obwalden', 118),
(2977, 'es', 'St. Gallen', 119),
(2978, 'es', 'Schaffhausen', 120),
(2979, 'es', 'Solothurn', 121),
(2980, 'es', 'Schwyz', 122),
(2981, 'es', 'Thurgau', 123),
(2982, 'es', 'Tessin', 124),
(2983, 'es', 'Uri', 125),
(2984, 'es', 'Waadt', 126),
(2985, 'es', 'Wallis', 127),
(2986, 'es', 'Zug', 128),
(2987, 'es', 'Zürich', 129),
(2988, 'es', 'La Coruña', 130),
(2989, 'es', 'Álava', 131),
(2990, 'es', 'Albacete', 132),
(2991, 'es', 'Alicante', 133),
(2992, 'es', 'Almería', 134),
(2993, 'es', 'Asturias', 135),
(2994, 'es', 'Ávila', 136),
(2995, 'es', 'Badajoz', 137),
(2996, 'es', 'Baleares', 138),
(2997, 'es', 'Barcelona', 139),
(2998, 'es', 'Burgos', 140),
(2999, 'es', 'Cáceres', 141),
(3000, 'es', 'Cádiz', 142),
(3001, 'es', 'Cantabria', 143),
(3002, 'es', 'Castellón', 144),
(3003, 'es', 'Ceuta', 145),
(3004, 'es', 'Ciudad Real', 146),
(3005, 'es', 'Córdoba', 147),
(3006, 'es', 'Cuenca', 148),
(3007, 'es', 'Gerona', 149),
(3008, 'es', 'Granada', 150),
(3009, 'es', 'Guadalajara', 151),
(3010, 'es', 'Guipúzcoa', 152),
(3011, 'es', 'Huelva', 153),
(3012, 'es', 'Huesca', 154),
(3013, 'es', 'Jaén', 155),
(3014, 'es', 'La Rioja', 156),
(3015, 'es', 'Las Palmas', 157),
(3016, 'es', 'León', 158),
(3017, 'es', 'Lérida', 159),
(3018, 'es', 'Lugo', 160),
(3019, 'es', 'Madrid', 161),
(3020, 'es', 'Málaga', 162),
(3021, 'es', 'Melilla', 163),
(3022, 'es', 'Murcia', 164),
(3023, 'es', 'Navarra', 165),
(3024, 'es', 'Orense', 166),
(3025, 'es', 'Palencia', 167),
(3026, 'es', 'Pontevedra', 168),
(3027, 'es', 'Salamanca', 169),
(3028, 'es', 'Santa Cruz de Tenerife', 170),
(3029, 'es', 'Segovia', 171),
(3030, 'es', 'Sevilla', 172),
(3031, 'es', 'Soria', 173),
(3032, 'es', 'Tarragona', 174),
(3033, 'es', 'Teruel', 175),
(3034, 'es', 'Toledo', 176),
(3035, 'es', 'Valencia', 177),
(3036, 'es', 'Valladolid', 178),
(3037, 'es', 'Vizcaya', 179),
(3038, 'es', 'Zamora', 180),
(3039, 'es', 'Zaragoza', 181),
(3040, 'es', 'Ain', 182),
(3041, 'es', 'Aisne', 183),
(3042, 'es', 'Allier', 184),
(3043, 'es', 'Alpes-de-Haute-Provence', 185),
(3044, 'es', 'Hautes-Alpes', 186),
(3045, 'es', 'Alpes-Maritimes', 187),
(3046, 'es', 'Ardèche', 188),
(3047, 'es', 'Ardennes', 189),
(3048, 'es', 'Ariège', 190),
(3049, 'es', 'Aube', 191),
(3050, 'es', 'Aude', 192),
(3051, 'es', 'Aveyron', 193),
(3052, 'es', 'Bouches-du-Rhône', 194),
(3053, 'es', 'Calvados', 195),
(3054, 'es', 'Cantal', 196),
(3055, 'es', 'Charente', 197),
(3056, 'es', 'Charente-Maritime', 198),
(3057, 'es', 'Cher', 199),
(3058, 'es', 'Corrèze', 200),
(3059, 'es', 'Corse-du-Sud', 201),
(3060, 'es', 'Haute-Corse', 202),
(3061, 'es', 'Côte-d\'Or', 203),
(3062, 'es', 'Côtes-d\'Armor', 204),
(3063, 'es', 'Creuse', 205),
(3064, 'es', 'Dordogne', 206),
(3065, 'es', 'Doubs', 207),
(3066, 'es', 'Drôme', 208),
(3067, 'es', 'Eure', 209),
(3068, 'es', 'Eure-et-Loir', 210),
(3069, 'es', 'Finistère', 211),
(3070, 'es', 'Gard', 212),
(3071, 'es', 'Haute-Garonne', 213),
(3072, 'es', 'Gers', 214),
(3073, 'es', 'Gironde', 215),
(3074, 'es', 'Hérault', 216),
(3075, 'es', 'Ille-et-Vilaine', 217),
(3076, 'es', 'Indre', 218),
(3077, 'es', 'Indre-et-Loire', 219),
(3078, 'es', 'Isère', 220),
(3079, 'es', 'Jura', 221),
(3080, 'es', 'Landes', 222),
(3081, 'es', 'Loir-et-Cher', 223),
(3082, 'es', 'Loire', 224),
(3083, 'es', 'Haute-Loire', 225),
(3084, 'es', 'Loire-Atlantique', 226),
(3085, 'es', 'Loiret', 227),
(3086, 'es', 'Lot', 228),
(3087, 'es', 'Lot-et-Garonne', 229),
(3088, 'es', 'Lozère', 230),
(3089, 'es', 'Maine-et-Loire', 231),
(3090, 'es', 'Manche', 232),
(3091, 'es', 'Marne', 233),
(3092, 'es', 'Haute-Marne', 234),
(3093, 'es', 'Mayenne', 235),
(3094, 'es', 'Meurthe-et-Moselle', 236),
(3095, 'es', 'Meuse', 237),
(3096, 'es', 'Morbihan', 238),
(3097, 'es', 'Moselle', 239),
(3098, 'es', 'Nièvre', 240),
(3099, 'es', 'Nord', 241),
(3100, 'es', 'Oise', 242),
(3101, 'es', 'Orne', 243),
(3102, 'es', 'Pas-de-Calais', 244),
(3103, 'es', 'Puy-de-Dôme', 245),
(3104, 'es', 'Pyrénées-Atlantiques', 246),
(3105, 'es', 'Hautes-Pyrénées', 247),
(3106, 'es', 'Pyrénées-Orientales', 248),
(3107, 'es', 'Bas-Rhin', 249),
(3108, 'es', 'Haut-Rhin', 250),
(3109, 'es', 'Rhône', 251),
(3110, 'es', 'Haute-Saône', 252),
(3111, 'es', 'Saône-et-Loire', 253),
(3112, 'es', 'Sarthe', 254),
(3113, 'es', 'Savoie', 255),
(3114, 'es', 'Haute-Savoie', 256),
(3115, 'es', 'Paris', 257),
(3116, 'es', 'Seine-Maritime', 258),
(3117, 'es', 'Seine-et-Marne', 259),
(3118, 'es', 'Yvelines', 260),
(3119, 'es', 'Deux-Sèvres', 261),
(3120, 'es', 'Somme', 262),
(3121, 'es', 'Tarn', 263),
(3122, 'es', 'Tarn-et-Garonne', 264),
(3123, 'es', 'Var', 265),
(3124, 'es', 'Vaucluse', 266),
(3125, 'es', 'Vendée', 267),
(3126, 'es', 'Vienne', 268),
(3127, 'es', 'Haute-Vienne', 269),
(3128, 'es', 'Vosges', 270),
(3129, 'es', 'Yonne', 271),
(3130, 'es', 'Territoire-de-Belfort', 272),
(3131, 'es', 'Essonne', 273),
(3132, 'es', 'Hauts-de-Seine', 274),
(3133, 'es', 'Seine-Saint-Denis', 275),
(3134, 'es', 'Val-de-Marne', 276),
(3135, 'es', 'Val-d\'Oise', 277),
(3136, 'es', 'Alba', 278),
(3137, 'es', 'Arad', 279),
(3138, 'es', 'Argeş', 280),
(3139, 'es', 'Bacău', 281),
(3140, 'es', 'Bihor', 282),
(3141, 'es', 'Bistriţa-Năsăud', 283),
(3142, 'es', 'Botoşani', 284),
(3143, 'es', 'Braşov', 285),
(3144, 'es', 'Brăila', 286),
(3145, 'es', 'Bucureşti', 287),
(3146, 'es', 'Buzău', 288),
(3147, 'es', 'Caraş-Severin', 289),
(3148, 'es', 'Călăraşi', 290),
(3149, 'es', 'Cluj', 291),
(3150, 'es', 'Constanţa', 292),
(3151, 'es', 'Covasna', 293),
(3152, 'es', 'Dâmboviţa', 294),
(3153, 'es', 'Dolj', 295),
(3154, 'es', 'Galaţi', 296),
(3155, 'es', 'Giurgiu', 297),
(3156, 'es', 'Gorj', 298),
(3157, 'es', 'Harghita', 299),
(3158, 'es', 'Hunedoara', 300),
(3159, 'es', 'Ialomiţa', 301),
(3160, 'es', 'Iaşi', 302),
(3161, 'es', 'Ilfov', 303),
(3162, 'es', 'Maramureş', 304),
(3163, 'es', 'Mehedinţi', 305),
(3164, 'es', 'Mureş', 306),
(3165, 'es', 'Neamţ', 307),
(3166, 'es', 'Olt', 308),
(3167, 'es', 'Prahova', 309),
(3168, 'es', 'Satu-Mare', 310),
(3169, 'es', 'Sălaj', 311),
(3170, 'es', 'Sibiu', 312),
(3171, 'es', 'Suceava', 313),
(3172, 'es', 'Teleorman', 314),
(3173, 'es', 'Timiş', 315),
(3174, 'es', 'Tulcea', 316),
(3175, 'es', 'Vaslui', 317),
(3176, 'es', 'Vâlcea', 318),
(3177, 'es', 'Vrancea', 319),
(3178, 'es', 'Lappi', 320),
(3179, 'es', 'Pohjois-Pohjanmaa', 321),
(3180, 'es', 'Kainuu', 322),
(3181, 'es', 'Pohjois-Karjala', 323),
(3182, 'es', 'Pohjois-Savo', 324),
(3183, 'es', 'Etelä-Savo', 325),
(3184, 'es', 'Etelä-Pohjanmaa', 326),
(3185, 'es', 'Pohjanmaa', 327),
(3186, 'es', 'Pirkanmaa', 328),
(3187, 'es', 'Satakunta', 329),
(3188, 'es', 'Keski-Pohjanmaa', 330),
(3189, 'es', 'Keski-Suomi', 331),
(3190, 'es', 'Varsinais-Suomi', 332),
(3191, 'es', 'Etelä-Karjala', 333),
(3192, 'es', 'Päijät-Häme', 334),
(3193, 'es', 'Kanta-Häme', 335),
(3194, 'es', 'Uusimaa', 336),
(3195, 'es', 'Itä-Uusimaa', 337),
(3196, 'es', 'Kymenlaakso', 338),
(3197, 'es', 'Ahvenanmaa', 339),
(3198, 'es', 'Harjumaa', 340),
(3199, 'es', 'Hiiumaa', 341),
(3200, 'es', 'country_state_ida-Virumaa', 342),
(3201, 'es', 'Jõgevamaa', 343),
(3202, 'es', 'Järvamaa', 344),
(3203, 'es', 'Läänemaa', 345),
(3204, 'es', 'Lääne-Virumaa', 346),
(3205, 'es', 'Põlvamaa', 347),
(3206, 'es', 'Pärnumaa', 348),
(3207, 'es', 'Raplamaa', 349),
(3208, 'es', 'Saaremaa', 350),
(3209, 'es', 'Tartumaa', 351),
(3210, 'es', 'Valgamaa', 352),
(3211, 'es', 'Viljandimaa', 353),
(3212, 'es', 'Võrumaa', 354),
(3213, 'es', 'Daugavpils', 355),
(3214, 'es', 'Jelgava', 356),
(3215, 'es', 'Jēkabpils', 357),
(3216, 'es', 'Jūrmala', 358),
(3217, 'es', 'Liepāja', 359),
(3218, 'es', 'Liepājas novads', 360),
(3219, 'es', 'Rēzekne', 361),
(3220, 'es', 'Rīga', 362),
(3221, 'es', 'Rīgas novads', 363),
(3222, 'es', 'Valmiera', 364),
(3223, 'es', 'Ventspils', 365),
(3224, 'es', 'Aglonas novads', 366),
(3225, 'es', 'Aizkraukles novads', 367),
(3226, 'es', 'Aizputes novads', 368),
(3227, 'es', 'Aknīstes novads', 369),
(3228, 'es', 'Alojas novads', 370),
(3229, 'es', 'Alsungas novads', 371),
(3230, 'es', 'Alūksnes novads', 372),
(3231, 'es', 'Amatas novads', 373),
(3232, 'es', 'Apes novads', 374),
(3233, 'es', 'Auces novads', 375),
(3234, 'es', 'Babītes novads', 376),
(3235, 'es', 'Baldones novads', 377),
(3236, 'es', 'Baltinavas novads', 378),
(3237, 'es', 'Balvu novads', 379),
(3238, 'es', 'Bauskas novads', 380),
(3239, 'es', 'Beverīnas novads', 381),
(3240, 'es', 'Brocēnu novads', 382),
(3241, 'es', 'Burtnieku novads', 383),
(3242, 'es', 'Carnikavas novads', 384),
(3243, 'es', 'Cesvaines novads', 385),
(3244, 'es', 'Ciblas novads', 386),
(3245, 'es', 'Cēsu novads', 387),
(3246, 'es', 'Dagdas novads', 388),
(3247, 'es', 'Daugavpils novads', 389),
(3248, 'es', 'Dobeles novads', 390),
(3249, 'es', 'Dundagas novads', 391),
(3250, 'es', 'Durbes novads', 392),
(3251, 'es', 'Engures novads', 393),
(3252, 'es', 'Garkalnes novads', 394),
(3253, 'es', 'Grobiņas novads', 395),
(3254, 'es', 'Gulbenes novads', 396),
(3255, 'es', 'Iecavas novads', 397),
(3256, 'es', 'Ikšķiles novads', 398),
(3257, 'es', 'Ilūkstes novads', 399),
(3258, 'es', 'Inčukalna novads', 400),
(3259, 'es', 'Jaunjelgavas novads', 401),
(3260, 'es', 'Jaunpiebalgas novads', 402),
(3261, 'es', 'Jaunpils novads', 403),
(3262, 'es', 'Jelgavas novads', 404),
(3263, 'es', 'Jēkabpils novads', 405),
(3264, 'es', 'Kandavas novads', 406),
(3265, 'es', 'Kokneses novads', 407),
(3266, 'es', 'Krimuldas novads', 408),
(3267, 'es', 'Krustpils novads', 409),
(3268, 'es', 'Krāslavas novads', 410),
(3269, 'es', 'Kuldīgas novads', 411),
(3270, 'es', 'Kārsavas novads', 412),
(3271, 'es', 'Lielvārdes novads', 413),
(3272, 'es', 'Limbažu novads', 414),
(3273, 'es', 'Lubānas novads', 415),
(3274, 'es', 'Ludzas novads', 416),
(3275, 'es', 'Līgatnes novads', 417),
(3276, 'es', 'Līvānu novads', 418),
(3277, 'es', 'Madonas novads', 419),
(3278, 'es', 'Mazsalacas novads', 420),
(3279, 'es', 'Mālpils novads', 421),
(3280, 'es', 'Mārupes novads', 422),
(3281, 'es', 'Naukšēnu novads', 423),
(3282, 'es', 'Neretas novads', 424),
(3283, 'es', 'Nīcas novads', 425),
(3284, 'es', 'Ogres novads', 426),
(3285, 'es', 'Olaines novads', 427),
(3286, 'es', 'Ozolnieku novads', 428),
(3287, 'es', 'Preiļu novads', 429),
(3288, 'es', 'Priekules novads', 430),
(3289, 'es', 'Priekuļu novads', 431),
(3290, 'es', 'Pārgaujas novads', 432),
(3291, 'es', 'Pāvilostas novads', 433),
(3292, 'es', 'Pļaviņu novads', 434),
(3293, 'es', 'Raunas novads', 435),
(3294, 'es', 'Riebiņu novads', 436),
(3295, 'es', 'Rojas novads', 437),
(3296, 'es', 'Ropažu novads', 438),
(3297, 'es', 'Rucavas novads', 439),
(3298, 'es', 'Rugāju novads', 440),
(3299, 'es', 'Rundāles novads', 441),
(3300, 'es', 'Rēzeknes novads', 442),
(3301, 'es', 'Rūjienas novads', 443),
(3302, 'es', 'Salacgrīvas novads', 444),
(3303, 'es', 'Salas novads', 445),
(3304, 'es', 'Salaspils novads', 446),
(3305, 'es', 'Saldus novads', 447),
(3306, 'es', 'Saulkrastu novads', 448),
(3307, 'es', 'Siguldas novads', 449),
(3308, 'es', 'Skrundas novads', 450),
(3309, 'es', 'Skrīveru novads', 451),
(3310, 'es', 'Smiltenes novads', 452),
(3311, 'es', 'Stopiņu novads', 453),
(3312, 'es', 'Strenču novads', 454),
(3313, 'es', 'Sējas novads', 455),
(3314, 'es', 'Talsu novads', 456),
(3315, 'es', 'Tukuma novads', 457),
(3316, 'es', 'Tērvetes novads', 458),
(3317, 'es', 'Vaiņodes novads', 459),
(3318, 'es', 'Valkas novads', 460),
(3319, 'es', 'Valmieras novads', 461),
(3320, 'es', 'Varakļānu novads', 462),
(3321, 'es', 'Vecpiebalgas novads', 463),
(3322, 'es', 'Vecumnieku novads', 464),
(3323, 'es', 'Ventspils novads', 465),
(3324, 'es', 'Viesītes novads', 466),
(3325, 'es', 'Viļakas novads', 467),
(3326, 'es', 'Viļānu novads', 468),
(3327, 'es', 'Vārkavas novads', 469),
(3328, 'es', 'Zilupes novads', 470),
(3329, 'es', 'Ādažu novads', 471),
(3330, 'es', 'Ērgļu novads', 472),
(3331, 'es', 'Ķeguma novads', 473),
(3332, 'es', 'Ķekavas novads', 474),
(3333, 'es', 'Alytaus Apskritis', 475),
(3334, 'es', 'Kauno Apskritis', 476),
(3335, 'es', 'Klaipėdos Apskritis', 477),
(3336, 'es', 'Marijampolės Apskritis', 478),
(3337, 'es', 'Panevėžio Apskritis', 479),
(3338, 'es', 'Šiaulių Apskritis', 480),
(3339, 'es', 'Tauragės Apskritis', 481),
(3340, 'es', 'Telšių Apskritis', 482),
(3341, 'es', 'Utenos Apskritis', 483),
(3342, 'es', 'Vilniaus Apskritis', 484),
(3343, 'es', 'Acre', 485),
(3344, 'es', 'Alagoas', 486),
(3345, 'es', 'Amapá', 487),
(3346, 'es', 'Amazonas', 488),
(3347, 'es', 'Bahía', 489),
(3348, 'es', 'Ceará', 490),
(3349, 'es', 'Espíritu Santo', 491),
(3350, 'es', 'Goiás', 492),
(3351, 'es', 'Maranhão', 493),
(3352, 'es', 'Mato Grosso', 494),
(3353, 'es', 'Mato Grosso del Sur', 495),
(3354, 'es', 'Minas Gerais', 496),
(3355, 'es', 'Pará', 497),
(3356, 'es', 'Paraíba', 498),
(3357, 'es', 'Paraná', 499),
(3358, 'es', 'Pernambuco', 500),
(3359, 'es', 'Piauí', 501),
(3360, 'es', 'Río de Janeiro', 502),
(3361, 'es', 'Río Grande del Norte', 503),
(3362, 'es', 'Río Grande del Sur', 504),
(3363, 'es', 'Rondônia', 505),
(3364, 'es', 'Roraima', 506),
(3365, 'es', 'Santa Catarina', 507),
(3366, 'es', 'São Paulo', 508),
(3367, 'es', 'Sergipe', 509),
(3368, 'es', 'Tocantins', 510),
(3369, 'es', 'Distrito Federal', 511),
(3370, 'es', 'Zagrebačka županija', 512),
(3371, 'es', 'Krapinsko-zagorska županija', 513),
(3372, 'es', 'Sisačko-moslavačka županija', 514),
(3373, 'es', 'Karlovačka županija', 515),
(3374, 'es', 'Varaždinska županija', 516),
(3375, 'es', 'Koprivničko-križevačka županija', 517),
(3376, 'es', 'Bjelovarsko-bilogorska županija', 518),
(3377, 'es', 'Primorsko-goranska županija', 519),
(3378, 'es', 'Ličko-senjska županija', 520),
(3379, 'es', 'Virovitičko-podravska županija', 521),
(3380, 'es', 'Požeško-slavonska županija', 522),
(3381, 'es', 'Brodsko-posavska županija', 523),
(3382, 'es', 'Zadarska županija', 524),
(3383, 'es', 'Osječko-baranjska županija', 525),
(3384, 'es', 'Šibensko-kninska županija', 526),
(3385, 'es', 'Vukovarsko-srijemska županija', 527),
(3386, 'es', 'Splitsko-dalmatinska županija', 528),
(3387, 'es', 'Istarska županija', 529),
(3388, 'es', 'Dubrovačko-neretvanska županija', 530),
(3389, 'es', 'Međimurska županija', 531),
(3390, 'es', 'Grad Zagreb', 532),
(3391, 'es', 'Andaman and Nicobar Islands', 533),
(3392, 'es', 'Andhra Pradesh', 534),
(3393, 'es', 'Arunachal Pradesh', 535),
(3394, 'es', 'Assam', 536),
(3395, 'es', 'Bihar', 537),
(3396, 'es', 'Chandigarh', 538),
(3397, 'es', 'Chhattisgarh', 539),
(3398, 'es', 'Dadra and Nagar Haveli', 540),
(3399, 'es', 'Daman and Diu', 541),
(3400, 'es', 'Delhi', 542),
(3401, 'es', 'Goa', 543),
(3402, 'es', 'Gujarat', 544),
(3403, 'es', 'Haryana', 545),
(3404, 'es', 'Himachal Pradesh', 546),
(3405, 'es', 'Jammu and Kashmir', 547),
(3406, 'es', 'Jharkhand', 548),
(3407, 'es', 'Karnataka', 549),
(3408, 'es', 'Kerala', 550),
(3409, 'es', 'Lakshadweep', 551),
(3410, 'es', 'Madhya Pradesh', 552),
(3411, 'es', 'Maharashtra', 553),
(3412, 'es', 'Manipur', 554),
(3413, 'es', 'Meghalaya', 555),
(3414, 'es', 'Mizoram', 556),
(3415, 'es', 'Nagaland', 557),
(3416, 'es', 'Odisha', 558),
(3417, 'es', 'Puducherry', 559),
(3418, 'es', 'Punjab', 560),
(3419, 'es', 'Rajasthan', 561),
(3420, 'es', 'Sikkim', 562),
(3421, 'es', 'Tamil Nadu', 563),
(3422, 'es', 'Telangana', 564),
(3423, 'es', 'Tripura', 565),
(3424, 'es', 'Uttar Pradesh', 566),
(3425, 'es', 'Uttarakhand', 567),
(3426, 'es', 'West Bengal', 568),
(3427, 'es', 'Alto Paraguay', 569),
(3428, 'es', 'Alto Paraná', 570),
(3429, 'es', 'Amambay', 571),
(3430, 'es', 'Asunción', 572),
(3431, 'es', 'Boquerón', 573),
(3432, 'es', 'Caaguazú', 574),
(3433, 'es', 'Caazapá', 575),
(3434, 'es', 'Canindeyú', 576),
(3435, 'es', 'Central', 577),
(3436, 'es', 'Concepción', 578),
(3437, 'es', 'Cordillera', 579),
(3438, 'es', 'Guairá', 580),
(3439, 'es', 'Itapúa', 581),
(3440, 'es', 'Misiones', 582),
(3441, 'es', 'Paraguarí', 583),
(3442, 'es', 'Presidente Hayes', 584),
(3443, 'es', 'San Pedro', 585),
(3444, 'es', 'Ñeembucú', 586),
(3445, 'fa', 'آلاباما', 1),
(3446, 'fa', 'آلاسکا', 2),
(3447, 'fa', 'ساموآ آمریکایی', 3),
(3448, 'fa', 'آریزونا', 4),
(3449, 'fa', 'آرکانزاس', 5),
(3450, 'fa', 'نیروهای مسلح آفریقا', 6),
(3451, 'fa', 'Armed Forces America', 7),
(3452, 'fa', 'نیروهای مسلح کانادا', 8),
(3453, 'fa', 'نیروهای مسلح اروپا', 9),
(3454, 'fa', 'نیروهای مسلح خاورمیانه', 10),
(3455, 'fa', 'نیروهای مسلح اقیانوس آرام', 11),
(3456, 'fa', 'کالیفرنیا', 12),
(3457, 'fa', 'کلرادو', 13),
(3458, 'fa', 'کانکتیکات', 14),
(3459, 'fa', 'دلاور', 15),
(3460, 'fa', 'منطقه کلمبیا', 16),
(3461, 'fa', 'ایالات فدرال میکرونزی', 17),
(3462, 'fa', 'فلوریدا', 18),
(3463, 'fa', 'جورجیا', 19),
(3464, 'fa', 'گوام', 20),
(3465, 'fa', 'هاوایی', 21),
(3466, 'fa', 'آیداهو', 22),
(3467, 'fa', 'ایلینویز', 23),
(3468, 'fa', 'ایندیانا', 24),
(3469, 'fa', 'آیووا', 25),
(3470, 'fa', 'کانزاس', 26),
(3471, 'fa', 'کنتاکی', 27),
(3472, 'fa', 'لوئیزیانا', 28),
(3473, 'fa', 'ماین', 29),
(3474, 'fa', 'مای', 30),
(3475, 'fa', 'مریلند', 31),
(3476, 'fa', ' ', 32),
(3477, 'fa', 'میشیگان', 33),
(3478, 'fa', 'مینه سوتا', 34),
(3479, 'fa', 'می سی سی پی', 35),
(3480, 'fa', 'میسوری', 36),
(3481, 'fa', 'مونتانا', 37),
(3482, 'fa', 'نبراسکا', 38),
(3483, 'fa', 'نواد', 39),
(3484, 'fa', 'نیوهمپشایر', 40),
(3485, 'fa', 'نیوجرسی', 41),
(3486, 'fa', 'نیومکزیکو', 42),
(3487, 'fa', 'نیویورک', 43),
(3488, 'fa', 'کارولینای شمالی', 44),
(3489, 'fa', 'داکوتای شمالی', 45),
(3490, 'fa', 'جزایر ماریانای شمالی', 46),
(3491, 'fa', 'اوهایو', 47),
(3492, 'fa', 'اوکلاهما', 48),
(3493, 'fa', 'اورگان', 49),
(3494, 'fa', 'پالائو', 50),
(3495, 'fa', 'پنسیلوانیا', 51),
(3496, 'fa', 'پورتوریکو', 52),
(3497, 'fa', 'رود آیلند', 53),
(3498, 'fa', 'کارولینای جنوبی', 54),
(3499, 'fa', 'داکوتای جنوبی', 55),
(3500, 'fa', 'تنسی', 56),
(3501, 'fa', 'تگزاس', 57),
(3502, 'fa', 'یوتا', 58),
(3503, 'fa', 'ورمونت', 59),
(3504, 'fa', 'جزایر ویرجین', 60),
(3505, 'fa', 'ویرجینیا', 61),
(3506, 'fa', 'واشنگتن', 62),
(3507, 'fa', 'ویرجینیای غربی', 63),
(3508, 'fa', 'ویسکانسین', 64),
(3509, 'fa', 'وایومینگ', 65),
(3510, 'fa', 'آلبرتا', 66),
(3511, 'fa', 'بریتیش کلمبیا', 67),
(3512, 'fa', 'مانیتوبا', 68),
(3513, 'fa', 'نیوفاندلند و لابرادور', 69),
(3514, 'fa', 'نیوبرانزویک', 70),
(3515, 'fa', 'نوا اسکوشیا', 71),
(3516, 'fa', 'سرزمینهای شمال غربی', 72),
(3517, 'fa', 'نوناووت', 73),
(3518, 'fa', 'انتاریو', 74),
(3519, 'fa', 'جزیره پرنس ادوارد', 75),
(3520, 'fa', 'کبک', 76),
(3521, 'fa', 'ساسکاتچوان', 77),
(3522, 'fa', 'قلمرو یوکان', 78),
(3523, 'fa', 'نیدرزاکسن', 79),
(3524, 'fa', 'بادن-وورتمبرگ', 80),
(3525, 'fa', 'بایرن', 81),
(3526, 'fa', 'برلین', 82),
(3527, 'fa', 'براندنبورگ', 83),
(3528, 'fa', 'برمن', 84),
(3529, 'fa', 'هامبور', 85),
(3530, 'fa', 'هسن', 86),
(3531, 'fa', 'مکلنبورگ-وورپومرن', 87),
(3532, 'fa', 'نوردراین-وستفالن', 88),
(3533, 'fa', 'راینلاند-پلاتینات', 89),
(3534, 'fa', 'سارلند', 90),
(3535, 'fa', 'ساچسن', 91),
(3536, 'fa', 'ساچسن-آنهالت', 92),
(3537, 'fa', 'شلسویگ-هولشتاین', 93),
(3538, 'fa', 'تورینگی', 94),
(3539, 'fa', 'وین', 95),
(3540, 'fa', 'اتریش پایین', 96),
(3541, 'fa', 'اتریش فوقانی', 97),
(3542, 'fa', 'سالزبورگ', 98),
(3543, 'fa', 'کارنتا', 99),
(3544, 'fa', 'Steiermar', 100),
(3545, 'fa', 'تیرول', 101),
(3546, 'fa', 'بورگنلن', 102),
(3547, 'fa', 'Vorarlber', 103),
(3548, 'fa', 'آرگ', 104),
(3549, 'fa', '', 105),
(3550, 'fa', 'اپنزلسرهودن', 106),
(3551, 'fa', 'بر', 107),
(3552, 'fa', 'بازل-لندشفت', 108),
(3553, 'fa', 'بازل استاد', 109),
(3554, 'fa', 'فرایبورگ', 110),
(3555, 'fa', 'گنف', 111),
(3556, 'fa', 'گلاروس', 112),
(3557, 'fa', 'Graubünde', 113),
(3558, 'fa', 'ژورا', 114),
(3559, 'fa', 'لوزرن', 115),
(3560, 'fa', 'نوینبور', 116),
(3561, 'fa', 'نیدالد', 117),
(3562, 'fa', 'اوبولدن', 118),
(3563, 'fa', 'سنت گالن', 119),
(3564, 'fa', 'شافهاوز', 120),
(3565, 'fa', 'سولوتور', 121),
(3566, 'fa', 'شووی', 122),
(3567, 'fa', 'تورگاو', 123),
(3568, 'fa', 'تسسی', 124),
(3569, 'fa', 'اوری', 125),
(3570, 'fa', 'وادت', 126),
(3571, 'fa', 'والی', 127),
(3572, 'fa', 'ز', 128),
(3573, 'fa', 'زوریخ', 129),
(3574, 'fa', 'کورونا', 130),
(3575, 'fa', 'آلاوا', 131),
(3576, 'fa', 'آلبوم', 132),
(3577, 'fa', 'آلیکانت', 133),
(3578, 'fa', 'آلمریا', 134),
(3579, 'fa', 'آستوریا', 135),
(3580, 'fa', 'آویلا', 136),
(3581, 'fa', 'باداژوز', 137),
(3582, 'fa', 'ضرب و شتم', 138),
(3583, 'fa', 'بارسلون', 139),
(3584, 'fa', 'بورگو', 140),
(3585, 'fa', 'کاسر', 141),
(3586, 'fa', 'کادی', 142),
(3587, 'fa', 'کانتابریا', 143),
(3588, 'fa', 'کاستلون', 144),
(3589, 'fa', 'سوت', 145),
(3590, 'fa', 'سیوداد واقعی', 146),
(3591, 'fa', 'کوردوب', 147),
(3592, 'fa', 'Cuenc', 148),
(3593, 'fa', 'جیرون', 149),
(3594, 'fa', 'گراناد', 150),
(3595, 'fa', 'گوادالاجار', 151),
(3596, 'fa', 'Guipuzcoa', 152),
(3597, 'fa', 'هولوا', 153),
(3598, 'fa', 'هوسک', 154),
(3599, 'fa', 'جی', 155),
(3600, 'fa', 'لا ریوجا', 156),
(3601, 'fa', 'لاس پالماس', 157),
(3602, 'fa', 'لئو', 158),
(3603, 'fa', 'Lleid', 159),
(3604, 'fa', 'لوگ', 160),
(3605, 'fa', 'مادری', 161),
(3606, 'fa', 'مالاگ', 162),
(3607, 'fa', 'ملیلی', 163),
(3608, 'fa', 'مورسیا', 164),
(3609, 'fa', 'ناوار', 165),
(3610, 'fa', 'اورنس', 166),
(3611, 'fa', 'پالنسی', 167),
(3612, 'fa', 'پونتوودر', 168),
(3613, 'fa', 'سالامانک', 169),
(3614, 'fa', 'سانتا کروز د تنریفه', 170),
(3615, 'fa', 'سوگویا', 171),
(3616, 'fa', 'سوی', 172),
(3617, 'fa', 'سوریا', 173),
(3618, 'fa', 'تاراگونا', 174),
(3619, 'fa', 'ترئو', 175),
(3620, 'fa', 'تولدو', 176),
(3621, 'fa', 'والنسیا', 177),
(3622, 'fa', 'والادولی', 178),
(3623, 'fa', 'ویزکایا', 179),
(3624, 'fa', 'زامور', 180),
(3625, 'fa', 'ساراگوز', 181),
(3626, 'fa', 'عی', 182),
(3627, 'fa', 'آیز', 183),
(3628, 'fa', 'آلی', 184),
(3629, 'fa', 'آلپ-دو-هاوت-پرووانس', 185),
(3630, 'fa', 'هاوتس آلپ', 186),
(3631, 'fa', 'Alpes-Maritime', 187),
(3632, 'fa', 'اردچه', 188),
(3633, 'fa', 'آرد', 189),
(3634, 'fa', 'محاصر', 190),
(3635, 'fa', 'آبه', 191),
(3636, 'fa', 'Aud', 192),
(3637, 'fa', 'آویرون', 193),
(3638, 'fa', 'BOCAS DO Rhône', 194),
(3639, 'fa', 'نوعی عرق', 195),
(3640, 'fa', 'کانتینال', 196),
(3641, 'fa', 'چارنت', 197),
(3642, 'fa', 'چارنت-دریایی', 198),
(3643, 'fa', 'چ', 199),
(3644, 'fa', 'کور', 200),
(3645, 'fa', 'کرس دو ساد', 201),
(3646, 'fa', 'هاوت کورس', 202),
(3647, 'fa', 'کوستا دورکرز', 203),
(3648, 'fa', 'تخت دارمور', 204),
(3649, 'fa', 'درهم', 205),
(3650, 'fa', 'دوردگن', 206),
(3651, 'fa', 'دوب', 207),
(3652, 'fa', 'تعریف اول', 208),
(3653, 'fa', 'یور', 209),
(3654, 'fa', 'Eure-et-Loi', 210),
(3655, 'fa', 'فمینیست', 211),
(3656, 'fa', 'باغ', 212),
(3657, 'fa', 'اوت-گارون', 213),
(3658, 'fa', 'گر', 214),
(3659, 'fa', 'جیروند', 215),
(3660, 'fa', 'هیر', 216),
(3661, 'fa', 'هشدار داده می شود', 217),
(3662, 'fa', 'ایندور', 218),
(3663, 'fa', 'Indre-et-Loir', 219),
(3664, 'fa', 'ایزر', 220),
(3665, 'fa', 'یور', 221),
(3666, 'fa', 'لندز', 222),
(3667, 'fa', 'Loir-et-Che', 223),
(3668, 'fa', 'وام گرفتن', 224),
(3669, 'fa', 'Haute-Loir', 225),
(3670, 'fa', 'Loire-Atlantiqu', 226),
(3671, 'fa', 'لیرت', 227),
(3672, 'fa', 'لوط', 228),
(3673, 'fa', 'لوت و گارون', 229),
(3674, 'fa', 'لوزر', 230),
(3675, 'fa', 'ماین et-Loire', 231),
(3676, 'fa', 'مانچ', 232),
(3677, 'fa', 'مارن', 233),
(3678, 'fa', 'هاوت-مارن', 234),
(3679, 'fa', 'مایین', 235),
(3680, 'fa', 'مورته-et-Moselle', 236),
(3681, 'fa', 'مسخره کردن', 237),
(3682, 'fa', 'موربیان', 238),
(3683, 'fa', 'موزل', 239),
(3684, 'fa', 'Nièvr', 240),
(3685, 'fa', 'نورد', 241),
(3686, 'fa', 'اوی', 242),
(3687, 'fa', 'ارن', 243),
(3688, 'fa', 'پاس-کاله', 244),
(3689, 'fa', 'Puy-de-Dôm', 245),
(3690, 'fa', 'Pyrénées-Atlantiques', 246),
(3691, 'fa', 'Hautes-Pyrénée', 247),
(3692, 'fa', 'Pyrénées-Orientales', 248),
(3693, 'fa', 'بس راین', 249),
(3694, 'fa', 'هاوت-رین', 250),
(3695, 'fa', 'رو', 251),
(3696, 'fa', 'Haute-Saône', 252),
(3697, 'fa', 'Saône-et-Loire', 253),
(3698, 'fa', 'سارته', 254),
(3699, 'fa', 'ساووی', 255),
(3700, 'fa', 'هاو-ساووی', 256),
(3701, 'fa', 'پاری', 257),
(3702, 'fa', 'Seine-Maritime', 258),
(3703, 'fa', 'Seine-et-Marn', 259),
(3704, 'fa', 'ایولینز', 260),
(3705, 'fa', 'Deux-Sèvres', 261),
(3706, 'fa', 'سمی', 262),
(3707, 'fa', 'ضعف', 263),
(3708, 'fa', 'Tarn-et-Garonne', 264),
(3709, 'fa', 'وار', 265),
(3710, 'fa', 'ووکلوز', 266),
(3711, 'fa', 'وندیه', 267),
(3712, 'fa', 'وین', 268),
(3713, 'fa', 'هاوت-وین', 269),
(3714, 'fa', 'رأی دادن', 270),
(3715, 'fa', 'یون', 271),
(3716, 'fa', 'سرزمین-دو-بلفورت', 272),
(3717, 'fa', 'اسون', 273),
(3718, 'fa', 'هاوتز دی سی', 274),
(3719, 'fa', 'Seine-Saint-Deni', 275),
(3720, 'fa', 'والد مارن', 276),
(3721, 'fa', 'Val-d\'Ois', 277),
(3722, 'fa', 'آلبا', 278),
(3723, 'fa', 'آرا', 279),
(3724, 'fa', 'Argeș', 280),
(3725, 'fa', 'باکو', 281),
(3726, 'fa', 'بیهور', 282),
(3727, 'fa', 'بیستریا-نسوود', 283),
(3728, 'fa', 'بوتانی', 284),
(3729, 'fa', 'برازوف', 285),
(3730, 'fa', 'Brăila', 286),
(3731, 'fa', 'București', 287),
(3732, 'fa', 'بوز', 288),
(3733, 'fa', 'کارا- Severin', 289),
(3734, 'fa', 'کالیراسی', 290),
(3735, 'fa', 'كلوژ', 291),
(3736, 'fa', 'کنستانس', 292),
(3737, 'fa', 'کواسنا', 293),
(3738, 'fa', 'Dâmbovița', 294),
(3739, 'fa', 'دال', 295),
(3740, 'fa', 'گالشی', 296),
(3741, 'fa', 'جورجیو', 297),
(3742, 'fa', 'گور', 298),
(3743, 'fa', 'هارگیتا', 299),
(3744, 'fa', 'هوندهار', 300),
(3745, 'fa', 'ایالومیشا', 301),
(3746, 'fa', 'Iași', 302),
(3747, 'fa', 'Ilfo', 303),
(3748, 'fa', 'Maramureș', 304),
(3749, 'fa', 'Mehedinți', 305),
(3750, 'fa', 'Mureș', 306),
(3751, 'fa', 'Neamț', 307),
(3752, 'fa', 'اولت', 308),
(3753, 'fa', 'پرهوا', 309),
(3754, 'fa', 'ستو ماره', 310),
(3755, 'fa', 'سلاج', 311),
(3756, 'fa', 'سیبیو', 312),
(3757, 'fa', 'سوساو', 313),
(3758, 'fa', 'تلورمان', 314),
(3759, 'fa', 'تیمیچ', 315),
(3760, 'fa', 'تولسا', 316),
(3761, 'fa', 'واسلوئی', 317),
(3762, 'fa', 'Vâlcea', 318),
(3763, 'fa', 'ورانسا', 319),
(3764, 'fa', 'لاپی', 320),
(3765, 'fa', 'Pohjois-Pohjanmaa', 321),
(3766, 'fa', 'کائینو', 322),
(3767, 'fa', 'Pohjois-Karjala', 323),
(3768, 'fa', 'Pohjois-Savo', 324),
(3769, 'fa', 'اتل-ساوو', 325),
(3770, 'fa', 'کسکی-پوهانما', 326),
(3771, 'fa', 'Pohjanmaa', 327),
(3772, 'fa', 'پیرکانما', 328),
(3773, 'fa', 'ساتاکونتا', 329),
(3774, 'fa', 'کسکی-پوهانما', 330),
(3775, 'fa', 'کسکی-سوومی', 331),
(3776, 'fa', 'Varsinais-Suomi', 332),
(3777, 'fa', 'اتلی کرجالا', 333),
(3778, 'fa', 'Päijät-HAM', 334),
(3779, 'fa', 'کانتا-هوم', 335),
(3780, 'fa', 'یوسیما', 336),
(3781, 'fa', 'اوسیم', 337),
(3782, 'fa', 'کیمنلاکو', 338),
(3783, 'fa', 'آونوانما', 339),
(3784, 'fa', 'هارژوم', 340),
(3785, 'fa', 'سلا', 341),
(3786, 'fa', 'آیدا-ویروما', 342),
(3787, 'fa', 'Jõgevamaa', 343),
(3788, 'fa', 'جوروماا', 344),
(3789, 'fa', 'لونما', 345),
(3790, 'fa', 'لون-ویروما', 346),
(3791, 'fa', 'پالوماا', 347),
(3792, 'fa', 'پورنوما', 348),
(3793, 'fa', 'Raplama', 349),
(3794, 'fa', 'ساارما', 350),
(3795, 'fa', 'تارتوما', 351),
(3796, 'fa', 'والگام', 352),
(3797, 'fa', 'ویلجاندیم', 353),
(3798, 'fa', 'Võrumaa', 354),
(3799, 'fa', 'داگاوپیل', 355),
(3800, 'fa', 'جلگاو', 356),
(3801, 'fa', 'جکابیل', 357),
(3802, 'fa', 'جرمل', 358),
(3803, 'fa', 'لیپجا', 359),
(3804, 'fa', 'شهرستان لیپاج', 360),
(3805, 'fa', 'روژن', 361),
(3806, 'fa', 'راگ', 362),
(3807, 'fa', 'شهرستان ریگ', 363),
(3808, 'fa', 'والمییرا', 364),
(3809, 'fa', 'Ventspils', 365),
(3810, 'fa', 'آگلوناس نوادا', 366),
(3811, 'fa', 'تازه کاران آیزکرایکلس', 367),
(3812, 'fa', 'تازه واردان', 368),
(3813, 'fa', 'شهرستا', 369),
(3814, 'fa', 'نوازندگان آلوجاس', 370),
(3815, 'fa', 'تازه های آلسونگاس', 371),
(3816, 'fa', 'شهرستان آلوکس', 372),
(3817, 'fa', 'تازه کاران آماتاس', 373),
(3818, 'fa', 'میمون های تازه', 374),
(3819, 'fa', 'نوادا را آویز می کند', 375),
(3820, 'fa', 'شهرستان بابی', 376),
(3821, 'fa', 'Baldones novad', 377),
(3822, 'fa', 'نوین های بالتیناوا', 378),
(3823, 'fa', 'Balvu novad', 379),
(3824, 'fa', 'نوازندگان باسکاس', 380),
(3825, 'fa', 'شهرستان بورین', 381),
(3826, 'fa', 'شهرستان بروچن', 382),
(3827, 'fa', 'بوردنیکو نوآوران', 383),
(3828, 'fa', 'تازه کارنیکاوا', 384),
(3829, 'fa', 'نوازان سزوینس', 385),
(3830, 'fa', 'نوادگان Cibla', 386),
(3831, 'fa', 'شهرستان Cesis', 387),
(3832, 'fa', 'تازه های داگدا', 388),
(3833, 'fa', 'داوگاوپیلز نوادا', 389),
(3834, 'fa', 'دابل نوادی', 390),
(3835, 'fa', 'تازه کارهای دنداگاس', 391),
(3836, 'fa', 'نوباد دوربس', 392),
(3837, 'fa', 'مشغول تازه کارها است', 393),
(3838, 'fa', 'گرکالنس نواد', 394),
(3839, 'fa', 'یا شهرستان گروبی', 395),
(3840, 'fa', 'تازه های گلبنس', 396),
(3841, 'fa', 'Iecavas novads', 397),
(3842, 'fa', 'شهرستان ایسکل', 398),
(3843, 'fa', 'ایالت ایلکست', 399),
(3844, 'fa', 'کنددو د اینچوکالن', 400),
(3845, 'fa', 'نوجواد Jaunjelgavas', 401),
(3846, 'fa', 'تازه های Jaunpiebalgas', 402),
(3847, 'fa', 'شهرستان جونپیلس', 403),
(3848, 'fa', 'شهرستان جگلو', 404),
(3849, 'fa', 'شهرستان جکابیل', 405),
(3850, 'fa', 'شهرستان کنداوا', 406),
(3851, 'fa', 'شهرستان کوکنز', 407),
(3852, 'fa', 'شهرستان کریمولد', 408),
(3853, 'fa', 'شهرستان کرستپیل', 409),
(3854, 'fa', 'شهرستان کراسلاو', 410),
(3855, 'fa', 'کاندادو د کلدیگا', 411),
(3856, 'fa', 'کاندادو د کارساوا', 412),
(3857, 'fa', 'شهرستان لیولوارد', 413),
(3858, 'fa', 'شهرستان لیمباشی', 414),
(3859, 'fa', 'ای ولسوالی لوبون', 415),
(3860, 'fa', 'شهرستان لودزا', 416),
(3861, 'fa', 'شهرستان لیگات', 417),
(3862, 'fa', 'شهرستان لیوانی', 418),
(3863, 'fa', 'شهرستان مادونا', 419),
(3864, 'fa', 'شهرستان مازسال', 420),
(3865, 'fa', 'شهرستان مالپیلس', 421),
(3866, 'fa', 'شهرستان Mārupe', 422),
(3867, 'fa', 'ا کنددو د نوکشنی', 423),
(3868, 'fa', 'کاملاً یک شهرستان', 424),
(3869, 'fa', 'شهرستان نیکا', 425),
(3870, 'fa', 'شهرستان اوگر', 426),
(3871, 'fa', 'شهرستان اولین', 427),
(3872, 'fa', 'شهرستان اوزولنیکی', 428),
(3873, 'fa', 'شهرستان پرلیلی', 429),
(3874, 'fa', 'شهرستان Priekule', 430),
(3875, 'fa', 'Condado de Priekuļi', 431),
(3876, 'fa', 'شهرستان در حال حرکت', 432),
(3877, 'fa', 'شهرستان پاویلوستا', 433),
(3878, 'fa', 'شهرستان Plavinas', 4),
(3879, 'fa', 'شهرستان راونا', 435),
(3880, 'fa', 'شهرستان ریبیشی', 436),
(3881, 'fa', 'شهرستان روجا', 437),
(3882, 'fa', 'شهرستان روپازی', 438),
(3883, 'fa', 'شهرستان روساوا', 439),
(3884, 'fa', 'شهرستان روگی', 440),
(3885, 'fa', 'شهرستان راندل', 441),
(3886, 'fa', 'شهرستان ریزکن', 442),
(3887, 'fa', 'شهرستان روژینا', 443),
(3888, 'fa', 'شهرداری Salacgriva', 444),
(3889, 'fa', 'منطقه جزیره', 445),
(3890, 'fa', 'شهرستان Salaspils', 446),
(3891, 'fa', 'شهرستان سالدوس', 447),
(3892, 'fa', 'شهرستان ساولکرستی', 448),
(3893, 'fa', 'شهرستان سیگولدا', 449),
(3894, 'fa', 'شهرستان Skrunda', 450),
(3895, 'fa', 'شهرستان Skrīveri', 451),
(3896, 'fa', 'شهرستان Smiltene', 452),
(3897, 'fa', 'شهرستان ایستینی', 453);
INSERT INTO `country_state_translations` (`id`, `locale`, `default_name`, `country_state_id`) VALUES
(3898, 'fa', 'شهرستان استرنشی', 454),
(3899, 'fa', 'منطقه کاشت', 455),
(3900, 'fa', 'شهرستان تالسی', 456),
(3901, 'fa', 'توکومس', 457),
(3902, 'fa', 'شهرستان تورت', 458),
(3903, 'fa', 'یا شهرستان وایودود', 459),
(3904, 'fa', 'شهرستان والکا', 460),
(3905, 'fa', 'شهرستان Valmiera', 461),
(3906, 'fa', 'شهرستان وارکانی', 462),
(3907, 'fa', 'شهرستان Vecpiebalga', 463),
(3908, 'fa', 'شهرستان وکومنیکی', 464),
(3909, 'fa', 'شهرستان ونتسپیل', 465),
(3910, 'fa', 'کنددو د بازدید', 466),
(3911, 'fa', 'شهرستان ویلاکا', 467),
(3912, 'fa', 'شهرستان ویلانی', 468),
(3913, 'fa', 'شهرستان واركاوا', 469),
(3914, 'fa', 'شهرستان زیلوپ', 470),
(3915, 'fa', 'شهرستان آدازی', 471),
(3916, 'fa', 'شهرستان ارگلو', 472),
(3917, 'fa', 'شهرستان کگومس', 473),
(3918, 'fa', 'شهرستان ککاوا', 474),
(3919, 'fa', 'شهرستان Alytus', 475),
(3920, 'fa', 'شهرستان Kaunas', 476),
(3921, 'fa', 'شهرستان کلایپدا', 477),
(3922, 'fa', 'شهرستان ماریجامپولی', 478),
(3923, 'fa', 'شهرستان پانویسیز', 479),
(3924, 'fa', 'شهرستان سیاولیا', 480),
(3925, 'fa', 'شهرستان تاجیج', 481),
(3926, 'fa', 'شهرستان تلشیا', 482),
(3927, 'fa', 'شهرستان اوتنا', 483),
(3928, 'fa', 'شهرستان ویلنیوس', 484),
(3929, 'fa', 'جریب', 485),
(3930, 'fa', 'حالت', 486),
(3931, 'fa', 'آمپá', 487),
(3932, 'fa', 'آمازون', 488),
(3933, 'fa', 'باهی', 489),
(3934, 'fa', 'سارا', 490),
(3935, 'fa', 'روح القدس', 491),
(3936, 'fa', 'برو', 492),
(3937, 'fa', 'مارانهائ', 493),
(3938, 'fa', 'ماتو گروسو', 494),
(3939, 'fa', 'Mato Grosso do Sul', 495),
(3940, 'fa', 'ایالت میناس گرایس', 496),
(3941, 'fa', 'پار', 497),
(3942, 'fa', 'حالت', 498),
(3943, 'fa', 'پارانا', 499),
(3944, 'fa', 'حال', 500),
(3945, 'fa', 'پیازو', 501),
(3946, 'fa', 'ریو دوژانیرو', 502),
(3947, 'fa', 'ریو گراند دو نورته', 503),
(3948, 'fa', 'ریو گراند دو سول', 504),
(3949, 'fa', 'Rondôni', 505),
(3950, 'fa', 'Roraim', 506),
(3951, 'fa', 'سانتا کاتارینا', 507),
(3952, 'fa', 'پ', 508),
(3953, 'fa', 'Sergip', 509),
(3954, 'fa', 'توکانتین', 510),
(3955, 'fa', 'منطقه فدرال', 511),
(3956, 'fa', 'شهرستان زاگرب', 512),
(3957, 'fa', 'Condado de Krapina-Zagorj', 513),
(3958, 'fa', 'شهرستان سیساک-موسلاوینا', 514),
(3959, 'fa', 'شهرستان کارلوواک', 515),
(3960, 'fa', 'شهرداری واراžدین', 516),
(3961, 'fa', 'Condo de Koprivnica-Križevci', 517),
(3962, 'fa', 'محل سکونت د بیلوار-بلوگورا', 518),
(3963, 'fa', 'Condado de Primorje-Gorski kotar', 519),
(3964, 'fa', 'شهرستان لیکا-سنج', 520),
(3965, 'fa', 'Condado de Virovitica-Podravina', 521),
(3966, 'fa', 'شهرستان پوژگا-اسلاونیا', 522),
(3967, 'fa', 'Condado de Brod-Posavina', 523),
(3968, 'fa', 'شهرستان زجر', 524),
(3969, 'fa', 'Condado de Osijek-Baranja', 525),
(3970, 'fa', 'Condo de Sibenik-Knin', 526),
(3971, 'fa', 'Condado de Vukovar-Srijem', 527),
(3972, 'fa', 'شهرستان اسپلیت-Dalmatia', 528),
(3973, 'fa', 'شهرستان ایستیا', 529),
(3974, 'fa', 'Condado de Dubrovnik-Neretva', 530),
(3975, 'fa', 'شهرستان Međimurje', 531),
(3976, 'fa', 'شهر زاگرب', 532),
(3977, 'fa', 'جزایر آندامان و نیکوبار', 533),
(3978, 'fa', 'آندرا پرادش', 534),
(3979, 'fa', 'آروناچال پرادش', 535),
(3980, 'fa', 'آسام', 536),
(3981, 'fa', 'Biha', 537),
(3982, 'fa', 'چاندیگار', 538),
(3983, 'fa', 'چاتیسگار', 539),
(3984, 'fa', 'دادرا و نگار هاولی', 540),
(3985, 'fa', 'دامان و دیو', 541),
(3986, 'fa', 'دهلی', 542),
(3987, 'fa', 'گوا', 543),
(3988, 'fa', 'گجرات', 544),
(3989, 'fa', 'هاریانا', 545),
(3990, 'fa', 'هیماچال پرادش', 546),
(3991, 'fa', 'جامو و کشمیر', 547),
(3992, 'fa', 'جهخند', 548),
(3993, 'fa', 'کارناتاکا', 549),
(3994, 'fa', 'کرال', 550),
(3995, 'fa', 'لاکشادوپ', 551),
(3996, 'fa', 'مادیا پرادش', 552),
(3997, 'fa', 'ماهاراشترا', 553),
(3998, 'fa', 'مانی پور', 554),
(3999, 'fa', 'مگالایا', 555),
(4000, 'fa', 'مزورام', 556),
(4001, 'fa', 'ناگلند', 557),
(4002, 'fa', 'ادیشا', 558),
(4003, 'fa', 'میناکاری', 559),
(4004, 'fa', 'پنجا', 560),
(4005, 'fa', 'راجستان', 561),
(4006, 'fa', 'سیکیم', 562),
(4007, 'fa', 'تامیل نادو', 563),
(4008, 'fa', 'تلنگانا', 564),
(4009, 'fa', 'تریپورا', 565),
(4010, 'fa', 'اوتار پرادش', 566),
(4011, 'fa', 'اوتاراکند', 567),
(4012, 'fa', 'بنگال غرب', 568),
(4013, 'pt_BR', 'Alabama', 1),
(4014, 'pt_BR', 'Alaska', 2),
(4015, 'pt_BR', 'Samoa Americana', 3),
(4016, 'pt_BR', 'Arizona', 4),
(4017, 'pt_BR', 'Arkansas', 5),
(4018, 'pt_BR', 'Forças Armadas da África', 6),
(4019, 'pt_BR', 'Forças Armadas das Américas', 7),
(4020, 'pt_BR', 'Forças Armadas do Canadá', 8),
(4021, 'pt_BR', 'Forças Armadas da Europa', 9),
(4022, 'pt_BR', 'Forças Armadas do Oriente Médio', 10),
(4023, 'pt_BR', 'Forças Armadas do Pacífico', 11),
(4024, 'pt_BR', 'California', 12),
(4025, 'pt_BR', 'Colorado', 13),
(4026, 'pt_BR', 'Connecticut', 14),
(4027, 'pt_BR', 'Delaware', 15),
(4028, 'pt_BR', 'Distrito de Columbia', 16),
(4029, 'pt_BR', 'Estados Federados da Micronésia', 17),
(4030, 'pt_BR', 'Florida', 18),
(4031, 'pt_BR', 'Geórgia', 19),
(4032, 'pt_BR', 'Guam', 20),
(4033, 'pt_BR', 'Havaí', 21),
(4034, 'pt_BR', 'Idaho', 22),
(4035, 'pt_BR', 'Illinois', 23),
(4036, 'pt_BR', 'Indiana', 24),
(4037, 'pt_BR', 'Iowa', 25),
(4038, 'pt_BR', 'Kansas', 26),
(4039, 'pt_BR', 'Kentucky', 27),
(4040, 'pt_BR', 'Louisiana', 28),
(4041, 'pt_BR', 'Maine', 29),
(4042, 'pt_BR', 'Ilhas Marshall', 30),
(4043, 'pt_BR', 'Maryland', 31),
(4044, 'pt_BR', 'Massachusetts', 32),
(4045, 'pt_BR', 'Michigan', 33),
(4046, 'pt_BR', 'Minnesota', 34),
(4047, 'pt_BR', 'Mississippi', 35),
(4048, 'pt_BR', 'Missouri', 36),
(4049, 'pt_BR', 'Montana', 37),
(4050, 'pt_BR', 'Nebraska', 38),
(4051, 'pt_BR', 'Nevada', 39),
(4052, 'pt_BR', 'New Hampshire', 40),
(4053, 'pt_BR', 'Nova Jersey', 41),
(4054, 'pt_BR', 'Novo México', 42),
(4055, 'pt_BR', 'Nova York', 43),
(4056, 'pt_BR', 'Carolina do Norte', 44),
(4057, 'pt_BR', 'Dakota do Norte', 45),
(4058, 'pt_BR', 'Ilhas Marianas do Norte', 46),
(4059, 'pt_BR', 'Ohio', 47),
(4060, 'pt_BR', 'Oklahoma', 48),
(4061, 'pt_BR', 'Oregon', 4),
(4062, 'pt_BR', 'Palau', 50),
(4063, 'pt_BR', 'Pensilvânia', 51),
(4064, 'pt_BR', 'Porto Rico', 52),
(4065, 'pt_BR', 'Rhode Island', 53),
(4066, 'pt_BR', 'Carolina do Sul', 54),
(4067, 'pt_BR', 'Dakota do Sul', 55),
(4068, 'pt_BR', 'Tennessee', 56),
(4069, 'pt_BR', 'Texas', 57),
(4070, 'pt_BR', 'Utah', 58),
(4071, 'pt_BR', 'Vermont', 59),
(4072, 'pt_BR', 'Ilhas Virgens', 60),
(4073, 'pt_BR', 'Virginia', 61),
(4074, 'pt_BR', 'Washington', 62),
(4075, 'pt_BR', 'West Virginia', 63),
(4076, 'pt_BR', 'Wisconsin', 64),
(4077, 'pt_BR', 'Wyoming', 65),
(4078, 'pt_BR', 'Alberta', 66),
(4079, 'pt_BR', 'Colúmbia Britânica', 67),
(4080, 'pt_BR', 'Manitoba', 68),
(4081, 'pt_BR', 'Terra Nova e Labrador', 69),
(4082, 'pt_BR', 'New Brunswick', 70),
(4083, 'pt_BR', 'Nova Escócia', 7),
(4084, 'pt_BR', 'Territórios do Noroeste', 72),
(4085, 'pt_BR', 'Nunavut', 73),
(4086, 'pt_BR', 'Ontario', 74),
(4087, 'pt_BR', 'Ilha do Príncipe Eduardo', 75),
(4088, 'pt_BR', 'Quebec', 76),
(4089, 'pt_BR', 'Saskatchewan', 77),
(4090, 'pt_BR', 'Território yukon', 78),
(4091, 'pt_BR', 'Niedersachsen', 79),
(4092, 'pt_BR', 'Baden-Wurttemberg', 80),
(4093, 'pt_BR', 'Bayern', 81),
(4094, 'pt_BR', 'Berlim', 82),
(4095, 'pt_BR', 'Brandenburg', 83),
(4096, 'pt_BR', 'Bremen', 84),
(4097, 'pt_BR', 'Hamburgo', 85),
(4098, 'pt_BR', 'Hessen', 86),
(4099, 'pt_BR', 'Mecklenburg-Vorpommern', 87),
(4100, 'pt_BR', 'Nordrhein-Westfalen', 88),
(4101, 'pt_BR', 'Renânia-Palatinado', 8),
(4102, 'pt_BR', 'Sarre', 90),
(4103, 'pt_BR', 'Sachsen', 91),
(4104, 'pt_BR', 'Sachsen-Anhalt', 92),
(4105, 'pt_BR', 'Schleswig-Holstein', 93),
(4106, 'pt_BR', 'Turíngia', 94),
(4107, 'pt_BR', 'Viena', 95),
(4108, 'pt_BR', 'Baixa Áustria', 96),
(4109, 'pt_BR', 'Oberösterreich', 97),
(4110, 'pt_BR', 'Salzburg', 98),
(4111, 'pt_BR', 'Caríntia', 99),
(4112, 'pt_BR', 'Steiermark', 100),
(4113, 'pt_BR', 'Tirol', 101),
(4114, 'pt_BR', 'Burgenland', 102),
(4115, 'pt_BR', 'Vorarlberg', 103),
(4116, 'pt_BR', 'Aargau', 104),
(4117, 'pt_BR', 'Appenzell Innerrhoden', 105),
(4118, 'pt_BR', 'Appenzell Ausserrhoden', 106),
(4119, 'pt_BR', 'Bern', 107),
(4120, 'pt_BR', 'Basel-Landschaft', 108),
(4121, 'pt_BR', 'Basel-Stadt', 109),
(4122, 'pt_BR', 'Freiburg', 110),
(4123, 'pt_BR', 'Genf', 111),
(4124, 'pt_BR', 'Glarus', 112),
(4125, 'pt_BR', 'Grisons', 113),
(4126, 'pt_BR', 'Jura', 114),
(4127, 'pt_BR', 'Luzern', 115),
(4128, 'pt_BR', 'Neuenburg', 116),
(4129, 'pt_BR', 'Nidwalden', 117),
(4130, 'pt_BR', 'Obwalden', 118),
(4131, 'pt_BR', 'St. Gallen', 119),
(4132, 'pt_BR', 'Schaffhausen', 120),
(4133, 'pt_BR', 'Solothurn', 121),
(4134, 'pt_BR', 'Schwyz', 122),
(4135, 'pt_BR', 'Thurgau', 123),
(4136, 'pt_BR', 'Tessin', 124),
(4137, 'pt_BR', 'Uri', 125),
(4138, 'pt_BR', 'Waadt', 126),
(4139, 'pt_BR', 'Wallis', 127),
(4140, 'pt_BR', 'Zug', 128),
(4141, 'pt_BR', 'Zurique', 129),
(4142, 'pt_BR', 'Corunha', 130),
(4143, 'pt_BR', 'Álava', 131),
(4144, 'pt_BR', 'Albacete', 132),
(4145, 'pt_BR', 'Alicante', 133),
(4146, 'pt_BR', 'Almeria', 134),
(4147, 'pt_BR', 'Astúrias', 135),
(4148, 'pt_BR', 'Avila', 136),
(4149, 'pt_BR', 'Badajoz', 137),
(4150, 'pt_BR', 'Baleares', 138),
(4151, 'pt_BR', 'Barcelona', 139),
(4152, 'pt_BR', 'Burgos', 140),
(4153, 'pt_BR', 'Caceres', 141),
(4154, 'pt_BR', 'Cadiz', 142),
(4155, 'pt_BR', 'Cantábria', 143),
(4156, 'pt_BR', 'Castellon', 144),
(4157, 'pt_BR', 'Ceuta', 145),
(4158, 'pt_BR', 'Ciudad Real', 146),
(4159, 'pt_BR', 'Cordoba', 147),
(4160, 'pt_BR', 'Cuenca', 148),
(4161, 'pt_BR', 'Girona', 149),
(4162, 'pt_BR', 'Granada', 150),
(4163, 'pt_BR', 'Guadalajara', 151),
(4164, 'pt_BR', 'Guipuzcoa', 152),
(4165, 'pt_BR', 'Huelva', 153),
(4166, 'pt_BR', 'Huesca', 154),
(4167, 'pt_BR', 'Jaen', 155),
(4168, 'pt_BR', 'La Rioja', 156),
(4169, 'pt_BR', 'Las Palmas', 157),
(4170, 'pt_BR', 'Leon', 158),
(4171, 'pt_BR', 'Lleida', 159),
(4172, 'pt_BR', 'Lugo', 160),
(4173, 'pt_BR', 'Madri', 161),
(4174, 'pt_BR', 'Málaga', 162),
(4175, 'pt_BR', 'Melilla', 163),
(4176, 'pt_BR', 'Murcia', 164),
(4177, 'pt_BR', 'Navarra', 165),
(4178, 'pt_BR', 'Ourense', 166),
(4179, 'pt_BR', 'Palencia', 167),
(4180, 'pt_BR', 'Pontevedra', 168),
(4181, 'pt_BR', 'Salamanca', 169),
(4182, 'pt_BR', 'Santa Cruz de Tenerife', 170),
(4183, 'pt_BR', 'Segovia', 171),
(4184, 'pt_BR', 'Sevilla', 172),
(4185, 'pt_BR', 'Soria', 173),
(4186, 'pt_BR', 'Tarragona', 174),
(4187, 'pt_BR', 'Teruel', 175),
(4188, 'pt_BR', 'Toledo', 176),
(4189, 'pt_BR', 'Valencia', 177),
(4190, 'pt_BR', 'Valladolid', 178),
(4191, 'pt_BR', 'Vizcaya', 179),
(4192, 'pt_BR', 'Zamora', 180),
(4193, 'pt_BR', 'Zaragoza', 181),
(4194, 'pt_BR', 'Ain', 182),
(4195, 'pt_BR', 'Aisne', 183),
(4196, 'pt_BR', 'Allier', 184),
(4197, 'pt_BR', 'Alpes da Alta Provença', 185),
(4198, 'pt_BR', 'Altos Alpes', 186),
(4199, 'pt_BR', 'Alpes-Maritimes', 187),
(4200, 'pt_BR', 'Ardèche', 188),
(4201, 'pt_BR', 'Ardennes', 189),
(4202, 'pt_BR', 'Ariege', 190),
(4203, 'pt_BR', 'Aube', 191),
(4204, 'pt_BR', 'Aude', 192),
(4205, 'pt_BR', 'Aveyron', 193),
(4206, 'pt_BR', 'BOCAS DO Rhône', 194),
(4207, 'pt_BR', 'Calvados', 195),
(4208, 'pt_BR', 'Cantal', 196),
(4209, 'pt_BR', 'Charente', 197),
(4210, 'pt_BR', 'Charente-Maritime', 198),
(4211, 'pt_BR', 'Cher', 199),
(4212, 'pt_BR', 'Corrèze', 200),
(4213, 'pt_BR', 'Corse-du-Sud', 201),
(4214, 'pt_BR', 'Alta Córsega', 202),
(4215, 'pt_BR', 'Costa d\'OrCorrèze', 203),
(4216, 'pt_BR', 'Cotes d\'Armor', 204),
(4217, 'pt_BR', 'Creuse', 205),
(4218, 'pt_BR', 'Dordogne', 206),
(4219, 'pt_BR', 'Doubs', 207),
(4220, 'pt_BR', 'DrômeFinistère', 208),
(4221, 'pt_BR', 'Eure', 209),
(4222, 'pt_BR', 'Eure-et-Loir', 210),
(4223, 'pt_BR', 'Finistère', 211),
(4224, 'pt_BR', 'Gard', 212),
(4225, 'pt_BR', 'Haute-Garonne', 213),
(4226, 'pt_BR', 'Gers', 214),
(4227, 'pt_BR', 'Gironde', 215),
(4228, 'pt_BR', 'Hérault', 216),
(4229, 'pt_BR', 'Ille-et-Vilaine', 217),
(4230, 'pt_BR', 'Indre', 218),
(4231, 'pt_BR', 'Indre-et-Loire', 219),
(4232, 'pt_BR', 'Isère', 220),
(4233, 'pt_BR', 'Jura', 221),
(4234, 'pt_BR', 'Landes', 222),
(4235, 'pt_BR', 'Loir-et-Cher', 223),
(4236, 'pt_BR', 'Loire', 224),
(4237, 'pt_BR', 'Haute-Loire', 22),
(4238, 'pt_BR', 'Loire-Atlantique', 226),
(4239, 'pt_BR', 'Loiret', 227),
(4240, 'pt_BR', 'Lot', 228),
(4241, 'pt_BR', 'Lot e Garona', 229),
(4242, 'pt_BR', 'Lozère', 230),
(4243, 'pt_BR', 'Maine-et-Loire', 231),
(4244, 'pt_BR', 'Manche', 232),
(4245, 'pt_BR', 'Marne', 233),
(4246, 'pt_BR', 'Haute-Marne', 234),
(4247, 'pt_BR', 'Mayenne', 235),
(4248, 'pt_BR', 'Meurthe-et-Moselle', 236),
(4249, 'pt_BR', 'Meuse', 237),
(4250, 'pt_BR', 'Morbihan', 238),
(4251, 'pt_BR', 'Moselle', 239),
(4252, 'pt_BR', 'Nièvre', 240),
(4253, 'pt_BR', 'Nord', 241),
(4254, 'pt_BR', 'Oise', 242),
(4255, 'pt_BR', 'Orne', 243),
(4256, 'pt_BR', 'Pas-de-Calais', 244),
(4257, 'pt_BR', 'Puy-de-Dôme', 24),
(4258, 'pt_BR', 'Pirineus Atlânticos', 246),
(4259, 'pt_BR', 'Hautes-Pyrénées', 247),
(4260, 'pt_BR', 'Pirineus Orientais', 248),
(4261, 'pt_BR', 'Bas-Rhin', 249),
(4262, 'pt_BR', 'Alto Reno', 250),
(4263, 'pt_BR', 'Rhône', 251),
(4264, 'pt_BR', 'Haute-Saône', 252),
(4265, 'pt_BR', 'Saône-et-Loire', 253),
(4266, 'pt_BR', 'Sarthe', 25),
(4267, 'pt_BR', 'Savoie', 255),
(4268, 'pt_BR', 'Alta Sabóia', 256),
(4269, 'pt_BR', 'Paris', 257),
(4270, 'pt_BR', 'Seine-Maritime', 258),
(4271, 'pt_BR', 'Seine-et-Marne', 259),
(4272, 'pt_BR', 'Yvelines', 260),
(4273, 'pt_BR', 'Deux-Sèvres', 261),
(4274, 'pt_BR', 'Somme', 262),
(4275, 'pt_BR', 'Tarn', 263),
(4276, 'pt_BR', 'Tarn-et-Garonne', 264),
(4277, 'pt_BR', 'Var', 265),
(4278, 'pt_BR', 'Vaucluse', 266),
(4279, 'pt_BR', 'Compradora', 267),
(4280, 'pt_BR', 'Vienne', 268),
(4281, 'pt_BR', 'Haute-Vienne', 269),
(4282, 'pt_BR', 'Vosges', 270),
(4283, 'pt_BR', 'Yonne', 271),
(4284, 'pt_BR', 'Território de Belfort', 272),
(4285, 'pt_BR', 'Essonne', 273),
(4286, 'pt_BR', 'Altos do Sena', 274),
(4287, 'pt_BR', 'Seine-Saint-Denis', 275),
(4288, 'pt_BR', 'Val-de-Marne', 276),
(4289, 'pt_BR', 'Val-d\'Oise', 277),
(4290, 'pt_BR', 'Alba', 278),
(4291, 'pt_BR', 'Arad', 279),
(4292, 'pt_BR', 'Arges', 280),
(4293, 'pt_BR', 'Bacau', 281),
(4294, 'pt_BR', 'Bihor', 282),
(4295, 'pt_BR', 'Bistrita-Nasaud', 283),
(4296, 'pt_BR', 'Botosani', 284),
(4297, 'pt_BR', 'Brașov', 285),
(4298, 'pt_BR', 'Braila', 286),
(4299, 'pt_BR', 'Bucareste', 287),
(4300, 'pt_BR', 'Buzau', 288),
(4301, 'pt_BR', 'Caras-Severin', 289),
(4302, 'pt_BR', 'Călărași', 290),
(4303, 'pt_BR', 'Cluj', 291),
(4304, 'pt_BR', 'Constanta', 292),
(4305, 'pt_BR', 'Covasna', 29),
(4306, 'pt_BR', 'Dambovita', 294),
(4307, 'pt_BR', 'Dolj', 295),
(4308, 'pt_BR', 'Galati', 296),
(4309, 'pt_BR', 'Giurgiu', 297),
(4310, 'pt_BR', 'Gorj', 298),
(4311, 'pt_BR', 'Harghita', 299),
(4312, 'pt_BR', 'Hunedoara', 300),
(4313, 'pt_BR', 'Ialomita', 301),
(4314, 'pt_BR', 'Iasi', 302),
(4315, 'pt_BR', 'Ilfov', 303),
(4316, 'pt_BR', 'Maramures', 304),
(4317, 'pt_BR', 'Maramures', 305),
(4318, 'pt_BR', 'Mures', 306),
(4319, 'pt_BR', 'alemão', 307),
(4320, 'pt_BR', 'Olt', 308),
(4321, 'pt_BR', 'Prahova', 309),
(4322, 'pt_BR', 'Satu-Mare', 310),
(4323, 'pt_BR', 'Salaj', 311),
(4324, 'pt_BR', 'Sibiu', 312),
(4325, 'pt_BR', 'Suceava', 313),
(4326, 'pt_BR', 'Teleorman', 314),
(4327, 'pt_BR', 'Timis', 315),
(4328, 'pt_BR', 'Tulcea', 316),
(4329, 'pt_BR', 'Vaslui', 317),
(4330, 'pt_BR', 'dale', 318),
(4331, 'pt_BR', 'Vrancea', 319),
(4332, 'pt_BR', 'Lappi', 320),
(4333, 'pt_BR', 'Pohjois-Pohjanmaa', 321),
(4334, 'pt_BR', 'Kainuu', 322),
(4335, 'pt_BR', 'Pohjois-Karjala', 323),
(4336, 'pt_BR', 'Pohjois-Savo', 324),
(4337, 'pt_BR', 'Sul Savo', 325),
(4338, 'pt_BR', 'Ostrobothnia do sul', 326),
(4339, 'pt_BR', 'Pohjanmaa', 327),
(4340, 'pt_BR', 'Pirkanmaa', 328),
(4341, 'pt_BR', 'Satakunta', 329),
(4342, 'pt_BR', 'Keski-Pohjanmaa', 330),
(4343, 'pt_BR', 'Keski-Suomi', 331),
(4344, 'pt_BR', 'Varsinais-Suomi', 332),
(4345, 'pt_BR', 'Carélia do Sul', 333),
(4346, 'pt_BR', 'Päijät-Häme', 334),
(4347, 'pt_BR', 'Kanta-Häme', 335),
(4348, 'pt_BR', 'Uusimaa', 336),
(4349, 'pt_BR', 'Uusimaa', 337),
(4350, 'pt_BR', 'Kymenlaakso', 338),
(4351, 'pt_BR', 'Ahvenanmaa', 339),
(4352, 'pt_BR', 'Harjumaa', 340),
(4353, 'pt_BR', 'Hiiumaa', 341),
(4354, 'pt_BR', 'Ida-Virumaa', 342),
(4355, 'pt_BR', 'Condado de Jõgeva', 343),
(4356, 'pt_BR', 'Condado de Järva', 344),
(4357, 'pt_BR', 'Läänemaa', 345),
(4358, 'pt_BR', 'Condado de Lääne-Viru', 346),
(4359, 'pt_BR', 'Condado de Põlva', 347),
(4360, 'pt_BR', 'Condado de Pärnu', 348),
(4361, 'pt_BR', 'Raplamaa', 349),
(4362, 'pt_BR', 'Saaremaa', 350),
(4363, 'pt_BR', 'Tartumaa', 351),
(4364, 'pt_BR', 'Valgamaa', 352),
(4365, 'pt_BR', 'Viljandimaa', 353),
(4366, 'pt_BR', 'Võrumaa', 354),
(4367, 'pt_BR', 'Daugavpils', 355),
(4368, 'pt_BR', 'Jelgava', 356),
(4369, 'pt_BR', 'Jekabpils', 357),
(4370, 'pt_BR', 'Jurmala', 358),
(4371, 'pt_BR', 'Liepaja', 359),
(4372, 'pt_BR', 'Liepaja County', 360),
(4373, 'pt_BR', 'Rezekne', 361),
(4374, 'pt_BR', 'Riga', 362),
(4375, 'pt_BR', 'Condado de Riga', 363),
(4376, 'pt_BR', 'Valmiera', 364),
(4377, 'pt_BR', 'Ventspils', 365),
(4378, 'pt_BR', 'Aglonas novads', 366),
(4379, 'pt_BR', 'Aizkraukles novads', 367),
(4380, 'pt_BR', 'Aizputes novads', 368),
(4381, 'pt_BR', 'Condado de Akniste', 369),
(4382, 'pt_BR', 'Alojas novads', 370),
(4383, 'pt_BR', 'Alsungas novads', 371),
(4384, 'pt_BR', 'Aluksne County', 372),
(4385, 'pt_BR', 'Amatas novads', 373),
(4386, 'pt_BR', 'Macacos novads', 374),
(4387, 'pt_BR', 'Auces novads', 375),
(4388, 'pt_BR', 'Babītes novads', 376),
(4389, 'pt_BR', 'Baldones novads', 377),
(4390, 'pt_BR', 'Baltinavas novads', 378),
(4391, 'pt_BR', 'Balvu novads', 379),
(4392, 'pt_BR', 'Bauskas novads', 380),
(4393, 'pt_BR', 'Condado de Beverina', 381),
(4394, 'pt_BR', 'Condado de Broceni', 382),
(4395, 'pt_BR', 'Burtnieku novads', 383),
(4396, 'pt_BR', 'Carnikavas novads', 384),
(4397, 'pt_BR', 'Cesvaines novads', 385),
(4398, 'pt_BR', 'Ciblas novads', 386),
(4399, 'pt_BR', 'Cesis county', 387),
(4400, 'pt_BR', 'Dagdas novads', 388),
(4401, 'pt_BR', 'Daugavpils novads', 389),
(4402, 'pt_BR', 'Dobeles novads', 390),
(4403, 'pt_BR', 'Dundagas novads', 391),
(4404, 'pt_BR', 'Durbes novads', 392),
(4405, 'pt_BR', 'Engad novads', 393),
(4406, 'pt_BR', 'Garkalnes novads', 394),
(4407, 'pt_BR', 'O condado de Grobiņa', 395),
(4408, 'pt_BR', 'Gulbenes novads', 396),
(4409, 'pt_BR', 'Iecavas novads', 397),
(4410, 'pt_BR', 'Ikskile county', 398),
(4411, 'pt_BR', 'Ilūkste county', 399),
(4412, 'pt_BR', 'Condado de Inčukalns', 400),
(4413, 'pt_BR', 'Jaunjelgavas novads', 401),
(4414, 'pt_BR', 'Jaunpiebalgas novads', 402),
(4415, 'pt_BR', 'Jaunpils novads', 403),
(4416, 'pt_BR', 'Jelgavas novads', 404),
(4417, 'pt_BR', 'Jekabpils county', 405),
(4418, 'pt_BR', 'Kandavas novads', 406),
(4419, 'pt_BR', 'Kokneses novads', 407),
(4420, 'pt_BR', 'Krimuldas novads', 408),
(4421, 'pt_BR', 'Krustpils novads', 409),
(4422, 'pt_BR', 'Condado de Kraslava', 410),
(4423, 'pt_BR', 'Condado de Kuldīga', 411),
(4424, 'pt_BR', 'Condado de Kārsava', 412),
(4425, 'pt_BR', 'Condado de Lielvarde', 413),
(4426, 'pt_BR', 'Condado de Limbaži', 414),
(4427, 'pt_BR', 'O distrito de Lubāna', 415),
(4428, 'pt_BR', 'Ludzas novads', 416),
(4429, 'pt_BR', 'Ligatne county', 417),
(4430, 'pt_BR', 'Livani county', 418),
(4431, 'pt_BR', 'Madonas novads', 419),
(4432, 'pt_BR', 'Mazsalacas novads', 420),
(4433, 'pt_BR', 'Mālpils county', 421),
(4434, 'pt_BR', 'Mārupe county', 422),
(4435, 'pt_BR', 'O condado de Naukšēni', 423),
(4436, 'pt_BR', 'Neretas novads', 424),
(4437, 'pt_BR', 'Nīca county', 425),
(4438, 'pt_BR', 'Ogres novads', 426),
(4439, 'pt_BR', 'Olaines novads', 427),
(4440, 'pt_BR', 'Ozolnieku novads', 428),
(4441, 'pt_BR', 'Preiļi county', 429),
(4442, 'pt_BR', 'Priekules novads', 430),
(4443, 'pt_BR', 'Condado de Priekuļi', 431),
(4444, 'pt_BR', 'Moving county', 432),
(4445, 'pt_BR', 'Condado de Pavilosta', 433),
(4446, 'pt_BR', 'Condado de Plavinas', 434),
(4447, 'pt_BR', 'Raunas novads', 435),
(4448, 'pt_BR', 'Condado de Riebiņi', 436),
(4449, 'pt_BR', 'Rojas novads', 437),
(4450, 'pt_BR', 'Ropazi county', 438),
(4451, 'pt_BR', 'Rucavas novads', 439),
(4452, 'pt_BR', 'Rugāji county', 440),
(4453, 'pt_BR', 'Rundāle county', 441),
(4454, 'pt_BR', 'Rezekne county', 442),
(4455, 'pt_BR', 'Rūjiena county', 443),
(4456, 'pt_BR', 'O município de Salacgriva', 444),
(4457, 'pt_BR', 'Salas novads', 445),
(4458, 'pt_BR', 'Salaspils novads', 446),
(4459, 'pt_BR', 'Saldus novads', 447),
(4460, 'pt_BR', 'Saulkrastu novads', 448),
(4461, 'pt_BR', 'Siguldas novads', 449),
(4462, 'pt_BR', 'Skrundas novads', 450),
(4463, 'pt_BR', 'Skrīveri county', 451),
(4464, 'pt_BR', 'Smiltenes novads', 452),
(4465, 'pt_BR', 'Condado de Stopini', 453),
(4466, 'pt_BR', 'Condado de Strenči', 454),
(4467, 'pt_BR', 'Região de semeadura', 455),
(4468, 'pt_BR', 'Talsu novads', 456),
(4469, 'pt_BR', 'Tukuma novads', 457),
(4470, 'pt_BR', 'Condado de Tērvete', 458),
(4471, 'pt_BR', 'O condado de Vaiņode', 459),
(4472, 'pt_BR', 'Valkas novads', 460),
(4473, 'pt_BR', 'Valmieras novads', 461),
(4474, 'pt_BR', 'Varaklani county', 462),
(4475, 'pt_BR', 'Vecpiebalgas novads', 463),
(4476, 'pt_BR', 'Vecumnieku novads', 464),
(4477, 'pt_BR', 'Ventspils novads', 465),
(4478, 'pt_BR', 'Condado de Viesite', 466),
(4479, 'pt_BR', 'Condado de Vilaka', 467),
(4480, 'pt_BR', 'Vilani county', 468),
(4481, 'pt_BR', 'Condado de Varkava', 469),
(4482, 'pt_BR', 'Zilupes novads', 470),
(4483, 'pt_BR', 'Adazi county', 471),
(4484, 'pt_BR', 'Erglu county', 472),
(4485, 'pt_BR', 'Kegums county', 473),
(4486, 'pt_BR', 'Kekava county', 474),
(4487, 'pt_BR', 'Alytaus Apskritis', 475),
(4488, 'pt_BR', 'Kauno Apskritis', 476),
(4489, 'pt_BR', 'Condado de Klaipeda', 477),
(4490, 'pt_BR', 'Marijampolė county', 478),
(4491, 'pt_BR', 'Panevezys county', 479),
(4492, 'pt_BR', 'Siauliai county', 480),
(4493, 'pt_BR', 'Taurage county', 481),
(4494, 'pt_BR', 'Telšiai county', 482),
(4495, 'pt_BR', 'Utenos Apskritis', 483),
(4496, 'pt_BR', 'Vilniaus Apskritis', 484),
(4497, 'pt_BR', 'Acre', 485),
(4498, 'pt_BR', 'Alagoas', 486),
(4499, 'pt_BR', 'Amapá', 487),
(4500, 'pt_BR', 'Amazonas', 488),
(4501, 'pt_BR', 'Bahia', 489),
(4502, 'pt_BR', 'Ceará', 490),
(4503, 'pt_BR', 'Espírito Santo', 491),
(4504, 'pt_BR', 'Goiás', 492),
(4505, 'pt_BR', 'Maranhão', 493),
(4506, 'pt_BR', 'Mato Grosso', 494),
(4507, 'pt_BR', 'Mato Grosso do Sul', 495),
(4508, 'pt_BR', 'Minas Gerais', 496),
(4509, 'pt_BR', 'Pará', 497),
(4510, 'pt_BR', 'Paraíba', 498),
(4511, 'pt_BR', 'Paraná', 499),
(4512, 'pt_BR', 'Pernambuco', 500),
(4513, 'pt_BR', 'Piauí', 501),
(4514, 'pt_BR', 'Rio de Janeiro', 502),
(4515, 'pt_BR', 'Rio Grande do Norte', 503),
(4516, 'pt_BR', 'Rio Grande do Sul', 504),
(4517, 'pt_BR', 'Rondônia', 505),
(4518, 'pt_BR', 'Roraima', 506),
(4519, 'pt_BR', 'Santa Catarina', 507),
(4520, 'pt_BR', 'São Paulo', 508),
(4521, 'pt_BR', 'Sergipe', 509),
(4522, 'pt_BR', 'Tocantins', 510),
(4523, 'pt_BR', 'Distrito Federal', 511),
(4524, 'pt_BR', 'Condado de Zagreb', 512),
(4525, 'pt_BR', 'Condado de Krapina-Zagorje', 513),
(4526, 'pt_BR', 'Condado de Sisak-Moslavina', 514),
(4527, 'pt_BR', 'Condado de Karlovac', 515),
(4528, 'pt_BR', 'Concelho de Varaždin', 516),
(4529, 'pt_BR', 'Condado de Koprivnica-Križevci', 517),
(4530, 'pt_BR', 'Condado de Bjelovar-Bilogora', 518),
(4531, 'pt_BR', 'Condado de Primorje-Gorski kotar', 519),
(4532, 'pt_BR', 'Condado de Lika-Senj', 520),
(4533, 'pt_BR', 'Condado de Virovitica-Podravina', 521),
(4534, 'pt_BR', 'Condado de Požega-Slavonia', 522),
(4535, 'pt_BR', 'Condado de Brod-Posavina', 523),
(4536, 'pt_BR', 'Condado de Zadar', 524),
(4537, 'pt_BR', 'Condado de Osijek-Baranja', 525),
(4538, 'pt_BR', 'Condado de Šibenik-Knin', 526),
(4539, 'pt_BR', 'Condado de Vukovar-Srijem', 527),
(4540, 'pt_BR', 'Condado de Split-Dalmácia', 528),
(4541, 'pt_BR', 'Condado de Ístria', 529),
(4542, 'pt_BR', 'Condado de Dubrovnik-Neretva', 530),
(4543, 'pt_BR', 'Međimurska županija', 531),
(4544, 'pt_BR', 'Grad Zagreb', 532),
(4545, 'pt_BR', 'Ilhas Andaman e Nicobar', 533),
(4546, 'pt_BR', 'Andhra Pradesh', 534),
(4547, 'pt_BR', 'Arunachal Pradesh', 535),
(4548, 'pt_BR', 'Assam', 536),
(4549, 'pt_BR', 'Bihar', 537),
(4550, 'pt_BR', 'Chandigarh', 538),
(4551, 'pt_BR', 'Chhattisgarh', 539),
(4552, 'pt_BR', 'Dadra e Nagar Haveli', 540),
(4553, 'pt_BR', 'Daman e Diu', 541),
(4554, 'pt_BR', 'Delhi', 542),
(4555, 'pt_BR', 'Goa', 543),
(4556, 'pt_BR', 'Gujarat', 544),
(4557, 'pt_BR', 'Haryana', 545),
(4558, 'pt_BR', 'Himachal Pradesh', 546),
(4559, 'pt_BR', 'Jammu e Caxemira', 547),
(4560, 'pt_BR', 'Jharkhand', 548),
(4561, 'pt_BR', 'Karnataka', 549),
(4562, 'pt_BR', 'Kerala', 550),
(4563, 'pt_BR', 'Lakshadweep', 551),
(4564, 'pt_BR', 'Madhya Pradesh', 552),
(4565, 'pt_BR', 'Maharashtra', 553),
(4566, 'pt_BR', 'Manipur', 554),
(4567, 'pt_BR', 'Meghalaya', 555),
(4568, 'pt_BR', 'Mizoram', 556),
(4569, 'pt_BR', 'Nagaland', 557),
(4570, 'pt_BR', 'Odisha', 558),
(4571, 'pt_BR', 'Puducherry', 559),
(4572, 'pt_BR', 'Punjab', 560),
(4573, 'pt_BR', 'Rajasthan', 561),
(4574, 'pt_BR', 'Sikkim', 562),
(4575, 'pt_BR', 'Tamil Nadu', 563),
(4576, 'pt_BR', 'Telangana', 564),
(4577, 'pt_BR', 'Tripura', 565),
(4578, 'pt_BR', 'Uttar Pradesh', 566),
(4579, 'pt_BR', 'Uttarakhand', 567),
(4580, 'pt_BR', 'Bengala Ocidental', 568);

-- --------------------------------------------------------

--
-- Table structure for table `country_translations`
--

CREATE TABLE `country_translations` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `country_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `country_translations`
--

INSERT INTO `country_translations` (`id`, `locale`, `name`, `country_id`) VALUES
(1021, 'ar', 'أفغانستان', 1),
(1022, 'ar', 'جزر آلاند', 2),
(1023, 'ar', 'ألبانيا', 3),
(1024, 'ar', 'الجزائر', 4),
(1025, 'ar', 'ساموا الأمريكية', 5),
(1026, 'ar', 'أندورا', 6),
(1027, 'ar', 'أنغولا', 7),
(1028, 'ar', 'أنغيلا', 8),
(1029, 'ar', 'القارة القطبية الجنوبية', 9),
(1030, 'ar', 'أنتيغوا وبربودا', 10),
(1031, 'ar', 'الأرجنتين', 11),
(1032, 'ar', 'أرمينيا', 12),
(1033, 'ar', 'أروبا', 13),
(1034, 'ar', 'جزيرة الصعود', 14),
(1035, 'ar', 'أستراليا', 15),
(1036, 'ar', 'النمسا', 16),
(1037, 'ar', 'أذربيجان', 17),
(1038, 'ar', 'الباهاما', 18),
(1039, 'ar', 'البحرين', 19),
(1040, 'ar', 'بنغلاديش', 20),
(1041, 'ar', 'بربادوس', 21),
(1042, 'ar', 'روسيا البيضاء', 22),
(1043, 'ar', 'بلجيكا', 23),
(1044, 'ar', 'بليز', 24),
(1045, 'ar', 'بنين', 25),
(1046, 'ar', 'برمودا', 26),
(1047, 'ar', 'بوتان', 27),
(1048, 'ar', 'بوليفيا', 28),
(1049, 'ar', 'البوسنة والهرسك', 29),
(1050, 'ar', 'بوتسوانا', 30),
(1051, 'ar', 'البرازيل', 31),
(1052, 'ar', 'إقليم المحيط البريطاني الهندي', 32),
(1053, 'ar', 'جزر فيرجن البريطانية', 33),
(1054, 'ar', 'بروناي', 34),
(1055, 'ar', 'بلغاريا', 35),
(1056, 'ar', 'بوركينا فاسو', 36),
(1057, 'ar', 'بوروندي', 37),
(1058, 'ar', 'كمبوديا', 38),
(1059, 'ar', 'الكاميرون', 39),
(1060, 'ar', 'كندا', 40),
(1061, 'ar', 'جزر الكناري', 41),
(1062, 'ar', 'الرأس الأخضر', 42),
(1063, 'ar', 'الكاريبي هولندا', 43),
(1064, 'ar', 'جزر كايمان', 44),
(1065, 'ar', 'جمهورية افريقيا الوسطى', 45),
(1066, 'ar', 'سبتة ومليلية', 46),
(1067, 'ar', 'تشاد', 47),
(1068, 'ar', 'تشيلي', 48),
(1069, 'ar', 'الصين', 49),
(1070, 'ar', 'جزيرة الكريسماس', 50),
(1071, 'ar', 'جزر كوكوس (كيلينغ)', 51),
(1072, 'ar', 'كولومبيا', 52),
(1073, 'ar', 'جزر القمر', 53),
(1074, 'ar', 'الكونغو - برازافيل', 54),
(1075, 'ar', 'الكونغو - كينشاسا', 55),
(1076, 'ar', 'جزر كوك', 56),
(1077, 'ar', 'كوستاريكا', 57),
(1078, 'ar', 'ساحل العاج', 58),
(1079, 'ar', 'كرواتيا', 59),
(1080, 'ar', 'كوبا', 60),
(1081, 'ar', 'كوراساو', 61),
(1082, 'ar', 'قبرص', 62),
(1083, 'ar', 'التشيك', 63),
(1084, 'ar', 'الدنمارك', 64),
(1085, 'ar', 'دييغو غارسيا', 65),
(1086, 'ar', 'جيبوتي', 66),
(1087, 'ar', 'دومينيكا', 67),
(1088, 'ar', 'جمهورية الدومنيكان', 68),
(1089, 'ar', 'الإكوادور', 69),
(1090, 'ar', 'مصر', 70),
(1091, 'ar', 'السلفادور', 71),
(1092, 'ar', 'غينيا الإستوائية', 72),
(1093, 'ar', 'إريتريا', 73),
(1094, 'ar', 'استونيا', 74),
(1095, 'ar', 'أثيوبيا', 75),
(1096, 'ar', 'منطقة اليورو', 76),
(1097, 'ar', 'جزر فوكلاند', 77),
(1098, 'ar', 'جزر فاروس', 78),
(1099, 'ar', 'فيجي', 79),
(1100, 'ar', 'فنلندا', 80),
(1101, 'ar', 'فرنسا', 81),
(1102, 'ar', 'غيانا الفرنسية', 82),
(1103, 'ar', 'بولينيزيا الفرنسية', 83),
(1104, 'ar', 'المناطق الجنوبية لفرنسا', 84),
(1105, 'ar', 'الغابون', 85),
(1106, 'ar', 'غامبيا', 86),
(1107, 'ar', 'جورجيا', 87),
(1108, 'ar', 'ألمانيا', 88),
(1109, 'ar', 'غانا', 89),
(1110, 'ar', 'جبل طارق', 90),
(1111, 'ar', 'اليونان', 91),
(1112, 'ar', 'الأرض الخضراء', 92),
(1113, 'ar', 'غرينادا', 93),
(1114, 'ar', 'جوادلوب', 94),
(1115, 'ar', 'غوام', 95),
(1116, 'ar', 'غواتيمالا', 96),
(1117, 'ar', 'غيرنسي', 97),
(1118, 'ar', 'غينيا', 98),
(1119, 'ar', 'غينيا بيساو', 99),
(1120, 'ar', 'غيانا', 100),
(1121, 'ar', 'هايتي', 101),
(1122, 'ar', 'هندوراس', 102),
(1123, 'ar', 'هونج كونج SAR الصين', 103),
(1124, 'ar', 'هنغاريا', 104),
(1125, 'ar', 'أيسلندا', 105),
(1126, 'ar', 'الهند', 106),
(1127, 'ar', 'إندونيسيا', 107),
(1128, 'ar', 'إيران', 108),
(1129, 'ar', 'العراق', 109),
(1130, 'ar', 'أيرلندا', 110),
(1131, 'ar', 'جزيرة آيل أوف مان', 111),
(1132, 'ar', 'إسرائيل', 112),
(1133, 'ar', 'إيطاليا', 113),
(1134, 'ar', 'جامايكا', 114),
(1135, 'ar', 'اليابان', 115),
(1136, 'ar', 'جيرسي', 116),
(1137, 'ar', 'الأردن', 117),
(1138, 'ar', 'كازاخستان', 118),
(1139, 'ar', 'كينيا', 119),
(1140, 'ar', 'كيريباس', 120),
(1141, 'ar', 'كوسوفو', 121),
(1142, 'ar', 'الكويت', 122),
(1143, 'ar', 'قرغيزستان', 123),
(1144, 'ar', 'لاوس', 124),
(1145, 'ar', 'لاتفيا', 125),
(1146, 'ar', 'لبنان', 126),
(1147, 'ar', 'ليسوتو', 127),
(1148, 'ar', 'ليبيريا', 128),
(1149, 'ar', 'ليبيا', 129),
(1150, 'ar', 'ليختنشتاين', 130),
(1151, 'ar', 'ليتوانيا', 131),
(1152, 'ar', 'لوكسمبورغ', 132),
(1153, 'ar', 'ماكاو SAR الصين', 133),
(1154, 'ar', 'مقدونيا', 134),
(1155, 'ar', 'مدغشقر', 135),
(1156, 'ar', 'مالاوي', 136),
(1157, 'ar', 'ماليزيا', 137),
(1158, 'ar', 'جزر المالديف', 138),
(1159, 'ar', 'مالي', 139),
(1160, 'ar', 'مالطا', 140),
(1161, 'ar', 'جزر مارشال', 141),
(1162, 'ar', 'مارتينيك', 142),
(1163, 'ar', 'موريتانيا', 143),
(1164, 'ar', 'موريشيوس', 144),
(1165, 'ar', 'ضائع', 145),
(1166, 'ar', 'المكسيك', 146),
(1167, 'ar', 'ميكرونيزيا', 147),
(1168, 'ar', 'مولدوفا', 148),
(1169, 'ar', 'موناكو', 149),
(1170, 'ar', 'منغوليا', 150),
(1171, 'ar', 'الجبل الأسود', 151),
(1172, 'ar', 'مونتسيرات', 152),
(1173, 'ar', 'المغرب', 153),
(1174, 'ar', 'موزمبيق', 154),
(1175, 'ar', 'ميانمار (بورما)', 155),
(1176, 'ar', 'ناميبيا', 156),
(1177, 'ar', 'ناورو', 157),
(1178, 'ar', 'نيبال', 158),
(1179, 'ar', 'نيبال', 159),
(1180, 'ar', 'كاليدونيا الجديدة', 160),
(1181, 'ar', 'نيوزيلاندا', 161),
(1182, 'ar', 'نيكاراغوا', 162),
(1183, 'ar', 'النيجر', 163),
(1184, 'ar', 'نيجيريا', 164),
(1185, 'ar', 'نيوي', 165),
(1186, 'ar', 'جزيرة نورفولك', 166),
(1187, 'ar', 'كوريا الشماليه', 167),
(1188, 'ar', 'جزر مريانا الشمالية', 168),
(1189, 'ar', 'النرويج', 169),
(1190, 'ar', 'سلطنة عمان', 170),
(1191, 'ar', 'باكستان', 171),
(1192, 'ar', 'بالاو', 172),
(1193, 'ar', 'الاراضي الفلسطينية', 173),
(1194, 'ar', 'بناما', 174),
(1195, 'ar', 'بابوا غينيا الجديدة', 175),
(1196, 'ar', 'باراغواي', 176),
(1197, 'ar', 'بيرو', 177),
(1198, 'ar', 'الفلبين', 178),
(1199, 'ar', 'جزر بيتكيرن', 179),
(1200, 'ar', 'بولندا', 180),
(1201, 'ar', 'البرتغال', 181),
(1202, 'ar', 'بورتوريكو', 182),
(1203, 'ar', 'دولة قطر', 183),
(1204, 'ar', 'جمع شمل', 184),
(1205, 'ar', 'رومانيا', 185),
(1206, 'ar', 'روسيا', 186),
(1207, 'ar', 'رواندا', 187),
(1208, 'ar', 'ساموا', 188),
(1209, 'ar', 'سان مارينو', 189),
(1210, 'ar', 'سانت كيتس ونيفيس', 190),
(1211, 'ar', 'المملكة العربية السعودية', 191),
(1212, 'ar', 'السنغال', 192),
(1213, 'ar', 'صربيا', 193),
(1214, 'ar', 'سيشيل', 194),
(1215, 'ar', 'سيراليون', 195),
(1216, 'ar', 'سنغافورة', 196),
(1217, 'ar', 'سينت مارتن', 197),
(1218, 'ar', 'سلوفاكيا', 198),
(1219, 'ar', 'سلوفينيا', 199),
(1220, 'ar', 'جزر سليمان', 200),
(1221, 'ar', 'الصومال', 201),
(1222, 'ar', 'جنوب أفريقيا', 202),
(1223, 'ar', 'جورجيا الجنوبية وجزر ساندويتش الجنوبية', 203),
(1224, 'ar', 'كوريا الجنوبية', 204),
(1225, 'ar', 'جنوب السودان', 205),
(1226, 'ar', 'إسبانيا', 206),
(1227, 'ar', 'سيريلانكا', 207),
(1228, 'ar', 'سانت بارتيليمي', 208),
(1229, 'ar', 'سانت هيلانة', 209),
(1230, 'ar', 'سانت كيتس ونيفيس', 210),
(1231, 'ar', 'شارع لوسيا', 211),
(1232, 'ar', 'سانت مارتن', 212),
(1233, 'ar', 'سانت بيير وميكلون', 213),
(1234, 'ar', 'سانت فنسنت وجزر غرينادين', 214),
(1235, 'ar', 'السودان', 215),
(1236, 'ar', 'سورينام', 216),
(1237, 'ar', 'سفالبارد وجان ماين', 217),
(1238, 'ar', 'سوازيلاند', 218),
(1239, 'ar', 'السويد', 219),
(1240, 'ar', 'سويسرا', 220),
(1241, 'ar', 'سوريا', 221),
(1242, 'ar', 'تايوان', 222),
(1243, 'ar', 'طاجيكستان', 223),
(1244, 'ar', 'تنزانيا', 224),
(1245, 'ar', 'تايلاند', 225),
(1246, 'ar', 'تيمور', 226),
(1247, 'ar', 'توجو', 227),
(1248, 'ar', 'توكيلاو', 228),
(1249, 'ar', 'تونغا', 229),
(1250, 'ar', 'ترينيداد وتوباغو', 230),
(1251, 'ar', 'تريستان دا كونها', 231),
(1252, 'ar', 'تونس', 232),
(1253, 'ar', 'ديك رومي', 233),
(1254, 'ar', 'تركمانستان', 234),
(1255, 'ar', 'جزر تركس وكايكوس', 235),
(1256, 'ar', 'توفالو', 236),
(1257, 'ar', 'جزر الولايات المتحدة البعيدة', 237),
(1258, 'ar', 'جزر فيرجن الأمريكية', 238),
(1259, 'ar', 'أوغندا', 239),
(1260, 'ar', 'أوكرانيا', 240),
(1261, 'ar', 'الإمارات العربية المتحدة', 241),
(1262, 'ar', 'المملكة المتحدة', 242),
(1263, 'ar', 'الأمم المتحدة', 243),
(1264, 'ar', 'الولايات المتحدة الأمريكية', 244),
(1265, 'ar', 'أوروغواي', 245),
(1266, 'ar', 'أوزبكستان', 246),
(1267, 'ar', 'فانواتو', 247),
(1268, 'ar', 'مدينة الفاتيكان', 248),
(1269, 'ar', 'فنزويلا', 249),
(1270, 'ar', 'فيتنام', 250),
(1271, 'ar', 'واليس وفوتونا', 251),
(1272, 'ar', 'الصحراء الغربية', 252),
(1273, 'ar', 'اليمن', 253),
(1274, 'ar', 'زامبيا', 254),
(1275, 'ar', 'زيمبابوي', 255),
(1276, 'es', 'Afganistán', 1),
(1277, 'es', 'Islas Åland', 2),
(1278, 'es', 'Albania', 3),
(1279, 'es', 'Argelia', 4),
(1280, 'es', 'Samoa Americana', 5),
(1281, 'es', 'Andorra', 6),
(1282, 'es', 'Angola', 7),
(1283, 'es', 'Anguila', 8),
(1284, 'es', 'Antártida', 9),
(1285, 'es', 'Antigua y Barbuda', 10),
(1286, 'es', 'Argentina', 11),
(1287, 'es', 'Armenia', 12),
(1288, 'es', 'Aruba', 13),
(1289, 'es', 'Isla Ascensión', 14),
(1290, 'es', 'Australia', 15),
(1291, 'es', 'Austria', 16),
(1292, 'es', 'Azerbaiyán', 17),
(1293, 'es', 'Bahamas', 18),
(1294, 'es', 'Bahrein', 19),
(1295, 'es', 'Bangladesh', 20),
(1296, 'es', 'Barbados', 21),
(1297, 'es', 'Bielorrusia', 22),
(1298, 'es', 'Bélgica', 23),
(1299, 'es', 'Belice', 24),
(1300, 'es', 'Benín', 25),
(1301, 'es', 'Islas Bermudas', 26),
(1302, 'es', 'Bhután', 27),
(1303, 'es', 'Bolivia', 28),
(1304, 'es', 'Bosnia y Herzegovina', 29),
(1305, 'es', 'Botsuana', 30),
(1306, 'es', 'Brasil', 31),
(1307, 'es', 'Territorio Británico del Océano índico', 32),
(1308, 'es', 'Islas Vírgenes Británicas', 33),
(1309, 'es', 'Brunéi', 34),
(1310, 'es', 'Bulgaria', 35),
(1311, 'es', 'Burkina Faso', 36),
(1312, 'es', 'Burundi', 37),
(1313, 'es', 'Camboya', 38),
(1314, 'es', 'Camerún', 39),
(1315, 'es', 'Canadá', 40),
(1316, 'es', 'Islas Canarias', 41),
(1317, 'es', 'Cabo Verde', 42),
(1318, 'es', 'Caribe Neerlandés', 43),
(1319, 'es', 'Islas Caimán', 44),
(1320, 'es', 'República Centroafricana', 45),
(1321, 'es', 'Ceuta y Melilla', 46),
(1322, 'es', 'Chad', 47),
(1323, 'es', 'Chile', 48),
(1324, 'es', 'China', 49),
(1325, 'es', 'Isla de Navidad', 50),
(1326, 'es', 'Islas Cocos', 51),
(1327, 'es', 'Colombia', 52),
(1328, 'es', 'Comoras', 53),
(1329, 'es', 'República del Congo', 54),
(1330, 'es', 'República Democrática del Congo', 55),
(1331, 'es', 'Islas Cook', 56),
(1332, 'es', 'Costa Rica', 57),
(1333, 'es', 'Costa de Marfil', 58),
(1334, 'es', 'Croacia', 59),
(1335, 'es', 'Cuba', 60),
(1336, 'es', 'Curazao', 61),
(1337, 'es', 'Chipre', 62),
(1338, 'es', 'República Checa', 63),
(1339, 'es', 'Dinamarca', 64),
(1340, 'es', 'Diego García', 65),
(1341, 'es', 'Yibuti', 66),
(1342, 'es', 'Dominica', 67),
(1343, 'es', 'República Dominicana', 68),
(1344, 'es', 'Ecuador', 69),
(1345, 'es', 'Egipto', 70),
(1346, 'es', 'El Salvador', 71),
(1347, 'es', 'Guinea Ecuatorial', 72),
(1348, 'es', 'Eritrea', 73),
(1349, 'es', 'Estonia', 74),
(1350, 'es', 'Etiopía', 75),
(1351, 'es', 'Europa', 76),
(1352, 'es', 'Islas Malvinas', 77),
(1353, 'es', 'Islas Feroe', 78),
(1354, 'es', 'Fiyi', 79),
(1355, 'es', 'Finlandia', 80),
(1356, 'es', 'Francia', 81),
(1357, 'es', 'Guayana Francesa', 82),
(1358, 'es', 'Polinesia Francesa', 83),
(1359, 'es', 'Territorios Australes y Antárticas Franceses', 84),
(1360, 'es', 'Gabón', 85),
(1361, 'es', 'Gambia', 86),
(1362, 'es', 'Georgia', 87),
(1363, 'es', 'Alemania', 88),
(1364, 'es', 'Ghana', 89),
(1365, 'es', 'Gibraltar', 90),
(1366, 'es', 'Grecia', 91),
(1367, 'es', 'Groenlandia', 92),
(1368, 'es', 'Granada', 93),
(1369, 'es', 'Guadalupe', 94),
(1370, 'es', 'Guam', 95),
(1371, 'es', 'Guatemala', 96),
(1372, 'es', 'Guernsey', 97),
(1373, 'es', 'Guinea', 98),
(1374, 'es', 'Guinea-Bisáu', 99),
(1375, 'es', 'Guyana', 100),
(1376, 'es', 'Haití', 101),
(1377, 'es', 'Honduras', 102),
(1378, 'es', 'Hong Kong', 103),
(1379, 'es', 'Hungría', 104),
(1380, 'es', 'Islandia', 105),
(1381, 'es', 'India', 106),
(1382, 'es', 'Indonesia', 107),
(1383, 'es', 'Irán', 108),
(1384, 'es', 'Irak', 109),
(1385, 'es', 'Irlanda', 110),
(1386, 'es', 'Isla de Man', 111),
(1387, 'es', 'Israel', 112),
(1388, 'es', 'Italia', 113),
(1389, 'es', 'Jamaica', 114),
(1390, 'es', 'Japón', 115),
(1391, 'es', 'Jersey', 116),
(1392, 'es', 'Jordania', 117),
(1393, 'es', 'Kazajistán', 118),
(1394, 'es', 'Kenia', 119),
(1395, 'es', 'Kiribati', 120),
(1396, 'es', 'Kosovo', 121),
(1397, 'es', 'Kuwait', 122),
(1398, 'es', 'Kirguistán', 123),
(1399, 'es', 'Laos', 124),
(1400, 'es', 'Letonia', 125),
(1401, 'es', 'Líbano', 126),
(1402, 'es', 'Lesoto', 127),
(1403, 'es', 'Liberia', 128),
(1404, 'es', 'Libia', 129),
(1405, 'es', 'Liechtenstein', 130),
(1406, 'es', 'Lituania', 131),
(1407, 'es', 'Luxemburgo', 132),
(1408, 'es', 'Macao', 133),
(1409, 'es', 'Macedonia', 134),
(1410, 'es', 'Madagascar', 135),
(1411, 'es', 'Malaui', 136),
(1412, 'es', 'Malasia', 137),
(1413, 'es', 'Maldivas', 138),
(1414, 'es', 'Malí', 139),
(1415, 'es', 'Malta', 140),
(1416, 'es', 'Islas Marshall', 141),
(1417, 'es', 'Martinica', 142),
(1418, 'es', 'Mauritania', 143),
(1419, 'es', 'Mauricio', 144),
(1420, 'es', 'Mayotte', 145),
(1421, 'es', 'México', 146),
(1422, 'es', 'Micronesia', 147),
(1423, 'es', 'Moldavia', 148),
(1424, 'es', 'Mónaco', 149),
(1425, 'es', 'Mongolia', 150),
(1426, 'es', 'Montenegro', 151),
(1427, 'es', 'Montserrat', 152),
(1428, 'es', 'Marruecos', 153),
(1429, 'es', 'Mozambique', 154),
(1430, 'es', 'Birmania', 155),
(1431, 'es', 'Namibia', 156),
(1432, 'es', 'Nauru', 157),
(1433, 'es', 'Nepal', 158),
(1434, 'es', 'Holanda', 159),
(1435, 'es', 'Nueva Caledonia', 160),
(1436, 'es', 'Nueva Zelanda', 161),
(1437, 'es', 'Nicaragua', 162),
(1438, 'es', 'Níger', 163),
(1439, 'es', 'Nigeria', 164),
(1440, 'es', 'Niue', 165),
(1441, 'es', 'Isla Norfolk', 166),
(1442, 'es', 'Corea del Norte', 167),
(1443, 'es', 'Islas Marianas del Norte', 168),
(1444, 'es', 'Noruega', 169),
(1445, 'es', 'Omán', 170),
(1446, 'es', 'Pakistán', 171),
(1447, 'es', 'Palaos', 172),
(1448, 'es', 'Palestina', 173),
(1449, 'es', 'Panamá', 174),
(1450, 'es', 'Papúa Nueva Guinea', 175),
(1451, 'es', 'Paraguay', 176),
(1452, 'es', 'Perú', 177),
(1453, 'es', 'Filipinas', 178),
(1454, 'es', 'Islas Pitcairn', 179),
(1455, 'es', 'Polonia', 180),
(1456, 'es', 'Portugal', 181),
(1457, 'es', 'Puerto Rico', 182),
(1458, 'es', 'Catar', 183),
(1459, 'es', 'Reunión', 184),
(1460, 'es', 'Rumania', 185),
(1461, 'es', 'Rusia', 186),
(1462, 'es', 'Ruanda', 187),
(1463, 'es', 'Samoa', 188),
(1464, 'es', 'San Marino', 189),
(1465, 'es', 'Santo Tomé y Príncipe', 190),
(1466, 'es', 'Arabia Saudita', 191),
(1467, 'es', 'Senegal', 192),
(1468, 'es', 'Serbia', 193),
(1469, 'es', 'Seychelles', 194),
(1470, 'es', 'Sierra Leona', 195),
(1471, 'es', 'Singapur', 196),
(1472, 'es', 'San Martín', 197),
(1473, 'es', 'Eslovaquia', 198),
(1474, 'es', 'Eslovenia', 199),
(1475, 'es', 'Islas Salomón', 200),
(1476, 'es', 'Somalia', 201),
(1477, 'es', 'Sudáfrica', 202),
(1478, 'es', 'Islas Georgias del Sur y Sandwich del Sur', 203),
(1479, 'es', 'Corea del Sur', 204),
(1480, 'es', 'Sudán del Sur', 205),
(1481, 'es', 'España', 206),
(1482, 'es', 'Sri Lanka', 207),
(1483, 'es', 'San Bartolomé', 208),
(1484, 'es', 'Santa Elena', 209),
(1485, 'es', 'San Cristóbal y Nieves', 210),
(1486, 'es', 'Santa Lucía', 211),
(1487, 'es', 'San Martín', 212),
(1488, 'es', 'San Pedro y Miquelón', 213),
(1489, 'es', 'San Vicente y las Granadinas', 214),
(1490, 'es', 'Sudán', 215),
(1491, 'es', 'Surinam', 216),
(1492, 'es', 'Svalbard y Jan Mayen', 217),
(1493, 'es', 'Suazilandia', 218),
(1494, 'es', 'Suecia', 219),
(1495, 'es', 'Suiza', 220),
(1496, 'es', 'Siri', 221),
(1497, 'es', 'Taiwán', 222),
(1498, 'es', 'Tayikistán', 223),
(1499, 'es', 'Tanzania', 224),
(1500, 'es', 'Tailandia', 225),
(1501, 'es', 'Timor Oriental', 226),
(1502, 'es', 'Togo', 227),
(1503, 'es', 'Tokelau', 228),
(1504, 'es', 'Tonga', 229),
(1505, 'es', 'Trinidad y Tobago', 230),
(1506, 'es', 'Tristán de Acuña', 231),
(1507, 'es', 'Túnez', 232),
(1508, 'es', 'Turquía', 233),
(1509, 'es', 'Turkmenistán', 234),
(1510, 'es', 'Islas Turcas y Caicos', 235),
(1511, 'es', 'Tuvalu', 236),
(1512, 'es', 'Islas Ultramarinas Menores de los Estados Unidos', 237),
(1513, 'es', 'Islas Vírgenes de los Estados Unidos', 238),
(1514, 'es', 'Uganda', 239),
(1515, 'es', 'Ucrania', 240),
(1516, 'es', 'Emiratos árabes Unidos', 241),
(1517, 'es', 'Reino Unido', 242),
(1518, 'es', 'Naciones Unidas', 243),
(1519, 'es', 'Estados Unidos', 244),
(1520, 'es', 'Uruguay', 245),
(1521, 'es', 'Uzbekistán', 246),
(1522, 'es', 'Vanuatu', 247),
(1523, 'es', 'Ciudad del Vaticano', 248),
(1524, 'es', 'Venezuela', 249),
(1525, 'es', 'Vietnam', 250),
(1526, 'es', 'Wallis y Futuna', 251),
(1527, 'es', 'Sahara Occidental', 252),
(1528, 'es', 'Yemen', 253),
(1529, 'es', 'Zambia', 254),
(1530, 'es', 'Zimbabue', 255),
(1531, 'fa', 'افغانستان', 1),
(1532, 'fa', 'جزایر الند', 2),
(1533, 'fa', 'آلبانی', 3),
(1534, 'fa', 'الجزایر', 4),
(1535, 'fa', 'ساموآ آمریکایی', 5),
(1536, 'fa', 'آندورا', 6),
(1537, 'fa', 'آنگولا', 7),
(1538, 'fa', 'آنگولا', 8),
(1539, 'fa', 'جنوبگان', 9),
(1540, 'fa', 'آنتیگوا و باربودا', 10),
(1541, 'fa', 'آرژانتین', 11),
(1542, 'fa', 'ارمنستان', 12),
(1543, 'fa', 'آروبا', 13),
(1544, 'fa', 'جزیره صعود', 14),
(1545, 'fa', 'استرالیا', 15),
(1546, 'fa', 'اتریش', 16),
(1547, 'fa', 'آذربایجان', 17),
(1548, 'fa', 'باهاما', 18),
(1549, 'fa', 'بحرین', 19),
(1550, 'fa', 'بنگلادش', 20),
(1551, 'fa', 'باربادوس', 21),
(1552, 'fa', 'بلاروس', 22),
(1553, 'fa', 'بلژیک', 23),
(1554, 'fa', 'بلژیک', 24),
(1555, 'fa', 'بنین', 25),
(1556, 'fa', 'برمودا', 26),
(1557, 'fa', 'بوتان', 27),
(1558, 'fa', 'بولیوی', 28),
(1559, 'fa', 'بوسنی و هرزگوین', 29),
(1560, 'fa', 'بوتسوانا', 30),
(1561, 'fa', 'برزیل', 31),
(1562, 'fa', 'قلمرو اقیانوس هند انگلیس', 32),
(1563, 'fa', 'جزایر ویرجین انگلیس', 33),
(1564, 'fa', 'برونئی', 34),
(1565, 'fa', 'بلغارستان', 35),
(1566, 'fa', 'بورکینا فاسو', 36),
(1567, 'fa', 'بوروندی', 37),
(1568, 'fa', 'کامبوج', 38),
(1569, 'fa', 'کامرون', 39),
(1570, 'fa', 'کانادا', 40),
(1571, 'fa', 'جزایر قناری', 41),
(1572, 'fa', 'کیپ ورد', 42),
(1573, 'fa', 'کارائیب هلند', 43),
(1574, 'fa', 'Cayman Islands', 44),
(1575, 'fa', 'جمهوری آفریقای مرکزی', 45),
(1576, 'fa', 'سوتا و ملیلا', 46),
(1577, 'fa', 'چاد', 47),
(1578, 'fa', 'شیلی', 48),
(1579, 'fa', 'چین', 49),
(1580, 'fa', 'جزیره کریسمس', 50),
(1581, 'fa', 'جزایر کوکو (Keeling)', 51),
(1582, 'fa', 'کلمبیا', 52),
(1583, 'fa', 'کومور', 53),
(1584, 'fa', 'کنگو - برزاویل', 54),
(1585, 'fa', 'کنگو - کینشاسا', 55),
(1586, 'fa', 'جزایر کوک', 56),
(1587, 'fa', 'کاستاریکا', 57),
(1588, 'fa', 'ساحل عاج', 58),
(1589, 'fa', 'کرواسی', 59),
(1590, 'fa', 'کوبا', 60),
(1591, 'fa', 'کوراسائو', 61),
(1592, 'fa', 'قبرس', 62),
(1593, 'fa', 'چک', 63),
(1594, 'fa', 'دانمارک', 64),
(1595, 'fa', 'دیگو گارسیا', 65),
(1596, 'fa', 'جیبوتی', 66),
(1597, 'fa', 'دومینیکا', 67),
(1598, 'fa', 'جمهوری دومینیکن', 68),
(1599, 'fa', 'اکوادور', 69),
(1600, 'fa', 'مصر', 70),
(1601, 'fa', 'السالوادور', 71),
(1602, 'fa', 'گینه استوایی', 72),
(1603, 'fa', 'اریتره', 73),
(1604, 'fa', 'استونی', 74),
(1605, 'fa', 'اتیوپی', 75),
(1606, 'fa', 'منطقه یورو', 76),
(1607, 'fa', 'جزایر فالکلند', 77),
(1608, 'fa', 'جزایر فارو', 78),
(1609, 'fa', 'فیجی', 79),
(1610, 'fa', 'فنلاند', 80),
(1611, 'fa', 'فرانسه', 81),
(1612, 'fa', 'گویان فرانسه', 82),
(1613, 'fa', 'پلی‌نزی فرانسه', 83),
(1614, 'fa', 'سرزمین های جنوبی فرانسه', 84),
(1615, 'fa', 'گابن', 85),
(1616, 'fa', 'گامبیا', 86),
(1617, 'fa', 'جورجیا', 87),
(1618, 'fa', 'آلمان', 88),
(1619, 'fa', 'غنا', 89),
(1620, 'fa', 'جبل الطارق', 90),
(1621, 'fa', 'یونان', 91),
(1622, 'fa', 'گرینلند', 92),
(1623, 'fa', 'گرنادا', 93),
(1624, 'fa', 'گوادلوپ', 94),
(1625, 'fa', 'گوام', 95),
(1626, 'fa', 'گواتمالا', 96),
(1627, 'fa', 'گورنسی', 97),
(1628, 'fa', 'گینه', 98),
(1629, 'fa', 'گینه بیسائو', 99),
(1630, 'fa', 'گویان', 100),
(1631, 'fa', 'هائیتی', 101),
(1632, 'fa', 'هندوراس', 102),
(1633, 'fa', 'هنگ کنگ SAR چین', 103),
(1634, 'fa', 'مجارستان', 104),
(1635, 'fa', 'ایسلند', 105),
(1636, 'fa', 'هند', 106),
(1637, 'fa', 'اندونزی', 107),
(1638, 'fa', 'ایران', 108),
(1639, 'fa', 'عراق', 109),
(1640, 'fa', 'ایرلند', 110),
(1641, 'fa', 'جزیره من', 111),
(1642, 'fa', 'اسرائيل', 112),
(1643, 'fa', 'ایتالیا', 113),
(1644, 'fa', 'جامائیکا', 114),
(1645, 'fa', 'ژاپن', 115),
(1646, 'fa', 'پیراهن ورزشی', 116),
(1647, 'fa', 'اردن', 117),
(1648, 'fa', 'قزاقستان', 118),
(1649, 'fa', 'کنیا', 119),
(1650, 'fa', 'کیریباتی', 120),
(1651, 'fa', 'کوزوو', 121),
(1652, 'fa', 'کویت', 122),
(1653, 'fa', 'قرقیزستان', 123),
(1654, 'fa', 'لائوس', 124),
(1655, 'fa', 'لتونی', 125),
(1656, 'fa', 'لبنان', 126),
(1657, 'fa', 'لسوتو', 127),
(1658, 'fa', 'لیبریا', 128),
(1659, 'fa', 'لیبی', 129),
(1660, 'fa', 'لیختن اشتاین', 130),
(1661, 'fa', 'لیتوانی', 131),
(1662, 'fa', 'لوکزامبورگ', 132),
(1663, 'fa', 'ماکائو SAR چین', 133),
(1664, 'fa', 'مقدونیه', 134),
(1665, 'fa', 'ماداگاسکار', 135),
(1666, 'fa', 'مالاوی', 136),
(1667, 'fa', 'مالزی', 137),
(1668, 'fa', 'مالدیو', 138),
(1669, 'fa', 'مالی', 139),
(1670, 'fa', 'مالت', 140),
(1671, 'fa', 'جزایر مارشال', 141),
(1672, 'fa', 'مارتینیک', 142),
(1673, 'fa', 'موریتانی', 143),
(1674, 'fa', 'موریس', 144),
(1675, 'fa', 'گمشده', 145),
(1676, 'fa', 'مکزیک', 146),
(1677, 'fa', 'میکرونزی', 147),
(1678, 'fa', 'مولداوی', 148),
(1679, 'fa', 'موناکو', 149),
(1680, 'fa', 'مغولستان', 150),
(1681, 'fa', 'مونته نگرو', 151),
(1682, 'fa', 'مونتسرات', 152),
(1683, 'fa', 'مراکش', 153),
(1684, 'fa', 'موزامبیک', 154),
(1685, 'fa', 'میانمار (برمه)', 155),
(1686, 'fa', 'ناميبيا', 156),
(1687, 'fa', 'نائورو', 157),
(1688, 'fa', 'نپال', 158),
(1689, 'fa', 'هلند', 159),
(1690, 'fa', 'کالدونیای جدید', 160),
(1691, 'fa', 'نیوزلند', 161),
(1692, 'fa', 'نیکاراگوئه', 162),
(1693, 'fa', 'نیجر', 163),
(1694, 'fa', 'نیجریه', 164),
(1695, 'fa', 'نیو', 165),
(1696, 'fa', 'جزیره نورفولک', 166),
(1697, 'fa', 'کره شمالی', 167),
(1698, 'fa', 'جزایر ماریانای شمالی', 168),
(1699, 'fa', 'نروژ', 169),
(1700, 'fa', 'عمان', 170),
(1701, 'fa', 'پاکستان', 171),
(1702, 'fa', 'پالائو', 172),
(1703, 'fa', 'سرزمین های فلسطینی', 173),
(1704, 'fa', 'پاناما', 174),
(1705, 'fa', 'پاپوا گینه نو', 175),
(1706, 'fa', 'پاراگوئه', 176),
(1707, 'fa', 'پرو', 177),
(1708, 'fa', 'فیلیپین', 178),
(1709, 'fa', 'جزایر پیکریرن', 179),
(1710, 'fa', 'لهستان', 180),
(1711, 'fa', 'کشور پرتغال', 181),
(1712, 'fa', 'پورتوریکو', 182),
(1713, 'fa', 'قطر', 183),
(1714, 'fa', 'تجدید دیدار', 184),
(1715, 'fa', 'رومانی', 185),
(1716, 'fa', 'روسیه', 186),
(1717, 'fa', 'رواندا', 187),
(1718, 'fa', 'ساموآ', 188),
(1719, 'fa', 'سان مارینو', 189),
(1720, 'fa', 'سنت کیتس و نوویس', 190),
(1721, 'fa', 'عربستان سعودی', 191),
(1722, 'fa', 'سنگال', 192),
(1723, 'fa', 'صربستان', 193),
(1724, 'fa', 'سیشل', 194),
(1725, 'fa', 'سیرالئون', 195),
(1726, 'fa', 'سنگاپور', 196),
(1727, 'fa', 'سینت ماارتن', 197),
(1728, 'fa', 'اسلواکی', 198),
(1729, 'fa', 'اسلوونی', 199),
(1730, 'fa', 'جزایر سلیمان', 200),
(1731, 'fa', 'سومالی', 201),
(1732, 'fa', 'آفریقای جنوبی', 202),
(1733, 'fa', 'جزایر جورجیا جنوبی و جزایر ساندویچ جنوبی', 203),
(1734, 'fa', 'کره جنوبی', 204),
(1735, 'fa', 'سودان جنوبی', 205),
(1736, 'fa', 'اسپانیا', 206),
(1737, 'fa', 'سری لانکا', 207),
(1738, 'fa', 'سنت بارتلی', 208),
(1739, 'fa', 'سنت هلنا', 209),
(1740, 'fa', 'سنت کیتز و نوویس', 210),
(1741, 'fa', 'سنت لوسیا', 211),
(1742, 'fa', 'سنت مارتین', 212),
(1743, 'fa', 'سنت پیر و میکلون', 213),
(1744, 'fa', 'سنت وینسنت و گرنادینها', 214),
(1745, 'fa', 'سودان', 215),
(1746, 'fa', 'سورینام', 216),
(1747, 'fa', 'اسوالبارد و جان ماین', 217),
(1748, 'fa', 'سوازیلند', 218),
(1749, 'fa', 'سوئد', 219),
(1750, 'fa', 'سوئیس', 220),
(1751, 'fa', 'سوریه', 221),
(1752, 'fa', 'تایوان', 222),
(1753, 'fa', 'تاجیکستان', 223),
(1754, 'fa', 'تانزانیا', 224),
(1755, 'fa', 'تایلند', 225),
(1756, 'fa', 'تیمور-لست', 226),
(1757, 'fa', 'رفتن', 227),
(1758, 'fa', 'توکلو', 228),
(1759, 'fa', 'تونگا', 229),
(1760, 'fa', 'ترینیداد و توباگو', 230),
(1761, 'fa', 'تریستان دا کانونا', 231),
(1762, 'fa', 'تونس', 232),
(1763, 'fa', 'بوقلمون', 233),
(1764, 'fa', 'ترکمنستان', 234),
(1765, 'fa', 'جزایر تورکس و کایکوس', 235),
(1766, 'fa', 'تووالو', 236),
(1767, 'fa', 'جزایر دور افتاده ایالات متحده آمریکا', 237),
(1768, 'fa', 'جزایر ویرجین ایالات متحده', 238),
(1769, 'fa', 'اوگاندا', 239),
(1770, 'fa', 'اوکراین', 240),
(1771, 'fa', 'امارات متحده عربی', 241),
(1772, 'fa', 'انگلستان', 242),
(1773, 'fa', 'سازمان ملل', 243),
(1774, 'fa', 'ایالات متحده', 244),
(1775, 'fa', 'اروگوئه', 245),
(1776, 'fa', 'ازبکستان', 246),
(1777, 'fa', 'وانواتو', 247),
(1778, 'fa', 'شهر واتیکان', 248),
(1779, 'fa', 'ونزوئلا', 249),
(1780, 'fa', 'ویتنام', 250),
(1781, 'fa', 'والیس و فوتونا', 251),
(1782, 'fa', 'صحرای غربی', 252),
(1783, 'fa', 'یمن', 253),
(1784, 'fa', 'زامبیا', 254),
(1785, 'fa', 'زیمبابوه', 255),
(1786, 'pt_BR', 'Afeganistão', 1),
(1787, 'pt_BR', 'Ilhas Åland', 2),
(1788, 'pt_BR', 'Albânia', 3),
(1789, 'pt_BR', 'Argélia', 4),
(1790, 'pt_BR', 'Samoa Americana', 5),
(1791, 'pt_BR', 'Andorra', 6),
(1792, 'pt_BR', 'Angola', 7),
(1793, 'pt_BR', 'Angola', 8),
(1794, 'pt_BR', 'Antártico', 9),
(1795, 'pt_BR', 'Antígua e Barbuda', 10),
(1796, 'pt_BR', 'Argentina', 11),
(1797, 'pt_BR', 'Armênia', 12),
(1798, 'pt_BR', 'Aruba', 13),
(1799, 'pt_BR', 'Ilha de escalada', 14),
(1800, 'pt_BR', 'Austrália', 15),
(1801, 'pt_BR', 'Áustria', 16),
(1802, 'pt_BR', 'Azerbaijão', 17),
(1803, 'pt_BR', 'Bahamas', 18),
(1804, 'pt_BR', 'Bahrain', 19),
(1805, 'pt_BR', 'Bangladesh', 20),
(1806, 'pt_BR', 'Barbados', 21),
(1807, 'pt_BR', 'Bielorrússia', 22),
(1808, 'pt_BR', 'Bélgica', 23),
(1809, 'pt_BR', 'Bélgica', 24),
(1810, 'pt_BR', 'Benin', 25),
(1811, 'pt_BR', 'Bermuda', 26),
(1812, 'pt_BR', 'Butão', 27),
(1813, 'pt_BR', 'Bolívia', 28),
(1814, 'pt_BR', 'Bósnia e Herzegovina', 29),
(1815, 'pt_BR', 'Botsuana', 30),
(1816, 'pt_BR', 'Brasil', 31),
(1817, 'pt_BR', 'Território Britânico do Oceano Índico', 32),
(1818, 'pt_BR', 'Ilhas Virgens Britânicas', 33),
(1819, 'pt_BR', 'Brunei', 34),
(1820, 'pt_BR', 'Bulgária', 35),
(1821, 'pt_BR', 'Burkina Faso', 36),
(1822, 'pt_BR', 'Burundi', 37),
(1823, 'pt_BR', 'Camboja', 38),
(1824, 'pt_BR', 'Camarões', 39),
(1825, 'pt_BR', 'Canadá', 40),
(1826, 'pt_BR', 'Ilhas Canárias', 41),
(1827, 'pt_BR', 'Cabo Verde', 42),
(1828, 'pt_BR', 'Holanda do Caribe', 43),
(1829, 'pt_BR', 'Ilhas Cayman', 44),
(1830, 'pt_BR', 'República Centro-Africana', 45),
(1831, 'pt_BR', 'Ceuta e Melilla', 46),
(1832, 'pt_BR', 'Chade', 47),
(1833, 'pt_BR', 'Chile', 48),
(1834, 'pt_BR', 'China', 49),
(1835, 'pt_BR', 'Ilha Christmas', 50),
(1836, 'pt_BR', 'Ilhas Cocos (Keeling)', 51),
(1837, 'pt_BR', 'Colômbia', 52),
(1838, 'pt_BR', 'Comores', 53),
(1839, 'pt_BR', 'Congo - Brazzaville', 54),
(1840, 'pt_BR', 'Congo - Kinshasa', 55),
(1841, 'pt_BR', 'Ilhas Cook', 56),
(1842, 'pt_BR', 'Costa Rica', 57),
(1843, 'pt_BR', 'Costa do Marfim', 58),
(1844, 'pt_BR', 'Croácia', 59),
(1845, 'pt_BR', 'Cuba', 60),
(1846, 'pt_BR', 'Curaçao', 61),
(1847, 'pt_BR', 'Chipre', 62),
(1848, 'pt_BR', 'Czechia', 63),
(1849, 'pt_BR', 'Dinamarca', 64),
(1850, 'pt_BR', 'Diego Garcia', 65),
(1851, 'pt_BR', 'Djibuti', 66),
(1852, 'pt_BR', 'Dominica', 67),
(1853, 'pt_BR', 'República Dominicana', 68),
(1854, 'pt_BR', 'Equador', 69),
(1855, 'pt_BR', 'Egito', 70),
(1856, 'pt_BR', 'El Salvador', 71),
(1857, 'pt_BR', 'Guiné Equatorial', 72),
(1858, 'pt_BR', 'Eritreia', 73),
(1859, 'pt_BR', 'Estônia', 74),
(1860, 'pt_BR', 'Etiópia', 75),
(1861, 'pt_BR', 'Zona Euro', 76),
(1862, 'pt_BR', 'Ilhas Malvinas', 77),
(1863, 'pt_BR', 'Ilhas Faroe', 78),
(1864, 'pt_BR', 'Fiji', 79),
(1865, 'pt_BR', 'Finlândia', 80),
(1866, 'pt_BR', 'França', 81),
(1867, 'pt_BR', 'Guiana Francesa', 82),
(1868, 'pt_BR', 'Polinésia Francesa', 83),
(1869, 'pt_BR', 'Territórios Franceses do Sul', 84),
(1870, 'pt_BR', 'Gabão', 85),
(1871, 'pt_BR', 'Gâmbia', 86),
(1872, 'pt_BR', 'Geórgia', 87),
(1873, 'pt_BR', 'Alemanha', 88),
(1874, 'pt_BR', 'Gana', 89),
(1875, 'pt_BR', 'Gibraltar', 90),
(1876, 'pt_BR', 'Grécia', 91),
(1877, 'pt_BR', 'Gronelândia', 92),
(1878, 'pt_BR', 'Granada', 93),
(1879, 'pt_BR', 'Guadalupe', 94),
(1880, 'pt_BR', 'Guam', 95),
(1881, 'pt_BR', 'Guatemala', 96),
(1882, 'pt_BR', 'Guernsey', 97),
(1883, 'pt_BR', 'Guiné', 98),
(1884, 'pt_BR', 'Guiné-Bissau', 99),
(1885, 'pt_BR', 'Guiana', 100),
(1886, 'pt_BR', 'Haiti', 101),
(1887, 'pt_BR', 'Honduras', 102),
(1888, 'pt_BR', 'Região Administrativa Especial de Hong Kong, China', 103),
(1889, 'pt_BR', 'Hungria', 104),
(1890, 'pt_BR', 'Islândia', 105),
(1891, 'pt_BR', 'Índia', 106),
(1892, 'pt_BR', 'Indonésia', 107),
(1893, 'pt_BR', 'Irã', 108),
(1894, 'pt_BR', 'Iraque', 109),
(1895, 'pt_BR', 'Irlanda', 110),
(1896, 'pt_BR', 'Ilha de Man', 111),
(1897, 'pt_BR', 'Israel', 112),
(1898, 'pt_BR', 'Itália', 113),
(1899, 'pt_BR', 'Jamaica', 114),
(1900, 'pt_BR', 'Japão', 115),
(1901, 'pt_BR', 'Jersey', 116),
(1902, 'pt_BR', 'Jordânia', 117),
(1903, 'pt_BR', 'Cazaquistão', 118),
(1904, 'pt_BR', 'Quênia', 119),
(1905, 'pt_BR', 'Quiribati', 120),
(1906, 'pt_BR', 'Kosovo', 121),
(1907, 'pt_BR', 'Kuwait', 122),
(1908, 'pt_BR', 'Quirguistão', 123),
(1909, 'pt_BR', 'Laos', 124),
(1910, 'pt_BR', 'Letônia', 125),
(1911, 'pt_BR', 'Líbano', 126),
(1912, 'pt_BR', 'Lesoto', 127),
(1913, 'pt_BR', 'Libéria', 128),
(1914, 'pt_BR', 'Líbia', 129),
(1915, 'pt_BR', 'Liechtenstein', 130),
(1916, 'pt_BR', 'Lituânia', 131),
(1917, 'pt_BR', 'Luxemburgo', 132),
(1918, 'pt_BR', 'Macau SAR China', 133),
(1919, 'pt_BR', 'Macedônia', 134),
(1920, 'pt_BR', 'Madagascar', 135),
(1921, 'pt_BR', 'Malawi', 136),
(1922, 'pt_BR', 'Malásia', 137),
(1923, 'pt_BR', 'Maldivas', 138),
(1924, 'pt_BR', 'Mali', 139),
(1925, 'pt_BR', 'Malta', 140),
(1926, 'pt_BR', 'Ilhas Marshall', 141),
(1927, 'pt_BR', 'Martinica', 142),
(1928, 'pt_BR', 'Mauritânia', 143),
(1929, 'pt_BR', 'Maurício', 144),
(1930, 'pt_BR', 'Maiote', 145),
(1931, 'pt_BR', 'México', 146),
(1932, 'pt_BR', 'Micronésia', 147),
(1933, 'pt_BR', 'Moldávia', 148),
(1934, 'pt_BR', 'Mônaco', 149),
(1935, 'pt_BR', 'Mongólia', 150),
(1936, 'pt_BR', 'Montenegro', 151),
(1937, 'pt_BR', 'Montserrat', 152),
(1938, 'pt_BR', 'Marrocos', 153),
(1939, 'pt_BR', 'Moçambique', 154),
(1940, 'pt_BR', 'Mianmar (Birmânia)', 155),
(1941, 'pt_BR', 'Namíbia', 156),
(1942, 'pt_BR', 'Nauru', 157),
(1943, 'pt_BR', 'Nepal', 158),
(1944, 'pt_BR', 'Holanda', 159),
(1945, 'pt_BR', 'Nova Caledônia', 160),
(1946, 'pt_BR', 'Nova Zelândia', 161),
(1947, 'pt_BR', 'Nicarágua', 162),
(1948, 'pt_BR', 'Níger', 163),
(1949, 'pt_BR', 'Nigéria', 164),
(1950, 'pt_BR', 'Niue', 165),
(1951, 'pt_BR', 'Ilha Norfolk', 166),
(1952, 'pt_BR', 'Coréia do Norte', 167),
(1953, 'pt_BR', 'Ilhas Marianas do Norte', 168),
(1954, 'pt_BR', 'Noruega', 169),
(1955, 'pt_BR', 'Omã', 170),
(1956, 'pt_BR', 'Paquistão', 171),
(1957, 'pt_BR', 'Palau', 172),
(1958, 'pt_BR', 'Territórios Palestinos', 173),
(1959, 'pt_BR', 'Panamá', 174),
(1960, 'pt_BR', 'Papua Nova Guiné', 175),
(1961, 'pt_BR', 'Paraguai', 176),
(1962, 'pt_BR', 'Peru', 177),
(1963, 'pt_BR', 'Filipinas', 178),
(1964, 'pt_BR', 'Ilhas Pitcairn', 179),
(1965, 'pt_BR', 'Polônia', 180),
(1966, 'pt_BR', 'Portugal', 181),
(1967, 'pt_BR', 'Porto Rico', 182),
(1968, 'pt_BR', 'Catar', 183),
(1969, 'pt_BR', 'Reunião', 184),
(1970, 'pt_BR', 'Romênia', 185),
(1971, 'pt_BR', 'Rússia', 186),
(1972, 'pt_BR', 'Ruanda', 187),
(1973, 'pt_BR', 'Samoa', 188),
(1974, 'pt_BR', 'São Marinho', 189),
(1975, 'pt_BR', 'São Cristóvão e Nevis', 190),
(1976, 'pt_BR', 'Arábia Saudita', 191),
(1977, 'pt_BR', 'Senegal', 192),
(1978, 'pt_BR', 'Sérvia', 193),
(1979, 'pt_BR', 'Seychelles', 194),
(1980, 'pt_BR', 'Serra Leoa', 195),
(1981, 'pt_BR', 'Cingapura', 196),
(1982, 'pt_BR', 'São Martinho', 197),
(1983, 'pt_BR', 'Eslováquia', 198),
(1984, 'pt_BR', 'Eslovênia', 199),
(1985, 'pt_BR', 'Ilhas Salomão', 200),
(1986, 'pt_BR', 'Somália', 201),
(1987, 'pt_BR', 'África do Sul', 202),
(1988, 'pt_BR', 'Ilhas Geórgia do Sul e Sandwich do Sul', 203),
(1989, 'pt_BR', 'Coréia do Sul', 204),
(1990, 'pt_BR', 'Sudão do Sul', 205),
(1991, 'pt_BR', 'Espanha', 206),
(1992, 'pt_BR', 'Sri Lanka', 207),
(1993, 'pt_BR', 'São Bartolomeu', 208),
(1994, 'pt_BR', 'Santa Helena', 209),
(1995, 'pt_BR', 'São Cristóvão e Nevis', 210),
(1996, 'pt_BR', 'Santa Lúcia', 211),
(1997, 'pt_BR', 'São Martinho', 212),
(1998, 'pt_BR', 'São Pedro e Miquelon', 213),
(1999, 'pt_BR', 'São Vicente e Granadinas', 214),
(2000, 'pt_BR', 'Sudão', 215),
(2001, 'pt_BR', 'Suriname', 216),
(2002, 'pt_BR', 'Svalbard e Jan Mayen', 217),
(2003, 'pt_BR', 'Suazilândia', 218),
(2004, 'pt_BR', 'Suécia', 219),
(2005, 'pt_BR', 'Suíça', 220),
(2006, 'pt_BR', 'Síria', 221),
(2007, 'pt_BR', 'Taiwan', 222),
(2008, 'pt_BR', 'Tajiquistão', 223),
(2009, 'pt_BR', 'Tanzânia', 224),
(2010, 'pt_BR', 'Tailândia', 225),
(2011, 'pt_BR', 'Timor-Leste', 226),
(2012, 'pt_BR', 'Togo', 227),
(2013, 'pt_BR', 'Tokelau', 228),
(2014, 'pt_BR', 'Tonga', 229),
(2015, 'pt_BR', 'Trinidad e Tobago', 230),
(2016, 'pt_BR', 'Tristan da Cunha', 231),
(2017, 'pt_BR', 'Tunísia', 232),
(2018, 'pt_BR', 'Turquia', 233),
(2019, 'pt_BR', 'Turquemenistão', 234),
(2020, 'pt_BR', 'Ilhas Turks e Caicos', 235),
(2021, 'pt_BR', 'Tuvalu', 236),
(2022, 'pt_BR', 'Ilhas periféricas dos EUA', 237),
(2023, 'pt_BR', 'Ilhas Virgens dos EUA', 238),
(2024, 'pt_BR', 'Uganda', 239),
(2025, 'pt_BR', 'Ucrânia', 240),
(2026, 'pt_BR', 'Emirados Árabes Unidos', 241),
(2027, 'pt_BR', 'Reino Unido', 242),
(2028, 'pt_BR', 'Nações Unidas', 243),
(2029, 'pt_BR', 'Estados Unidos', 244),
(2030, 'pt_BR', 'Uruguai', 245),
(2031, 'pt_BR', 'Uzbequistão', 246),
(2032, 'pt_BR', 'Vanuatu', 247),
(2033, 'pt_BR', 'Cidade do Vaticano', 248),
(2034, 'pt_BR', 'Venezuela', 249),
(2035, 'pt_BR', 'Vietnã', 250),
(2036, 'pt_BR', 'Wallis e Futuna', 251),
(2037, 'pt_BR', 'Saara Ocidental', 252),
(2038, 'pt_BR', 'Iêmen', 253),
(2039, 'pt_BR', 'Zâmbia', 254),
(2040, 'pt_BR', 'Zimbábue', 255);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal` int UNSIGNED NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `created_at`, `updated_at`, `symbol`, `decimal`) VALUES
(1, 'USD', 'US Dollar', NULL, NULL, '$', 2),
(2, 'EUR', 'Euro', NULL, NULL, '€', 2),
(3, 'VND', 'Đồng', '2023-10-09 16:01:56', '2023-10-09 16:01:56', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `currency_exchange_rates`
--

CREATE TABLE `currency_exchange_rates` (
  `id` int UNSIGNED NOT NULL,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int UNSIGNED NOT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int UNSIGNED DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspended` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `image`, `status`, `password`, `api_token`, `customer_group_id`, `subscribed_to_news_letter`, `remember_token`, `created_at`, `updated_at`, `is_verified`, `is_suspended`, `token`, `notes`, `phone`) VALUES
(1, 'NHANH WEB (WNI)', 'NHANH WEB (WNI)', NULL, NULL, 'int.vnus@gmail.com', NULL, 1, NULL, NULL, 2, 0, 'IcOr1mZJ4L1Ag8hqJYNUB8IONL7MBVTCDzMP5pFisTyv0V9lPt7D9aFM6tN4', '2023-11-19 09:08:50', '2023-11-19 09:08:50', 0, 0, NULL, NULL, NULL),
(2, 'GETPIX', '', NULL, NULL, 'dso790208@gmail.com', NULL, 1, NULL, NULL, 2, 0, 'f78WtyT8evTPmQycibb4PwfIruQz2fiKbskmlCxtzfQepNK45JC17PmrmKxR', '2023-11-19 09:41:58', '2023-11-19 09:41:58', 0, 0, NULL, NULL, NULL),
(3, 'Nguyen', 'Huy', NULL, NULL, 'huy110qt@gmail.com', NULL, 1, NULL, NULL, 2, 0, '8fKWDPxbwx6Rvyy0ZWdTx6Rx610UhXHMNEPTKDvJwHRRBGhI7xVRA4Rhfu3B', '2023-11-19 09:45:20', '2023-11-19 09:45:20', 0, 0, NULL, NULL, NULL),
(4, 'Đức Kế Toán', 'An', 'Male', '0000-00-00', 'lienhe@dichvuketoananduc.vn', NULL, 1, NULL, NULL, 2, 0, '9RAj3xnHExcZRbgLpnLXszhByaTEFpcYj4hkXLSN3XuK1qMeeE7NP292Yqyo', '2023-11-20 02:51:40', '2023-12-03 06:32:23', 0, 0, NULL, NULL, ''),
(5, 'Huy', 'Nguyen', 'Male', NULL, 'ndhuy77@gmail.com', 'customer/5/buSlS8r73Fv2WMyuaNfURWyj1qZNo480inOHUsoi.jpg', 1, NULL, NULL, 2, 0, '1JQDIhw0gRgsQbNRZiVOHfsT3jjzCanWKWpVmsye3DsPftJzKTe4lOnat3tK', '2023-11-20 12:57:09', '2023-11-20 12:59:37', 0, 0, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `name`, `is_user_defined`, `created_at`, `updated_at`, `code`) VALUES
(1, 'Khách', 0, NULL, '2023-10-09 15:54:13', 'guest'),
(2, 'Thông Thường', 0, NULL, '2023-10-09 15:54:00', 'general'),
(3, 'Nhà Phân Phối', 0, NULL, '2023-10-09 15:53:47', 'wholesale'),
(4, 'Nhóm VIP 1', 1, '2023-10-09 15:52:28', '2023-10-09 15:52:28', 'VIP0001'),
(5, 'Nhóm VIP 2', 1, '2023-10-09 15:52:49', '2023-10-09 15:52:49', 'VIP0002'),
(6, 'Nhóm VIP 3', 1, '2023-10-09 15:53:09', '2023-10-09 15:53:09', 'VIP0003');

-- --------------------------------------------------------

--
-- Table structure for table `customer_password_resets`
--

CREATE TABLE `customer_password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `customer_social_accounts`
--

CREATE TABLE `customer_social_accounts` (
  `id` int UNSIGNED NOT NULL,
  `provider_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customer_social_accounts`
--

INSERT INTO `customer_social_accounts` (`id`, `provider_name`, `provider_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 'google', '101188957316223636828', 1, '2023-11-19 09:08:50', '2023-11-19 09:08:50'),
(2, 'google', '104856572556786757244', 2, '2023-11-19 09:41:59', '2023-11-19 09:41:59'),
(3, 'google', '117346177204417584259', 3, '2023-11-19 09:45:20', '2023-11-19 09:45:20'),
(4, 'google', '108339286602299444982', 4, '2023-11-20 02:51:40', '2023-11-20 02:51:40'),
(5, 'google', '102361480658265463819', 5, '2023-11-20 12:57:09', '2023-11-20 12:57:09');

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased`
--

CREATE TABLE `downloadable_link_purchased` (
  `id` int UNSIGNED NOT NULL,
  `product_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int NOT NULL DEFAULT '0',
  `download_used` int NOT NULL DEFAULT '0',
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `order_item_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `download_canceled` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_sources`
--

CREATE TABLE `inventory_sources` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `inventory_sources`
--

INSERT INTO `inventory_sources` (`id`, `code`, `name`, `description`, `contact_name`, `contact_email`, `contact_number`, `contact_fax`, `country`, `state`, `city`, `street`, `postcode`, `priority`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'GEINS001', 'Getpix Store', 'Getpix Store', 'Getpix Store', 'info@getpix.vn', '0903448207', '', 'VN', 'Ho Chi Minh', 'Thu Duc', '12th Street', '700000', 1, 0.00000, 0.00000, 1, NULL, '2023-10-11 19:11:31');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int UNSIGNED NOT NULL,
  `increment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int UNSIGNED DEFAULT NULL,
  `order_address_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminders` int NOT NULL DEFAULT '0',
  `next_reminder_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int UNSIGNED DEFAULT NULL,
  `invoice_id` int UNSIGNED DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `locales`
--

CREATE TABLE `locales` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `direction` enum('ltr','rtl') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `locale_image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `locales`
--

INSERT INTO `locales` (`id`, `code`, `name`, `created_at`, `updated_at`, `direction`, `locale_image`) VALUES
(1, 'en', 'English', NULL, NULL, 'ltr', NULL),
(6, 'Vi', 'Việt Nam', '2023-10-09 01:20:11', '2023-10-09 01:20:11', 'ltr', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marketing_campaigns`
--

CREATE TABLE `marketing_campaigns` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int UNSIGNED DEFAULT NULL,
  `customer_group_id` int UNSIGNED DEFAULT NULL,
  `marketing_template_id` int UNSIGNED DEFAULT NULL,
  `marketing_event_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_events`
--

CREATE TABLE `marketing_events` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `marketing_events`
--

INSERT INTO `marketing_events` (`id`, `name`, `description`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Birthday', 'Birthday', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marketing_templates`
--

CREATE TABLE `marketing_templates` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_admin_password_resets_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_06_12_111907_create_admins_table', 1),
(5, '2018_06_13_055341_create_roles_table', 1),
(6, '2018_07_05_130148_create_attributes_table', 1),
(7, '2018_07_05_132854_create_attribute_translations_table', 1),
(8, '2018_07_05_135150_create_attribute_families_table', 1),
(9, '2018_07_05_135152_create_attribute_groups_table', 1),
(10, '2018_07_05_140832_create_attribute_options_table', 1),
(11, '2018_07_05_140856_create_attribute_option_translations_table', 1),
(12, '2018_07_05_142820_create_categories_table', 1),
(13, '2018_07_10_055143_create_locales_table', 1),
(14, '2018_07_20_054426_create_countries_table', 1),
(15, '2018_07_20_054502_create_currencies_table', 1),
(16, '2018_07_20_054542_create_currency_exchange_rates_table', 1),
(17, '2018_07_20_064849_create_channels_table', 1),
(18, '2018_07_21_142836_create_category_translations_table', 1),
(19, '2018_07_23_110040_create_inventory_sources_table', 1),
(20, '2018_07_24_082635_create_customer_groups_table', 1),
(21, '2018_07_24_082930_create_customers_table', 1),
(22, '2018_07_24_083025_create_customer_addresses_table', 1),
(23, '2018_07_27_065727_create_products_table', 1),
(24, '2018_07_27_070011_create_product_attribute_values_table', 1),
(25, '2018_07_27_092623_create_product_reviews_table', 1),
(26, '2018_07_27_113941_create_product_images_table', 1),
(27, '2018_07_27_113956_create_product_inventories_table', 1),
(28, '2018_08_03_114203_create_sliders_table', 1),
(29, '2018_08_30_064755_create_tax_categories_table', 1),
(30, '2018_08_30_065042_create_tax_rates_table', 1),
(31, '2018_08_30_065840_create_tax_mappings_table', 1),
(32, '2018_09_05_150444_create_cart_table', 1),
(33, '2018_09_05_150915_create_cart_items_table', 1),
(34, '2018_09_11_064045_customer_password_resets', 1),
(35, '2018_09_19_092845_create_cart_address', 1),
(36, '2018_09_19_093453_create_cart_payment', 1),
(37, '2018_09_19_093508_create_cart_shipping_rates_table', 1),
(38, '2018_09_20_060658_create_core_config_table', 1),
(39, '2018_09_27_113154_create_orders_table', 1),
(40, '2018_09_27_113207_create_order_items_table', 1),
(41, '2018_09_27_113405_create_order_address_table', 1),
(42, '2018_09_27_115022_create_shipments_table', 1),
(43, '2018_09_27_115029_create_shipment_items_table', 1),
(44, '2018_09_27_115135_create_invoices_table', 1),
(45, '2018_09_27_115144_create_invoice_items_table', 1),
(46, '2018_10_01_095504_create_order_payment_table', 1),
(47, '2018_10_03_025230_create_wishlist_table', 1),
(48, '2018_10_12_101803_create_country_translations_table', 1),
(49, '2018_10_12_101913_create_country_states_table', 1),
(50, '2018_10_12_101923_create_country_state_translations_table', 1),
(51, '2018_11_15_153257_alter_order_table', 1),
(52, '2018_11_15_163729_alter_invoice_table', 1),
(53, '2018_11_16_173504_create_subscribers_list_table', 1),
(54, '2018_11_17_165758_add_is_verified_column_in_customers_table', 1),
(55, '2018_11_21_144411_create_cart_item_inventories_table', 1),
(56, '2018_11_26_110500_change_gender_column_in_customers_table', 1),
(57, '2018_11_27_174449_change_content_column_in_sliders_table', 1),
(58, '2018_12_05_132625_drop_foreign_key_core_config_table', 1),
(59, '2018_12_05_132629_alter_core_config_table', 1),
(60, '2018_12_06_185202_create_product_flat_table', 1),
(61, '2018_12_21_101307_alter_channels_table', 1),
(62, '2018_12_24_123812_create_channel_inventory_sources_table', 1),
(63, '2018_12_24_184402_alter_shipments_table', 1),
(64, '2018_12_26_165327_create_product_ordered_inventories_table', 1),
(65, '2018_12_31_161114_alter_channels_category_table', 1),
(66, '2019_01_11_122452_add_vendor_id_column_in_product_inventories_table', 1),
(67, '2019_01_25_124522_add_updated_at_column_in_product_flat_table', 1),
(68, '2019_01_29_123053_add_min_price_and_max_price_column_in_product_flat_table', 1),
(69, '2019_01_31_164117_update_value_column_type_to_text_in_core_config_table', 1),
(70, '2019_02_21_145238_alter_product_reviews_table', 1),
(71, '2019_02_21_152709_add_swatch_type_column_in_attributes_table', 1),
(72, '2019_02_21_153035_alter_customer_id_in_product_reviews_table', 1),
(73, '2019_02_21_153851_add_swatch_value_columns_in_attribute_options_table', 1),
(74, '2019_03_15_123337_add_display_mode_column_in_categories_table', 1),
(75, '2019_03_28_103658_add_notes_column_in_customers_table', 1),
(76, '2019_04_24_155820_alter_product_flat_table', 1),
(77, '2019_05_13_024320_remove_tables', 1),
(78, '2019_05_13_024321_create_cart_rules_table', 1),
(79, '2019_05_13_024322_create_cart_rule_channels_table', 1),
(80, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1),
(81, '2019_05_13_024324_create_cart_rule_translations_table', 1),
(82, '2019_05_13_024325_create_cart_rule_customers_table', 1),
(83, '2019_05_13_024326_create_cart_rule_coupons_table', 1),
(84, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1),
(85, '2019_05_22_165833_update_zipcode_column_type_to_varchar_in_cart_address_table', 1),
(86, '2019_05_23_113407_add_remaining_column_in_product_flat_table', 1),
(87, '2019_05_23_155520_add_discount_columns_in_invoice_items_table', 1),
(88, '2019_05_23_184029_rename_discount_columns_in_cart_table', 1),
(89, '2019_06_04_114009_add_phone_column_in_customers_table', 1),
(90, '2019_06_06_195905_update_custom_price_to_nullable_in_cart_items', 1),
(91, '2019_06_15_183412_add_code_column_in_customer_groups_table', 1),
(92, '2019_06_17_180258_create_product_downloadable_samples_table', 1),
(93, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1),
(94, '2019_06_17_180325_create_product_downloadable_links_table', 1),
(95, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1),
(96, '2019_06_19_162817_remove_unique_in_phone_column_in_customers_table', 1),
(97, '2019_06_21_130512_update_weight_column_deafult_value_in_cart_items_table', 1),
(98, '2019_06_21_202249_create_downloadable_link_purchased_table', 1),
(99, '2019_07_02_180307_create_booking_products_table', 1),
(100, '2019_07_05_114157_add_symbol_column_in_currencies_table', 1),
(101, '2019_07_05_154415_create_booking_product_default_slots_table', 1),
(102, '2019_07_05_154429_create_booking_product_appointment_slots_table', 1),
(103, '2019_07_05_154440_create_booking_product_event_tickets_table', 1),
(104, '2019_07_05_154451_create_booking_product_rental_slots_table', 1),
(105, '2019_07_05_154502_create_booking_product_table_slots_table', 1),
(106, '2019_07_11_151210_add_locale_id_in_category_translations', 1),
(107, '2019_07_23_033128_alter_locales_table', 1),
(108, '2019_07_23_174708_create_velocity_contents_table', 1),
(109, '2019_07_23_175212_create_velocity_contents_translations_table', 1),
(110, '2019_07_29_142734_add_use_in_flat_column_in_attributes_table', 1),
(111, '2019_07_30_153530_create_cms_pages_table', 1),
(112, '2019_07_31_143339_create_category_filterable_attributes_table', 1),
(113, '2019_08_02_105320_create_product_grouped_products_table', 1),
(114, '2019_08_12_184925_add_additional_column_in_wishlist_table', 1),
(115, '2019_08_20_170510_create_product_bundle_options_table', 1),
(116, '2019_08_20_170520_create_product_bundle_option_translations_table', 1),
(117, '2019_08_20_170528_create_product_bundle_option_products_table', 1),
(118, '2019_08_21_123707_add_seo_column_in_channels_table', 1),
(119, '2019_09_11_184511_create_refunds_table', 1),
(120, '2019_09_11_184519_create_refund_items_table', 1),
(121, '2019_09_26_163950_remove_channel_id_from_customers_table', 1),
(122, '2019_10_03_105451_change_rate_column_in_currency_exchange_rates_table', 1),
(123, '2019_10_21_105136_order_brands', 1),
(124, '2019_10_24_173358_change_postcode_column_type_in_order_address_table', 1),
(125, '2019_10_24_173437_change_postcode_column_type_in_cart_address_table', 1),
(126, '2019_10_24_173507_change_postcode_column_type_in_customer_addresses_table', 1),
(127, '2019_11_21_194541_add_column_url_path_to_category_translations', 1),
(128, '2019_11_25_171136_add_applied_cart_rule_ids_column_in_cart_table', 1),
(129, '2019_11_25_171208_add_applied_cart_rule_ids_column_in_cart_items_table', 1),
(130, '2019_11_30_124437_add_applied_cart_rule_ids_column_in_orders_table', 1),
(131, '2019_11_30_165644_add_discount_columns_in_cart_shipping_rates_table', 1),
(132, '2019_12_03_175253_create_remove_catalog_rule_tables', 1),
(133, '2019_12_03_184613_create_catalog_rules_table', 1),
(134, '2019_12_03_184651_create_catalog_rule_channels_table', 1),
(135, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1),
(136, '2019_12_06_101110_create_catalog_rule_products_table', 1),
(137, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1),
(138, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(139, '2019_12_30_155256_create_velocity_meta_data', 1),
(140, '2020_01_02_201029_add_api_token_columns', 1),
(141, '2020_01_09_154851_add_shipping_discount_columns_in_orders_table', 1),
(142, '2020_01_09_202815_add_inventory_source_name_column_in_shipments_table', 1),
(143, '2020_01_10_122226_update_velocity_meta_data', 1),
(144, '2020_01_10_151902_customer_address_improvements', 1),
(145, '2020_01_13_131431_alter_float_value_column_type_in_product_attribute_values_table', 1),
(146, '2020_01_13_155803_add_velocity_locale_icon', 1),
(147, '2020_01_13_192149_add_category_velocity_meta_data', 1),
(148, '2020_01_14_191854_create_cms_page_translations_table', 1),
(149, '2020_01_14_192206_remove_columns_from_cms_pages_table', 1),
(150, '2020_01_15_130209_create_cms_page_channels_table', 1),
(151, '2020_01_15_145637_add_product_policy', 1),
(152, '2020_01_15_152121_add_banner_link', 1),
(153, '2020_01_28_102422_add_new_column_and_rename_name_column_in_customer_addresses_table', 1),
(154, '2020_01_29_124748_alter_name_column_in_country_state_translations_table', 1),
(155, '2020_02_18_165639_create_bookings_table', 1),
(156, '2020_02_21_121201_create_booking_product_event_ticket_translations_table', 1),
(157, '2020_02_24_190025_add_is_comparable_column_in_attributes_table', 1),
(158, '2020_02_25_181902_propagate_company_name', 1),
(159, '2020_02_26_163908_change_column_type_in_cart_rules_table', 1),
(160, '2020_02_28_105104_fix_order_columns', 1),
(161, '2020_02_28_111958_create_customer_compare_products_table', 1),
(162, '2020_03_23_201431_alter_booking_products_table', 1),
(163, '2020_04_13_224524_add_locale_in_sliders_table', 1),
(164, '2020_04_16_130351_remove_channel_from_tax_category', 1),
(165, '2020_04_16_185147_add_table_addresses', 1),
(166, '2020_05_06_171638_create_order_comments_table', 1),
(167, '2020_05_21_171500_create_product_customer_group_prices_table', 1),
(168, '2020_06_08_161708_add_sale_prices_to_booking_product_event_tickets', 1),
(169, '2020_06_10_201453_add_locale_velocity_meta_data', 1),
(170, '2020_06_25_162154_create_customer_social_accounts_table', 1),
(171, '2020_06_25_162340_change_email_password_columns_in_customers_table', 1),
(172, '2020_06_30_163510_remove_unique_name_in_tax_categories_table', 1),
(173, '2020_07_31_142021_update_cms_page_translations_table_field_html_content', 1),
(174, '2020_08_01_132239_add_header_content_count_velocity_meta_data_table', 1),
(175, '2020_08_12_114128_removing_foriegn_key', 1),
(176, '2020_08_17_104228_add_channel_to_velocity_meta_data_table', 1),
(177, '2020_09_07_120413_add_unique_index_to_increment_id_in_orders_table', 1),
(178, '2020_09_07_195157_add_additional_to_category', 1),
(179, '2020_11_10_174816_add_product_number_column_in_product_flat_table', 1),
(180, '2020_11_19_112228_create_product_videos_table', 1),
(181, '2020_11_20_105353_add_columns_in_channels_table', 1),
(182, '2020_11_26_141455_create_marketing_templates_table', 1),
(183, '2020_11_26_150534_create_marketing_events_table', 1),
(184, '2020_11_26_150644_create_marketing_campaigns_table', 1),
(185, '2020_12_18_122826_add_is_tax_calculation_column_to_cart_shipping_rates_table', 1),
(186, '2020_12_21_000200_create_channel_translations_table', 1),
(187, '2020_12_21_140151_remove_columns_from_channels_table', 1),
(188, '2020_12_24_131004_add_customer_id_column_in_subscribers_list_table', 1),
(189, '2020_12_27_121950_create_jobs_table', 1),
(190, '2021_02_03_104907_add_adittional_data_to_order_payment_table', 1),
(191, '2021_02_04_150033_add_download_canceled_column_in_downloadable_link_purchased_table', 1),
(192, '2021_03_11_212124_create_order_transactions_table', 1),
(193, '2021_03_19_184538_add_expired_at_and_sort_order_column_in_sliders_table', 1),
(194, '2021_04_07_132010_create_product_review_images_table', 1),
(195, '2021_06_17_103057_alter_products_table', 1),
(196, '2021_10_14_122221_add_image_column_to_customers_table', 1),
(197, '2021_10_23_125017_add_transaction_amount_column', 1),
(198, '2021_10_29_030610_add_reminders_on_invoices_table', 1),
(199, '2021_10_30_112900_add_next_reminder_at_on_invoices_table', 1),
(200, '2021_12_15_104544_notifications', 1),
(201, '2022_01_25_160015_update_country_state_and_zip_code_in_addresses_table', 1),
(202, '2022_02_01_185800_add_position_column_to_product_images_table', 1),
(203, '2022_02_02_142616_add_is_suspended_column_to_customers_table', 1),
(204, '2022_02_03_120502_add_position_column_to_product_videos_table', 1),
(205, '2022_03_11_133408_add_enable_wysiwyg_column_in_attributes_table', 1),
(206, '2022_03_15_160510_create_failed_jobs_table', 1),
(207, '2022_03_22_105355_add_image_column_in_admins_table', 1),
(208, '2022_04_01_094622_create_sitemaps_table', 1),
(209, '2022_10_03_144232_create_product_price_indices_table', 1),
(210, '2022_10_04_144444_create_job_batches_table', 1),
(211, '2022_10_08_134150_create_product_inventory_indices_table', 1),
(212, '2022_10_28_161132_remove_product_flat_id_column_in_velocity_customer_compare_products_table', 1),
(213, '2022_10_28_182304_drop_use_in_flat_column_from_attributes_table', 1),
(214, '2022_10_28_200015_drop_columns_in_product_flat_table', 1),
(215, '2022_10_28_201144_add_columns_in_product_flat_table', 1),
(216, '2022_11_09_184539_add_decimal_columns_to_currency_table', 1),
(217, '2023_01_16_163456_add_category_banner_to_categories_table', 1),
(218, '2023_03_02_193725_remove_functions_and_trigger', 1),
(219, '2023_04_11_192047_add_expires_at_to_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int UNSIGNED NOT NULL,
  `increment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_company_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_vat_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int DEFAULT NULL,
  `total_qty_ordered` int DEFAULT NULL,
  `base_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `customer_id` int UNSIGNED DEFAULT NULL,
  `customer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int UNSIGNED DEFAULT NULL,
  `channel_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_brands`
--

CREATE TABLE `order_brands` (
  `id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `order_item_id` int UNSIGNED DEFAULT NULL,
  `product_id` int UNSIGNED DEFAULT NULL,
  `brand` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_comments`
--

CREATE TABLE `order_comments` (
  `id` int UNSIGNED NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int UNSIGNED NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int DEFAULT '0',
  `qty_shipped` int DEFAULT '0',
  `qty_invoiced` int DEFAULT '0',
  `qty_canceled` int DEFAULT '0',
  `qty_refunded` int DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `product_id` int UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_payment`
--

CREATE TABLE `order_payment` (
  `id` int UNSIGNED NOT NULL,
  `method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` int UNSIGNED NOT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `invoice_id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int UNSIGNED NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `attribute_family_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `type`, `created_at`, `updated_at`, `parent_id`, `attribute_family_id`, `additional`) VALUES
(7, 'A08', 'downloadable', '2023-10-25 02:44:00', '2023-11-11 13:34:20', NULL, 1, NULL),
(8, 'A09', 'downloadable', '2023-10-27 13:58:36', '2023-11-11 13:33:51', NULL, 1, NULL),
(9, 'A10', 'downloadable', '2023-10-31 09:59:51', '2023-11-11 13:32:25', NULL, 1, NULL),
(10, 'A13', 'downloadable', '2023-10-31 10:02:24', '2023-11-11 13:31:55', NULL, 3, NULL),
(11, 'A11', 'downloadable', '2023-11-11 13:28:14', '2023-11-11 13:28:14', NULL, 1, NULL),
(12, 'A12', 'downloadable', '2023-11-11 13:30:27', '2023-11-11 13:30:27', NULL, 1, NULL),
(13, 'A07', 'downloadable', '2023-11-11 13:34:56', '2023-11-11 13:34:56', NULL, 1, NULL),
(14, '2023000001', 'downloadable', '2023-11-11 13:37:48', '2023-11-18 02:20:46', NULL, 3, NULL),
(15, 'H0000001', 'downloadable', '2023-12-03 06:52:24', '2023-12-03 06:52:24', NULL, 1, NULL),
(16, 'H0000002', 'downloadable', '2023-12-03 07:10:02', '2023-12-03 07:10:02', NULL, 1, NULL),
(17, 'H0000003', 'downloadable', '2023-12-03 08:17:58', '2023-12-03 08:17:58', NULL, 1, NULL),
(18, 'H0000004', 'downloadable', '2023-12-03 08:25:10', '2023-12-03 08:25:10', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`) VALUES
(128, 'Vi', 'default', 'Ghế', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9),
(129, 'Vi', 'default', 'Ghế Đẹp', NULL, NULL, NULL, NULL, NULL, NULL, 7, 10),
(130, NULL, NULL, 'A08', NULL, NULL, NULL, NULL, NULL, NULL, 7, 1),
(131, 'Vi', 'default', 'A08', NULL, NULL, NULL, NULL, NULL, NULL, 7, 2),
(132, NULL, NULL, 'ghe', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3),
(133, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 7, 4),
(134, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 5),
(135, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 6),
(136, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 7),
(137, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 8),
(138, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 26),
(139, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 27),
(140, NULL, NULL, 'https://tuoitre.vn', NULL, NULL, NULL, NULL, NULL, NULL, 7, 28),
(141, 'Vi', 'default', '.jpg, vector', NULL, NULL, NULL, NULL, NULL, NULL, 7, 29),
(142, NULL, NULL, 'https://tuoitre.vn/xaydung', NULL, NULL, NULL, NULL, NULL, NULL, 7, 30),
(143, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 16),
(144, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 17),
(145, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 18),
(146, NULL, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, 7, 11),
(147, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 12),
(148, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 13),
(149, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 14),
(150, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 15),
(151, 'Vi', 'default', '22238', NULL, NULL, NULL, NULL, NULL, NULL, 8, 9),
(152, 'Vi', 'default', '22238', NULL, NULL, NULL, NULL, NULL, NULL, 8, 10),
(153, NULL, NULL, 'A09', NULL, NULL, NULL, NULL, NULL, NULL, 8, 1),
(154, 'Vi', 'default', 'A09', NULL, NULL, NULL, NULL, NULL, NULL, 8, 2),
(155, NULL, NULL, 'a09', NULL, NULL, NULL, NULL, NULL, NULL, 8, 3),
(156, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 8, 4),
(157, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 5),
(158, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 6),
(159, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 7),
(160, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 8),
(161, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 8, 26),
(162, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 27),
(163, NULL, NULL, 'https://localhost.com', NULL, NULL, NULL, NULL, NULL, NULL, 8, 28),
(164, 'Vi', 'default', '22238', NULL, NULL, NULL, NULL, NULL, NULL, 8, 29),
(165, NULL, NULL, 'https://localhost.com', NULL, NULL, NULL, NULL, NULL, NULL, 8, 30),
(166, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 16),
(167, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 17),
(168, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 18),
(169, NULL, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, 8, 11),
(170, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 12),
(171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 13),
(172, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 14),
(173, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 15),
(174, 'Vi', 'default', '111', NULL, NULL, NULL, NULL, NULL, NULL, 9, 9),
(175, 'Vi', 'default', '111', NULL, NULL, NULL, NULL, NULL, NULL, 9, 10),
(176, NULL, NULL, 'A10', NULL, NULL, NULL, NULL, NULL, NULL, 9, 1),
(177, 'Vi', 'default', 'A10', NULL, NULL, NULL, NULL, NULL, NULL, 9, 2),
(178, NULL, NULL, 'abc', NULL, NULL, NULL, NULL, NULL, NULL, 9, 3),
(179, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 9, 4),
(180, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 5),
(181, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 6),
(182, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 7),
(183, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 8),
(184, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 9, 26),
(185, NULL, NULL, '111', NULL, NULL, NULL, NULL, NULL, NULL, 9, 27),
(186, NULL, NULL, 'https://vn.vn', NULL, NULL, NULL, NULL, NULL, NULL, 9, 28),
(187, 'Vi', 'default', '1', NULL, NULL, NULL, NULL, NULL, NULL, 9, 29),
(188, NULL, NULL, 'https://vn.vn', NULL, NULL, NULL, NULL, NULL, NULL, 9, 30),
(189, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 16),
(190, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 17),
(191, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 18),
(192, NULL, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, 9, 11),
(193, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 12),
(194, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 13),
(195, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 14),
(196, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 15),
(197, 'Vi', 'default', 'qqq', NULL, NULL, NULL, NULL, NULL, NULL, 10, 9),
(198, 'Vi', 'default', 'qqq', NULL, NULL, NULL, NULL, NULL, NULL, 10, 10),
(199, NULL, NULL, 'A13', NULL, NULL, NULL, NULL, NULL, NULL, 10, 1),
(200, 'Vi', 'default', 'A13', NULL, NULL, NULL, NULL, NULL, NULL, 10, 2),
(201, NULL, NULL, 'vvv', NULL, NULL, NULL, NULL, NULL, NULL, 10, 3),
(202, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 10, 4),
(203, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 5),
(204, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 6),
(205, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 7),
(206, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 8),
(207, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 10, 26),
(208, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 27),
(209, NULL, NULL, 'https://vn.vn', NULL, NULL, NULL, NULL, NULL, NULL, 10, 28),
(210, 'Vi', 'default', '11', NULL, NULL, NULL, NULL, NULL, NULL, 10, 29),
(211, NULL, NULL, 'https://vn.vn', NULL, NULL, NULL, NULL, NULL, NULL, 10, 30),
(212, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 16),
(213, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 17),
(214, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 18),
(215, NULL, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, 10, 11),
(216, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 13),
(217, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 14),
(218, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 15),
(219, 'Vi', 'default', '1', NULL, NULL, NULL, NULL, NULL, NULL, 11, 9),
(220, 'Vi', 'default', '1', NULL, NULL, NULL, NULL, NULL, NULL, 11, 10),
(221, NULL, NULL, 'A11', NULL, NULL, NULL, NULL, NULL, NULL, 11, 1),
(222, 'Vi', 'default', 'A1', NULL, NULL, NULL, NULL, NULL, NULL, 11, 2),
(223, NULL, NULL, 'a1', NULL, NULL, NULL, NULL, NULL, NULL, 11, 3),
(224, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 11, 4),
(225, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 5),
(226, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 6),
(227, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 7),
(228, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 8),
(229, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 26),
(230, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 27),
(231, NULL, NULL, 'https://111.vn', NULL, NULL, NULL, NULL, NULL, NULL, 11, 28),
(232, 'Vi', 'default', 'A11', NULL, NULL, NULL, NULL, NULL, NULL, 11, 29),
(233, NULL, NULL, 'https://111.vn', NULL, NULL, NULL, NULL, NULL, NULL, 11, 30),
(234, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 16),
(235, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 17),
(236, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 18),
(237, NULL, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, 11, 11),
(238, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 12),
(239, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 13),
(240, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 14),
(241, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 15),
(242, 'Vi', 'default', '1', NULL, NULL, NULL, NULL, NULL, NULL, 12, 9),
(243, 'Vi', 'default', '1', NULL, NULL, NULL, NULL, NULL, NULL, 12, 10),
(244, NULL, NULL, 'A12', NULL, NULL, NULL, NULL, NULL, NULL, 12, 1),
(245, 'Vi', 'default', 'A12', NULL, NULL, NULL, NULL, NULL, NULL, 12, 2),
(246, NULL, NULL, 'a12', NULL, NULL, NULL, NULL, NULL, NULL, 12, 3),
(247, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 12, 4),
(248, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 5),
(249, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 6),
(250, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 7),
(251, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 8),
(252, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 12, 26),
(253, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 12, 27),
(254, NULL, NULL, 'https://111.vn', NULL, NULL, NULL, NULL, NULL, NULL, 12, 28),
(255, 'Vi', 'default', 'A111', NULL, NULL, NULL, NULL, NULL, NULL, 12, 29),
(256, NULL, NULL, 'https://111.vn', NULL, NULL, NULL, NULL, NULL, NULL, 12, 30),
(257, 'Vi', 'default', 'tết tây', NULL, NULL, NULL, NULL, NULL, NULL, 12, 16),
(258, 'Vi', 'default', 'tết tây 2024', NULL, NULL, NULL, NULL, NULL, NULL, 12, 17),
(259, 'Vi', 'default', 'tết tây 202444', NULL, NULL, NULL, NULL, NULL, NULL, 12, 18),
(260, NULL, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, 12, 11),
(261, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 12),
(262, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 13),
(263, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 14),
(264, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 15),
(265, 'Vi', 'default', '1', NULL, NULL, NULL, NULL, NULL, NULL, 13, 9),
(266, 'Vi', 'default', '1', NULL, NULL, NULL, NULL, NULL, NULL, 13, 10),
(267, NULL, NULL, 'A07', NULL, NULL, NULL, NULL, NULL, NULL, 13, 1),
(268, 'Vi', 'default', 'A07', NULL, NULL, NULL, NULL, NULL, NULL, 13, 2),
(269, NULL, NULL, 'a07', NULL, NULL, NULL, NULL, NULL, NULL, 13, 3),
(270, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 13, 4),
(271, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 5),
(272, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 6),
(273, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 7),
(274, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 8),
(275, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 13, 26),
(276, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 27),
(277, NULL, NULL, 'https://111.vn', NULL, NULL, NULL, NULL, NULL, NULL, 13, 28),
(278, 'Vi', 'default', 'A07', NULL, NULL, NULL, NULL, NULL, NULL, 13, 29),
(279, NULL, NULL, 'https://111.vn', NULL, NULL, NULL, NULL, NULL, NULL, 13, 30),
(280, 'Vi', 'default', 'tết 2024', NULL, NULL, NULL, NULL, NULL, NULL, 13, 16),
(281, 'Vi', 'default', 'nghỉ tết', NULL, NULL, NULL, NULL, NULL, NULL, 13, 17),
(282, 'Vi', 'default', 'nghỉ tết 2024', NULL, NULL, NULL, NULL, NULL, NULL, 13, 18),
(283, NULL, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, 13, 11),
(284, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 12),
(285, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 13),
(286, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 14),
(287, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 15),
(288, 'Vi', 'default', '0', NULL, NULL, NULL, NULL, NULL, NULL, 14, 9),
(289, 'Vi', 'default', '0', NULL, NULL, NULL, NULL, NULL, NULL, 14, 10),
(290, NULL, NULL, '2023000001', NULL, NULL, NULL, NULL, NULL, NULL, 14, 1),
(291, 'Vi', 'default', 'A05', NULL, NULL, NULL, NULL, NULL, NULL, 14, 2),
(292, NULL, NULL, 'a05', NULL, NULL, NULL, NULL, NULL, NULL, 14, 3),
(293, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 14, 4),
(294, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 5),
(295, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 6),
(296, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 7),
(297, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 8),
(298, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 14, 26),
(299, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 14, 27),
(300, NULL, NULL, 'https://111.vn', NULL, NULL, NULL, NULL, NULL, NULL, 14, 28),
(301, 'Vi', 'default', 'jpg, AI, png', NULL, NULL, NULL, NULL, NULL, NULL, 14, 29),
(302, NULL, NULL, 'https://111.vn', NULL, NULL, NULL, NULL, NULL, NULL, 14, 30),
(303, 'Vi', 'default', 'noel', NULL, NULL, NULL, NULL, NULL, NULL, 14, 16),
(304, 'Vi', 'default', 'giáng sinh', NULL, NULL, NULL, NULL, NULL, NULL, 14, 17),
(305, 'Vi', 'default', 'giáng sinh 2024', NULL, NULL, NULL, NULL, NULL, NULL, 14, 18),
(306, NULL, NULL, NULL, NULL, NULL, 5.0000, NULL, NULL, NULL, 14, 11),
(307, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 13),
(308, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 14),
(309, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14, 15),
(310, 'Vi', 'default', 'https://hienpro.vn', NULL, NULL, NULL, NULL, NULL, NULL, 15, 9),
(311, 'Vi', 'default', 'https://hienpro.vn', NULL, NULL, NULL, NULL, NULL, NULL, 15, 10),
(312, NULL, NULL, 'H0000001', NULL, NULL, NULL, NULL, NULL, NULL, 15, 1),
(313, 'Vi', 'default', 'H0000001', NULL, NULL, NULL, NULL, NULL, NULL, 15, 2),
(314, NULL, NULL, 'h0000001', NULL, NULL, NULL, NULL, NULL, NULL, 15, 3),
(315, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 15, 4),
(316, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 5),
(317, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 6),
(318, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 7),
(319, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 8),
(320, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 15, 26),
(321, NULL, NULL, '10000', NULL, NULL, NULL, NULL, NULL, NULL, 15, 27),
(322, NULL, NULL, 'https://hienpro.vn', NULL, NULL, NULL, NULL, NULL, NULL, 15, 28),
(323, 'Vi', 'default', 'H0000001', NULL, NULL, NULL, NULL, NULL, NULL, 15, 29),
(324, NULL, NULL, 'https://hienpro.vn', NULL, NULL, NULL, NULL, NULL, NULL, 15, 30),
(325, 'Vi', 'default', 'Thái Hiển', NULL, NULL, NULL, NULL, NULL, NULL, 15, 16),
(326, 'Vi', 'default', 'Thái Hiển', NULL, NULL, NULL, NULL, NULL, NULL, 15, 17),
(327, 'Vi', 'default', 'Thái Hiển', NULL, NULL, NULL, NULL, NULL, NULL, 15, 18),
(328, NULL, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, 15, 11),
(329, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 12),
(330, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 13),
(331, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 14),
(332, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 15),
(333, 'Vi', 'default', 'H0000001', NULL, NULL, NULL, NULL, NULL, NULL, 16, 9),
(334, 'Vi', 'default', 'H0000001', NULL, NULL, NULL, NULL, NULL, NULL, 16, 10),
(335, NULL, NULL, 'H0000002', NULL, NULL, NULL, NULL, NULL, NULL, 16, 1),
(336, 'Vi', 'default', 'H0000002', NULL, NULL, NULL, NULL, NULL, NULL, 16, 2),
(337, NULL, NULL, 'h0000002', NULL, NULL, NULL, NULL, NULL, NULL, 16, 3),
(338, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 16, 4),
(339, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 5),
(340, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 6),
(341, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 7),
(342, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 8),
(343, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 16, 26),
(344, NULL, NULL, '1000', NULL, NULL, NULL, NULL, NULL, NULL, 16, 27),
(345, NULL, NULL, 'https://hienpro.vn', NULL, NULL, NULL, NULL, NULL, NULL, 16, 28),
(346, 'Vi', 'default', 'H0000002', NULL, NULL, NULL, NULL, NULL, NULL, 16, 29),
(347, NULL, NULL, 'https://hienpro.vn', NULL, NULL, NULL, NULL, NULL, NULL, 16, 30),
(348, 'Vi', 'default', 'H0000001', NULL, NULL, NULL, NULL, NULL, NULL, 16, 16),
(349, 'Vi', 'default', 'H0000001', NULL, NULL, NULL, NULL, NULL, NULL, 16, 17),
(350, 'Vi', 'default', 'H0000001', NULL, NULL, NULL, NULL, NULL, NULL, 16, 18),
(351, NULL, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, 16, 11),
(352, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 12),
(353, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 13),
(354, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 14),
(355, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 15),
(356, 'Vi', 'default', 'https://hienpro.vn', NULL, NULL, NULL, NULL, NULL, NULL, 17, 9),
(357, 'Vi', 'default', 'https://hienpro.vn', NULL, NULL, NULL, NULL, NULL, NULL, 17, 10),
(358, NULL, NULL, 'H0000003', NULL, NULL, NULL, NULL, NULL, NULL, 17, 1),
(359, 'Vi', 'default', 'H0000003', NULL, NULL, NULL, NULL, NULL, NULL, 17, 2),
(360, NULL, NULL, 'h0000003', NULL, NULL, NULL, NULL, NULL, NULL, 17, 3),
(361, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 17, 4),
(362, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 5),
(363, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 6),
(364, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 7),
(365, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 8),
(366, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 17, 26),
(367, NULL, NULL, '10001', NULL, NULL, NULL, NULL, NULL, NULL, 17, 27),
(368, NULL, NULL, 'https://hienpro.vn', NULL, NULL, NULL, NULL, NULL, NULL, 17, 28),
(369, 'Vi', 'default', 'H3', NULL, NULL, NULL, NULL, NULL, NULL, 17, 29),
(370, NULL, NULL, 'https://hienpro.vn', NULL, NULL, NULL, NULL, NULL, NULL, 17, 30),
(371, 'Vi', 'default', 'H3', NULL, NULL, NULL, NULL, NULL, NULL, 17, 16),
(372, 'Vi', 'default', 'h3', NULL, NULL, NULL, NULL, NULL, NULL, 17, 17),
(373, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 18),
(374, NULL, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, 17, 11),
(375, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 12),
(376, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 13),
(377, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 14),
(378, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 15),
(379, 'Vi', 'default', 'h4', NULL, NULL, NULL, NULL, NULL, NULL, 18, 9),
(380, 'Vi', 'default', '4h', NULL, NULL, NULL, NULL, NULL, NULL, 18, 10),
(381, NULL, NULL, 'H0000004', NULL, NULL, NULL, NULL, NULL, NULL, 18, 1),
(382, 'Vi', 'default', 'H0000004', NULL, NULL, NULL, NULL, NULL, NULL, 18, 2),
(383, NULL, NULL, 'h0000004', NULL, NULL, NULL, NULL, NULL, NULL, 18, 3),
(384, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 18, 4),
(385, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 5),
(386, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 6),
(387, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 7),
(388, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 8),
(389, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 18, 26),
(390, NULL, NULL, '111333', NULL, NULL, NULL, NULL, NULL, NULL, 18, 27),
(391, NULL, NULL, 'https://hienpro.vn', NULL, NULL, NULL, NULL, NULL, NULL, 18, 28),
(392, 'Vi', 'default', 'H4', NULL, NULL, NULL, NULL, NULL, NULL, 18, 29),
(393, NULL, NULL, 'https://hienpro.vn', NULL, NULL, NULL, NULL, NULL, NULL, 18, 30),
(394, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 16),
(395, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 17),
(396, 'Vi', 'default', '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 18),
(397, NULL, NULL, NULL, NULL, NULL, 1.0000, NULL, NULL, NULL, 18, 11),
(398, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 12),
(399, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 13),
(400, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 14),
(401, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 15);

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_options`
--

CREATE TABLE `product_bundle_options` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_option_products`
--

CREATE TABLE `product_bundle_option_products` (
  `id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `product_bundle_option_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_option_translations`
--

CREATE TABLE `product_bundle_option_translations` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_bundle_option_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
(7, 8),
(7, 9),
(8, 8),
(8, 15),
(8, 20),
(8, 28),
(8, 21),
(8, 22),
(8, 10),
(8, 26),
(8, 11),
(8, 24),
(8, 12),
(8, 13),
(7, 14),
(7, 20),
(7, 28),
(7, 21),
(7, 22),
(7, 10),
(7, 26),
(7, 11),
(7, 24),
(7, 12),
(7, 13),
(9, 8),
(9, 14),
(9, 15),
(9, 9),
(9, 20),
(9, 28),
(9, 21),
(9, 22),
(9, 10),
(9, 26),
(9, 11),
(9, 24),
(9, 12),
(9, 17),
(10, 1),
(10, 8),
(10, 15),
(10, 9),
(10, 28),
(10, 21),
(10, 22),
(10, 10),
(10, 26),
(10, 11),
(10, 24),
(10, 12),
(10, 17),
(11, 8),
(11, 14),
(11, 20),
(11, 28),
(11, 21),
(11, 22),
(11, 10),
(11, 26),
(11, 24),
(11, 12),
(11, 13),
(12, 8),
(12, 20),
(12, 28),
(12, 21),
(12, 23),
(12, 10),
(12, 27),
(12, 25),
(12, 12),
(12, 18),
(13, 8),
(13, 16),
(13, 20),
(13, 30),
(13, 21),
(13, 22),
(13, 10),
(13, 26),
(13, 27),
(13, 11),
(13, 25),
(13, 12),
(13, 19),
(14, 1),
(14, 8),
(14, 15),
(14, 9),
(14, 20),
(14, 28),
(14, 30),
(14, 21),
(14, 23),
(14, 10),
(14, 26),
(14, 11),
(14, 24),
(14, 12),
(14, 13),
(14, 19),
(15, 8),
(15, 14),
(15, 28),
(15, 30),
(15, 22),
(15, 10),
(15, 26),
(15, 24),
(15, 13),
(18, 22),
(18, 23),
(18, 26),
(18, 27),
(18, 11),
(18, 12),
(18, 18);

-- --------------------------------------------------------

--
-- Table structure for table `product_cross_sells`
--

CREATE TABLE `product_cross_sells` (
  `parent_id` int UNSIGNED NOT NULL,
  `child_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_cross_sells`
--

INSERT INTO `product_cross_sells` (`parent_id`, `child_id`) VALUES
(15, 14);

-- --------------------------------------------------------

--
-- Table structure for table `product_customer_group_prices`
--

CREATE TABLE `product_customer_group_prices` (
  `id` bigint UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `value_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_links`
--

CREATE TABLE `product_downloadable_links` (
  `id` int UNSIGNED NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int NOT NULL DEFAULT '0',
  `sort_order` int DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_downloadable_links`
--

INSERT INTO `product_downloadable_links` (`id`, `url`, `file`, `file_name`, `type`, `price`, `sample_url`, `sample_file`, `sample_file_name`, `sample_type`, `downloads`, `sort_order`, `product_id`, `created_at`, `updated_at`) VALUES
(5, 'https://web', NULL, NULL, 'url', 0.0000, NULL, 'product_downloadable_links/7/O6dHdvQrHYnz8ad01v5v86gQaPgLcTDwf5x9qgxe.bin', 'armchair-019.fbx', 'file', 1111, 0, 7, '2023-10-25 02:49:52', '2023-10-25 02:51:05'),
(7, NULL, 'product_downloadable_links/8/oUl0pwrcISWOh6z2Hyj7xa22vrPMxlprXTackZNT.zip', '11.zip', 'file', 0.0000, NULL, 'product_downloadable_links/8/Cw6kZQF76afHXV7ax0Z6z7E0h7tSir5nVWJ25Zty.zip', '11.zip', 'file', 1000, 1, 8, '2023-10-28 05:10:59', '2023-10-28 05:11:35'),
(8, NULL, 'product_downloadable_links/9/vI44ot4JGMoFmHTkh81t6SFe1uC5WmcmFJR9z8gV.jpg', 'z4547566020991_cff40690b3244f0600bdab530ae51afd.jpg', 'file', 0.0000, NULL, 'product_downloadable_links/9/VsxCfC947fvz0KAA2rlIuw71OReo4IjX8wp3tb3B.jpg', '11.jpg', 'file', 111, 0, 9, '2023-10-31 10:02:03', '2023-10-31 10:02:03'),
(9, NULL, 'product_downloadable_links/11/ByrSsweNwclycphAlynqXjIiufJuzrcBrQXA2Ia9.png', '11.11_500.png', 'file', 1.0000, NULL, '', '', 'file', 0, 0, 11, '2023-11-11 13:30:00', '2023-11-11 13:30:00'),
(11, 'https://111.vn', 'product_downloadable_links/12/YqmFDNeyUq0hEpsHr2B5mRhFVArfR0rvfCyn9Sb9.zip', 'women-s-fashion-template-design.zip', 'url', 1.0000, NULL, 'product_downloadable_links/12/lQOHLTjA6ho3aYXwwuoZmSeOHv14PgwnjQsIBzDn.zip', 'women-s-fashion-template-design.zip', 'file', 1000, 0, 12, '2023-11-20 13:30:14', '2023-11-20 13:31:48'),
(12, 'http://hienpro.vn', NULL, NULL, 'url', 0.0000, NULL, 'product_downloadable_links/15/M3GggsG0zCkGxu71hKuKDaILE9bqoDKthpK6wfq5.jpg', 'Hienpro.jpg', 'file', 10000, 0, 15, '2023-12-03 06:58:27', '2023-12-03 06:58:27'),
(13, 'https://hienpro.vn', NULL, NULL, 'url', 0.0000, NULL, 'product_downloadable_links/16/U2vcICvjNxCSYfpwbfy34R8VMgJqruTKdTKsQMvV.jpg', 'Hienpro1.jpg', 'file', 10000, 0, 16, '2023-12-03 07:14:54', '2023-12-03 07:14:54'),
(14, NULL, 'product_downloadable_links/18/jWSoZDAGnUs6v4vnWe2KikHjPGDLRhgll2inVfAP.jpg', 'Leonardo_Diffusion_XL_I_want_to_draw_a_21yearold_Vietnamese_wo_1.jpg', 'file', 1.0000, 'https://hienpro.vn', NULL, NULL, 'url', 1000, 0, 18, '2023-12-03 08:27:05', '2023-12-03 08:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_link_translations`
--

CREATE TABLE `product_downloadable_link_translations` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_downloadable_link_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_downloadable_link_translations`
--

INSERT INTO `product_downloadable_link_translations` (`id`, `locale`, `title`, `product_downloadable_link_id`) VALUES
(5, 'Vi', 'A08', 5),
(7, 'Vi', 'A09', 7),
(8, 'Vi', 'A10', 8),
(9, 'Vi', 'A11', 9),
(11, 'Vi', 'a12', 11),
(12, 'Vi', 'hienpro', 12),
(13, 'Vi', 'H0000002', 13),
(14, 'Vi', 'h4', 14);

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_samples`
--

CREATE TABLE `product_downloadable_samples` (
  `id` int UNSIGNED NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_downloadable_samples`
--

INSERT INTO `product_downloadable_samples` (`id`, `url`, `file`, `file_name`, `type`, `sort_order`, `product_id`, `created_at`, `updated_at`) VALUES
(3, NULL, 'product_downloadable_links/17/v2MQYsCJCZ6ubxUxbeZQYJmEK2kkeAScID1eAUIH.jpg', 'Hienpro3.jpg', 'file', 122, 17, '2023-12-03 08:20:35', '2023-12-03 08:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_sample_translations`
--

CREATE TABLE `product_downloadable_sample_translations` (
  `id` int UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `product_downloadable_sample_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_downloadable_sample_translations`
--

INSERT INTO `product_downloadable_sample_translations` (`id`, `locale`, `title`, `product_downloadable_sample_id`) VALUES
(3, 'Vi', 'h3', 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_flat`
--

CREATE TABLE `product_flat` (
  `id` int UNSIGNED NOT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  `short_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attribute_family_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_flat`
--

INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `description`, `url_key`, `new`, `featured`, `status`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `product_id`, `updated_at`, `parent_id`, `visible_individually`, `short_description`, `meta_title`, `meta_keywords`, `meta_description`, `attribute_family_id`) VALUES
(9, 'A08', 'downloadable', '', 'A08', 'Ghế Đẹp', 'ghe', 1, 1, 1, 1.0000, NULL, NULL, NULL, NULL, '2023-10-25 09:44:00', 'Vi', 'default', 7, '2023-11-11 20:34:20', NULL, 1, 'Ghế', '', '', '', 1),
(10, 'A09', 'downloadable', '', 'A09', '22238', 'a09', 1, 1, 1, 1.0000, NULL, NULL, NULL, NULL, '2023-10-27 20:58:36', 'Vi', 'default', 8, '2023-11-11 20:33:52', NULL, 1, '22238', '', '', '', 1),
(11, 'A10', 'downloadable', '111', 'A10', '111', 'abc', 1, 1, 1, 1.0000, NULL, NULL, NULL, NULL, '2023-10-31 16:59:51', 'Vi', 'default', 9, '2023-11-11 20:32:25', NULL, 1, '111', '', '', '', 1),
(12, 'A13', 'downloadable', '', 'A13', 'qqq', 'vvv', 1, 1, 1, 1.0000, NULL, NULL, NULL, NULL, '2023-10-31 17:02:24', 'Vi', 'default', 10, '2023-11-11 20:31:56', NULL, 1, 'qqq', '', '', '', 3),
(13, 'A11', 'downloadable', '', 'A1', '1', 'a1', 1, 1, 1, 1.0000, NULL, NULL, NULL, NULL, '2023-11-11 20:28:14', 'Vi', 'default', 11, '2023-11-11 20:30:00', NULL, 1, '1', '', '', '', 1),
(14, 'A12', 'downloadable', '', 'A12', '1', 'a12', 1, 1, 1, 1.0000, NULL, NULL, NULL, NULL, '2023-11-11 20:30:27', 'Vi', 'default', 12, '2023-11-18 13:16:40', NULL, 1, '1', 'tết tây', 'tết tây 2024', 'tết tây 202444', 1),
(15, 'A07', 'downloadable', '', 'A07', '1', 'a07', 1, 1, 1, 1.0000, NULL, NULL, NULL, NULL, '2023-11-11 20:34:56', 'Vi', 'default', 13, '2023-11-18 13:15:58', NULL, 1, '1', 'tết 2024', 'nghỉ tết', 'nghỉ tết 2024', 1),
(16, '2023000001', 'downloadable', '', 'A05', '0', 'a05', 1, 1, 1, 5.0000, NULL, NULL, NULL, NULL, '2023-11-11 20:37:48', 'Vi', 'default', 14, '2023-11-18 13:15:24', NULL, 1, '0', 'noel', 'giáng sinh', 'giáng sinh 2024', 3),
(17, 'H0000001', 'downloadable', '10000', 'H0000001', 'https://hienpro.vn', 'h0000001', 1, 1, 1, 1.0000, NULL, NULL, NULL, NULL, '2023-12-03 13:52:24', 'Vi', 'default', 15, '2023-12-03 13:58:27', NULL, 1, 'https://hienpro.vn', 'Thái Hiển', 'Thái Hiển', 'Thái Hiển', 1),
(18, 'H0000002', 'downloadable', '1000', 'H0000002', 'H0000001', 'h0000002', 1, 1, 1, 1.0000, NULL, NULL, NULL, NULL, '2023-12-03 14:10:02', 'Vi', 'default', 16, '2023-12-03 14:14:55', NULL, 1, 'H0000001', 'H0000001', 'H0000001', 'H0000001', 1),
(19, 'H0000003', 'downloadable', '10001', 'H0000003', 'https://hienpro.vn', 'h0000003', 1, 1, 1, 1.0000, NULL, NULL, NULL, NULL, '2023-12-03 15:17:58', 'Vi', 'default', 17, '2023-12-03 15:20:35', NULL, 1, 'https://hienpro.vn', 'H3', 'h3', '', 1),
(20, 'H0000004', 'downloadable', '111333', 'H0000004', '4h', 'h0000004', 1, 1, 1, 1.0000, NULL, NULL, NULL, NULL, '2023-12-03 15:25:10', 'Vi', 'default', 18, '2023-12-03 15:27:06', NULL, 1, 'h4', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_grouped_products`
--

CREATE TABLE `product_grouped_products` (
  `id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `sort_order` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `associated_product_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `position` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES
(10, 'images', 'product/8/oQghI1oJ7OH1jo17FOa5tpst0SMLR1ySpyTvgf1O.jpg', 8, 0),
(13, 'images', 'product/9/ghCuW9Djz9N7iEkM5RbPLQlipLCo3OHSXMcmdYp0.png', 9, 0),
(14, 'images', 'product/10/WE2iCMtZmfT2bIPmYP4VZvjIF1bt8H8VhrjFJGHJ.jpg', 10, 0),
(15, 'images', 'product/7/mAIYwAu5tspz6pOv78K5ltQjvB5xx1Yuo0WNsZ42.jpg', 7, 0),
(16, 'images', 'product/11/GlMJUf4UOJHIKUFEB0KK5nTeq8bEBtkOIDZutpZu.png', 11, 0),
(18, 'images', 'product/13/ZHW5NtZrGzdbRgSpdwtTV1ONmmlMt7DgxOilxKrO.jpg', 13, 0),
(19, 'images', 'product/14/Q2KvHANefgRVRxw0MAYfl9nYriraXX2HZsZ3HXxZ.jpg', 14, 0),
(20, 'images', 'product/12/lnSfGrEXbl5JuVaHZBRs8vq3WF7x0n0fAaoFPxVP.jpg', 12, 0),
(21, 'images', 'product/15/nndhjDjmcFiPB4mAR7YNVeaVe4bC0QRERxZXRqCq.jpg', 15, 0),
(22, 'images', 'product/17/9lnyn7biglwYd6a3ZJcIW5Y2A7PX6ijS7qj46sW1.jpg', 17, 0),
(23, 'images', 'product/18/FyOGJ37YRiJPdeOKC0pEjqu3BlYQxcfUyv9fHJ95.jpg', 18, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_inventories`
--

CREATE TABLE `product_inventories` (
  `id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `inventory_source_id` int UNSIGNED NOT NULL,
  `vendor_id` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_inventory_indices`
--

CREATE TABLE `product_inventory_indices` (
  `id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_inventory_indices`
--

INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(7, 0, 7, 1, NULL, NULL),
(8, 0, 8, 1, NULL, NULL),
(9, 0, 9, 1, NULL, NULL),
(10, 0, 10, 1, NULL, NULL),
(11, 0, 11, 1, NULL, NULL),
(12, 0, 12, 1, NULL, NULL),
(13, 0, 13, 1, NULL, NULL),
(14, 0, 14, 1, NULL, NULL),
(15, 0, 15, 1, NULL, NULL),
(16, 0, 16, 1, NULL, NULL),
(17, 0, 17, 1, NULL, NULL),
(18, 0, 18, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_ordered_inventories`
--

CREATE TABLE `product_ordered_inventories` (
  `id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL DEFAULT '0',
  `product_id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_price_indices`
--

CREATE TABLE `product_price_indices` (
  `id` int UNSIGNED NOT NULL,
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int UNSIGNED NOT NULL,
  `customer_group_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_price_indices`
--

INSERT INTO `product_price_indices` (`id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `product_id`, `customer_group_id`, `created_at`, `updated_at`) VALUES
(25, 1.0000, 1.0000, 1.0000, 1.0000, 7, 1, NULL, NULL),
(26, 1.0000, 1.0000, 1.0000, 1.0000, 7, 2, NULL, NULL),
(27, 1.0000, 1.0000, 1.0000, 1.0000, 7, 3, NULL, NULL),
(28, 1.0000, 1.0000, 1.0000, 1.0000, 7, 4, NULL, NULL),
(29, 1.0000, 1.0000, 1.0000, 1.0000, 7, 5, NULL, NULL),
(30, 1.0000, 1.0000, 1.0000, 1.0000, 7, 6, NULL, NULL),
(31, 1.0000, 1.0000, 1.0000, 1.0000, 8, 1, NULL, NULL),
(32, 1.0000, 1.0000, 1.0000, 1.0000, 8, 2, NULL, NULL),
(33, 1.0000, 1.0000, 1.0000, 1.0000, 8, 3, NULL, NULL),
(34, 1.0000, 1.0000, 1.0000, 1.0000, 8, 4, NULL, NULL),
(35, 1.0000, 1.0000, 1.0000, 1.0000, 8, 5, NULL, NULL),
(36, 1.0000, 1.0000, 1.0000, 1.0000, 8, 6, NULL, NULL),
(37, 1.0000, 1.0000, 1.0000, 1.0000, 9, 1, NULL, NULL),
(38, 1.0000, 1.0000, 1.0000, 1.0000, 9, 2, NULL, NULL),
(39, 1.0000, 1.0000, 1.0000, 1.0000, 9, 3, NULL, NULL),
(40, 1.0000, 1.0000, 1.0000, 1.0000, 9, 4, NULL, NULL),
(41, 1.0000, 1.0000, 1.0000, 1.0000, 9, 5, NULL, NULL),
(42, 1.0000, 1.0000, 1.0000, 1.0000, 9, 6, NULL, NULL),
(43, 1.0000, 1.0000, 1.0000, 1.0000, 10, 1, NULL, NULL),
(44, 1.0000, 1.0000, 1.0000, 1.0000, 10, 2, NULL, NULL),
(45, 1.0000, 1.0000, 1.0000, 1.0000, 10, 3, NULL, NULL),
(46, 1.0000, 1.0000, 1.0000, 1.0000, 10, 4, NULL, NULL),
(47, 1.0000, 1.0000, 1.0000, 1.0000, 10, 5, NULL, NULL),
(48, 1.0000, 1.0000, 1.0000, 1.0000, 10, 6, NULL, NULL),
(49, 1.0000, 1.0000, 1.0000, 1.0000, 11, 1, NULL, NULL),
(50, 1.0000, 1.0000, 1.0000, 1.0000, 11, 2, NULL, NULL),
(51, 1.0000, 1.0000, 1.0000, 1.0000, 11, 3, NULL, NULL),
(52, 1.0000, 1.0000, 1.0000, 1.0000, 11, 4, NULL, NULL),
(53, 1.0000, 1.0000, 1.0000, 1.0000, 11, 5, NULL, NULL),
(54, 1.0000, 1.0000, 1.0000, 1.0000, 11, 6, NULL, NULL),
(55, 1.0000, 1.0000, 1.0000, 1.0000, 12, 1, NULL, NULL),
(56, 1.0000, 1.0000, 1.0000, 1.0000, 12, 2, NULL, NULL),
(57, 1.0000, 1.0000, 1.0000, 1.0000, 12, 3, NULL, NULL),
(58, 1.0000, 1.0000, 1.0000, 1.0000, 12, 4, NULL, NULL),
(59, 1.0000, 1.0000, 1.0000, 1.0000, 12, 5, NULL, NULL),
(60, 1.0000, 1.0000, 1.0000, 1.0000, 12, 6, NULL, NULL),
(61, 1.0000, 1.0000, 1.0000, 1.0000, 13, 1, NULL, NULL),
(62, 1.0000, 1.0000, 1.0000, 1.0000, 13, 2, NULL, NULL),
(63, 1.0000, 1.0000, 1.0000, 1.0000, 13, 3, NULL, NULL),
(64, 1.0000, 1.0000, 1.0000, 1.0000, 13, 4, NULL, NULL),
(65, 1.0000, 1.0000, 1.0000, 1.0000, 13, 5, NULL, NULL),
(66, 1.0000, 1.0000, 1.0000, 1.0000, 13, 6, NULL, NULL),
(67, 5.0000, 5.0000, 5.0000, 5.0000, 14, 1, NULL, NULL),
(68, 5.0000, 5.0000, 5.0000, 5.0000, 14, 2, NULL, NULL),
(69, 5.0000, 5.0000, 5.0000, 5.0000, 14, 3, NULL, NULL),
(70, 5.0000, 5.0000, 5.0000, 5.0000, 14, 4, NULL, NULL),
(71, 5.0000, 5.0000, 5.0000, 5.0000, 14, 5, NULL, NULL),
(72, 5.0000, 5.0000, 5.0000, 5.0000, 14, 6, NULL, NULL),
(73, 1.0000, 1.0000, 1.0000, 1.0000, 15, 1, NULL, NULL),
(74, 1.0000, 1.0000, 1.0000, 1.0000, 15, 2, NULL, NULL),
(75, 1.0000, 1.0000, 1.0000, 1.0000, 15, 3, NULL, NULL),
(76, 1.0000, 1.0000, 1.0000, 1.0000, 15, 4, NULL, NULL),
(77, 1.0000, 1.0000, 1.0000, 1.0000, 15, 5, NULL, NULL),
(78, 1.0000, 1.0000, 1.0000, 1.0000, 15, 6, NULL, NULL),
(79, 1.0000, 1.0000, 1.0000, 1.0000, 16, 1, NULL, NULL),
(80, 1.0000, 1.0000, 1.0000, 1.0000, 16, 2, NULL, NULL),
(81, 1.0000, 1.0000, 1.0000, 1.0000, 16, 3, NULL, NULL),
(82, 1.0000, 1.0000, 1.0000, 1.0000, 16, 4, NULL, NULL),
(83, 1.0000, 1.0000, 1.0000, 1.0000, 16, 5, NULL, NULL),
(84, 1.0000, 1.0000, 1.0000, 1.0000, 16, 6, NULL, NULL),
(85, 1.0000, 1.0000, 1.0000, 1.0000, 17, 1, NULL, NULL),
(86, 1.0000, 1.0000, 1.0000, 1.0000, 17, 2, NULL, NULL),
(87, 1.0000, 1.0000, 1.0000, 1.0000, 17, 3, NULL, NULL),
(88, 1.0000, 1.0000, 1.0000, 1.0000, 17, 4, NULL, NULL),
(89, 1.0000, 1.0000, 1.0000, 1.0000, 17, 5, NULL, NULL),
(90, 1.0000, 1.0000, 1.0000, 1.0000, 17, 6, NULL, NULL),
(91, 1.0000, 1.0000, 1.0000, 1.0000, 18, 1, NULL, NULL),
(92, 1.0000, 1.0000, 1.0000, 1.0000, 18, 2, NULL, NULL),
(93, 1.0000, 1.0000, 1.0000, 1.0000, 18, 3, NULL, NULL),
(94, 1.0000, 1.0000, 1.0000, 1.0000, 18, 4, NULL, NULL),
(95, 1.0000, 1.0000, 1.0000, 1.0000, 18, 5, NULL, NULL),
(96, 1.0000, 1.0000, 1.0000, 1.0000, 18, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_relations`
--

CREATE TABLE `product_relations` (
  `parent_id` int UNSIGNED NOT NULL,
  `child_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_relations`
--

INSERT INTO `product_relations` (`parent_id`, `child_id`) VALUES
(15, 12),
(18, 12);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_review_images`
--

CREATE TABLE `product_review_images` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `review_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_super_attributes`
--

CREATE TABLE `product_super_attributes` (
  `product_id` int UNSIGNED NOT NULL,
  `attribute_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `product_up_sells`
--

CREATE TABLE `product_up_sells` (
  `parent_id` int UNSIGNED NOT NULL,
  `child_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product_up_sells`
--

INSERT INTO `product_up_sells` (`parent_id`, `child_id`) VALUES
(15, 13);

-- --------------------------------------------------------

--
-- Table structure for table `product_users`
--

CREATE TABLE `product_users` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `admin_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_users`
--

INSERT INTO `product_users` (`id`, `product_id`, `admin_id`) VALUES
(1, 15, 2),
(2, 14, 2),
(3, 8, 2),
(4, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_videos`
--

CREATE TABLE `product_videos` (
  `id` int UNSIGNED NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `position` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` int UNSIGNED NOT NULL,
  `increment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int DEFAULT NULL,
  `base_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `order_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `refund_items`
--

CREATE TABLE `refund_items` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `product_id` int UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int UNSIGNED DEFAULT NULL,
  `refund_id` int UNSIGNED DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Administrator role', 'all', NULL, NULL, NULL),
(2, 'Product Manager', 'Quản lý sản phẩm', 'custom', '[\"dashboard\", \"sales\", \"sales.orders\", \"sales.orders.view\", \"sales.orders.cancel\", \"sales.invoices\", \"sales.invoices.view\", \"sales.invoices.create\", \"sales.shipments\", \"sales.shipments.view\", \"sales.shipments.create\", \"sales.refunds\", \"sales.refunds.view\", \"sales.refunds.create\", \"catalog\", \"catalog.products\", \"catalog.products.create\", \"catalog.products.copy\", \"catalog.products.edit\", \"catalog.products.delete\", \"catalog.products.mass-update\", \"catalog.products.mass-delete\", \"catalog.categories\", \"catalog.categories.create\", \"catalog.categories.edit\", \"catalog.categories.delete\", \"catalog.categories.mass-delete\", \"catalog.categories.mass-update\", \"catalog.attributes\", \"catalog.attributes.create\", \"catalog.attributes.edit\", \"catalog.attributes.delete\", \"catalog.attributes.mass-delete\", \"catalog.families\", \"catalog.families.create\", \"catalog.families.edit\", \"catalog.families.delete\", \"customers\", \"customers.customers\", \"customers.customers.create\", \"customers.customers.edit\", \"customers.customers.delete\", \"customers.customers.mass-update\", \"customers.customers.mass-delete\", \"customers.addresses\", \"customers.addresses.create\", \"customers.addresses.edit\", \"customers.addresses.delete\", \"customers.note\", \"customers.groups\", \"customers.groups.create\", \"customers.groups.edit\", \"customers.groups.delete\", \"customers.reviews\", \"customers.reviews.edit\", \"customers.reviews.delete\", \"customers.reviews.mass-update\", \"customers.reviews.mass-delete\", \"customers.orders\", \"velocity\", \"velocity.meta-data\", \"velocity.meta-data.edit\", \"velocity.header\", \"velocity.header.create\", \"velocity.header.edit\", \"velocity.header.delete\"]', '2023-10-09 16:06:54', '2023-10-09 16:13:40'),
(3, 'Marketing Manager', 'Quản trị Marketing', 'custom', '[\"dashboard\", \"marketing\", \"marketing.promotions\", \"marketing.promotions.cart-rules\", \"marketing.promotions.cart-rules.create\", \"marketing.promotions.cart-rules.copy\", \"marketing.promotions.cart-rules.edit\", \"marketing.promotions.cart-rules.delete\", \"marketing.promotions.catalog-rules\", \"marketing.promotions.catalog-rules.create\", \"marketing.promotions.catalog-rules.edit\", \"marketing.promotions.catalog-rules.delete\", \"marketing.email-marketing\", \"marketing.email-marketing.email-templates\", \"marketing.email-marketing.email-templates.create\", \"marketing.email-marketing.email-templates.edit\", \"marketing.email-marketing.email-templates.delete\", \"marketing.email-marketing.events\", \"marketing.email-marketing.events.create\", \"marketing.email-marketing.events.edit\", \"marketing.email-marketing.events.delete\", \"marketing.email-marketing.campaigns\", \"marketing.email-marketing.campaigns.create\", \"marketing.email-marketing.campaigns.edit\", \"marketing.email-marketing.campaigns.delete\", \"marketing.email-marketing.subscribers\", \"marketing.email-marketing.subscribers.edit\", \"marketing.email-marketing.subscribers.delete\"]', '2023-10-09 16:08:02', '2023-10-09 16:08:02');

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int UNSIGNED NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int DEFAULT NULL,
  `total_weight` int DEFAULT NULL,
  `carrier_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int UNSIGNED DEFAULT NULL,
  `customer_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `order_address_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `inventory_source_id` int UNSIGNED DEFAULT NULL,
  `inventory_source_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `shipment_items`
--

CREATE TABLE `shipment_items` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `weight` int DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `product_id` int UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int UNSIGNED DEFAULT NULL,
  `shipment_id` int UNSIGNED NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `sitemaps`
--

CREATE TABLE `sitemaps` (
  `id` int UNSIGNED NOT NULL,
  `file_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slider_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` date DEFAULT NULL,
  `sort_order` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers_list`
--

CREATE TABLE `subscribers_list` (
  `id` int UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tax_categories`
--

CREATE TABLE `tax_categories` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tax_categories_tax_rates`
--

CREATE TABLE `tax_categories_tax_rates` (
  `id` int UNSIGNED NOT NULL,
  `tax_category_id` int UNSIGNED NOT NULL,
  `tax_rate_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int UNSIGNED NOT NULL,
  `identifier` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `velocity_contents`
--

CREATE TABLE `velocity_contents` (
  `id` int UNSIGNED NOT NULL,
  `content_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `velocity_contents_translations`
--

CREATE TABLE `velocity_contents_translations` (
  `id` int UNSIGNED NOT NULL,
  `content_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_heading` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `page_link` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_target` tinyint(1) NOT NULL DEFAULT '0',
  `catalog_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `velocity_customer_compare_products`
--

CREATE TABLE `velocity_customer_compare_products` (
  `id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `velocity_meta_data`
--

CREATE TABLE `velocity_meta_data` (
  `id` int UNSIGNED NOT NULL,
  `home_page_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_left_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `footer_middle_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slider` tinyint(1) NOT NULL DEFAULT '0',
  `advertisement` json DEFAULT NULL,
  `sidebar_category_count` int NOT NULL DEFAULT '9',
  `featured_product_count` int NOT NULL DEFAULT '10',
  `new_products_count` int NOT NULL DEFAULT '10',
  `subscription_bar_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_view_images` json DEFAULT NULL,
  `product_policy` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `locale` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_content_count` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `velocity_meta_data`
--

INSERT INTO `velocity_meta_data` (`id`, `home_page_content`, `footer_left_content`, `footer_middle_content`, `slider`, `advertisement`, `sidebar_category_count`, `featured_product_count`, `new_products_count`, `subscription_bar_content`, `created_at`, `updated_at`, `product_view_images`, `product_policy`, `locale`, `channel`, `header_content_count`) VALUES
(1, '<p>@include(\'shop::home.advertisements.advertisement-four\', [\'one\'=>\'/page/refund-policy\',\'two\'=>\'/page/privacy-policy\',\'three\'=>\'/page/shipping-policy\',\'four\'=>\'/page/whats-new\'])@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\', [\'one\'=>\'/page/refund-policy\',\'two\'=>\'/page/privacy-policy\',\'three\'=>\'/page/shipping-policy\']) @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\', [\'one\'=>\'/page/refund-policy\',\'two\'=>\'/page/privacy-policy\'])</p>', '<p>We love to craft softwares and solve the real world problems with the binaries. We are highly committed to our goals. We invest our resources to create world class easy to use softwares and applications for the enterprise business with the top notch, on the edge technology expertise.</p>', '<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"{!! url(\'page/about-us\') !!}\">About Us</a></li><li><a href=\"{!! url(\'page/cutomer-service\') !!}\">Customer Service</a></li><li><a href=\"{!! url(\'page/whats-new\') !!}\">What&rsquo;s New</a></li><li><a href=\"{!! url(\'page/contact-us\') !!}\">Contact Us </a></li></ul></div><div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\"><ul type=\"none\"><li><a href=\"{!! url(\'page/return-policy\') !!}\"> Order and Returns </a></li><li><a href=\"{!! url(\'page/payment-policy\') !!}\"> Payment Policy </a></li><li><a href=\"{!! url(\'page/shipping-policy\') !!}\"> Shipping Policy</a></li><li><a href=\"{!! url(\'page/privacy-policy\') !!}\"> Privacy and Cookies Policy </a></li></ul></div>', 1, NULL, 9, 10, 10, '<div class=\"social-icons col-lg-6\"><a href=\"https://facebook.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://twitter.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://linkedin.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://pintrest.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://youtube.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://instagram.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>', NULL, NULL, NULL, '<div class=\"row col-12 remove-padding-margin\"><div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-van-ship fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Free Shipping on Order $20 or More</span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Replace &amp; Return Available </span></div></div></div></div> <div class=\"col-lg-4 col-sm-12 product-policy-wrapper\"><div class=\"card\"><div class=\"policy\"><div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div> <div class=\"right\"><span class=\"font-setting fs20\">Product Exchange and EMI Available </span></div></div></div></div></div>', 'en', 'default', '5'),
(2, '<p>@include(\'shop::home.advertisements.advertisement-four\')@include(\'shop::home.featured-products\') @include(\'shop::home.product-policy\') @include(\'shop::home.advertisements.advertisement-three\') @include(\'shop::home.new-products\') @include(\'shop::home.advertisements.advertisement-two\')</p>', '<p><strong>Getpix</strong>, được th&agrave;nh lập v&agrave;o th&aacute;ng 7 năm 2023, c&oacute; h&agrave;ng triệu h&igrave;nh ảnh v&agrave; c&aacute;c t&agrave;i nguy&ecirc;n đồ họa kh&aacute;c để mọi người tải xuống. Mục ti&ecirc;u của ch&uacute;ng t&ocirc;i l&agrave; x&acirc;y dựng nền tảng h&igrave;nh ảnh phục vụ cho tất cả những người kh&ocirc;ng c&oacute; kỹ năng thiết kế. Gi&uacute;p người d&ugrave;ng tiết kiệm thời gian v&agrave; cải thiện dự &aacute;n của họ một c&aacute;ch hiệu quả l&agrave; nhiệm vụ của ch&uacute;ng t&ocirc;i</p>', '<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\">\r\n<ul type=\"none\">\r\n<li><a href=\"{!! url(\'page/about-us\') !!}\">About Us</a></li>\r\n<li><a href=\"{!! url(\'page/cutomer-service\') !!}\">Customer Service</a></li>\r\n<li><a href=\"{!! url(\'page/whats-new\') !!}\">What&rsquo;s New</a></li>\r\n<li><a href=\"{!! url(\'page/contact-us\') !!}\">Contact Us </a></li>\r\n</ul>\r\n</div>\r\n<div class=\"col-lg-6 col-md-12 col-sm-12 no-padding\">\r\n<ul type=\"none\">\r\n<li><a href=\"{!! url(\'page/return-policy\') !!}\"> Order and Returns </a></li>\r\n<li><a href=\"{!! url(\'page/payment-policy\') !!}\"> Payment Policy </a></li>\r\n<li><a href=\"{!! url(\'page/shipping-policy\') !!}\"> Shipping Policy</a></li>\r\n<li><a href=\"{!! url(\'page/privacy-policy\') !!}\"> Privacy and Cookies Policy </a></li>\r\n</ul>\r\n</div>', 1, '[]', 9, 10, 10, '<div class=\"social-icons col-lg-6\"><a href=\"https://facebook.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-facebook\" title=\"facebook\"></i> </a> <a href=\"https://twitter.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-twitter\" title=\"twitter\"></i> </a> <a href=\"https://linkedin.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-linked-in\" title=\"linkedin\"></i> </a> <a href=\"https://pintrest.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-pintrest\" title=\"Pinterest\"></i> </a> <a href=\"https://youtube.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-youtube\" title=\"Youtube\"></i> </a> <a href=\"https://instagram.com\" target=\"_blank\" class=\"unset\" rel=\"noopener noreferrer\"><i class=\"fs24 within-circle rango-instagram\" title=\"instagram\"></i></a></div>', '2023-11-19 08:24:35', '2023-11-19 08:29:13', NULL, '<div class=\"row col-12 remove-padding-margin\">\r\n<div class=\"col-lg-4 col-sm-12 product-policy-wrapper\">\r\n<div class=\"card\">\r\n<div class=\"policy\">\r\n<div class=\"left\"><i class=\"rango-van-ship fs40\"></i></div>\r\n<div class=\"right\"><span class=\"font-setting fs20\">Free Shipping on Order $20 or More</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-4 col-sm-12 product-policy-wrapper\">\r\n<div class=\"card\">\r\n<div class=\"policy\">\r\n<div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div>\r\n<div class=\"right\"><span class=\"font-setting fs20\">Product Replace &amp; Return Available </span></div>\r\n</div>\r\n</div>\r\n</div>\r\n<div class=\"col-lg-4 col-sm-12 product-policy-wrapper\">\r\n<div class=\"card\">\r\n<div class=\"policy\">\r\n<div class=\"left\"><i class=\"rango-exchnage fs40\"></i></div>\r\n<div class=\"right\"><span class=\"font-setting fs20\">Product Exchange and EMI Available </span></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 'Vi', 'default', '5');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int UNSIGNED NOT NULL,
  `channel_id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `customer_id` int UNSIGNED NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `additional` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_customer_id_foreign` (`customer_id`),
  ADD KEY `addresses_cart_id_foreign` (`cart_id`),
  ADD KEY `addresses_order_id_foreign` (`order_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_api_token_unique` (`api_token`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_code_unique` (`code`);

--
-- Indexes for table `attribute_families`
--
ALTER TABLE `attribute_families`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`);

--
-- Indexes for table `attribute_group_mappings`
--
ALTER TABLE `attribute_group_mappings`
  ADD PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  ADD KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_options_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`);

--
-- Indexes for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_order_id_foreign` (`order_id`),
  ADD KEY `bookings_product_id_foreign` (`product_id`);

--
-- Indexes for table `booking_products`
--
ALTER TABLE `booking_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `booking_product_appointment_slots`
--
ALTER TABLE `booking_product_appointment_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`);

--
-- Indexes for table `booking_product_default_slots`
--
ALTER TABLE `booking_product_default_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`);

--
-- Indexes for table `booking_product_event_tickets`
--
ALTER TABLE `booking_product_event_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`);

--
-- Indexes for table `booking_product_event_ticket_translations`
--
ALTER TABLE `booking_product_event_ticket_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `booking_product_event_ticket_translations_locale_unique` (`booking_product_event_ticket_id`,`locale`);

--
-- Indexes for table `booking_product_rental_slots`
--
ALTER TABLE `booking_product_rental_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`);

--
-- Indexes for table `booking_product_table_slots`
--
ALTER TABLE `booking_product_table_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_customer_id_foreign` (`customer_id`),
  ADD KEY `cart_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  ADD KEY `cart_items_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `cart_item_inventories`
--
ALTER TABLE `cart_item_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_payment`
--
ALTER TABLE `cart_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_payment_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `cart_rules`
--
ALTER TABLE `cart_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_rule_channels`
--
ALTER TABLE `cart_rule_channels`
  ADD PRIMARY KEY (`cart_rule_id`,`channel_id`),
  ADD KEY `cart_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`);

--
-- Indexes for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  ADD KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  ADD KEY `cart_rule_customers_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `cart_rule_customer_groups`
--
ALTER TABLE `cart_rule_customer_groups`
  ADD PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  ADD KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`);

--
-- Indexes for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_shipping_rates_cart_address_id_foreign` (`cart_address_id`);

--
-- Indexes for table `catalog_rules`
--
ALTER TABLE `catalog_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_rule_channels`
--
ALTER TABLE `catalog_rule_channels`
  ADD PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  ADD KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `catalog_rule_customer_groups`
--
ALTER TABLE `catalog_rule_customer_groups`
  ADD PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  ADD KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_products_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `category_filterable_attributes`
--
ALTER TABLE `category_filterable_attributes`
  ADD KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  ADD KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  ADD KEY `category_translations_locale_id_foreign` (`locale_id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  ADD KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  ADD KEY `channels_root_category_id_foreign` (`root_category_id`);

--
-- Indexes for table `channel_currencies`
--
ALTER TABLE `channel_currencies`
  ADD PRIMARY KEY (`channel_id`,`currency_id`),
  ADD KEY `channel_currencies_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `channel_inventory_sources`
--
ALTER TABLE `channel_inventory_sources`
  ADD UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  ADD KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `channel_locales`
--
ALTER TABLE `channel_locales`
  ADD PRIMARY KEY (`channel_id`,`locale_id`),
  ADD KEY `channel_locales_locale_id_foreign` (`locale_id`);

--
-- Indexes for table `channel_translations`
--
ALTER TABLE `channel_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  ADD KEY `channel_translations_locale_index` (`locale`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_page_channels`
--
ALTER TABLE `cms_page_channels`
  ADD UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  ADD KEY `cms_page_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`);

--
-- Indexes for table `core_config`
--
ALTER TABLE `core_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_config_channel_id_foreign` (`channel_code`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_states`
--
ALTER TABLE `country_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_states_country_id_foreign` (`country_id`);

--
-- Indexes for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_state_translations_country_state_id_foreign` (`country_state_id`);

--
-- Indexes for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_translations_country_id_foreign` (`country_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD UNIQUE KEY `customers_api_token_unique` (`api_token`),
  ADD KEY `customers_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_groups_code_unique` (`code`);

--
-- Indexes for table `customer_password_resets`
--
ALTER TABLE `customer_password_resets`
  ADD KEY `customer_password_resets_email_index` (`email`);

--
-- Indexes for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  ADD KEY `customer_social_accounts_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD PRIMARY KEY (`id`),
  ADD KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  ADD KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  ADD KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventory_sources`
--
ALTER TABLE `inventory_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_sources_code_unique` (`code`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_order_id_foreign` (`order_id`),
  ADD KEY `invoices_order_address_id_foreign` (`order_address_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locales_code_unique` (`code`);

--
-- Indexes for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  ADD KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  ADD KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`);

--
-- Indexes for table `marketing_events`
--
ALTER TABLE `marketing_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_templates`
--
ALTER TABLE `marketing_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_order_id_foreign` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `order_brands`
--
ALTER TABLE `order_brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_brands_order_id_foreign` (`order_id`),
  ADD KEY `order_brands_order_item_id_foreign` (`order_item_id`),
  ADD KEY `order_brands_product_id_foreign` (`product_id`),
  ADD KEY `order_brands_brand_foreign` (`brand`);

--
-- Indexes for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_comments_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_payment_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `products_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  ADD KEY `product_attribute_values_product_id_foreign` (`product_id`),
  ADD KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_bundle_options_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`),
  ADD KEY `product_bundle_option_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD KEY `product_categories_product_id_foreign` (`product_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_cross_sells`
--
ALTER TABLE `product_cross_sells`
  ADD KEY `product_cross_sells_parent_id_foreign` (`parent_id`),
  ADD KEY `product_cross_sells_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  ADD KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_links_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`);

--
-- Indexes for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_samples_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`);

--
-- Indexes for table `product_flat`
--
ALTER TABLE `product_flat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  ADD KEY `product_flat_parent_id_foreign` (`parent_id`),
  ADD KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`);

--
-- Indexes for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_grouped_products_product_id_foreign` (`product_id`),
  ADD KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  ADD KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_inventory_indices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_price_indices_product_id_customer_group_id_unique` (`product_id`,`customer_group_id`),
  ADD KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD KEY `product_relations_parent_id_foreign` (`parent_id`),
  ADD KEY `product_relations_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`),
  ADD KEY `product_reviews_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `product_review_images`
--
ALTER TABLE `product_review_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_review_images_review_id_foreign` (`review_id`);

--
-- Indexes for table `product_super_attributes`
--
ALTER TABLE `product_super_attributes`
  ADD KEY `product_super_attributes_product_id_foreign` (`product_id`),
  ADD KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_up_sells`
--
ALTER TABLE `product_up_sells`
  ADD KEY `product_up_sells_parent_id_foreign` (`parent_id`),
  ADD KEY `product_up_sells_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_users`
--
ALTER TABLE `product_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_videos_product_id_foreign` (`product_id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refunds_order_id_foreign` (`order_id`);

--
-- Indexes for table `refund_items`
--
ALTER TABLE `refund_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  ADD KEY `refund_items_refund_id_foreign` (`refund_id`),
  ADD KEY `refund_items_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_order_id_foreign` (`order_id`),
  ADD KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  ADD KEY `shipments_order_address_id_foreign` (`order_address_id`);

--
-- Indexes for table `shipment_items`
--
ALTER TABLE `shipment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_items_shipment_id_foreign` (`shipment_id`);

--
-- Indexes for table `sitemaps`
--
ALTER TABLE `sitemaps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sliders_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  ADD KEY `subscribers_list_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `tax_categories`
--
ALTER TABLE `tax_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_categories_code_unique` (`code`);

--
-- Indexes for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  ADD KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_rates_identifier_unique` (`identifier`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `velocity_contents`
--
ALTER TABLE `velocity_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `velocity_contents_translations`
--
ALTER TABLE `velocity_contents_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `velocity_contents_translations_content_id_foreign` (`content_id`);

--
-- Indexes for table `velocity_customer_compare_products`
--
ALTER TABLE `velocity_customer_compare_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `velocity_customer_compare_products_customer_id_foreign` (`customer_id`),
  ADD KEY `velocity_customer_compare_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `velocity_meta_data`
--
ALTER TABLE `velocity_meta_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_customer_id_foreign` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `attribute_families`
--
ALTER TABLE `attribute_families`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_products`
--
ALTER TABLE `booking_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_product_appointment_slots`
--
ALTER TABLE `booking_product_appointment_slots`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_product_default_slots`
--
ALTER TABLE `booking_product_default_slots`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_product_event_tickets`
--
ALTER TABLE `booking_product_event_tickets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_product_event_ticket_translations`
--
ALTER TABLE `booking_product_event_ticket_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_product_rental_slots`
--
ALTER TABLE `booking_product_rental_slots`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_product_table_slots`
--
ALTER TABLE `booking_product_table_slots`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart_item_inventories`
--
ALTER TABLE `cart_item_inventories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_payment`
--
ALTER TABLE `cart_payment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rules`
--
ALTER TABLE `cart_rules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_rules`
--
ALTER TABLE `catalog_rules`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `channel_translations`
--
ALTER TABLE `channel_translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cms_pages`
--
ALTER TABLE `cms_pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `core_config`
--
ALTER TABLE `core_config`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `country_states`
--
ALTER TABLE `country_states`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

--
-- AUTO_INCREMENT for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4581;

--
-- AUTO_INCREMENT for table `country_translations`
--
ALTER TABLE `country_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2041;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_sources`
--
ALTER TABLE `inventory_sources`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locales`
--
ALTER TABLE `locales`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_events`
--
ALTER TABLE `marketing_events`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketing_templates`
--
ALTER TABLE `marketing_templates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_brands`
--
ALTER TABLE `order_brands`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_comments`
--
ALTER TABLE `order_comments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_payment`
--
ALTER TABLE `order_payment`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

--
-- AUTO_INCREMENT for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_flat`
--
ALTER TABLE `product_flat`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_inventories`
--
ALTER TABLE `product_inventories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_review_images`
--
ALTER TABLE `product_review_images`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_users`
--
ALTER TABLE `product_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_videos`
--
ALTER TABLE `product_videos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_items`
--
ALTER TABLE `refund_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipment_items`
--
ALTER TABLE `shipment_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitemaps`
--
ALTER TABLE `sitemaps`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_categories`
--
ALTER TABLE `tax_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `velocity_contents`
--
ALTER TABLE `velocity_contents`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `velocity_contents_translations`
--
ALTER TABLE `velocity_contents_translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `velocity_customer_compare_products`
--
ALTER TABLE `velocity_customer_compare_products`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `velocity_meta_data`
--
ALTER TABLE `velocity_meta_data`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  ADD CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_group_mappings`
--
ALTER TABLE `attribute_group_mappings`
  ADD CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  ADD CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `booking_products`
--
ALTER TABLE `booking_products`
  ADD CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_product_appointment_slots`
--
ALTER TABLE `booking_product_appointment_slots`
  ADD CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_product_default_slots`
--
ALTER TABLE `booking_product_default_slots`
  ADD CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_product_event_tickets`
--
ALTER TABLE `booking_product_event_tickets`
  ADD CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_product_event_ticket_translations`
--
ALTER TABLE `booking_product_event_ticket_translations`
  ADD CONSTRAINT `booking_product_event_ticket_translations_locale_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_product_rental_slots`
--
ALTER TABLE `booking_product_rental_slots`
  ADD CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_product_table_slots`
--
ALTER TABLE `booking_product_table_slots`
  ADD CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`);

--
-- Constraints for table `cart_payment`
--
ALTER TABLE `cart_payment`
  ADD CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_channels`
--
ALTER TABLE `cart_rule_channels`
  ADD CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  ADD CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  ADD CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  ADD CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_customer_groups`
--
ALTER TABLE `cart_rule_customer_groups`
  ADD CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  ADD CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  ADD CONSTRAINT `cart_shipping_rates_cart_address_id_foreign` FOREIGN KEY (`cart_address_id`) REFERENCES `addresses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_channels`
--
ALTER TABLE `catalog_rule_channels`
  ADD CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_customer_groups`
--
ALTER TABLE `catalog_rule_customer_groups`
  ADD CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  ADD CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  ADD CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_filterable_attributes`
--
ALTER TABLE `category_filterable_attributes`
  ADD CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channels`
--
ALTER TABLE `channels`
  ADD CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  ADD CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `channel_currencies`
--
ALTER TABLE `channel_currencies`
  ADD CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_inventory_sources`
--
ALTER TABLE `channel_inventory_sources`
  ADD CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_locales`
--
ALTER TABLE `channel_locales`
  ADD CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_translations`
--
ALTER TABLE `channel_translations`
  ADD CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_page_channels`
--
ALTER TABLE `cms_page_channels`
  ADD CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  ADD CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_states`
--
ALTER TABLE `country_states`
  ADD CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  ADD CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  ADD CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  ADD CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_brands`
--
ALTER TABLE `order_brands`
  ADD CONSTRAINT `order_brands_brand_foreign` FOREIGN KEY (`brand`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_brands_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_brands_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_brands_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  ADD CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  ADD CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  ADD CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  ADD CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_cross_sells`
--
ALTER TABLE `product_cross_sells`
  ADD CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  ADD CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  ADD CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  ADD CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  ADD CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  ADD CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_flat`
--
ALTER TABLE `product_flat`
  ADD CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  ADD CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  ADD CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  ADD CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  ADD CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  ADD CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_review_images`
--
ALTER TABLE `product_review_images`
  ADD CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_super_attributes`
--
ALTER TABLE `product_super_attributes`
  ADD CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_up_sells`
--
ALTER TABLE `product_up_sells`
  ADD CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refunds`
--
ALTER TABLE `refunds`
  ADD CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refund_items`
--
ALTER TABLE `refund_items`
  ADD CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipment_items`
--
ALTER TABLE `shipment_items`
  ADD CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sliders`
--
ALTER TABLE `sliders`
  ADD CONSTRAINT `sliders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  ADD CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  ADD CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `velocity_contents_translations`
--
ALTER TABLE `velocity_contents_translations`
  ADD CONSTRAINT `velocity_contents_translations_content_id_foreign` FOREIGN KEY (`content_id`) REFERENCES `velocity_contents` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `velocity_customer_compare_products`
--
ALTER TABLE `velocity_customer_compare_products`
  ADD CONSTRAINT `velocity_customer_compare_products_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `velocity_customer_compare_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
