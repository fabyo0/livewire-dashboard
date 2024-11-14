-- phpMyAdmin SQL Dump
-- version 5.2.1deb1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Creato il: Nov 12, 2024 alle 15:01
-- Versione del server: 10.11.6-MariaDB-0+deb12u1
-- Versione PHP: 8.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `livewire`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `admin_login_history`
--

CREATE TABLE `admin_login_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `IP` varchar(191) NOT NULL,
  `browser` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `admin_login_history`
--

INSERT INTO `admin_login_history` (`id`, `name`, `email`, `IP`, `browser`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'jimipulsar@github.com', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', '2024-11-12 14:59:55', '2024-11-12 14:59:55');

-- --------------------------------------------------------

--
-- Struttura della tabella `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `name`, `parent_id`, `slug`, `is_required`, `created_at`, `updated_at`) VALUES
(4, NULL, 'Taglia', NULL, 'taglia', 0, '2024-04-22 14:21:53', '2024-04-22 14:21:53'),
(5, NULL, 'M', 4, 'm', 0, '2024-04-22 14:22:00', '2024-04-22 14:22:00'),
(6, NULL, 'Colore', NULL, 'colore', 0, '2024-04-22 14:22:06', '2024-04-22 14:22:06'),
(7, NULL, 'Rosso', 6, 'rosso', 0, '2024-04-22 14:22:11', '2024-04-22 14:22:11'),
(8, NULL, '42', 4, '42', 0, '2024-04-22 14:22:23', '2024-04-22 14:22:23');

-- --------------------------------------------------------

--
-- Struttura della tabella `attribute_product`
--

CREATE TABLE `attribute_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `attribute_product`
--

INSERT INTO `attribute_product` (`id`, `product_id`, `attribute_id`, `created_at`, `updated_at`) VALUES
(19, 10, 4, NULL, NULL),
(20, 10, 5, NULL, NULL),
(21, 9, 4, NULL, NULL),
(22, 9, 5, NULL, NULL),
(23, 8, 4, NULL, NULL),
(24, 8, 5, NULL, NULL),
(25, 6, 4, NULL, NULL),
(26, 6, 5, NULL, NULL),
(27, 7, 4, NULL, NULL),
(28, 7, 8, NULL, NULL),
(29, 5, 4, NULL, NULL),
(30, 5, 5, NULL, NULL),
(33, 4, 4, NULL, NULL),
(34, 4, 8, NULL, NULL),
(35, 3, 4, NULL, NULL),
(36, 3, 8, NULL, NULL),
(37, 1, 4, NULL, NULL),
(38, 1, 8, NULL, NULL),
(39, 11, 4, NULL, NULL),
(40, 11, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `cover` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `description`, `cover`, `link`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Quis voluptatem.', 'quis-voluptatem', NULL, NULL, NULL, 1, '2024-04-12 15:19:47', '2024-04-12 15:19:47'),
(2, 'Voluptatem.', 'voluptatem', NULL, NULL, NULL, 1, '2024-04-12 15:19:47', '2024-04-12 15:19:47'),
(3, 'Sint saepe.', 'sint-saepe', NULL, NULL, NULL, 1, '2024-04-12 15:19:47', '2024-04-12 15:19:47'),
(4, 'Ut quibusdam.', 'ut-quibusdam', NULL, NULL, NULL, 1, '2024-04-12 15:19:47', '2024-04-12 15:19:47'),
(5, 'Et ipsa.', 'et-ipsa', NULL, NULL, NULL, 1, '2024-04-12 15:19:47', '2024-04-12 15:19:47'),
(6, 'Est.', 'est', NULL, NULL, NULL, 1, '2024-04-12 15:19:47', '2024-04-12 15:19:47'),
(7, 'Blanditiis.', 'blanditiis', NULL, NULL, NULL, 1, '2024-04-12 15:19:47', '2024-04-12 15:19:47'),
(8, 'Adipisci.', 'adipisci', NULL, NULL, NULL, 1, '2024-04-12 15:19:47', '2024-04-12 15:19:47'),
(9, 'Aut.', 'aut', NULL, NULL, NULL, 1, '2024-04-12 15:19:47', '2024-04-12 15:19:47'),
(10, 'Labore.', 'labore', NULL, NULL, NULL, 1, '2024-04-12 15:19:47', '2024-04-12 15:19:47');

-- --------------------------------------------------------

--
-- Struttura della tabella `brand_product`
--

CREATE TABLE `brand_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `category_slug` varchar(191) NOT NULL DEFAULT 'slug',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `category_slug`, `created_at`, `updated_at`) VALUES
(1, 'Nike', NULL, 'nike', '2024-04-12 15:20:09', '2024-04-12 15:20:09'),
(2, 'Adidas', NULL, 'adidas', '2024-04-12 15:20:13', '2024-04-12 15:20:13'),
(3, 'Puma', NULL, 'puma', '2024-04-12 15:20:18', '2024-04-12 15:20:18'),
(4, 'Scarpe', 1, 'scarpe', '2024-04-12 15:20:24', '2024-04-12 15:20:24'),
(5, 'Scarpe', 2, 'scarpe', '2024-04-12 15:20:28', '2024-04-12 15:20:28'),
(6, 'Scarpe', 3, 'scarpe', '2024-04-12 15:20:34', '2024-04-12 15:20:34'),
(7, 'Felpa', 3, 'felpa', '2024-04-12 15:20:39', '2024-04-12 15:20:39'),
(8, 'Felpa', 2, 'felpa', '2024-04-12 15:20:44', '2024-04-12 15:20:44'),
(9, 'Cappelli', 3, 'cappelli', '2024-04-12 15:28:11', '2024-04-12 15:28:11');

-- --------------------------------------------------------

--
-- Struttura della tabella `category_product`
--

CREATE TABLE `category_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `category_product`
--

INSERT INTO `category_product` (`id`, `product_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 4, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 3, 4, NULL, NULL),
(5, 4, 2, NULL, NULL),
(6, 4, 5, NULL, NULL),
(7, 5, 2, NULL, NULL),
(8, 5, 8, NULL, NULL),
(9, 6, 3, NULL, NULL),
(10, 6, 7, NULL, NULL),
(11, 7, 2, NULL, NULL),
(12, 7, 5, NULL, NULL),
(13, 8, 2, NULL, NULL),
(14, 8, 8, NULL, NULL),
(15, 9, 3, NULL, NULL),
(16, 9, 9, NULL, NULL),
(17, 10, 1, NULL, NULL),
(18, 10, 4, NULL, NULL),
(19, 11, 3, NULL, NULL),
(20, 11, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `value` int(11) DEFAULT NULL,
  `percent_off` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `percent_off`, `created_at`, `updated_at`) VALUES
(1, 'ABC123', 'fixed', 10, NULL, '2024-04-12 15:19:47', '2024-04-12 15:19:47'),
(2, 'DEF456', 'percent', NULL, 10, '2024-04-12 15:19:47', '2024-04-12 15:19:47');

-- --------------------------------------------------------

--
-- Struttura della tabella `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `shipping_name` varchar(191) DEFAULT NULL,
  `shipping_surname` varchar(191) DEFAULT NULL,
  `shipping_company` varchar(191) DEFAULT NULL,
  `shipping_vat` varchar(191) DEFAULT NULL,
  `shipping_address` varchar(191) DEFAULT NULL,
  `shipping_city` varchar(191) DEFAULT NULL,
  `shipping_country` varchar(191) DEFAULT NULL,
  `shipping_province` varchar(191) DEFAULT NULL,
  `shipping_zipcode` varchar(191) DEFAULT NULL,
  `shipping_phone` varchar(191) DEFAULT NULL,
  `billing_name` varchar(191) DEFAULT NULL,
  `billing_surname` varchar(191) DEFAULT NULL,
  `billing_company` varchar(191) DEFAULT NULL,
  `billing_vat` varchar(191) DEFAULT NULL,
  `billing_address` varchar(191) DEFAULT NULL,
  `billing_city` varchar(191) DEFAULT NULL,
  `billing_country` varchar(191) DEFAULT NULL,
  `billing_province` varchar(191) DEFAULT NULL,
  `billing_zipcode` varchar(191) DEFAULT NULL,
  `billing_phone` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `customers`
--

INSERT INTO `customers` (`id`, `email`, `shipping_name`, `shipping_surname`, `shipping_company`, `shipping_vat`, `shipping_address`, `shipping_city`, `shipping_country`, `shipping_province`, `shipping_zipcode`, `shipping_phone`, `billing_name`, `billing_surname`, `billing_company`, `billing_vat`, `billing_address`, `billing_city`, `billing_country`, `billing_province`, `billing_zipcode`, `billing_phone`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'randomuser@github.com', 'Giovanni', 'Rossi', 'Zara S.r.l.', NULL, 'Via Alessandro Manzoni, 34', 'Roma', 'IT', 'RM', '00118', '39358222521', 'Giovanni', 'Rossi', NULL, NULL, 'Via Alessandro Manzoni, 34', 'Roma', 'IT', 'RM', '00118', '39358222521', NULL, '$2y$10$N/sHoad6Hb2m6997exCG7ez582hUfP2Nk/gush4tYGthBv5ouM3ly', NULL, '2024-04-12 15:19:47', '2024-04-12 15:19:47');

-- --------------------------------------------------------

--
-- Struttura della tabella `customer_login_history`
--

CREATE TABLE `customer_login_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `IP` varchar(191) NOT NULL,
  `browser` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `customer_login_history`
--

INSERT INTO `customer_login_history` (`id`, `name`, `email`, `IP`, `browser`, `created_at`, `updated_at`) VALUES
(1, 'Giovanni', 'randomuser@github.com', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101 Firefox/128.0', '2024-11-08 15:28:06', '2024-11-08 15:28:06');

-- --------------------------------------------------------

--
-- Struttura della tabella `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_02_21_095453_create_coupons_table', 1),
(6, '2022_02_21_095509_create_customers_table', 1),
(7, '2022_02_21_095510_create_categories_table', 1),
(8, '2022_02_21_095527_create_products_table', 1),
(9, '2022_02_21_095529_create_brands_table', 1),
(10, '2022_02_21_095543_create_orders_table', 1),
(11, '2022_02_21_095602_create_order_items_table', 1),
(12, '2022_02_21_095703_create_sub_orders_table', 1),
(13, '2022_02_21_095717_create_sub_order_items_table', 1),
(14, '2022_02_21_095736_create_transactions_table', 1),
(15, '2022_02_21_095748_create_sliders_table', 1),
(16, '2022_02_21_095758_create_wishlists_table', 1),
(17, '2022_02_21_095809_create_notifications_table', 1),
(18, '2022_02_21_095821_create_newsletters_table', 1),
(19, '2022_02_21_095831_create_shipments_table', 1),
(20, '2022_02_25_110716_create_customer_login_history_table', 1),
(21, '2022_02_25_110753_create_admin_login_history_table', 1),
(22, '2022_03_07_170845_create_category_product_table', 1),
(23, '2022_03_12_130518_create_attributes_table', 1),
(24, '2022_03_12_130828_create_attribute_product_table', 1),
(25, '2022_07_30_141027_create_cache_table', 1),
(26, '2022_09_28_121137_create_brand_product_table', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `emailSubscription` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `status` enum('pending','processing','completed','decline') NOT NULL DEFAULT 'pending',
  `is_paid` tinyint(1) NOT NULL DEFAULT 0,
  `is_shipped` tinyint(1) NOT NULL DEFAULT 0,
  `grand_total` double(12,2) NOT NULL,
  `item_count` int(11) NOT NULL DEFAULT 1,
  `discount` double(5,2) DEFAULT NULL,
  `shipping_name` varchar(191) DEFAULT NULL,
  `shipping_surname` varchar(191) DEFAULT NULL,
  `shipping_company` varchar(191) DEFAULT NULL,
  `shipping_address` varchar(191) DEFAULT NULL,
  `shipping_city` varchar(191) DEFAULT NULL,
  `shipping_country` varchar(191) DEFAULT NULL,
  `shipping_province` varchar(191) DEFAULT NULL,
  `shipping_zipcode` varchar(191) DEFAULT NULL,
  `shipping_phone` varchar(191) DEFAULT NULL,
  `notes` varchar(191) DEFAULT NULL,
  `billing_name` varchar(191) DEFAULT NULL,
  `billing_surname` varchar(191) DEFAULT NULL,
  `billing_company` varchar(191) DEFAULT NULL,
  `billing_vat` varchar(191) DEFAULT NULL,
  `billing_address` varchar(191) DEFAULT NULL,
  `billing_city` varchar(191) DEFAULT NULL,
  `billing_country` varchar(191) DEFAULT NULL,
  `billing_province` varchar(191) DEFAULT NULL,
  `billing_zipcode` varchar(191) DEFAULT NULL,
  `billing_phone` varchar(191) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` enum('cash_on_delivery','paypal','wire transfer','card') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `email`, `status`, `is_paid`, `is_shipped`, `grand_total`, `item_count`, `discount`, `shipping_name`, `shipping_surname`, `shipping_company`, `shipping_address`, `shipping_city`, `shipping_country`, `shipping_province`, `shipping_zipcode`, `shipping_phone`, `notes`, `billing_name`, `billing_surname`, `billing_company`, `billing_vat`, `billing_address`, `billing_city`, `billing_country`, `billing_province`, `billing_zipcode`, `billing_phone`, `customer_id`, `payment_method`, `created_at`, `updated_at`) VALUES
(1, '672E2E1A54E86', 'randomuser@github.com', 'processing', 1, 0, 445.00, 1, NULL, 'Giovanni', 'Rossi', 'Zara S.r.l.', 'Via Alessandro Manzoni, 34', 'Roma', 'IT', 'RM', '00118', '39358222521', NULL, 'Giovanni', 'Rossi', NULL, NULL, 'Via Alessandro Manzoni, 34', 'Roma', NULL, 'RM', '00118', NULL, 1, 'card', '2024-11-08 15:28:26', '2024-11-08 15:28:26'),
(2, '672E2E31D0E2E', 'randomuser@github.com', 'decline', 1, 0, 59.00, 1, NULL, 'Giovanni', 'Rossi', 'Zara S.r.l.', 'Via Alessandro Manzoni, 34', 'Roma', 'IT', 'RM', '00118', '39358222521', NULL, 'Giovanni', 'Rossi', NULL, NULL, 'Via Alessandro Manzoni, 34', 'Roma', NULL, 'RM', '00118', NULL, 1, 'card', '2024-11-08 15:28:49', '2024-11-12 15:01:29'),
(3, '672E2FD080FAE', 'randomuser@github.com', 'completed', 1, 1, 59.00, 1, NULL, 'Giovanni', 'Rossi', 'Zara S.r.l.', 'Via Alessandro Manzoni, 34', 'Roma', 'IT', 'RM', '00118', '39358222521', NULL, 'Giovanni', 'Rossi', NULL, NULL, 'Via Alessandro Manzoni, 34', 'Roma', NULL, 'RM', '00118', NULL, 1, 'card', '2024-11-08 15:35:44', '2024-11-12 15:00:09'),
(4, '672E2FF3C1CB3', 'randomuser@github.com', 'processing', 1, 0, 32.00, 1, NULL, 'Giovanni', 'Rossi', 'Zara S.r.l.', 'Via Alessandro Manzoni, 34', 'Roma', 'IT', 'RM', '00118', '39358222521', NULL, 'Giovanni', 'Rossi', NULL, NULL, 'Via Alessandro Manzoni, 34', 'Roma', NULL, 'RM', '00118', NULL, 1, 'card', '2024-11-08 15:36:19', '2024-11-08 15:36:19'),
(5, '672E311D7DA40', 'randomuser@github.com', 'pending', 0, 0, 32.00, 1, NULL, 'Giovanni', 'Rossi', 'Zara S.r.l.', 'Via Alessandro Manzoni, 34', 'Roma', 'IT', 'RM', '00118', '39358222521', NULL, 'Giovanni', 'Rossi', NULL, NULL, 'Via Alessandro Manzoni, 34', 'Roma', NULL, 'RM', '00118', NULL, 1, 'wire transfer', '2024-11-08 15:41:17', '2024-11-08 15:41:17');

-- --------------------------------------------------------

--
-- Struttura della tabella `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `price` double(8,2) NOT NULL DEFAULT 23.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `order_items`
--

INSERT INTO `order_items` (`id`, `product_id`, `order_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 10, 1, 3, 438.00, NULL, NULL),
(2, 8, 2, 1, 52.00, NULL, NULL),
(3, 8, 3, 1, 52.00, NULL, NULL),
(4, 9, 4, 1, 25.00, NULL, NULL),
(5, 9, 5, 1, 25.00, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_name` text DEFAULT NULL,
  `item_code` varchar(191) DEFAULT NULL,
  `short_description` longtext DEFAULT NULL,
  `long_description` longtext DEFAULT NULL,
  `img_01` text DEFAULT NULL,
  `img_02` text DEFAULT NULL,
  `img_03` text DEFAULT NULL,
  `link` text DEFAULT NULL,
  `link_2` text DEFAULT NULL,
  `attachment` text DEFAULT NULL,
  `links` varchar(191) DEFAULT NULL,
  `base_width` varchar(191) DEFAULT NULL,
  `base_height` varchar(191) DEFAULT NULL,
  `base_depth` varchar(191) DEFAULT NULL,
  `base_weight` varchar(191) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `published` varchar(191) DEFAULT '0',
  `stock_qty` varchar(191) DEFAULT '1',
  `quantity` varchar(191) DEFAULT '1',
  `slug` text DEFAULT NULL,
  `purchasable` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `products`
--

INSERT INTO `products` (`id`, `item_name`, `item_code`, `short_description`, `long_description`, `img_01`, `img_02`, `img_03`, `link`, `link_2`, `attachment`, `links`, `base_width`, `base_height`, `base_depth`, `base_weight`, `price`, `published`, `stock_qty`, `quantity`, `slug`, `purchasable`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Scarpe Nike Air GOOD', '12', '<p>asdasd</p>', '<p>asd</p>', 'scarpe-nike-air-max-2090-cw7306-001-nike-air-m.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12.00, '1', '77', '1', 'scarpe-nike-air-good', 1, 1, '2024-04-12 15:21:40', '2024-11-08 17:46:37'),
(3, 'Scarpe Nike Air Max Azure', '123', '<p>asdasdasdasd</p>', '<p>asdasd</p>', 'scarpa-air-force-1-07-npDqNV.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 123.00, '1', '866', '1', 'scarpe-nike-air-max-azure', 1, 1, '2024-04-12 15:24:36', '2024-11-08 17:46:47'),
(4, 'Scarpe Adidas', '5112', '<p>asd</p>', '<p>asd</p>', 'images.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 232.00, '1', '61', '1', 'scarpe-adidas', 1, 1, '2024-04-12 15:24:52', '2024-11-08 17:46:23'),
(5, 'Felpa Donna Rossa', '5151', '<p>asdasdas</p>', '<p>asdasda</p>', '9129988_0.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 51.00, '1', '26', '1', 'felpa-donna-rossa', 1, 1, '2024-04-12 15:26:22', '2024-11-08 17:46:17'),
(6, 'Canottiera Puma Donna', '231', '<p>asd</p>', '<p>asd</p>', '203752213-1-black.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 14.00, '1', '166', '1', 'canottiera-puma-donna', 1, 1, '2024-04-12 15:26:47', '2024-11-08 17:46:12'),
(7, 'Scarpe Adidas Green', '112', '<p>asd</p>', '<p>asd</p>', 'adidas-switch-fwd-scarpe-da-running-uomo-ftwwht-wonblu-luclem-fz5621_A.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 64.00, '1', '5', '1', 'scarpe-adidas-green', 1, 1, '2024-04-12 15:27:15', '2024-11-08 17:45:55'),
(8, 'Felpa Black', '24', '<p>asd</p>', '<p>asd</p>', 'adidas-felpa-nera-track-jacket.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 52.00, '1', '33', '1', 'felpa-black', 1, 1, '2024-04-12 15:27:53', '2024-11-12 15:00:09'),
(9, 'Cappello Puma Sportivo', '163', '<p>asd</p>', '<p>asd</p>', 'b67e9921d90c4a4387bf314d64478df9.webp', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 25.00, '1', '32', '1', 'cappello-puma-sportivo', 1, 1, '2024-04-12 15:28:59', '2024-11-08 17:45:44'),
(10, 'Nike Air Max Jordan', '155', '<p>asdasd</p>', '<p>asdas</p>', 'A23---nike---FQ8740480.JPG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 146.00, '1', '16', '1', 'nike-air-max-jordan', 1, 1, '2024-04-12 15:29:38', '2024-11-08 17:45:40'),
(11, 'Scarpe Puma Bianche', '612', '<p>asdasdas</p>', NULL, 'scarpepumabianche.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65.00, '1', '51', '1', 'scarpe-puma-bianche', 1, 1, '2024-11-08 15:43:29', '2024-11-08 15:43:29');

-- --------------------------------------------------------

--
-- Struttura della tabella `shipments`
--

CREATE TABLE `shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `tracking_number` bigint(20) UNSIGNED DEFAULT NULL,
  `packlink_name` varchar(191) DEFAULT NULL,
  `packlink_content` varchar(191) DEFAULT NULL,
  `packlink_city` varchar(191) DEFAULT NULL,
  `packlink_country` varchar(191) DEFAULT NULL,
  `packlink_date` varchar(191) DEFAULT NULL,
  `packlink_order_id` varchar(191) DEFAULT NULL,
  `status` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title1` varchar(191) DEFAULT NULL,
  `title2` varchar(191) DEFAULT NULL,
  `title3` varchar(191) DEFAULT NULL,
  `cover` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `sliders`
--

INSERT INTO `sliders` (`id`, `title1`, `title2`, `title3`, `cover`, `created_at`, `updated_at`) VALUES
(1, 'Trapani', 'elettrici', '49', 'uploads/slider/slider1.jpg', '2024-04-12 15:19:47', '2024-04-12 15:19:47'),
(2, 'Scarpe', 'antinfortunistiche', '32', 'uploads/slider/slider2.jpg', '2024-04-12 15:19:47', '2024-04-12 15:19:47'),
(3, 'Arredamento', 'industriale', '135', 'uploads/slider/slider3.jpg', '2024-04-12 15:19:47', '2024-04-12 15:19:47');

-- --------------------------------------------------------

--
-- Struttura della tabella `sub_orders`
--

CREATE TABLE `sub_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','processing','completed','decline') NOT NULL DEFAULT 'pending',
  `grand_total` double(8,2) NOT NULL,
  `item_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `sub_orders`
--

INSERT INTO `sub_orders` (`id`, `order_id`, `customer_id`, `status`, `grand_total`, `item_count`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'pending', 438.00, 3, '2024-11-08 15:28:26', '2024-11-08 15:28:26'),
(2, 2, 1, 'pending', 52.00, 1, '2024-11-08 15:28:49', '2024-11-08 15:28:49'),
(3, 3, 1, 'pending', 52.00, 1, '2024-11-08 15:35:44', '2024-11-08 15:35:44'),
(4, 4, 1, 'pending', 25.00, 1, '2024-11-08 15:36:19', '2024-11-08 15:36:19'),
(5, 5, 1, 'pending', 25.00, 1, '2024-11-08 15:41:17', '2024-11-08 15:41:17');

-- --------------------------------------------------------

--
-- Struttura della tabella `sub_order_items`
--

CREATE TABLE `sub_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 10.00,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `sub_order_items`
--

INSERT INTO `sub_order_items` (`id`, `sub_order_id`, `product_id`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 438.00, 3, NULL, NULL),
(2, 2, 8, 52.00, 1, NULL, NULL),
(3, 3, 8, 52.00, 1, NULL, NULL),
(4, 4, 9, 25.00, 1, NULL, NULL),
(5, 5, 9, 25.00, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_order_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `amount_paid` double(8,2) DEFAULT NULL,
  `commission` double(8,2) DEFAULT NULL,
  `payer_email` varchar(191) DEFAULT NULL,
  `payer_order_id` varchar(191) DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','processing','completed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `transactions`
--

INSERT INTO `transactions` (`id`, `sub_order_id`, `transaction_id`, `amount_paid`, `commission`, `payer_email`, `payer_order_id`, `customer_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '1', 445.00, NULL, 'randomuser@github.com', '1', 1, 'completed', '2024-11-08 15:28:26', '2024-11-08 15:28:26'),
(2, 2, '2', 59.00, NULL, 'randomuser@github.com', '2', 1, 'completed', '2024-11-08 15:28:49', '2024-11-08 15:28:49'),
(3, 3, '3', 59.00, NULL, 'randomuser@github.com', '3', 1, 'completed', '2024-11-08 15:35:44', '2024-11-08 15:35:44'),
(4, 4, '4', 32.00, NULL, 'randomuser@github.com', '4', 1, 'completed', '2024-11-08 15:36:19', '2024-11-08 15:36:19'),
(5, 3, '3', 59.00, NULL, 'randomuser@github.com', '3', 1, 'completed', '2024-11-12 15:00:09', '2024-11-12 15:00:09');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `address` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `address`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'jimipulsar@github.com', NULL, 'Station Street', '$2y$10$2OGwDrfDcw17smlFt5xl1enEsdPO0JwbXUjFCa1axdF6dmjZ4SpyO', NULL, '2024-04-12 15:19:47', '2024-11-12 15:00:36');

-- --------------------------------------------------------

--
-- Struttura della tabella `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `admin_login_history`
--
ALTER TABLE `admin_login_history`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_product_product_id_foreign` (`product_id`),
  ADD KEY `attribute_product_attribute_id_foreign` (`attribute_id`);

--
-- Indici per le tabelle `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_user_id_foreign` (`user_id`);

--
-- Indici per le tabelle `brand_product`
--
ALTER TABLE `brand_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_product_product_id_foreign` (`product_id`),
  ADD KEY `brand_product_brand_id_foreign` (`brand_id`);

--
-- Indici per le tabelle `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indici per le tabelle `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indici per le tabelle `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Indici per le tabelle `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indici per le tabelle `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `customer_login_history`
--
ALTER TABLE `customer_login_history`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indici per le tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`),
  ADD KEY `notifications_order_id_foreign` (`order_id`);

--
-- Indici per le tabelle `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indici per le tabelle `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indici per le tabelle `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indici per le tabelle `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indici per le tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_item_code_unique` (`item_code`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indici per le tabelle `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_order_id_foreign` (`order_id`),
  ADD KEY `shipments_customer_id_foreign` (`customer_id`),
  ADD KEY `shipments_tracking_number_foreign` (`tracking_number`);

--
-- Indici per le tabelle `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `sub_orders`
--
ALTER TABLE `sub_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_orders_order_id_foreign` (`order_id`),
  ADD KEY `sub_orders_customer_id_foreign` (`customer_id`);

--
-- Indici per le tabelle `sub_order_items`
--
ALTER TABLE `sub_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_order_items_sub_order_id_foreign` (`sub_order_id`),
  ADD KEY `sub_order_items_product_id_foreign` (`product_id`);

--
-- Indici per le tabelle `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_sub_order_id_foreign` (`sub_order_id`),
  ADD KEY `transactions_customer_id_foreign` (`customer_id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indici per le tabelle `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_customer_id_foreign` (`customer_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `admin_login_history`
--
ALTER TABLE `admin_login_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `attribute_product`
--
ALTER TABLE `attribute_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT per la tabella `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `brand_product`
--
ALTER TABLE `brand_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `customer_login_history`
--
ALTER TABLE `customer_login_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT per la tabella `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT per la tabella `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `sub_orders`
--
ALTER TABLE `sub_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `sub_order_items`
--
ALTER TABLE `sub_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT per la tabella `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD CONSTRAINT `attribute_product_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Limiti per la tabella `brand_product`
--
ALTER TABLE `brand_product`
  ADD CONSTRAINT `brand_product_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brand_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Limiti per la tabella `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Limiti per la tabella `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shipments_tracking_number_foreign` FOREIGN KEY (`tracking_number`) REFERENCES `orders` (`id`);

--
-- Limiti per la tabella `sub_orders`
--
ALTER TABLE `sub_orders`
  ADD CONSTRAINT `sub_orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `sub_order_items`
--
ALTER TABLE `sub_order_items`
  ADD CONSTRAINT `sub_order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `sub_order_items_sub_order_id_foreign` FOREIGN KEY (`sub_order_id`) REFERENCES `sub_orders` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_sub_order_id_foreign` FOREIGN KEY (`sub_order_id`) REFERENCES `sub_orders` (`id`) ON DELETE CASCADE;

--
-- Limiti per la tabella `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
