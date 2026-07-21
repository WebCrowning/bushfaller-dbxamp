-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2026 at 03:40 PM
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
-- Database: `bushfaller`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_chat_ai_messages`
--

CREATE TABLE `admin_chat_ai_messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_chat_ai_messages`
--

INSERT INTO `admin_chat_ai_messages` (`id`, `conversation_id`, `message`, `created_at`) VALUES
(1, 1, 'Hello! Bushfaller is an e-commerce store offering a variety of high-quality products. I\'d be happy to help you with any product inquiries. Our available categories include electronics, home & garden, clothing, and more. Could you please specify which product category you\'re interested in?', '2026-03-29 11:35:11'),
(2, 1, 'Bushfaller is an African raw food marketplace. Our available product categories are Seafood, Protein, and Vegetables. Examples of our products include Premium Dried Fish and Fresh African Snails. Let me know if you have a specific product in mind, and I\'d be happy to help with any questions you may have.', '2026-03-29 11:37:47'),
(3, 1, 'Bushfaller is an African raw food marketplace where you can find a variety of seafood, protein, and vegetable products. Some examples include Premium Dried Fish and Fresh African Snails. The company was founded to bring authentic African raw food products to customers. I\'m here to help answer any questions you have about our products or your order. If you have a specific product in mind, please let me know and I\'d be happy to provide more information. If you have a question about the founder of Bushfaller, I\'d be happy to connect you with someone who has that information.', '2026-03-29 11:38:34'),
(4, 1, 'I do not have verified founder details in this project data. Please contact store admin for official founder information.', '2026-03-29 23:17:57'),
(5, 1, 'Bushfaller is an African raw food marketplace. Our available product categories are Seafood, Protein, and Vegetables. Examples of our products include Premium Dried Fish and Fresh African Snails. If you have a specific product in mind, please let me know and I\'d be happy to help with any questions you may have. If you have a question about the availability of a particular product, I\'d be happy to check our inventory for you. If you\'re looking for something outside of our Seafood, Protein, and Vegetables categories, I\'d be happy to suggest some relevant alternatives or connect you with a human agent who can better assist you.', '2026-03-29 23:18:37'),
(6, 1, 'Bushfaller offers African raw food products in the categories of Seafood, Protein, and Vegetables. Examples include Premium Dried Fish and Fresh African Snails. Let me know if you have a specific product in mind.', '2026-03-29 23:24:36'),
(7, 1, 'We only sell African raw food. For \"eru,\" try elsewhere.', '2026-03-29 23:25:13'),
(8, 1, 'Bushfaller is an African raw food marketplace with categories including Seafood, Protein, and Vegetables. Examples of our products are Premium Dried Fish and Fresh African Snails. Let me know if you have a specific product in mind.', '2026-04-02 03:24:59'),
(9, 1, 'Here\'s what we currently have available: - **Seafood:** Premium Dried Fish - **Protein:** Fresh African Snails - **Vegetables & General:** Let me ask our team about specific items in these categories. Would you like to order any of these?', '2026-04-02 03:56:09'),
(10, 3, 'Hello and welcome to Bushfaller, your go-to marketplace for authentic, fresh African raw ingredients! I\'d be happy to help you find what you\'re looking for. **Products:** We offer a variety of items in our current catalog. Here are some examples: - **Seafood:** Premium Dried Fish ($18.50 per bag), Fresh and flavorful. - **Protein:** Fresh African Snails ($24.99 per bag), Rich in nutrients and delicious. - **Vegetables:** Eru Leaves Bundle ($12.00 per bag), Perfect for various dishes. - **General:** African meat ($15.00 per bag), Sourced directly from trusted suppliers. - **General:** EGUSI ($10.00 per bag), A versatile and popular ingredient. If you\'re looking for something specific, please let me know the category that interests you, and I\'ll be glad to help you further. If you have a particular item in mind, please ask, and I\'ll check if it\'s available in our catalog. If uncertain, I\'ll let you know and connect you with our admin for confirmation. Is there a specific product you\'re interested in? I\'m here to help!', '2026-04-03 01:31:25'),
(11, 3, 'Products: Seafood: Premium Dried Fish ($18.50), Protein: Fresh African Snails ($24.99), Vegetables: Eru Leaves Bundle ($12.00. If you\'re looking for something else, please specify the category or the item. I\'ll check our catalog for availability.', '2026-04-03 01:38:29'),
(12, 3, 'I\'ll check with our team about the admin\'s availability. In the meantime, I can help you with any questions you have about our current product catalog. Here are some examples:\n* Seafood: Premium Dried Fish ($18.50 per bag)\n* Protein: Fresh African Snails ($24.99 per bag)\n* Vegetables: Eru Leaves Bundle ($12.00 per bag)\n* General: African meat ($15.00 per bag)\n* General: EGUSI ($10.00 per bag)\nIf you\'re looking for a specific item, please let me know, and I\'ll check if it\'s available in our catalog. If uncertain, I\'ll connect you with our admin for confirmation.\nAs for your question, our team is usually available during business hours. If you need assistance outside of those hours, please...', '2026-04-03 01:39:31'),
(13, 3, 'I\'ll connect you with our admin for confirmation on the availability of the specific item you\'re looking for. In the meantime, here are some examples of items we have in our current catalog:\n* Seafood: Premium Dried Fish ($18.50 per bag)\n* Protein: Fresh African Snails ($24.99 per bag)\n* Vegetables: Eru Leaves Bundle ($12.00 per bag)\n* General: African meat ($15.00 per bag)\n* General: EGUSI ($10.00 per bag)\nPlease let me know if you\'d like to know more about any of these items or if you have a specific item in mind. I\'ll check our catalog for availability and connect you with our admin for confirmation if uncertain.', '2026-04-03 01:40:20'),
(14, 3, 'Hello. Welcome to Bushfaller. Tell me the ingredient you need, and I will check our available products.', '2026-04-03 03:22:50'),
(15, 3, '@admin requested. I\'m here to help you find authentic African raw ingredients at Bushfaller. Here are some examples of items we have in our current catalog:\n* Seafood: Premium Dried Fish ($18.50 per bag)\n* Protein: Fresh African Snails ($24.99 per bag)\n* Vegetables: Eru Leaves Bundle ($12.00 per bag)\n* General: African meat ($15.00 per bag)\n* General: EGUSI ($10.00 per bag)\nIf you\'re looking for Galinha-piripiri or any other specific item, please let me know, and I\'ll check our catalog for availability. If uncertain, I\'ll connect you with our admin for confirmation.\nIs Galinha-piripiri categorized as seafood, protein, or vegetables in our catalog? Let me know, and I\'ll look it up for you.', '2026-04-03 03:23:30'),
(16, 3, 'Hello. Welcome to Bushfaller. Tell me the ingredient you need, and I will check our available products.', '2026-04-04 01:50:55'),
(17, 3, '@admin requested. Our catalog includes a variety of items, but Rice from Cameroon is not specifically listed. However, we have a range of authentic African raw foods. Our team can help source specific requests. Would you like me to connect you with admin to discuss your needs?\nHere are some examples of items we have in our current catalog:\n- Seafood: Premium Dried Fish ($18.50 per bag)\n- Protein: Fresh African Snails ($24.99 per bag)\n- Vegetables: Eru Leaves Bundle ($12.00 per bag)\n- General: African meat ($15.00 per bag)\n- General: EGUSI ($10.00 per bag)\nLet me know if you\'d like to know more about any of these items or if you have a specific rice in mind. I\'ll check our catalog for avai...', '2026-04-04 01:52:18'),
(18, 3, '@admin requested. I have escalated your chat to admin. They will assist you with sourcing Cameroonian rice. Please hang tight!', '2026-04-04 01:52:57'),
(19, 3, 'Hello. Welcome to Bushfaller. Tell me the ingredient you need, and I will check our available products.', '2026-04-06 12:04:17'),
(20, 3, 'I\'m a helpful customer support assistant for Bushfaller. Here are some items from our current catalog:\n- Seafood: Premium Dried Fish ($18.50 per bag)\n- Protein: Fresh African Snails ($24.99 per bag)\n- Vegetables: Eru Leaves Bundle ($12.00 per bag)\n- General: Ogbono seeds ($24.99 per bag)\nIf you\'re looking for Cameroonian rice, our team can help source it for you. Please let me know if you have a specific type in mind.\nIf you need more information about any of these items, just let me know. I\'ll be happy to help.\nDo you have a question about a different product or category? Let me know!', '2026-04-07 23:36:29'),
(21, 3, '\"@admin requested. I have escalated your chat to admin.\"', '2026-04-07 23:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `admin_chat_conversations`
--

CREATE TABLE `admin_chat_conversations` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `assigned_admin_id` int(11) DEFAULT NULL,
  `status` enum('open','taken','closed') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_chat_conversations`
--

INSERT INTO `admin_chat_conversations` (`id`, `customer_id`, `assigned_admin_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'closed', '2026-03-28 04:04:06', '2026-04-03 01:15:52'),
(2, 1, 1, 'taken', '2026-04-01 07:49:58', '2026-04-01 07:57:06'),
(3, 2, 1, 'taken', '2026-04-03 01:29:35', '2026-04-15 00:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `admin_chat_messages`
--

CREATE TABLE `admin_chat_messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `sender_type` enum('customer','admin') NOT NULL,
  `message` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_chat_messages`
--

INSERT INTO `admin_chat_messages` (`id`, `conversation_id`, `sender_id`, `sender_type`, `message`, `created_at`) VALUES
(1, 1, 2, 'customer', 'hello', '2026-03-28 04:09:13'),
(2, 1, 2, 'customer', 'ai', '2026-03-28 04:09:38'),
(3, 1, 2, 'customer', 'hi', '2026-03-28 04:12:20'),
(4, 1, 2, 'customer', 'i want an admin', '2026-03-28 04:13:00'),
(5, 1, 2, 'customer', 'what is bush faller about', '2026-03-28 04:13:51'),
(6, 1, 2, 'customer', 'gretting\'', '2026-03-28 04:14:36'),
(7, 1, 2, 'customer', 'hello', '2026-03-28 04:15:04'),
(8, 1, 2, 'customer', 'hi', '2026-03-28 04:16:04'),
(9, 1, 2, 'customer', 'what your name', '2026-03-28 04:16:42'),
(10, 1, 2, 'customer', 'hello', '2026-03-29 11:29:27'),
(11, 1, 2, 'customer', 'what do you mean', '2026-03-29 11:29:49'),
(12, 1, 2, 'customer', 'what are the available product', '2026-03-29 11:30:19'),
(13, 1, 2, 'customer', 'hello', '2026-03-29 11:35:05'),
(14, 1, 2, 'customer', 'what product you sell', '2026-03-29 11:37:41'),
(15, 1, 2, 'customer', 'who was the founder of the app', '2026-03-29 11:38:25'),
(16, 1, 2, 'customer', 'who is the founder of these plateform', '2026-03-29 23:17:57'),
(17, 1, 2, 'customer', 'what product are available', '2026-03-29 23:18:27'),
(18, 1, 2, 'customer', 'what products are available', '2026-03-29 23:24:31'),
(19, 1, 2, 'customer', 'is eru available', '2026-03-29 23:25:09'),
(20, 1, 1, 'admin', 'hello', '2026-04-01 07:39:13'),
(21, 1, 2, 'customer', 'HELLO', '2026-04-02 03:24:54'),
(22, 1, 2, 'customer', 'WHAT IS AVAIALBLE', '2026-04-02 03:56:06'),
(23, 3, 2, 'customer', 'hello', '2026-04-03 01:29:52'),
(24, 3, 2, 'customer', 'greeting', '2026-04-03 01:31:05'),
(25, 3, 2, 'customer', 'hello', '2026-04-03 01:38:20'),
(26, 3, 2, 'customer', 'is the admin online', '2026-04-03 01:39:06'),
(27, 3, 2, 'customer', 'i want to talk with the admin', '2026-04-03 01:40:07'),
(28, 3, 2, 'customer', 'HELLO', '2026-04-03 03:22:50'),
(29, 3, 2, 'customer', 'IS THERE GALIC', '2026-04-03 03:23:13'),
(30, 3, 2, 'customer', 'hello', '2026-04-04 01:50:55'),
(31, 3, 2, 'customer', 'i want to rice from cameroon', '2026-04-04 01:51:53'),
(32, 3, 2, 'customer', 'yes please', '2026-04-04 01:52:54'),
(33, 3, 1, 'admin', 'hello', '2026-04-04 01:56:22'),
(34, 3, 1, 'admin', 'greeting', '2026-04-06 11:51:41'),
(35, 3, 2, 'customer', 'hello', '2026-04-06 12:04:17'),
(36, 3, 2, 'customer', 'hee', '2026-04-06 12:07:31'),
(37, 3, 2, 'customer', '@ai', '2026-04-06 12:09:48'),
(38, 3, 2, 'customer', '@chatbot', '2026-04-06 12:10:31'),
(39, 3, 2, 'customer', '@agent', '2026-04-06 12:10:57'),
(40, 3, 2, 'customer', '@ai', '2026-04-07 23:36:08'),
(41, 3, 2, 'customer', 'i want to talk with the admin', '2026-04-07 23:37:08'),
(42, 3, 2, 'customer', 'hello', '2026-04-07 23:37:44'),
(43, 3, 2, 'customer', '@agent', '2026-04-07 23:38:06'),
(44, 3, 2, 'customer', 'hi', '2026-04-07 23:46:16'),
(45, 3, 2, 'customer', 'chatbot', '2026-04-07 23:46:42'),
(46, 3, 2, 'customer', 'hello', '2026-04-15 00:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `admin_online_status`
--

CREATE TABLE `admin_online_status` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('online','offline') DEFAULT 'offline',
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_conversations`
--

CREATE TABLE `chat_conversations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `needs_admin_help` tinyint(1) DEFAULT 0,
  `assigned_admin_id` int(11) DEFAULT NULL,
  `status` enum('Active','Closed','Assigned') DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(11) NOT NULL,
  `conversation_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `sender_type` enum('user','ai','admin') DEFAULT 'user',
  `message` text NOT NULL,
  `is_ai_generated` tinyint(1) DEFAULT 0,
  `faq_id_used` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `slug` varchar(64) NOT NULL,
  `title` varchar(180) NOT NULL,
  `content_html` longtext NOT NULL,
  `updated_by` varchar(191) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`slug`, `title`, `content_html`, `updated_by`, `created_at`, `updated_at`) VALUES
('about', 'About Us', '<h2>Who We Are</h2>\n<p>Bushfaller connects families, chefs, and food businesses with authentic African raw food ingredients through trusted sourcing and dependable delivery.</p>\n\n<h2>Our Mission</h2>\n<p>Our mission is to make premium African ingredients accessible worldwide while supporting responsible sourcing partners.</p>\n\n<h2>What Makes Us Different</h2>\n<ul>\n  <li>Direct relationships with verified farmers and processors</li>\n  <li>Quality checks and careful packaging before dispatch</li>\n  <li>Fast customer support through email and chat</li>\n</ul>\n\n<h2>Contact</h2>\n<p>For partnerships, bulk orders, or support, contact our team via the Contact page.</p>', NULL, '2026-04-04 01:16:26', '2026-04-04 01:16:26'),
('privacy', 'Privacy Policy', '<h2>1. Information We Collect</h2>\n<p>We collect information needed to process orders, provide support, and improve your experience, including account, delivery, and communication details.</p>\n\n<h2>2. How We Use Information</h2>\n<ul>\n  <li>To process and deliver orders</li>\n  <li>To communicate order and support updates</li>\n  <li>To improve product and service quality</li>\n</ul>\n\n<h2>3. Payment and Security</h2>\n<p>Payments are processed through trusted providers. We apply security best practices to protect account and order information.</p>\n\n<h2>4. Your Rights</h2>\n<p>You may request updates or deletion of your personal data by contacting support.</p>\n\n<h2>5. Policy Updates</h2>\n<p>We may update this policy periodically. Changes will be published on this page with an updated date.</p>', NULL, '2026-04-04 01:16:26', '2026-04-04 01:16:26');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `answer` text NOT NULL,
  `category` varchar(100) DEFAULT 'General',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`, `category`, `created_by`, `created_at`, `updated_at`) VALUES
(3, 'what is bush faller app', 'food sending website.', 'General', NULL, '2026-04-01 07:26:28', '2026-04-01 07:29:22'),
(4, 'What are your most popular African food products?', 'Our most popular African food products include jollof rice seasoning, plantain chips, and cassava flour.', 'Products', NULL, '2026-04-01 07:37:30', '2026-04-01 07:37:30'),
(5, 'Do you offer international shipping?', 'Yes, we offer international shipping to select countries. You can check if your country is eligible during the checkout process.', 'Shipping', NULL, '2026-04-01 07:37:32', '2026-04-01 07:37:32'),
(6, 'What payment methods do you accept?', 'We accept payments via credit/debit cards and PayPal for online orders. For offline orders, please contact our customer support for alternative payment options.', 'Payment', NULL, '2026-04-01 07:37:34', '2026-04-01 07:37:34'),
(7, 'How can I track my order?', 'Once your order is shipped, you will receive a tracking number via email. You can use this number to track your order on our website.', 'Shipping', NULL, '2026-04-01 07:37:36', '2026-04-01 07:37:36'),
(8, 'How can I contact customer support?', 'You can contact our customer support team by emailing support@bushfaller.com or by filling out the contact form on our website.', 'Support', NULL, '2026-04-01 07:37:40', '2026-04-01 07:37:40'),
(9, 'What payment methods are accepted on Bushfaller?', 'We accept various payment methods including credit/debit cards, PayPal, and more. You can choose your preferred option at checkout.', 'Payment', NULL, '2026-04-01 07:38:01', '2026-04-01 07:38:01'),
(10, 'How can I track my order from Bushfaller?', 'Once your order is shipped, you will receive a tracking number via email. You can use this tracking number to monitor the status of your delivery.', 'Order Tracking', NULL, '2026-04-01 07:38:04', '2026-04-01 07:38:04'),
(11, 'Do you offer international shipping for African food products?', 'Yes, we offer international shipping for our African food products. Simply select your country at checkout to see the shipping options available.', 'Shipping', NULL, '2026-04-01 07:38:06', '2026-04-01 07:38:06'),
(12, 'How can I place an order on Bushfaller?', 'To place an order on Bushfaller, simply browse our products, add items to your cart, and proceed to checkout.', 'Ordering', NULL, '2026-04-01 07:38:08', '2026-04-01 07:38:08'),
(13, 'What is the typical shipping time for orders from Bushfaller?', 'Our typical shipping time varies depending on your location. You can expect your order to arrive within 2-7 business days.', 'Shipping', NULL, '2026-04-01 07:38:10', '2026-04-01 07:38:10');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `reply` text DEFAULT NULL,
  `status` enum('Open','Replied') DEFAULT 'Open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_email` varchar(190) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message`, `reply`, `status`, `created_at`, `customer_email`) VALUES
(1, NULL, 'hello', NULL, 'Open', '2026-03-26 10:29:58', NULL),
(2, 2, 'HELLO', NULL, 'Open', '2026-04-06 16:01:45', NULL),
(3, 2, 'hello', NULL, 'Open', '2026-04-15 00:15:47', 'jesuspeace514@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `audience` enum('user','admin') NOT NULL,
  `type` varchar(60) NOT NULL DEFAULT 'general',
  `title` varchar(190) NOT NULL,
  `body` text DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `audience`, `type`, `title`, `body`, `link`, `is_read`, `read_at`, `created_at`) VALUES
(24, 2, 'user', 'chat', 'Support replied in your chat', 'You have a new response from an admin.', '/chat', 1, '2026-04-04 23:39:47', '2026-04-04 01:56:22'),
(27, 2, 'user', 'order', 'Order #2 status updated', 'Your order is now marked as Shipped.', '/orders/2', 1, '2026-04-06 15:25:16', '2026-04-06 02:58:36'),
(28, 2, 'user', 'order', 'Order #1 status updated', 'Your order is now marked as Shipped.', '/orders/1', 1, '2026-04-06 15:25:16', '2026-04-06 02:58:47'),
(29, 2, 'user', 'order', 'Order #2 status updated', 'Your order is now marked as Delivered.', '/orders/2', 1, '2026-04-06 15:25:16', '2026-04-06 10:27:30'),
(31, 2, 'user', 'order', 'Order #1 status updated', 'Your order is now marked as Delivered.', '/orders/1', 1, '2026-04-06 15:25:16', '2026-04-06 11:05:04'),
(33, 2, 'user', 'chat', 'Support replied in your chat', 'You have a new response from an admin.', '/chat', 1, '2026-04-06 15:25:16', '2026-04-06 11:51:41'),
(53, NULL, 'admin', 'order', 'New order BF-20260414-RGZ589K36Z', 'PayPal payment captured successfully (57.49 USD).', '/admin/orders', 0, NULL, '2026-04-14 23:58:14'),
(54, NULL, 'admin', 'chat', 'New customer chat message', 'A customer sent a new message in support chat.', '/admin/chat?conversationId=3', 0, NULL, '2026-04-15 00:04:48'),
(55, NULL, 'admin', 'contact', 'New customer message', 'User One sent a new contact message.', '/admin/messages', 0, NULL, '2026-04-15 00:15:47'),
(56, NULL, 'admin', 'order', 'New order BF-20260422-53U937EJUU', 'PayPal payment captured successfully (78.99 USD).', '/admin/orders', 0, NULL, '2026-04-22 09:45:28'),
(57, 2, 'user', 'order', 'Order BF-20260414-RGZ589K36Z status updated', 'Your order is now marked as Pending.', '/orders/BF-20260414-RGZ589K36Z', 0, NULL, '2026-07-15 14:12:07');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('Pending','Paid','Shipped','Delivered') DEFAULT 'Pending',
  `address` text NOT NULL,
  `phone` varchar(40) NOT NULL,
  `country` varchar(80) NOT NULL,
  `customer_name` varchar(120) NOT NULL,
  `customer_email` varchar(190) NOT NULL,
  `payment_id` varchar(120) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `paypal_order_id` varchar(120) DEFAULT NULL,
  `paypal_transaction_id` varchar(120) DEFAULT NULL,
  `received_confirmed_at` timestamp NULL DEFAULT NULL,
  `public_order_id` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `address`, `phone`, `country`, `customer_name`, `customer_email`, `payment_id`, `created_at`, `paypal_order_id`, `paypal_transaction_id`, `received_confirmed_at`, `public_order_id`) VALUES
(1, 2, 21.50, 'Delivered', 't4t4t4dfgggrgggge', '+237 8877889', 'Germany', 'User One', 'user1@gmail.com', NULL, '2026-04-06 02:39:23', '70S95478GH6918509', '5NY75309EE988444A', NULL, 'BF-20260406-7A5D30C938'),
(2, 2, 24.99, 'Delivered', 'Dispensaire messassi\n000', '+237 651342166', 'Cameroon', 'User One', 'user1@gmail.com', NULL, '2026-04-06 02:54:24', '24626608WH2246358', '5MW84847F0478825C', '2026-04-06 11:00:51', 'BF-20260406-7A5E085438'),
(3, 2, 14.00, 'Paid', 'Mulango street fiango kumba', '+237 673315282', 'Cameroon', 'User One', 'user1@gmail.com', NULL, '2026-04-06 11:31:00', '1YW24463DW510714G', '1F195664K4887731S', NULL, 'BF-20260406-7A5E0C4E38'),
(4, 2, 18.50, 'Paid', 'Mulango street fiango kumba, 000, Kumba, Southwest, 0000, Note: dddddddddddddddddddddddddddddddddddddddddddddddddd', '+1 673315282', 'Cameroon', 'User One', 'user1@gmail.com', NULL, '2026-04-08 00:20:09', '0FJ10115VJ466182W', '6N857148VY029771X', NULL, 'BF-20260408-7A5E0E8F38'),
(5, 2, 14.00, 'Paid', 'Dispensaire messassi, 000, Yaounde, Central, 00000', '+1 06 51 34 21 66', 'Cameroon', 'User One', 'user1@gmail.com', NULL, '2026-04-08 00:56:39', '4D3445328M981212K', '22L1725964435970U', NULL, 'BF-20260408-7A5E10A438'),
(6, 2, 140.00, 'Paid', 'Mulango street, Mulango street, Kumba, Central, 00000', '+1 650228743', 'Bahrain', 'User One', 'user1@gmail.com', NULL, '2026-04-08 01:07:05', '8UR59170VE932052P', '53B00399NR7328543', NULL, 'BF-20260408-7A5E129038'),
(7, 2, 126.00, 'Paid', 'Mulango street fiango kumba, Kumba, Southwest, 0000', '+2 673315282', 'Cameroon', 'User One', 'user1@gmail.com', NULL, '2026-04-08 01:10:12', '03612855K4251474G', '8PK71792MX647505D', NULL, 'BF-20260408-7A5E146638'),
(8, 2, 57.49, 'Pending', 'Dispensaire messassi, 000, Yaounde, Central, 00000', '+237 651342166', 'Cameroon', 'User One', 'user1@gmail.com', NULL, '2026-04-14 23:58:14', '0KS75091UA522304Y', '2B73035176316535L', NULL, 'BF-20260414-RGZ589K36Z'),
(9, 2, 78.99, 'Paid', 'Mulango street fiango kumba, Kumba, Southwest, 0000', '+237 651342166', 'Cameroon', 'nkem collins', 'user1@gmail.com', NULL, '2026-04-22 09:45:27', '5BC205664E002662H', '9Y415113A9036350Y', NULL, 'BF-20260422-53U937EJUU');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `product_name_snapshot` varchar(190) NOT NULL,
  `product_image_snapshot` text NOT NULL,
  `transport_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quantity_packages` int(11) NOT NULL DEFAULT 1,
  `unit_type` enum('pcs','kg') NOT NULL DEFAULT 'pcs',
  `unit_value` decimal(10,3) NOT NULL DEFAULT 1.000,
  `package_name` varchar(50) NOT NULL DEFAULT 'pack'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `price`, `product_name_snapshot`, `product_image_snapshot`, `transport_fee`, `quantity_packages`, `unit_type`, `unit_value`, `package_name`) VALUES
(1, 1, 30, 18.50, 'Garry', '/uploads/1775345199608-9893f3e6-28a9-4821-b6b1-03196973bf94.png', 3.00, 1, 'pcs', 1.000, 'bag'),
(2, 2, 8, 24.99, 'Ogbono seeds', '/uploads/1775342161760-60da91b9-e590-4995-b60a-9b9bce4417d8.png', 0.00, 1, 'pcs', 1.000, 'bag'),
(3, 3, 35, 12.00, 'dry fish/bunga', '/uploads/1775342525110-13bcfebb-0d80-4370-9c3b-2e4dad393c00.png', 2.00, 1, 'pcs', 1.000, 'bag'),
(4, 4, 7, 18.50, 'Premium Dried Fish', '/uploads/1775034538773-55743dc9-381b-46d7-8fb9-deff93ef4998.png', 0.00, 1, 'pcs', 1.000, 'bag'),
(5, 5, 35, 12.00, 'dry fish/bunga', '/uploads/1775342525110-13bcfebb-0d80-4370-9c3b-2e4dad393c00.png', 2.00, 1, 'pcs', 1.000, 'bag'),
(6, 6, 35, 12.00, 'dry fish/bunga', '/uploads/1775342525110-13bcfebb-0d80-4370-9c3b-2e4dad393c00.png', 2.00, 10, 'pcs', 1.000, 'bag'),
(7, 7, 35, 12.00, 'dry fish/bunga', '/uploads/1775342525110-13bcfebb-0d80-4370-9c3b-2e4dad393c00.png', 2.00, 9, 'pcs', 1.000, 'bag'),
(8, 8, 35, 12.00, 'dry fish/bunga', '/uploads/1775342525110-13bcfebb-0d80-4370-9c3b-2e4dad393c00.png', 2.00, 2, 'pcs', 1.000, 'bag'),
(9, 8, 31, 24.99, 'Fresh African Snails', 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?q=80&w=1200&auto=format&fit=crop', 4.50, 1, 'pcs', 1.000, 'bag'),
(10, 9, 35, 12.00, 'dry fish/bunga', '/uploads/1775342525110-13bcfebb-0d80-4370-9c3b-2e4dad393c00.png', 2.00, 2, 'pcs', 1.000, 'bag'),
(11, 9, 30, 18.50, 'Garry', '/uploads/1775345199608-9893f3e6-28a9-4821-b6b1-03196973bf94.png', 3.00, 1, 'pcs', 1.000, 'bag'),
(12, 9, 31, 24.99, 'Fresh African Snails', 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?q=80&w=1200&auto=format&fit=crop', 4.50, 1, 'pcs', 1.000, 'bag');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_checkout_sessions`
--

CREATE TABLE `paypal_checkout_sessions` (
  `id` int(11) NOT NULL,
  `paypal_order_id` varchar(120) NOT NULL,
  `user_id` int(11) NOT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'USD',
  `verified_total` decimal(10,2) NOT NULL,
  `items_json` longtext NOT NULL,
  `status` enum('created','consumed','expired') NOT NULL DEFAULT 'created',
  `consumed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paypal_checkout_sessions`
--

INSERT INTO `paypal_checkout_sessions` (`id`, `paypal_order_id`, `user_id`, `currency`, `verified_total`, `items_json`, `status`, `consumed_at`, `created_at`) VALUES
(1, '5SH3231767627251R', 2, 'USD', 43.49, '[{\"productId\":18,\"quantity\":1,\"unitPrice\":12,\"unitTransportFee\":2},{\"productId\":17,\"quantity\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5}]', 'created', NULL, '2026-03-31 22:50:03'),
(2, '5VD14149EF679262S', 2, 'USD', 43.49, '[{\"productId\":18,\"quantity\":1,\"unitPrice\":12,\"unitTransportFee\":2},{\"productId\":17,\"quantity\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5}]', 'created', NULL, '2026-03-31 22:53:07'),
(3, '6LY774359L135725M', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-03 02:16:22'),
(4, '80D50190S7826540L', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-03 02:38:33'),
(5, '8YA23860NJ4478048', 2, 'USD', 18.50, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-03 02:56:48'),
(6, '139200031V820452T', 2, 'USD', 18.50, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-03 02:57:19'),
(7, '54F12895YL834612T', 2, 'USD', 18.50, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-03 03:00:11'),
(8, '91426267U42738639', 2, 'USD', 18.50, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-03 03:19:06'),
(9, '7S610793YD8670743', 2, 'USD', 18.50, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-03 03:19:17'),
(10, '3W5851897W683781A', 2, 'USD', 40.00, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 03:06:21'),
(11, '2PB3983137040541L', 2, 'USD', 40.00, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 03:10:34'),
(12, '3X5960693N4694159', 2, 'USD', 40.00, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 03:30:07'),
(13, '5NE66393B6177224X', 2, 'USD', 40.00, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 03:30:28'),
(14, '28H19805VP634202M', 2, 'USD', 40.00, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 03:47:55'),
(15, '8T612863VU110600U', 2, 'USD', 40.00, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 03:48:21'),
(16, '0A703345YA6220534', 2, 'USD', 40.00, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 03:48:43'),
(17, '457017273F170171X', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 03:53:29'),
(18, '0SG14964BV6848625', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 03:58:20'),
(19, '9FH88670J8433901G', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 04:06:26'),
(20, '7L289845TL511645U', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 04:06:56'),
(21, '7VJ05832ER829390T', 2, 'USD', 40.00, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 04:14:03'),
(22, '4C567766MX038725Y', 2, 'USD', 40.00, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 04:28:35'),
(23, '177740916N786620R', 2, 'USD', 40.00, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 04:30:50'),
(24, '65P610779C477891E', 2, 'USD', 75.98, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":11,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":8,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 04:42:12'),
(25, '15V453592R295354R', 2, 'USD', 75.98, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":11,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":8,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 04:46:40'),
(26, '37180269RU3625825', 2, 'USD', 75.98, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":11,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":8,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-04 04:46:56'),
(27, '9TL58769XV078894F', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-05 11:01:42'),
(28, '65X25434VE840203M', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-05 11:02:43'),
(29, '7LG65043586411912', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-05 11:02:50'),
(30, '8J282500HB506061C', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-05 11:03:23'),
(31, '16E10361RR452194A', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-05 23:54:48'),
(32, '7KR26112UN999325S', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:08:22'),
(33, '1NU35188822571428', 2, 'USD', 64.99, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:12:01'),
(34, '69F18483YB7183524', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:20:51'),
(35, '78696850TG4189207', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:27:35'),
(36, '06T740517H576641H', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:28:02'),
(37, '4LV459684X517644R', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:28:17'),
(38, '1YT912189Y955172A', 2, 'USD', 64.99, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:28:45'),
(39, '2F377178AU700904P', 2, 'USD', 64.99, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:30:23'),
(40, '9NH49702Y1556233V', 2, 'USD', 64.99, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:31:04'),
(41, '4B5050284F611545X', 2, 'USD', 64.99, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:31:20'),
(42, '836628263G259584V', 2, 'USD', 64.99, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:31:48'),
(43, '1CB11327V3394552B', 2, 'USD', 64.99, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:42:47'),
(44, '6CA39523VU141715D', 2, 'USD', 64.99, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 00:58:37'),
(45, '1V379150UG1493809', 2, 'USD', 64.99, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 01:06:04'),
(46, '98P592457S193340V', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 01:27:00'),
(47, '0VM33435UL9665712', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 01:36:44'),
(48, '0UU281866S059815G', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 01:53:24'),
(49, '8R9486312R770864M', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 01:56:10'),
(50, '23A72340HU387583B', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 02:01:02'),
(51, '8L883827SH092592L', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 02:03:08'),
(52, '1Y885162NY4332700', 2, 'USD', 35.50, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 02:16:37'),
(53, '4JA88209W5155122H', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 02:19:57'),
(54, '3LM93401TN896001C', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 02:26:20'),
(55, '0SU626816M697790T', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 02:28:30'),
(56, '06K03122ET737022P', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 02:29:52'),
(57, '1UL500124W780403D', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 02:34:56'),
(58, '70S95478GH6918509', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'consumed', '2026-04-06 02:39:23', '2026-04-06 02:39:11'),
(59, '24626608WH2246358', 2, 'USD', 24.99, '[{\"productId\":8,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'consumed', '2026-04-06 02:54:24', '2026-04-06 02:53:58'),
(60, '8RP199984L547162X', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 11:23:54'),
(61, '9BH107737U6257847', 2, 'USD', 21.50, '[{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 11:24:24'),
(62, '0WV57383UG8922639', 2, 'USD', 14.00, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-06 11:25:46'),
(63, '1YW24463DW510714G', 2, 'USD', 14.00, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'consumed', '2026-04-06 11:31:00', '2026-04-06 11:30:28'),
(64, '0FJ10115VJ466182W', 2, 'USD', 18.50, '[{\"productId\":7,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'consumed', '2026-04-08 00:20:09', '2026-04-08 00:19:43'),
(65, '1PT20787EM693594U', 2, 'USD', 14.00, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-08 00:26:16'),
(66, '60068956JA381163P', 2, 'USD', 14.00, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-08 00:27:29'),
(67, '768723473X896764L', 2, 'USD', 14.00, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-08 00:30:28'),
(68, '69X32819LE815102R', 2, 'USD', 14.00, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-08 00:34:52'),
(69, '1E718102SD575915X', 2, 'USD', 14.00, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-08 00:35:02'),
(70, '4D3445328M981212K', 2, 'USD', 14.00, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'consumed', '2026-04-08 00:56:39', '2026-04-08 00:56:23'),
(71, '8UR59170VE932052P', 2, 'USD', 140.00, '[{\"productId\":35,\"quantityPackages\":10,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'consumed', '2026-04-08 01:07:05', '2026-04-08 01:06:51'),
(72, '03612855K4251474G', 2, 'USD', 126.00, '[{\"productId\":35,\"quantityPackages\":9,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'consumed', '2026-04-08 01:10:12', '2026-04-08 01:10:00'),
(73, '60905528XV868351S', 2, 'USD', 57.49, '[{\"productId\":35,\"quantityPackages\":2,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-14 23:49:32'),
(74, '6X924991N1295984J', 2, 'USD', 57.49, '[{\"productId\":35,\"quantityPackages\":2,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-14 23:50:14'),
(75, '9LS492274T420815A', 2, 'USD', 57.49, '[{\"productId\":35,\"quantityPackages\":2,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-14 23:51:07'),
(76, '0KS75091UA522304Y', 2, 'USD', 57.49, '[{\"productId\":35,\"quantityPackages\":2,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'consumed', '2026-04-14 23:58:14', '2026-04-14 23:58:00'),
(77, '7WC00189X16195727', 2, 'USD', 75.15, '[{\"productId\":35,\"quantityPackages\":1,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":2,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":29,\"quantityPackages\":1,\"unitPrice\":15,\"unitTransportFee\":3.15,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-04-22 09:41:33'),
(78, '5BC205664E002662H', 2, 'USD', 78.99, '[{\"productId\":35,\"quantityPackages\":2,\"unitPrice\":12,\"unitTransportFee\":2,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":30,\"quantityPackages\":1,\"unitPrice\":18.5,\"unitTransportFee\":3,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1},{\"productId\":31,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":4.5,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'consumed', '2026-04-22 09:45:28', '2026-04-22 09:44:42'),
(79, '7XL902584P2996829', 2, 'USD', 24.99, '[{\"productId\":8,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-07-03 10:13:35'),
(80, '61L36688BY6462214', 2, 'USD', 24.99, '[{\"productId\":8,\"quantityPackages\":1,\"unitPrice\":24.99,\"unitTransportFee\":0,\"packageName\":\"bag\",\"unitType\":\"pcs\",\"unitValue\":1}]', 'created', NULL, '2026-07-15 15:51:58');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_webhook_events`
--

CREATE TABLE `paypal_webhook_events` (
  `id` int(11) NOT NULL,
  `event_id` varchar(120) NOT NULL,
  `event_type` varchar(120) NOT NULL,
  `resource_id` varchar(120) DEFAULT NULL,
  `paypal_order_id` varchar(120) DEFAULT NULL,
  `payload` longtext NOT NULL,
  `reconciliation_status` enum('processed','unmatched') NOT NULL DEFAULT 'processed',
  `matched_order_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `processed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(190) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL,
  `featured` tinyint(1) DEFAULT 0,
  `category` varchar(80) DEFAULT 'General',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `transport_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `image_zoom` int(11) NOT NULL DEFAULT 100,
  `package_name` varchar(50) NOT NULL DEFAULT 'pack',
  `unit_type` enum('pcs','kg') NOT NULL DEFAULT 'pcs',
  `unit_value` decimal(10,3) NOT NULL DEFAULT 1.000,
  `stock_packages` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `description`, `featured`, `category`, `created_at`, `transport_fee`, `image_zoom`, `package_name`, `unit_type`, `unit_value`, `stock_packages`) VALUES
(2, 'Crayfish/Njanga', 24.99, '/uploads/1775341555524-7716956d-6b5d-44ce-b6b8-d07eb9c13a78.png', 'crayfish directly from our local market ,taste from home.', 1, 'Seafood', '2026-03-26 01:00:37', 0.00, 100, 'pack', 'kg', 1.000, 34),
(6, 'Eru Leaves Bundle', 12.00, '/uploads/1775035074740-0012e86e-3500-4346-80fe-004b77bf24ac.png', 'Authentic eru leaves, ready for your favorite traditional recipe.', 0, 'Vegetables', '2026-03-28 03:58:14', 0.00, 97, 'bag', 'pcs', 1.000, 80),
(7, 'Premium Dried Fish', 18.50, '/uploads/1775034538773-55743dc9-381b-46d7-8fb9-deff93ef4998.png', 'Sun-dried fish with rich flavor for soups and sauces.', 1, 'Seafood', '2026-03-29 11:32:59', 0.00, 100, 'bag', 'pcs', 1.000, 49),
(8, 'Ogbono seeds', 24.99, '/uploads/1775342161760-60da91b9-e590-4995-b60a-9b9bce4417d8.png', 'Ogbono seeds perfect for African soup delicacies.', 1, 'General', '2026-03-29 11:32:59', 0.00, 100, 'bag', 'pcs', 1.000, 34),
(11, 'Fresh African Snails', 24.99, '/uploads/1775034085876-7b081267-b89a-4ea6-ad94-707e556b1e1e.png', 'Carefully cleaned and packed giant snails for premium meals.', 1, 'Protein', '2026-03-30 00:39:03', 4.50, 100, 'bag', 'pcs', 1.000, 35),
(28, 'EGUSI', 10.00, '/uploads/1775035270859-f45b83d6-448f-4a23-b1bc-9fc3eda3a8de.png', 'The best Egusi directly to you.', 0, 'General', '2026-04-01 09:22:03', 0.00, 100, 'bag', 'pcs', 1.000, 0),
(29, 'African meat', 15.00, '/uploads/1775035424351-5809bfc8-180a-4ad4-af2d-3959d7236835.png', 'Best home meats', 0, 'General', '2026-04-01 09:24:10', 3.15, 100, 'bag', 'pcs', 1.000, 12),
(30, 'Garry', 18.50, '/uploads/1775345199608-9893f3e6-28a9-4821-b6b1-03196973bf94.png', 'Have a test from home with our home made garry just for you.', 1, 'Seafood', '2026-04-02 00:49:49', 3.00, 94, 'bag', 'pcs', 1.000, 48),
(31, 'Fresh African Snails', 24.99, 'https://images.unsplash.com/photo-1467003909585-2f8a72700288?q=80&w=1200&auto=format&fit=crop', 'Carefully cleaned and packed giant snails for premium meals.', 1, 'Protein', '2026-04-02 00:49:49', 4.50, 100, 'bag', 'pcs', 1.000, 33),
(32, 'Bitter leaves ', 12.00, '/uploads/1775342376758-21f2ec3f-3d66-4ceb-972c-7ef6bcaf0549.png', 'Authentic sweet Bitter leaves, ready for your favorite traditional recipe.', 0, 'Vegetables', '2026-04-02 00:49:49', 2.00, 100, 'bag', 'pcs', 1.000, 80),
(35, 'dry fish/bunga', 12.00, '/uploads/1775342525110-13bcfebb-0d80-4370-9c3b-2e4dad393c00.png', 'dry fish localy known as dry bunga  available for you.', 0, 'Vegetables', '2026-04-02 01:58:54', 2.00, 100, 'bag', 'pcs', 1.000, 55);

-- --------------------------------------------------------

--
-- Table structure for table `traffic_events`
--

CREATE TABLE `traffic_events` (
  `id` bigint(20) NOT NULL,
  `path` varchar(255) NOT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `session_key` char(64) NOT NULL,
  `country` varchar(60) DEFAULT NULL,
  `load_ms` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `traffic_events`
--

INSERT INTO `traffic_events` (`id`, `path`, `referrer`, `user_agent`, `session_key`, `country`, `load_ms`, `created_at`) VALUES
(1, '/admin/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 22418, '2026-04-04 02:36:41'),
(2, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 22418, '2026-04-04 02:36:41'),
(3, '/admin/traffic', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 22418, '2026-04-04 02:36:46'),
(4, '/admin/traffic', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4130, '2026-04-04 02:50:20'),
(5, '/admin/traffic', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4130, '2026-04-04 02:51:42'),
(6, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7138, '2026-04-04 03:01:47'),
(7, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 907, '2026-04-04 03:01:58'),
(8, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 0, '2026-04-04 03:02:06'),
(9, '/dashboard', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1238, '2026-04-04 03:02:20'),
(10, '/dashboard', 'http://localhost:3000/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 20246, '2026-04-04 03:03:01'),
(11, '/cart', 'http://localhost:3000/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 20246, '2026-04-04 03:05:09'),
(12, '/checkout', 'http://localhost:3000/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 20246, '2026-04-04 03:05:41'),
(13, '/checkout', 'http://localhost:3000/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1141, '2026-04-04 03:47:44'),
(14, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1696, '2026-04-04 03:49:25'),
(15, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3455, '2026-04-04 04:08:50'),
(16, '/checkout', 'http://localhost:3000/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 759, '2026-04-04 04:10:09'),
(17, '/checkout', 'http://localhost:3000/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 6794, '2026-04-04 04:11:38'),
(18, '/checkout', 'http://localhost:3000/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 6861, '2026-04-04 04:13:35'),
(19, '/signin', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1271, '2026-04-04 04:27:16'),
(20, '/dashboard', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1271, '2026-04-04 04:27:22'),
(21, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1643, '2026-04-04 04:27:37'),
(22, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1643, '2026-04-04 04:28:21'),
(23, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1643, '2026-04-04 04:28:24'),
(24, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1719, '2026-04-04 04:37:45'),
(25, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 0, '2026-04-04 04:38:18'),
(26, '/signin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4977, '2026-04-04 04:39:18'),
(27, '/signin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13685, '2026-04-04 04:40:25'),
(28, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13685, '2026-04-04 04:40:31'),
(29, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13685, '2026-04-04 04:40:49'),
(30, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13685, '2026-04-04 04:41:03'),
(31, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13685, '2026-04-04 04:41:18'),
(32, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13685, '2026-04-04 04:41:26'),
(33, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13685, '2026-04-04 04:41:41'),
(34, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13685, '2026-04-04 04:41:55'),
(35, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1606, '2026-04-04 22:23:06'),
(36, '/', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4006, '2026-04-04 22:23:17'),
(37, '/products', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4006, '2026-04-04 22:23:41'),
(38, '/admin-login', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1794, '2026-04-04 22:24:09'),
(39, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1794, '2026-04-04 22:24:21'),
(40, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1794, '2026-04-04 22:24:49'),
(41, '/admin/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1794, '2026-04-04 22:25:02'),
(42, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1009, '2026-04-04 22:44:39'),
(43, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1009, '2026-04-04 22:45:19'),
(44, '/products?page=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1009, '2026-04-04 22:45:32'),
(45, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1009, '2026-04-04 22:45:45'),
(46, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1391, '2026-04-04 22:46:28'),
(47, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1199, '2026-04-04 23:20:21'),
(48, '/products?page=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1199, '2026-04-04 23:20:34'),
(49, '/products?page=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 679, '2026-04-04 23:20:41'),
(50, '/products?page=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-04 23:20:44'),
(51, '/products?page=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 0, '2026-04-04 23:21:02'),
(52, '/products?page=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3838, '2026-04-04 23:21:22'),
(53, '/products?page=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 0, '2026-04-04 23:21:40'),
(54, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1047, '2026-04-04 23:21:52'),
(55, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1228, '2026-04-04 23:23:27'),
(56, '/products/30', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1228, '2026-04-04 23:24:29'),
(57, '/admin-login', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4089, '2026-04-04 23:24:41'),
(58, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4089, '2026-04-04 23:24:44'),
(59, '/admin/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4089, '2026-04-04 23:24:48'),
(60, '/admin/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4089, '2026-04-04 23:24:52'),
(61, '/admin/messages/manage', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4089, '2026-04-04 23:24:59'),
(62, '/admin/traffic', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4089, '2026-04-04 23:25:08'),
(63, '/admin/faq', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4089, '2026-04-04 23:25:21'),
(64, '/admin/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4089, '2026-04-04 23:25:30'),
(65, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1228, '2026-04-04 23:29:42'),
(66, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 934, '2026-04-04 23:29:47'),
(67, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 826, '2026-04-04 23:30:22'),
(68, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 790, '2026-04-04 23:30:45'),
(69, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 783, '2026-04-04 23:30:49'),
(70, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 826, '2026-04-04 23:30:52'),
(71, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 934, '2026-04-04 23:30:55'),
(72, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1018, '2026-04-04 23:30:59'),
(73, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 812, '2026-04-04 23:31:14'),
(74, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 826, '2026-04-04 23:31:42'),
(75, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 978, '2026-04-04 23:32:24'),
(76, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1004, '2026-04-04 23:32:46'),
(77, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 793, '2026-04-04 23:33:02'),
(78, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1204, '2026-04-04 23:33:49'),
(79, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1204, '2026-04-04 23:34:37'),
(80, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1204, '2026-04-04 23:34:41'),
(81, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 925, '2026-04-04 23:34:55'),
(82, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 925, '2026-04-04 23:36:35'),
(83, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 925, '2026-04-04 23:36:39'),
(84, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 487, '2026-04-04 23:36:47'),
(85, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:36:57'),
(86, '/products?page=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:37:36'),
(87, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:37:51'),
(88, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:38:47'),
(89, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:38:54'),
(90, '/signin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:38:55'),
(91, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:01'),
(92, '/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:08'),
(93, '/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:15'),
(94, '/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:23'),
(95, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:24'),
(96, '/dashboard/profile', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:28'),
(97, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:32'),
(98, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:34'),
(99, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:37'),
(100, '/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:41'),
(101, '/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:46'),
(102, '/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:50'),
(103, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:39:58'),
(104, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:40:03'),
(105, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:40:06'),
(106, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:40:08'),
(107, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:40:21'),
(108, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:40:27'),
(109, '/signin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:40:43'),
(110, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:40:49'),
(111, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:40:52'),
(112, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:40:53'),
(113, '/signin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:41:13'),
(114, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:41:17'),
(115, '/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:41:20'),
(116, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:41:24'),
(117, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:41:26'),
(118, '/signin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:41:27'),
(119, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 487, '2026-04-04 23:41:36'),
(120, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 487, '2026-04-04 23:41:39'),
(121, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 487, '2026-04-04 23:41:41'),
(122, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 951, '2026-04-04 23:41:49'),
(123, '/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 951, '2026-04-04 23:41:53'),
(124, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1004, '2026-04-04 23:42:02'),
(125, '/dashboard', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1004, '2026-04-04 23:42:07'),
(126, '/products', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1004, '2026-04-04 23:42:14'),
(127, '/cart', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1004, '2026-04-04 23:42:27'),
(128, '/checkout', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1004, '2026-04-04 23:42:29'),
(129, '/cart', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1004, '2026-04-04 23:42:45'),
(130, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1387, '2026-04-04 23:42:58'),
(131, '/checkout', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1004, '2026-04-04 23:43:10'),
(132, '/admin/inventory', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4089, '2026-04-04 23:44:12'),
(133, '/admin-login?error=forbidden', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1419, '2026-04-04 23:44:27'),
(134, '/dashboard', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1419, '2026-04-04 23:44:39'),
(135, '/', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1419, '2026-04-04 23:44:54'),
(136, '/products', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1419, '2026-04-04 23:45:13'),
(137, '/orders', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1419, '2026-04-04 23:45:20'),
(138, '/about', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1419, '2026-04-04 23:45:29'),
(139, '/', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1419, '2026-04-04 23:45:33'),
(140, '/products', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 113599, '2026-04-05 10:56:22'),
(141, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18736, '2026-04-05 10:56:22'),
(142, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18736, '2026-04-05 10:56:24'),
(143, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18736, '2026-04-05 10:57:06'),
(144, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18736, '2026-04-05 10:58:01'),
(145, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 0, '2026-04-05 10:59:47'),
(146, '/signin', 'http://localhost:3000/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 0, '2026-04-05 10:59:48'),
(147, '/dashboard', 'http://localhost:3000/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3135, '2026-04-05 11:00:07'),
(148, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 14288, '2026-04-05 11:00:49'),
(149, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 14288, '2026-04-05 11:00:57'),
(150, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 14288, '2026-04-05 11:01:08'),
(151, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 14288, '2026-04-05 11:01:12'),
(152, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 14288, '2026-04-05 11:03:46'),
(153, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 27847, '2026-04-05 23:25:30'),
(154, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 27847, '2026-04-05 23:25:32'),
(155, '/products?page=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 27847, '2026-04-05 23:32:54'),
(156, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 27847, '2026-04-05 23:32:57'),
(157, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2239, '2026-04-05 23:33:28'),
(158, '/products?page=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2239, '2026-04-05 23:38:41'),
(159, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2239, '2026-04-05 23:38:46'),
(160, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1831, '2026-04-05 23:38:54'),
(161, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1831, '2026-04-05 23:39:06'),
(162, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1831, '2026-04-05 23:39:17'),
(163, '/about', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1831, '2026-04-05 23:40:22'),
(164, '/privacy', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1831, '2026-04-05 23:41:19'),
(165, '/about', 'http://localhost:3000/about', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3863, '2026-04-05 23:43:09'),
(166, '/privacy', 'http://localhost:3000/about', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3863, '2026-04-05 23:43:38'),
(167, '/privacy', 'http://localhost:3000/about', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1997, '2026-04-05 23:47:12'),
(168, '/products', 'http://localhost:3000/about', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1997, '2026-04-05 23:47:36'),
(169, '/chat', 'http://localhost:3000/about', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1997, '2026-04-05 23:47:42'),
(170, '/admin-login?error=forbidden', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1451, '2026-04-05 23:47:52'),
(171, '/', 'http://localhost:3000/admin-login?error=forbidden', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1214, '2026-04-05 23:47:58'),
(172, '/admin-login', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 727, '2026-04-05 23:48:14'),
(173, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 727, '2026-04-05 23:48:54'),
(174, '/admin', 'http://localhost:3000/admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 15048, '2026-04-05 23:51:28'),
(175, '/admin/content', 'http://localhost:3000/admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 15048, '2026-04-05 23:51:36'),
(176, '/admin/products', 'http://localhost:3000/admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 15048, '2026-04-05 23:51:58'),
(177, '/admin/inventory', 'http://localhost:3000/admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 15048, '2026-04-05 23:51:59'),
(178, '/', 'http://localhost:3000/admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 15048, '2026-04-05 23:52:11'),
(179, '/admin/notifications', 'http://localhost:3000/admin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 15048, '2026-04-05 23:52:15'),
(180, '/', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1501, '2026-04-05 23:52:37'),
(181, '/cart', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1501, '2026-04-05 23:52:42'),
(182, '/checkout', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1501, '2026-04-05 23:52:49'),
(183, '/signin', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1501, '2026-04-05 23:52:52'),
(184, '/dashboard', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1501, '2026-04-05 23:53:00'),
(185, '/contact', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1501, '2026-04-05 23:53:13'),
(186, '/', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1501, '2026-04-05 23:53:33'),
(187, '/orders', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1501, '2026-04-05 23:53:40'),
(188, '/cart', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1501, '2026-04-05 23:53:43'),
(189, '/checkout', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1501, '2026-04-05 23:53:48'),
(190, '/checkout', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 546, '2026-04-05 23:53:56'),
(191, '/cart', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 546, '2026-04-05 23:54:01'),
(192, '/checkout', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 546, '2026-04-05 23:54:04'),
(193, '/checkout', 'http://localhost:3000/admin/notifications', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4519, '2026-04-06 00:07:37'),
(194, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 5226, '2026-04-06 00:09:35'),
(195, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 58039, '2026-04-06 00:11:12');
INSERT INTO `traffic_events` (`id`, `path`, `referrer`, `user_agent`, `session_key`, `country`, `load_ms`, `created_at`) VALUES
(196, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 0, '2026-04-06 00:12:20'),
(197, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 30136, '2026-04-06 00:18:47'),
(198, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 0, '2026-04-06 00:20:30'),
(199, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 568, '2026-04-06 00:27:47'),
(200, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 985, '2026-04-06 00:30:42'),
(201, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 38060, '2026-04-06 00:33:48'),
(202, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 44062, '2026-04-06 00:33:50'),
(203, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 28703, '2026-04-06 00:39:15'),
(204, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3940, '2026-04-06 00:41:09'),
(205, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 836, '2026-04-06 00:41:46'),
(206, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 693, '2026-04-06 00:41:57'),
(207, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1560, '2026-04-06 00:46:53'),
(208, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 31093, '2026-04-06 00:55:45'),
(209, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 21673, '2026-04-06 00:57:24'),
(210, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 5080, '2026-04-06 00:57:45'),
(211, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1016, '2026-04-06 01:05:45'),
(212, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 16234, '2026-04-06 01:25:40'),
(213, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1584, '2026-04-06 01:26:43'),
(214, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1118, '2026-04-06 01:35:55'),
(215, '/cart', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1118, '2026-04-06 01:36:01'),
(216, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/cart', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1076, '2026-04-06 01:36:06'),
(217, '/dashboard', 'http://localhost:3000/cart', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1076, '2026-04-06 01:36:11'),
(218, '/products', 'http://localhost:3000/cart', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1076, '2026-04-06 01:36:16'),
(219, '/cart', 'http://localhost:3000/cart', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1076, '2026-04-06 01:36:25'),
(220, '/checkout', 'http://localhost:3000/cart', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1076, '2026-04-06 01:36:27'),
(221, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3138, '2026-04-06 01:39:05'),
(222, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 50080, '2026-04-06 01:45:45'),
(223, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1952, '2026-04-06 01:48:22'),
(224, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 0, '2026-04-06 01:51:08'),
(225, '/signin', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 55662, '2026-04-06 01:51:11'),
(226, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 36317, '2026-04-06 01:51:14'),
(227, '/dashboard', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 55662, '2026-04-06 01:51:42'),
(228, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11432, '2026-04-06 01:52:15'),
(229, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11432, '2026-04-06 01:52:55'),
(230, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11432, '2026-04-06 01:53:04'),
(231, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2104, '2026-04-06 01:57:10'),
(232, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1204, '2026-04-06 02:00:49'),
(233, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 68226, '2026-04-06 02:13:15'),
(234, '/signin', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1160, '2026-04-06 02:15:51'),
(235, '/dashboard', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1160, '2026-04-06 02:15:56'),
(236, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1491, '2026-04-06 02:16:11'),
(237, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1491, '2026-04-06 02:16:14'),
(238, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1491, '2026-04-06 02:16:17'),
(239, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1353, '2026-04-06 02:24:45'),
(240, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 702, '2026-04-06 02:25:57'),
(241, '/signin', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 702, '2026-04-06 02:28:53'),
(242, '/dashboard', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 702, '2026-04-06 02:28:57'),
(243, '/cart', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 702, '2026-04-06 02:29:00'),
(244, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 702, '2026-04-06 02:29:02'),
(245, '/signin', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 702, '2026-04-06 02:29:03'),
(246, '/dashboard', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 702, '2026-04-06 02:29:06'),
(247, '/cart', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 702, '2026-04-06 02:29:08'),
(248, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 702, '2026-04-06 02:29:09'),
(249, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 860, '2026-04-06 02:29:17'),
(250, '/cart', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 860, '2026-04-06 02:29:22'),
(251, '/products', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 860, '2026-04-06 02:29:26'),
(252, '/cart', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 860, '2026-04-06 02:29:30'),
(253, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 860, '2026-04-06 02:29:32'),
(254, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7442, '2026-04-06 02:32:20'),
(255, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 9400, '2026-04-06 02:32:22'),
(256, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3510, '2026-04-06 02:38:21'),
(257, '/checkout/success?orderId=1', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3510, '2026-04-06 02:39:46'),
(258, '/orders', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3510, '2026-04-06 02:40:13'),
(259, '/orders/1', 'http://localhost:3000/orders/1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 29053, '2026-04-06 02:44:04'),
(260, '/signin', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 26366, '2026-04-06 02:51:53'),
(261, '/dashboard', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 26366, '2026-04-06 02:52:10'),
(262, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1961, '2026-04-06 02:52:26'),
(263, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1961, '2026-04-06 02:52:45'),
(264, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1961, '2026-04-06 02:53:00'),
(265, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1961, '2026-04-06 02:53:19'),
(266, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1961, '2026-04-06 02:53:27'),
(267, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1961, '2026-04-06 02:53:35'),
(268, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1961, '2026-04-06 02:53:42'),
(269, '/checkout/success?orderId=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1961, '2026-04-06 02:54:29'),
(270, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1961, '2026-04-06 02:54:34'),
(271, '/admin-login?error=forbidden', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 12408, '2026-04-06 02:56:50'),
(272, '/', 'http://localhost:3000/admin-login?error=forbidden', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 6352, '2026-04-06 02:57:10'),
(273, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 29608, '2026-04-06 02:57:10'),
(274, '/admin-login', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3346, '2026-04-06 02:57:18'),
(275, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3346, '2026-04-06 02:57:20'),
(276, '/admin-login', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3346, '2026-04-06 02:57:21'),
(277, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3346, '2026-04-06 02:57:25'),
(278, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3346, '2026-04-06 02:58:04'),
(279, '/admin/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3346, '2026-04-06 02:58:18'),
(280, '/admin/orders', 'http://localhost:3000/admin/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 15758, '2026-04-06 07:01:31'),
(281, '/admin/notifications', 'http://localhost:3000/admin/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 15758, '2026-04-06 08:24:24'),
(282, '/admin/orders', 'http://localhost:3000/admin/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 15758, '2026-04-06 08:24:37'),
(283, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 5515, '2026-04-06 08:25:05'),
(284, '/admin/orders', 'http://localhost:3000/admin/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9641, '2026-04-06 08:26:02'),
(285, '/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 5515, '2026-04-06 08:26:17'),
(286, '/orders/1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 5515, '2026-04-06 08:27:26'),
(287, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 5515, '2026-04-06 08:41:36'),
(288, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 10735, '2026-04-06 10:18:30'),
(289, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 10735, '2026-04-06 10:20:09'),
(290, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 10735, '2026-04-06 10:20:26'),
(291, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 10735, '2026-04-06 10:20:32'),
(292, '/admin/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 10735, '2026-04-06 10:20:48'),
(293, '/admin/traffic', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 10735, '2026-04-06 10:21:13'),
(294, '/admin/messages/manage', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 10735, '2026-04-06 10:21:55'),
(295, '/admin/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 10735, '2026-04-06 10:22:06'),
(296, '/admin/content', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 10735, '2026-04-06 10:22:21'),
(297, '/', 'http://localhost:3000/admin/content', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1666, '2026-04-06 10:22:35'),
(298, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4497, '2026-04-06 10:22:43'),
(299, '/dashboard', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4497, '2026-04-06 10:22:51'),
(300, '/orders/2', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4497, '2026-04-06 10:23:19'),
(301, '/admin-login?error=forbidden', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4962, '2026-04-06 10:25:57'),
(302, '/', 'http://localhost:3000/admin-login?error=forbidden', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2284, '2026-04-06 10:26:03'),
(303, '/admin-login', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 685, '2026-04-06 10:26:10'),
(304, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 685, '2026-04-06 10:26:18'),
(305, '/admin/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 685, '2026-04-06 10:27:16'),
(306, '/admin/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 685, '2026-04-06 10:27:23'),
(307, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1951, '2026-04-06 10:28:02'),
(308, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1951, '2026-04-06 10:28:07'),
(309, '/orders/1', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1951, '2026-04-06 10:28:10'),
(310, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1951, '2026-04-06 10:28:30'),
(311, '/orders/2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1951, '2026-04-06 10:28:33'),
(312, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1951, '2026-04-06 10:31:51'),
(313, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1951, '2026-04-06 10:31:52'),
(314, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1951, '2026-04-06 10:31:54'),
(315, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 685, '2026-04-06 10:34:46'),
(316, '/admin/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 685, '2026-04-06 10:34:48'),
(317, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 17701, '2026-04-06 10:44:19'),
(318, '/orders/2', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 17701, '2026-04-06 10:44:29'),
(319, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 17701, '2026-04-06 10:44:33'),
(320, '/orders/2', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 17701, '2026-04-06 10:45:13'),
(321, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 17701, '2026-04-06 10:46:08'),
(322, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 0, '2026-04-06 10:46:13'),
(323, '/orders/2', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 30318, '2026-04-06 10:46:20'),
(324, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 30318, '2026-04-06 10:50:37'),
(325, '/products', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 30318, '2026-04-06 10:50:43'),
(326, '/products', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 0, '2026-04-06 10:55:29'),
(327, '/admin/orders', 'http://localhost:3000/admin/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13952, '2026-04-06 10:56:22'),
(328, '/orders', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 23161, '2026-04-06 10:59:57'),
(329, '/orders/2', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 23161, '2026-04-06 11:00:11'),
(330, '/admin/orders', 'http://localhost:3000/admin/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1855, '2026-04-06 11:01:21'),
(331, '/admin/orders', 'http://localhost:3000/admin/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 43078, '2026-04-06 11:05:05'),
(332, '/admin/notifications', 'http://localhost:3000/admin/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 43078, '2026-04-06 11:06:29'),
(333, '/admin/orders', 'http://localhost:3000/admin/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 43078, '2026-04-06 11:06:33'),
(334, '/products', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 23161, '2026-04-06 11:07:05'),
(335, '/cart', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 23161, '2026-04-06 11:08:04'),
(336, '/products', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 23161, '2026-04-06 11:08:28'),
(337, '/cart', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 23161, '2026-04-06 11:08:44'),
(338, '/checkout', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 23161, '2026-04-06 11:09:11'),
(339, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 8075, '2026-04-06 11:17:40'),
(340, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 8075, '2026-04-06 11:17:45'),
(341, '/admin/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 8075, '2026-04-06 11:17:55'),
(342, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3549, '2026-04-06 11:18:35'),
(343, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3549, '2026-04-06 11:18:39'),
(344, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3549, '2026-04-06 11:18:43'),
(345, '/', 'http://localhost:3000/admin/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 0, '2026-04-06 11:24:55'),
(346, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2180, '2026-04-06 11:24:59'),
(347, '/dashboard', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2180, '2026-04-06 11:25:05'),
(348, '/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2180, '2026-04-06 11:25:22'),
(349, '/cart', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2180, '2026-04-06 11:25:29'),
(350, '/checkout', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2180, '2026-04-06 11:25:34'),
(351, '/checkout', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2878, '2026-04-06 11:30:18'),
(352, '/checkout/success?orderId=3', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2878, '2026-04-06 11:31:11'),
(353, '/orders', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2878, '2026-04-06 11:31:20'),
(354, '/orders/3', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2878, '2026-04-06 11:31:37'),
(355, '/notifications', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2878, '2026-04-06 11:32:04'),
(356, '/admin-login?error=forbidden', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1258, '2026-04-06 11:32:22'),
(357, '/', 'http://localhost:3000/admin-login?error=forbidden', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3986, '2026-04-06 11:32:32'),
(358, '/admin-login', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 822, '2026-04-06 11:32:43'),
(359, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 822, '2026-04-06 11:32:48'),
(360, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 822, '2026-04-06 11:33:16'),
(361, '/admin/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 822, '2026-04-06 11:33:19'),
(362, '/admin/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 6506, '2026-04-06 11:37:16'),
(363, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 6506, '2026-04-06 11:51:11'),
(364, '/admin/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 6506, '2026-04-06 11:51:17'),
(365, '/admin/chat?conversationId=3', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 6506, '2026-04-06 11:51:24'),
(366, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 6170, '2026-04-06 11:52:12'),
(367, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 0, '2026-04-06 11:52:19'),
(368, '/dashboard', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3526, '2026-04-06 11:52:25'),
(369, '/chat', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3526, '2026-04-06 12:04:02'),
(370, '/chat', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3364, '2026-04-06 12:10:18'),
(371, '/admin/chat?conversationId=3', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7969, '2026-04-06 12:42:57'),
(372, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7969, '2026-04-06 12:44:36'),
(373, '/admin/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7969, '2026-04-06 12:44:47'),
(374, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7969, '2026-04-06 12:44:50'),
(375, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7969, '2026-04-06 12:44:52'),
(376, '/admin/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7969, '2026-04-06 12:44:55'),
(377, '/admin/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7969, '2026-04-06 13:28:48'),
(378, '/admin/content', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7969, '2026-04-06 15:22:32'),
(379, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7969, '2026-04-06 15:22:44'),
(380, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7969, '2026-04-06 15:22:46'),
(381, '/admin/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7969, '2026-04-06 15:23:27'),
(382, '/admin/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7969, '2026-04-06 15:23:36');
INSERT INTO `traffic_events` (`id`, `path`, `referrer`, `user_agent`, `session_key`, `country`, `load_ms`, `created_at`) VALUES
(383, '/notifications', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3364, '2026-04-06 15:24:55'),
(384, '/chat', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3364, '2026-04-06 15:24:59'),
(385, '/notifications', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3364, '2026-04-06 15:25:05'),
(386, '/chat', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3364, '2026-04-06 15:26:26'),
(387, '/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3364, '2026-04-06 15:32:21'),
(388, '/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 3456, '2026-04-06 15:32:28'),
(389, '/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 0, '2026-04-06 15:32:42'),
(390, '/cart', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 2734, '2026-04-06 15:33:09'),
(391, '/', 'http://localhost:3000/admin/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 10243, '2026-04-06 15:34:03'),
(392, '/products', 'http://localhost:3000/admin/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 10243, '2026-04-06 15:34:07'),
(393, '/products?page=2', 'http://localhost:3000/admin/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 10243, '2026-04-06 15:34:21'),
(394, '/admin-login', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2467, '2026-04-06 15:34:41'),
(395, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2467, '2026-04-06 15:34:46'),
(396, '/admin/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2467, '2026-04-06 15:34:48'),
(397, '/admin/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 959, '2026-04-06 15:36:48'),
(398, '/cart', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 2592, '2026-04-06 15:37:11'),
(399, '/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 2592, '2026-04-06 15:37:21'),
(400, '/products?page=2', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 2592, '2026-04-06 15:37:32'),
(401, '/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 2592, '2026-04-06 15:37:38'),
(402, '/chat', 'http://localhost:3000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2592, '2026-04-06 15:43:45'),
(403, '/signin?callbackUrl=%2Fchat', 'http://localhost:3000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2592, '2026-04-06 15:43:51'),
(404, '/dashboard', 'http://localhost:3000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2592, '2026-04-06 15:44:07'),
(405, '/cart', 'http://localhost:3000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2592, '2026-04-06 15:44:25'),
(406, '/products', 'http://localhost:3000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2592, '2026-04-06 15:44:29'),
(407, '/cart', 'http://localhost:3000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2592, '2026-04-06 15:44:47'),
(408, '/chat', 'http://localhost:3000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2592, '2026-04-06 15:45:07'),
(409, '/dashboard/profile', 'http://localhost:3000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2592, '2026-04-06 15:55:49'),
(410, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 2592, '2026-04-06 15:58:52'),
(411, '/contact', 'http://localhost:3000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2592, '2026-04-06 16:00:43'),
(412, '/cart', 'http://localhost:3000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2592, '2026-04-06 16:03:15'),
(413, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2592, '2026-04-06 16:07:38'),
(414, '/cart', 'http://localhost:3000/', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2592, '2026-04-06 16:07:39'),
(415, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9886, '2026-04-07 23:31:47'),
(416, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9886, '2026-04-07 23:32:53'),
(417, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9886, '2026-04-07 23:32:56'),
(418, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9886, '2026-04-07 23:33:01'),
(419, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9886, '2026-04-07 23:33:12'),
(420, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9886, '2026-04-07 23:33:22'),
(421, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9886, '2026-04-07 23:33:32'),
(422, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9886, '2026-04-07 23:33:39'),
(423, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9886, '2026-04-07 23:33:55'),
(424, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9886, '2026-04-07 23:34:03'),
(425, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9886, '2026-04-07 23:34:07'),
(426, '/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9886, '2026-04-07 23:35:10'),
(427, '/', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1844, '2026-04-07 23:35:30'),
(428, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1000, '2026-04-07 23:35:37'),
(429, '/dashboard', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1000, '2026-04-07 23:35:42'),
(430, '/chat', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1000, '2026-04-07 23:35:48'),
(431, '/chat', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 20209, '2026-04-07 23:45:57'),
(432, '/cart', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 20209, '2026-04-07 23:49:06'),
(433, '/cart', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2207, '2026-04-07 23:49:53'),
(434, '/checkout', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2207, '2026-04-07 23:50:01'),
(435, '/dashboard/profile', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2207, '2026-04-08 00:00:32'),
(436, '/cart', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2207, '2026-04-08 00:03:05'),
(437, '/checkout', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2207, '2026-04-08 00:03:08'),
(438, '/checkout', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3118, '2026-04-08 00:08:24'),
(439, '/dashboard/profile', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3118, '2026-04-08 00:08:37'),
(440, '/dashboard/profile', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4101, '2026-04-08 00:10:22'),
(441, '/dashboard/profile', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4309, '2026-04-08 00:12:07'),
(442, '/dashboard/profile', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 5581, '2026-04-08 00:14:45'),
(443, '/cart', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 5581, '2026-04-08 00:15:06'),
(444, '/checkout', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 5581, '2026-04-08 00:15:08'),
(445, '/checkout/success?orderId=4', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 5581, '2026-04-08 00:20:23'),
(446, '/orders', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 5581, '2026-04-08 00:20:34'),
(447, '/orders/4', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 5581, '2026-04-08 00:21:11'),
(448, '/', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 5581, '2026-04-08 00:22:05'),
(449, '/cart', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 5581, '2026-04-08 00:22:06'),
(450, '/products', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 5581, '2026-04-08 00:22:10'),
(451, '/cart', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 5581, '2026-04-08 00:22:19'),
(452, '/cart', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 5581, '2026-04-08 00:24:36'),
(453, '/cart', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4662, '2026-04-08 00:25:02'),
(454, '/checkout', 'http://localhost:3000/chat', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 4662, '2026-04-08 00:25:06'),
(455, '/checkout', 'http://localhost:3000/chat', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 12675, '2026-04-08 00:33:36'),
(456, '/checkout', 'http://localhost:3000/chat', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 12039, '2026-04-08 00:38:04'),
(457, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 14062, '2026-04-08 00:47:34'),
(458, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 15543, '2026-04-08 00:54:59'),
(459, '/checkout/success?orderId=5', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 15543, '2026-04-08 00:56:41'),
(460, '/orders', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 15543, '2026-04-08 00:56:51'),
(461, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21805, '2026-04-08 01:03:28'),
(462, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:04:38'),
(463, '/products', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:05:02'),
(464, '/cart', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:05:16'),
(465, '/checkout', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:05:22'),
(466, '/cart', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:05:43'),
(467, '/checkout', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:06:10'),
(468, '/checkout/success?orderId=6', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:07:06'),
(469, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:07:14'),
(470, '/orders/6', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:08:18'),
(471, '/products', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:09:01'),
(472, '/cart', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:09:08'),
(473, '/checkout', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:09:32'),
(474, '/checkout/success?orderId=7', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:10:13'),
(475, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:10:20'),
(476, '/orders/7', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:10:24'),
(477, '/', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:10:57'),
(478, '/products', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:10:59'),
(479, '/cart', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:11:19'),
(480, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:11:55'),
(481, '/orders/7', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:11:57'),
(482, '/', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:12:40'),
(483, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 11399, '2026-04-08 01:12:47'),
(484, '/orders/7', 'http://localhost:3000/orders', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 11399, '2026-04-08 01:13:00'),
(485, '/orders/7', 'http://localhost:3000/orders', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 0, '2026-04-08 01:16:06'),
(486, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18295, '2026-04-08 01:16:12'),
(487, '/orders', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1271, '2026-04-08 01:16:20'),
(488, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 688, '2026-04-08 01:16:48'),
(489, '/orders/7', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 688, '2026-04-08 01:17:15'),
(490, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 688, '2026-04-08 01:17:18'),
(491, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 938, '2026-04-08 01:17:25'),
(492, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1922, '2026-04-08 01:19:38'),
(493, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 729, '2026-04-08 01:19:58'),
(494, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 729, '2026-04-08 08:01:11'),
(495, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 729, '2026-04-08 08:02:43'),
(496, '/products/8', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 729, '2026-04-08 08:03:34'),
(497, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 729, '2026-04-08 08:24:01'),
(498, '/', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 0, '2026-04-08 08:25:52'),
(499, '/products', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 0, '2026-04-08 08:25:53'),
(500, '/products?page=2', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 0, '2026-04-08 08:26:02'),
(501, '/cart', NULL, 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 125969, '2026-04-08 08:27:38'),
(502, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 125969, '2026-04-08 08:27:48'),
(503, '/products?q=olcro&category=All', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1491, '2026-04-08 08:27:58'),
(504, '/products?q=fih&category=All', 'http://localhost:3000/products?q=olcro&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 627, '2026-04-08 08:28:14'),
(505, '/products?q=fish&category=All', 'http://localhost:3000/products?q=fih&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-08 08:28:20'),
(506, '/cart', 'http://localhost:3000/products?q=fih&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-08 08:30:28'),
(507, '/', 'http://localhost:3000/products?q=fih&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-08 08:30:32'),
(508, '/products', 'http://localhost:3000/products?q=fih&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-08 08:30:39'),
(509, '/cart', 'http://localhost:3000/products?q=fih&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-08 08:31:53'),
(510, '/', 'http://localhost:3000/products?q=fih&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-08 08:31:57'),
(511, '/products', 'http://localhost:3000/products?q=fih&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-08 08:32:02'),
(512, '/orders', 'http://localhost:3000/products?q=fih&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-08 08:32:05'),
(513, '/orders/3', 'http://localhost:3000/products?q=fih&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-08 08:34:58'),
(514, '/cart', 'http://localhost:3000/products?q=fih&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-08 08:35:06'),
(515, '/', 'http://localhost:3000/products?q=fih&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-08 08:37:22'),
(516, '/products', 'http://localhost:3000/products?q=fih&category=All', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 820, '2026-04-08 08:37:28'),
(517, '/', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1525, '2026-04-08 08:37:33'),
(518, '/admin-login', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:37:58'),
(519, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:38:07'),
(520, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:38:13'),
(521, '/admin/chat?conversationId=3', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:38:30'),
(522, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:38:56'),
(523, '/admin/messages/manage', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:39:09'),
(524, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:43:14'),
(525, '/admin/chat?conversationId=3', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:43:17'),
(526, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:43:23'),
(527, '/admin/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:43:31'),
(528, '/admin/traffic', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:45:17'),
(529, '/admin/messages', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:45:33'),
(530, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:49:59'),
(531, '/admin/traffic', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:50:03'),
(532, '/admin/messages', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:50:03'),
(533, '/admin/content', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 08:50:12'),
(534, '/admin/faq', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 09:06:32'),
(535, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 09:49:44'),
(536, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 09:49:49'),
(537, '/admin/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 09:49:54'),
(538, '/admin/inventory', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 18593, '2026-04-08 09:50:24'),
(539, '/admin/inventory', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2372, '2026-04-08 10:09:34'),
(540, '/admin/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2372, '2026-04-08 10:09:40'),
(541, '/admin/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2372, '2026-04-08 10:12:13'),
(542, '/', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1643, '2026-04-08 10:12:26'),
(543, '/admin/notifications', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1643, '2026-04-08 10:12:29'),
(544, '/admin', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1643, '2026-04-08 10:12:37'),
(545, '/admin/products', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1643, '2026-04-08 10:12:42'),
(546, '/admin/inventory', 'http://localhost:3000/orders', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1643, '2026-04-08 10:12:44'),
(547, '/', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:12:54'),
(548, '/products', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:13:16'),
(549, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:13:21'),
(550, '/checkout', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:13:24'),
(551, '/signin', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:13:52'),
(552, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:14:07'),
(553, '/checkout', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:14:17'),
(554, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:15:22'),
(555, '/products', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:15:48'),
(556, '/orders', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:15:52'),
(557, '/orders/1', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:16:03'),
(558, '/', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:16:10'),
(559, '/products', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:16:12'),
(560, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:16:13'),
(561, '/orders', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:16:21'),
(562, '/orders/2', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:16:24'),
(563, '/', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:17:04'),
(564, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:17:13'),
(565, '/checkout', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:17:15'),
(566, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:17:50'),
(567, '/', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:24:07'),
(568, '/products', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:24:16');
INSERT INTO `traffic_events` (`id`, `path`, `referrer`, `user_agent`, `session_key`, `country`, `load_ms`, `created_at`) VALUES
(569, '/orders', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:24:21'),
(570, '/orders/7', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:24:36'),
(571, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:24:48'),
(572, '/orders', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:52:39'),
(573, '/chat', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:52:44'),
(574, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:52:59'),
(575, '/', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:53:27'),
(576, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:54:06'),
(577, '/products', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:54:54'),
(578, '/orders', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:55:14'),
(579, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:55:17'),
(580, '/orders', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:55:40'),
(581, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 10:55:43'),
(582, '/', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 11:19:13'),
(583, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 11:19:16'),
(584, '/products', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 11:19:19'),
(585, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 11:19:21'),
(586, '/', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 11:25:10'),
(587, '/products', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 11:25:19'),
(588, '/orders', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 11:25:22'),
(589, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 11:25:47'),
(590, '/', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 11:26:00'),
(591, '/orders', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 11:26:03'),
(592, '/cart', 'http://localhost:3000/admin/inventory', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1030, '2026-04-08 11:26:11'),
(593, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2373, '2026-04-10 13:04:53'),
(594, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2373, '2026-04-10 13:04:53'),
(595, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2373, '2026-04-10 13:05:45'),
(596, '/', 'http://localhost:3000/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1894, '2026-04-10 13:07:04'),
(597, '/admin-login', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1817, '2026-04-10 13:07:10'),
(598, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1817, '2026-04-10 13:07:18'),
(599, '/admin/notifications', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1817, '2026-04-10 13:07:20'),
(600, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1817, '2026-04-10 13:07:44'),
(601, '/admin/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1817, '2026-04-10 13:07:46'),
(602, '/admin/inventory', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1817, '2026-04-10 13:07:51'),
(603, '/admin/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1817, '2026-04-10 13:07:58'),
(604, '/admin/traffic', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1817, '2026-04-10 13:08:07'),
(605, '/admin/messages/manage', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1817, '2026-04-10 13:08:13'),
(606, '/admin/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1817, '2026-04-10 13:08:16'),
(607, '/admin/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 1817, '2026-04-10 13:08:23'),
(608, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 4294, '2026-04-10 13:08:59'),
(609, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 4294, '2026-04-10 13:09:04'),
(610, '/products?page=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 4294, '2026-04-10 13:09:16'),
(611, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 4294, '2026-04-10 13:09:21'),
(612, '/orders', NULL, 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 4294, '2026-04-10 13:18:56'),
(613, '/orders/7', NULL, 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 4294, '2026-04-10 13:19:06'),
(614, '/', 'http://localhost:3000/orders/7', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2762, '2026-04-10 13:19:21'),
(615, '/products', 'http://localhost:3000/orders/7', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2762, '2026-04-10 13:19:31'),
(616, '/faq', 'http://localhost:3000/orders/7', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2762, '2026-04-10 13:20:11'),
(617, '/chat', 'http://localhost:3000/orders/7', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2762, '2026-04-10 13:20:30'),
(618, '/signin?callbackUrl=%2Fchat', 'http://localhost:3000/orders/7', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 2762, '2026-04-10 13:20:38'),
(619, '/signin?callbackUrl=%2Fchat', 'http://localhost:3000/orders/7', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 4141, '2026-04-10 13:21:48'),
(620, '/cart', 'http://localhost:3000/orders/7', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 4141, '2026-04-10 13:23:50'),
(621, '/products', 'http://localhost:3000/orders/7', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 4141, '2026-04-10 13:23:59'),
(622, '/cart', 'http://localhost:3000/orders/7', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 4141, '2026-04-10 13:24:05'),
(623, '/checkout', 'http://localhost:3000/orders/7', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 4141, '2026-04-10 13:24:11'),
(624, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 1607, '2026-04-10 13:24:23'),
(625, '/dashboard', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 1607, '2026-04-10 13:24:32'),
(626, '/products', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Linux; Android 8.0.0; SM-G955U Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Mobile Safari/537.36 Edg/146.0.0.0', '48cfb41acb5e23aeda6f98d205df15b2396c12ff42cae081e8ccc4cc36db9009', NULL, 1607, '2026-04-10 13:25:15'),
(627, '/admin/chat', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3017, '2026-04-10 13:42:07'),
(628, '/admin/messages/manage', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3017, '2026-04-10 13:42:10'),
(629, '/admin/products', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3017, '2026-04-10 13:42:12'),
(630, '/admin/messages', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3017, '2026-04-10 13:42:17'),
(631, '/admin/notifications', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3017, '2026-04-10 13:42:20'),
(632, '/admin/messages/manage', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3017, '2026-04-10 13:42:23'),
(633, '/admin/chat', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3017, '2026-04-10 13:42:25'),
(634, '/admin/content', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3017, '2026-04-10 13:42:27'),
(635, '/orders', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1607, '2026-04-13 08:19:29'),
(636, '/', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1607, '2026-04-13 08:19:34'),
(637, '/products', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1607, '2026-04-13 08:19:39'),
(638, '/orders', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1607, '2026-04-13 08:19:40'),
(639, '/cart', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1607, '2026-04-13 08:19:42'),
(640, '/orders', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1607, '2026-04-13 08:23:27'),
(641, '/products', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1607, '2026-04-13 08:23:28'),
(642, '/', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1607, '2026-04-13 08:23:34'),
(643, '/orders', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1607, '2026-04-13 08:23:38'),
(644, '/cart', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1607, '2026-04-13 08:23:41'),
(645, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1607, '2026-04-13 08:23:45'),
(646, '/', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 1607, '2026-04-13 08:40:49'),
(647, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36 Edg/146.0.0.0', 'cd1f007a39814796737f41e1d1de155766dca672902dd2bcf2210610e88b149a', NULL, 0, '2026-04-13 08:40:55'),
(648, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3342, '2026-04-13 09:29:45'),
(649, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3342, '2026-04-13 09:29:48'),
(650, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3342, '2026-04-13 09:29:52'),
(651, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3342, '2026-04-13 09:29:55'),
(652, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3342, '2026-04-13 09:29:57'),
(653, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3342, '2026-04-13 09:29:59'),
(654, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3342, '2026-04-13 13:08:08'),
(655, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3342, '2026-04-13 13:08:09'),
(656, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3342, '2026-04-13 13:08:10'),
(657, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3342, '2026-04-13 13:08:13'),
(658, '/products?q=rice&category=All', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 910, '2026-04-13 13:08:19'),
(659, '/cart', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 910, '2026-04-13 13:09:33'),
(660, '/orders', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 910, '2026-04-13 13:09:47'),
(661, '/cart', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 910, '2026-04-13 13:09:49'),
(662, '/', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 910, '2026-04-13 13:34:46'),
(663, '/products', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 910, '2026-04-13 13:34:48'),
(664, '/cart', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 910, '2026-04-13 13:35:03'),
(665, '/checkout', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 910, '2026-04-13 13:35:07'),
(666, '/cart', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 910, '2026-04-13 13:35:10'),
(667, '/cart', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2718, '2026-04-13 16:25:51'),
(668, '/', 'http://localhost:3000/cart', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 2718, '2026-04-14 10:05:53'),
(669, '/products', 'http://localhost:3000/cart', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 2718, '2026-04-14 10:06:35'),
(670, '/products', 'http://localhost:3000/cart', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 0, '2026-04-14 10:07:39'),
(671, '/cart', 'http://localhost:3000/cart', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 88147, '2026-04-14 10:09:50'),
(672, '/checkout', 'http://localhost:3000/cart', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.5 Mobile/15E148 Safari/604.1', '7994e1d4820655d2d2213d60fa0140441a3c7a1568b5655a9445c8bdc70d06fb', NULL, 88147, '2026-04-14 10:10:01'),
(673, '/', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 10:12:59'),
(674, '/cart', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 10:13:07'),
(675, '/', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 11:18:29'),
(676, '/products', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:12'),
(677, '/orders', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:14'),
(678, '/signin', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:15'),
(679, '/cart', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:17'),
(680, '/', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:21'),
(681, '/products', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:22'),
(682, '/orders', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:23'),
(683, '/signin', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:24'),
(684, '/cart', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:31'),
(685, '/', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:33'),
(686, '/products', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:34'),
(687, '/orders', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:36'),
(688, '/signin', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:36'),
(689, '/', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:40'),
(690, '/products', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:44'),
(691, '/cart', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:47'),
(692, '/', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 13093, '2026-04-14 12:54:49'),
(693, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:46:02'),
(694, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:46:21'),
(695, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:46:31'),
(696, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:47:03'),
(697, '/signin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:47:15'),
(698, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:47:24'),
(699, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:47:29'),
(700, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:47:31'),
(701, '/signin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:47:43'),
(702, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:47:50'),
(703, '/cart', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:47:54'),
(704, '/checkout', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:47:56'),
(705, '/signin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 21473, '2026-04-14 23:48:17'),
(706, '/signin', 'http://localhost:3000/signin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 940, '2026-04-14 23:48:31'),
(707, '/dashboard', 'http://localhost:3000/signin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 940, '2026-04-14 23:48:38'),
(708, '/cart', 'http://localhost:3000/signin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 940, '2026-04-14 23:48:43'),
(709, '/checkout', 'http://localhost:3000/signin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 940, '2026-04-14 23:48:45'),
(710, '/checkout', 'http://localhost:3000/signin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 0, '2026-04-14 23:57:16'),
(711, '/checkout/success?orderId=BF-20260414-RGZ589K36Z', 'http://localhost:3000/signin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7984, '2026-04-14 23:58:15'),
(712, '/orders', 'http://localhost:3000/signin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7984, '2026-04-14 23:58:22'),
(713, '/products', 'http://localhost:3000/signin', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 7984, '2026-04-14 23:58:47'),
(714, '/products?q=ricd&category=All', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 848, '2026-04-14 23:58:54'),
(715, '/contact', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 848, '2026-04-15 00:02:54'),
(716, '/products', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 848, '2026-04-15 00:04:09'),
(717, '/products?q=rice&category=All', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3158, '2026-04-15 00:04:22'),
(718, '/chat', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3158, '2026-04-15 00:04:27'),
(719, '/products?q=rice&category=All', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3158, '2026-04-15 00:05:04'),
(720, '/contact', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 3158, '2026-04-15 00:05:16'),
(721, '/contact', 'http://localhost:3000/contact', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 14418, '2026-04-15 00:09:27'),
(722, '/contact', 'http://localhost:3000/contact', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 9963, '2026-04-15 00:15:39'),
(723, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '86c12fb72b3ee865dd565751553b7b45b0e0fb9c80bb8d093bf10447674b8139', NULL, 8582, '2026-04-15 01:02:52'),
(724, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 5959, '2026-04-15 13:17:37'),
(725, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 5959, '2026-04-15 13:17:46'),
(726, '/orders/BF-20260414-RGZ589K36Z', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 5959, '2026-04-15 13:17:56'),
(727, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 20579, '2026-04-19 09:38:33'),
(728, '/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 20579, '2026-04-19 09:38:36'),
(729, '/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1870, '2026-04-21 15:03:26'),
(730, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1870, '2026-04-21 15:03:30'),
(731, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1870, '2026-04-21 15:03:37'),
(732, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 882, '2026-04-21 15:03:46'),
(733, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1455, '2026-04-21 15:04:10'),
(734, '/products?page=2', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1455, '2026-04-21 15:04:17'),
(735, '/products', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1455, '2026-04-21 15:04:26'),
(736, '/orders', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1455, '2026-04-21 15:04:27'),
(737, '/signin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1455, '2026-04-21 15:04:28'),
(738, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1455, '2026-04-21 15:04:35'),
(739, '/dashboard', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 0, '2026-04-22 09:20:20'),
(740, '/admin-login?error=forbidden', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 2252, '2026-04-22 09:20:45'),
(741, '/', 'http://localhost:3000/admin-login?error=forbidden', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 2343, '2026-04-22 09:20:51'),
(742, '/admin-login', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1088, '2026-04-22 09:21:01'),
(743, '/admin', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1088, '2026-04-22 09:21:08'),
(744, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', '7ba2e84b1a9b9efbeba81dd836559df731deda641196ee7ab3e5053f8d6a5418', NULL, 0, '2026-04-22 09:21:59'),
(745, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', '7ba2e84b1a9b9efbeba81dd836559df731deda641196ee7ab3e5053f8d6a5418', NULL, 1560, '2026-04-22 09:22:06'),
(746, '/dashboard', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', '7ba2e84b1a9b9efbeba81dd836559df731deda641196ee7ab3e5053f8d6a5418', NULL, 1560, '2026-04-22 09:22:11'),
(747, '/cart', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', '7ba2e84b1a9b9efbeba81dd836559df731deda641196ee7ab3e5053f8d6a5418', NULL, 1560, '2026-04-22 09:23:48'),
(748, '/checkout', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', '7ba2e84b1a9b9efbeba81dd836559df731deda641196ee7ab3e5053f8d6a5418', NULL, 1560, '2026-04-22 09:23:59'),
(749, '/checkout', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', '7ba2e84b1a9b9efbeba81dd836559df731deda641196ee7ab3e5053f8d6a5418', NULL, 1756, '2026-04-22 09:34:39'),
(750, '/checkout', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0', '7ba2e84b1a9b9efbeba81dd836559df731deda641196ee7ab3e5053f8d6a5418', NULL, 1481, '2026-04-22 09:38:36'),
(751, '/admin-login', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1088, '2026-04-22 09:43:03'),
(752, '/', 'http://localhost:3000/admin-login', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 0, '2026-04-22 09:43:09'),
(753, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1135, '2026-04-22 09:43:11'),
(754, '/dashboard', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1135, '2026-04-22 09:43:18'),
(755, '/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1135, '2026-04-22 09:43:24');
INSERT INTO `traffic_events` (`id`, `path`, `referrer`, `user_agent`, `session_key`, `country`, `load_ms`, `created_at`) VALUES
(756, '/cart', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1135, '2026-04-22 09:43:45'),
(757, '/checkout', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1135, '2026-04-22 09:43:49'),
(758, '/checkout/success?orderId=BF-20260422-53U937EJUU', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1135, '2026-04-22 09:45:29'),
(759, '/orders', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1135, '2026-04-22 09:45:36'),
(760, '/orders/BF-20260422-53U937EJUU', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 1135, '2026-04-22 09:45:48'),
(761, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '70e9b076e2579236897d0119e9120e77ed1a18119d45c505b72cf39e64b0db3f', NULL, 2302, '2026-04-25 11:03:52'),
(762, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.126.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '86e36973dfcd5ba3ea9c7d90452f9b222178971eb81d1e2995293cb5eeefee5e', NULL, 0, '2026-07-03 10:11:17'),
(763, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '15fcf09ec274e5a91f2310adc0f3bbafa38bd930ff24234c10cab1e20bed7b2d', NULL, 0, '2026-07-03 10:11:32'),
(764, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '15fcf09ec274e5a91f2310adc0f3bbafa38bd930ff24234c10cab1e20bed7b2d', NULL, 0, '2026-07-03 10:11:41'),
(765, '/dashboard', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '15fcf09ec274e5a91f2310adc0f3bbafa38bd930ff24234c10cab1e20bed7b2d', NULL, 2431, '2026-07-03 10:11:50'),
(766, '/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '15fcf09ec274e5a91f2310adc0f3bbafa38bd930ff24234c10cab1e20bed7b2d', NULL, 2431, '2026-07-03 10:12:05'),
(767, '/products?page=2', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '15fcf09ec274e5a91f2310adc0f3bbafa38bd930ff24234c10cab1e20bed7b2d', NULL, 2431, '2026-07-03 10:12:19'),
(768, '/cart', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '15fcf09ec274e5a91f2310adc0f3bbafa38bd930ff24234c10cab1e20bed7b2d', NULL, 2431, '2026-07-03 10:12:46'),
(769, '/checkout', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '15fcf09ec274e5a91f2310adc0f3bbafa38bd930ff24234c10cab1e20bed7b2d', NULL, 2431, '2026-07-03 10:12:51'),
(770, '/', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '15fcf09ec274e5a91f2310adc0f3bbafa38bd930ff24234c10cab1e20bed7b2d', NULL, 1600, '2026-07-03 10:28:03'),
(771, '/products', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '15fcf09ec274e5a91f2310adc0f3bbafa38bd930ff24234c10cab1e20bed7b2d', NULL, 1600, '2026-07-03 10:32:07'),
(772, '/chat', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '15fcf09ec274e5a91f2310adc0f3bbafa38bd930ff24234c10cab1e20bed7b2d', NULL, 1600, '2026-07-03 10:32:13'),
(773, '/signin?callbackUrl=%2Fchat', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', '15fcf09ec274e5a91f2310adc0f3bbafa38bd930ff24234c10cab1e20bed7b2d', NULL, 1600, '2026-07-03 10:32:14'),
(774, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 0, '2026-07-15 14:08:22'),
(775, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 0, '2026-07-15 14:09:46'),
(776, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 0, '2026-07-15 14:09:53'),
(777, '/dashboard', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 2785, '2026-07-15 14:10:03'),
(778, '/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 2785, '2026-07-15 14:10:22'),
(779, '/', 'http://localhost:3000/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 0, '2026-07-15 14:10:40'),
(780, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 962, '2026-07-15 14:11:07'),
(781, '/admin', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 962, '2026-07-15 14:11:16'),
(782, '/admin/chat', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 962, '2026-07-15 14:11:22'),
(783, '/admin/content', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 962, '2026-07-15 14:11:27'),
(784, '/admin/notifications', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 962, '2026-07-15 14:11:33'),
(785, '/admin/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 962, '2026-07-15 14:11:44'),
(786, '/admin/inventory', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 962, '2026-07-15 14:11:46'),
(787, '/admin/orders', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 962, '2026-07-15 14:11:48'),
(788, '/admin/traffic', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 962, '2026-07-15 14:12:09'),
(789, '/admin/faq', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 962, '2026-07-15 14:12:33'),
(790, '/admin/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 962, '2026-07-15 14:12:35'),
(791, '/admin/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 7585, '2026-07-15 14:21:43'),
(792, '/admin/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 840, '2026-07-15 14:22:56'),
(793, '/admin/products', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 704, '2026-07-15 14:23:21'),
(794, '/', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 1372, '2026-07-15 14:23:50'),
(795, '/products', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 1372, '2026-07-15 14:23:54'),
(796, '/products?page=2', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 1372, '2026-07-15 14:23:58'),
(797, '/cart', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 1372, '2026-07-15 14:24:08'),
(798, '/checkout', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 1372, '2026-07-15 14:24:10'),
(799, '/signin', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 1372, '2026-07-15 14:24:12'),
(800, '/dashboard', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 1372, '2026-07-15 14:24:19'),
(801, '/cart', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 1372, '2026-07-15 14:24:47'),
(802, '/notifications', 'http://localhost:3000/admin/products', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 1372, '2026-07-15 14:25:13'),
(803, '/dashboard', 'http://localhost:3000/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 0, '2026-07-15 14:49:43'),
(804, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 0, '2026-07-15 14:49:43'),
(805, '/cart', 'http://localhost:3000/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 64251, '2026-07-15 14:49:45'),
(806, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 54843, '2026-07-15 14:49:46'),
(807, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 4007, '2026-07-15 15:07:30'),
(808, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 4070, '2026-07-15 15:07:30'),
(809, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 2994, '2026-07-15 15:08:40'),
(810, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 3002, '2026-07-15 15:08:40'),
(811, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 9940, '2026-07-15 15:14:51'),
(812, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 9702, '2026-07-15 15:14:51'),
(813, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 4719, '2026-07-15 15:15:20'),
(814, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 4850, '2026-07-15 15:15:20'),
(815, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 4198, '2026-07-15 15:15:59'),
(816, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 4481, '2026-07-15 15:15:59'),
(817, '/cart', 'http://localhost:3000/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 2826, '2026-07-15 15:43:10'),
(818, '/checkout', 'http://localhost:3000/dashboard', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 2826, '2026-07-15 15:43:26'),
(819, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 7729, '2026-07-15 15:47:52'),
(820, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 8002, '2026-07-15 15:47:53'),
(821, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 18709, '2026-07-15 15:51:23'),
(822, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 19458, '2026-07-15 15:51:23'),
(823, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 18632, '2026-07-15 15:51:23'),
(824, '/checkout', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 0, '2026-07-15 15:51:31'),
(825, '/', 'http://localhost:3000/checkout', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 2491, '2026-07-15 15:53:08'),
(826, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 0, '2026-07-15 15:53:16'),
(827, '/signin?callbackUrl=http%3A%2F%2Flocalhost%3A3000%2Fsignin', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 4740, '2026-07-15 15:53:26'),
(828, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 13036, '2026-07-15 16:04:14'),
(829, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 13454, '2026-07-15 16:04:14'),
(830, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 24001, '2026-07-16 12:37:45'),
(831, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 33143, '2026-07-16 12:37:45'),
(832, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 4654, '2026-07-16 12:37:58'),
(833, '/', 'http://localhost:3000/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.127.0 Chrome/148.0.7778.97 Electron/42.2.0 Safari/537.36', '347931dce23d3b0cf81f0cfb210fafe60608b60e8a986601dfc9a28dc4a67405', NULL, 31813, '2026-07-16 12:41:09'),
(834, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 2314, '2026-07-16 12:41:36'),
(835, '/', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 0, '2026-07-16 13:39:28'),
(836, '/chat', NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', 'd9d861f288010a170dd2cf80c9b4492e90cab0a08d7a04867fa9c55d77af181d', NULL, 19672, '2026-07-16 13:39:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `image` text DEFAULT NULL,
  `provider` varchar(80) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_blocked` tinyint(1) NOT NULL DEFAULT 0,
  `blocked_reason` text DEFAULT NULL,
  `blocked_at` timestamp NULL DEFAULT NULL,
  `blocked_by` int(11) DEFAULT NULL,
  `role` enum('user','admin','sub_admin') DEFAULT 'user',
  `phone_country_code` varchar(8) DEFAULT NULL,
  `phone_number` varchar(40) DEFAULT NULL,
  `default_country` varchar(80) DEFAULT NULL,
  `default_address_line1` varchar(255) DEFAULT NULL,
  `default_address_line2` varchar(255) DEFAULT NULL,
  `default_city` varchar(120) DEFAULT NULL,
  `default_state_province` varchar(120) DEFAULT NULL,
  `default_postal_code` varchar(30) DEFAULT NULL,
  `default_delivery_note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `image`, `provider`, `created_at`, `is_blocked`, `blocked_reason`, `blocked_at`, `blocked_by`, `role`, `phone_country_code`, `phone_number`, `default_country`, `default_address_line1`, `default_address_line2`, `default_city`, `default_state_province`, `default_postal_code`, `default_delivery_note`) VALUES
(1, 'Admin', 'admin@bushfaller.com', NULL, 'credentials', '2026-03-26 08:02:40', 0, NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'NKEM COLLINSS', 'user1@gmail.com', NULL, 'credentials', '2026-03-28 03:23:29', 0, NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_chat_ai_messages`
--
ALTER TABLE `admin_chat_ai_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_conversation_ai` (`conversation_id`),
  ADD KEY `idx_created_at_ai` (`created_at`);

--
-- Indexes for table `admin_chat_conversations`
--
ALTER TABLE `admin_chat_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_assigned_admin` (`assigned_admin_id`),
  ADD KEY `idx_updated_at` (`updated_at`);

--
-- Indexes for table `admin_chat_messages`
--
ALTER TABLE `admin_chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `idx_conversation` (`conversation_id`),
  ADD KEY `idx_created_at` (`created_at`);

--
-- Indexes for table `admin_online_status`
--
ALTER TABLE `admin_online_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `chat_conversations`
--
ALTER TABLE `chat_conversations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `assigned_admin_id` (`assigned_admin_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_id` (`conversation_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `faq_id_used` (`faq_id_used`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`slug`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);
ALTER TABLE `faq` ADD FULLTEXT KEY `ft_qa` (`question`,`answer`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_notifications_user_read_created` (`user_id`,`is_read`,`created_at`),
  ADD KEY `idx_notifications_audience_read_created` (`audience`,`is_read`,`created_at`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_orders_public_order_id` (`public_order_id`),
  ADD UNIQUE KEY `ux_orders_payment_id` (`payment_id`),
  ADD UNIQUE KEY `uq_orders_paypal_order_id` (`paypal_order_id`),
  ADD UNIQUE KEY `uq_orders_paypal_transaction_id` (`paypal_transaction_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `paypal_checkout_sessions`
--
ALTER TABLE `paypal_checkout_sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `paypal_order_id` (`paypal_order_id`),
  ADD KEY `idx_paypal_checkout_user` (`user_id`),
  ADD KEY `idx_paypal_checkout_status_created` (`status`,`created_at`);

--
-- Indexes for table `paypal_webhook_events`
--
ALTER TABLE `paypal_webhook_events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_id` (`event_id`),
  ADD KEY `matched_order_id` (`matched_order_id`),
  ADD KEY `idx_paypal_webhook_event_type_created` (`event_type`,`created_at`),
  ADD KEY `idx_paypal_webhook_resource_id` (`resource_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `traffic_events`
--
ALTER TABLE `traffic_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_traffic_created_at` (`created_at`),
  ADD KEY `idx_traffic_path_created_at` (`path`,`created_at`),
  ADD KEY `idx_traffic_session_created_at` (`session_key`,`created_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_chat_ai_messages`
--
ALTER TABLE `admin_chat_ai_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `admin_chat_conversations`
--
ALTER TABLE `admin_chat_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_chat_messages`
--
ALTER TABLE `admin_chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `admin_online_status`
--
ALTER TABLE `admin_online_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_conversations`
--
ALTER TABLE `chat_conversations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `paypal_checkout_sessions`
--
ALTER TABLE `paypal_checkout_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `paypal_webhook_events`
--
ALTER TABLE `paypal_webhook_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `traffic_events`
--
ALTER TABLE `traffic_events`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=837;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_chat_ai_messages`
--
ALTER TABLE `admin_chat_ai_messages`
  ADD CONSTRAINT `admin_chat_ai_messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `admin_chat_conversations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_chat_conversations`
--
ALTER TABLE `admin_chat_conversations`
  ADD CONSTRAINT `admin_chat_conversations_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_chat_conversations_ibfk_2` FOREIGN KEY (`assigned_admin_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `admin_chat_messages`
--
ALTER TABLE `admin_chat_messages`
  ADD CONSTRAINT `admin_chat_messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `admin_chat_conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `admin_chat_messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `admin_online_status`
--
ALTER TABLE `admin_online_status`
  ADD CONSTRAINT `admin_online_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_conversations`
--
ALTER TABLE `chat_conversations`
  ADD CONSTRAINT `chat_conversations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chat_conversations_ibfk_2` FOREIGN KEY (`assigned_admin_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD CONSTRAINT `chat_messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `chat_conversations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_messages_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chat_messages_ibfk_3` FOREIGN KEY (`faq_id_used`) REFERENCES `faq` (`id`);

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `paypal_checkout_sessions`
--
ALTER TABLE `paypal_checkout_sessions`
  ADD CONSTRAINT `paypal_checkout_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `paypal_webhook_events`
--
ALTER TABLE `paypal_webhook_events`
  ADD CONSTRAINT `paypal_webhook_events_ibfk_1` FOREIGN KEY (`matched_order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
