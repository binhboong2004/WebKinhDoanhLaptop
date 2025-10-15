-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th9 27, 2024 lúc 02:44 PM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `EgaGear_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('b1d5781111d84f7b3fe45a0852e59758cd7a87e5', 'i:1;', 1727446485),
('b1d5781111d84f7b3fe45a0852e59758cd7a87e5:timer', 'i:1727446485;', 1727446485),
('nghiadaica@gmail.com|127.0.0.1', 'i:3;', 1725851758),
('nghiadaica@gmail.com|127.0.0.1:timer', 'i:1725851758;', 1725851758),
('niboss458@gmail.com|127.0.0.1', 'i:2;', 1725851795),
('niboss458@gmail.com|127.0.0.1:timer', 'i:1725851795;', 1725851795);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Drink Fruit', 'categories/u39jDez8CkbozjI2Wv5nskVzIUJ0NrK8sd32Hcll.jpg', 1, '2024-07-23 23:44:47', '2024-07-24 01:54:25'),
(4, 'Fried Fruit', 'categories/OrVEq7Sbod4RNBGUUCDjRv0Bw9OYtYgKSMcoWV0Y.jpg', 1, '2024-07-23 23:45:28', '2024-07-24 01:54:20'),
(5, 'Vegetables', 'categories/sQknppOtJ7a5FL5SQpuQamLRAPiIeta1bD3tZ1pj.jpg', 1, '2024-07-23 23:45:37', '2024-07-24 01:54:22'),
(6, 'Meats', 'categories/5NV2mzz1RPfutgpPUmqdkGBgkozfJ1tOrYViK0GF.jpg', 1, '2024-07-23 23:45:44', '2024-07-24 01:54:16'),
(7, 'Fresh Fruit', 'categories/RRDZWST2WC60dLyejfMz60gH2UqMzGQddMx2v45G.jpg', 1, '2024-07-23 23:56:38', '2024-07-24 01:53:54'),
(8, 'Fast Food', 'categories/DiCIjzkAi2QIEjVQjmNvEcGwAfWjPqlHY8i90GOe.jpg', 1, '2024-07-24 01:34:11', '2024-07-24 01:58:29'),
(10, 'Dairy Products', 'categories/nBhbIjnT3cnsJ4DAPmF3qf4f782XqkuLa9m3JZOZ.jpg', 1, '2024-07-29 00:38:53', '2024-07-29 00:38:56'),
(11, 'Seafood', 'categories/eivOPAHfMRqDabY4AzwQCv1WvV3W1hlRysiPnJyZ.jpg', 1, '2024-07-29 00:39:53', '2024-07-29 00:40:24'),
(12, 'Bakery Goods', 'categories/ct5td0yIldYjyWAr5KQvwdtRioX35EdveJlq0Xxl.jpg', 1, '2024-07-29 00:41:10', '2024-07-29 00:43:16'),
(13, 'Snacks', 'categories/eFAWNwVC7JLOgkCEmXk0A2vcNCMjiq9Rg5jr2Hul.jpg', 1, '2024-07-29 00:48:36', '2024-08-10 01:27:58'),
(14, 'Beverages', 'categories/PjYOAb6kWPEjc0WiYy5Vbnuh1yo4V0yv3Ev10cl3.jpg', 1, '2024-07-29 00:50:51', '2024-09-27 07:15:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_blogs`
--

CREATE TABLE `category_blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_blogs`
--

INSERT INTO `category_blogs` (`id`, `category_name`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Recipes', 1, '2024-07-29 02:09:35', '2024-07-29 02:11:04'),
(5, 'Nutrition', 1, '2024-07-29 02:09:47', '2024-07-29 02:11:03'),
(6, 'Food Reviews', 1, '2024-07-29 02:09:55', '2024-07-29 02:11:01'),
(7, 'Food Trends', 1, '2024-07-29 02:10:06', '2024-07-29 02:11:00'),
(8, 'Cooking Tips', 1, '2024-07-29 02:10:13', '2024-07-29 02:11:05'),
(9, 'Healthy Eating', 1, '2024-07-29 02:10:23', '2024-07-29 02:11:07'),
(10, 'Culinary Techniques', 1, '2024-07-29 02:10:31', '2024-07-29 02:11:09'),
(11, 'Global Cuisine', 1, '2024-07-29 02:10:39', '2024-07-29 02:11:11'),
(12, 'Food History', 1, '2024-07-29 02:10:46', '2024-07-29 02:11:12'),
(13, 'Food Science', 1, '2024-07-29 02:10:55', '2024-07-29 02:10:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `emails`
--

CREATE TABLE `emails` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `emails`
--

INSERT INTO `emails` (`id`, `name`, `email`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Zetta Heaney Sr.', 'michaela.williamson@example.net', 'Voluptatum officia libero et excepturi. Occaecati facere vel tenetur aliquam. Dolores ut quia eum harum vitae. Necessitatibus repellendus praesentium et impedit.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(2, 'Effie Nolan', 'mills.juanita@example.org', 'Sit dolore eum et suscipit aliquid sit laudantium. Non excepturi minus ea. Et reprehenderit nulla blanditiis qui voluptatibus dolorem.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(3, 'Cullen Gulgowski', 'reanna.mcglynn@example.com', 'Aliquid velit occaecati voluptatem explicabo rerum odio. Ipsum quis est laudantium qui et sed cum qui. Accusamus incidunt nemo illum perferendis. Corporis facere alias odio alias.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(4, 'Emile Dare', 'douglas.tianna@example.net', 'Voluptates tempore et iusto sunt harum accusamus. Voluptas ipsa perferendis odit et qui voluptatum dolor est. At numquam sapiente quam voluptates dolore. Sapiente et beatae voluptas corrupti.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(5, 'Dr. Willa Ankunding PhD', 'kaley.bechtelar@example.com', 'Facilis id omnis voluptatem et voluptatem ut alias. Iusto eligendi placeat praesentium voluptate quod facere tenetur. Tempore voluptatem aut accusamus amet quod est suscipit. Quasi et est amet ut repudiandae eum doloremque.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(6, 'Ms. Maddison Volkman', 'pinkie34@example.com', 'Perspiciatis corporis quidem reiciendis iusto nobis. Expedita nisi quod enim ad. Et reiciendis officia officia quod sit. Fugit et et dicta voluptas ut.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(7, 'Jayda Wehner', 'ohara.coleman@example.com', 'Est eligendi dolorem minus voluptates ut blanditiis rerum. Recusandae voluptatem est earum qui. Voluptatibus qui ab molestiae eos quis inventore. Cumque aut suscipit sit.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(8, 'Jules Homenick', 'christiansen.buck@example.net', 'Et sapiente fugiat itaque quasi quia soluta asperiores. Nihil nobis eum ex dolores. Et aut sit excepturi quia.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(9, 'Jenifer Ullrich', 'akeeling@example.com', 'Amet quo quod nihil. Expedita nihil aut officia sed culpa consequatur. Asperiores vitae sit aut quasi libero ut atque. Et voluptas cum est sed qui.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(10, 'Clay Kunde DDS', 'lowe.tiana@example.com', 'Et minus voluptates officia aut ad. Tempora ea facere beatae blanditiis aut sunt velit. Blanditiis quibusdam voluptates dolore ea perferendis eum nemo. Reprehenderit omnis et voluptatibus voluptatem commodi distinctio.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(11, 'Mariah O\'Hara', 'janiya08@example.com', 'Saepe id minus modi vero sed vitae quia. Repellendus enim minus provident molestias hic eius debitis. Unde voluptatem rerum est omnis distinctio. Est voluptas eos unde voluptatibus est consequatur aliquam ut.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(12, 'Alisa Ruecker', 'knicolas@example.com', 'Quisquam dolorem aspernatur aperiam pariatur quo possimus vel. Aspernatur odio et saepe facere. Assumenda perspiciatis distinctio quia.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(13, 'Jules Metz', 'hagenes.heaven@example.net', 'Provident qui consequatur mollitia quam culpa. Itaque magni quas labore quo. Est totam delectus beatae ad amet laboriosam.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(14, 'Lexie Eichmann', 'floyd64@example.net', 'Harum ab esse voluptas harum error distinctio. Et voluptatibus aspernatur expedita aut. Perspiciatis aliquid culpa est amet non quae non. Ipsa rerum nam sequi fugit nemo ut sit.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(15, 'Myra King', 'esimonis@example.org', 'Et aut velit delectus minus nobis dolor at. Vel dolorum rerum quaerat dolorem et eaque tempore excepturi. In incidunt provident consequatur quasi. In quos non dolorem eum quam.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(16, 'Frankie Wilderman', 'wterry@example.net', 'Ut in sint accusantium. Hic ut non eum nulla id eos sed. Delectus qui provident et et magni et. Est quaerat sapiente dolore commodi ut.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(17, 'Ellen Torphy Jr.', 'lebsack.mafalda@example.com', 'Rem libero est optio dolor. Velit aliquam ut fugit consequatur incidunt eaque sunt. Quia et sunt nostrum quisquam.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(18, 'Dr. Sven Wisoky', 'werner58@example.net', 'Ratione beatae accusantium ad aut veniam sequi. Repellendus reprehenderit et laborum id consectetur eligendi.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(19, 'Shanna Rice', 'elliot42@example.com', 'Sunt quis nostrum assumenda. Quo maxime accusamus sed molestias accusamus. Non dolorem iste quaerat doloribus ipsa velit.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(20, 'Dustin Pagac', 'bailey.alycia@example.org', 'Minus omnis sit minima. Sequi cumque et provident sint voluptas architecto qui eum. Delectus amet quo ut minima hic voluptates mollitia.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(21, 'Sasha Walker', 'ross26@example.com', 'Magnam soluta qui quisquam. Voluptatibus minus minima atque a. Dolor quia repellendus sed nam perferendis ut qui.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(22, 'Clyde Nicolas IV', 'avery24@example.com', 'Recusandae accusamus rerum id. Repellat magni minus accusantium odio ullam odio. Quidem libero eos aut consectetur ea impedit earum.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(23, 'Ephraim Ortiz', 'fahey.westley@example.org', 'Consequuntur occaecati incidunt aspernatur voluptatem animi. Minus nihil atque ut aut officiis repellat quibusdam. Quibusdam quia odio tempore et impedit. Perspiciatis ab accusantium ullam et qui non minus et.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(24, 'Miracle Flatley', 'dooley.mikayla@example.net', 'Animi similique sed ipsam libero rerum odit. Consequatur est facilis rem. Numquam autem voluptatem molestiae architecto.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(25, 'Miss Crystal Mertz V', 'mona.maggio@example.net', 'Quaerat consequatur sed dolor porro consectetur. Sed molestiae eum recusandae consectetur. Dolorum nostrum voluptatem pariatur aliquid impedit iste est rerum. Voluptatem voluptatibus optio dolorum est in.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(26, 'Chance Batz MD', 'lyla.rippin@example.net', 'Maiores id optio aliquam praesentium. Labore labore cupiditate odit est doloremque ducimus. Assumenda totam est nisi aut blanditiis.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(27, 'Isabel Ruecker', 'schowalter.skylar@example.net', 'Maiores est perspiciatis sed. Provident ut voluptatem quia consequatur officia. Minima non rerum voluptatum aut. Quibusdam exercitationem eius et laborum odio qui aut.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(28, 'Dr. Ned Rowe', 'dbartoletti@example.net', 'Pariatur fugit enim alias laborum cumque maiores non repudiandae. Iusto in ipsa commodi nihil ut et. Praesentium aliquam ut et ratione et labore consequatur.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(29, 'Trystan Kulas DVM', 'chaya.rosenbaum@example.net', 'Corrupti quis consectetur repudiandae ipsam doloremque. Similique a impedit quibusdam deserunt vitae error. Beatae delectus est praesentium et ut quo voluptas.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(30, 'Prof. Gabrielle Fadel', 'sydnee71@example.org', 'Nam autem ut soluta fugit fugiat deleniti exercitationem. Molestiae eius sit provident.', '2024-07-27 01:18:32', '2024-07-27 01:18:32'),
(31, 'Nghĩa Trần Quang', 'niboss458@gmail.com', '1212121', '2024-08-08 01:59:44', '2024-08-08 01:59:44'),
(32, 'Nghĩa Trần Quang', 'niboss458@gmail.com', 'ok', '2024-08-11 05:29:29', '2024-08-11 05:29:29'),
(33, 'Son Tung MTP', 'nghiadaica@gmail.com', 'new new new', '2024-09-26 08:50:35', '2024-09-26 08:50:35'),
(34, 'abc', 'caytien412@gmail.com', 'pp00000', '2024-09-27 07:18:15', '2024-09-27 07:18:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 3, 'image-more/B5MxtoLgEc7uNJMeHGBZ9NsaS4oD9EcKqCpXwvmw.jpg', '2024-07-24 20:18:53', '2024-07-24 20:18:53'),
(3, 2, 'image-more/vIOu8WR59by00D0VTEicUgrvf8NQXTkn6xOtKvcH.jpg', '2024-07-24 20:21:41', '2024-07-24 20:21:41'),
(6, 5, 'image-more/s5Vdr1f8aPwrDkvGVcxWujNKtgGkrIAwOaM0vhEV.jpg', '2024-07-24 20:22:04', '2024-07-24 20:22:04'),
(7, 5, 'image-more/0ZERdoygm6LmSWsrdDcWnimgpCoFEUyTGtkZaF0M.jpg', '2024-07-24 20:22:08', '2024-07-24 20:22:08'),
(8, 2, 'image-more/2tmRIIHYyhj65nm40uJkDWcw0ABkAZj2uk8uMn5w.jpg', '2024-07-24 20:24:12', '2024-07-24 20:24:12'),
(9, 2, 'image-more/QTYGfcRnHxILWrATRHOJAIMEnSIq84SOHttStZaP.jpg', '2024-07-24 20:24:20', '2024-07-24 20:24:20'),
(10, 19, 'image-more/KaKa5h81O4sHrKj4Q9ZRDEdHkGph5uyP0IG5LNBd.jpg', '2024-07-24 20:26:26', '2024-07-24 20:26:26'),
(11, 19, 'image-more/tg4HTKLr44egeAVeJvMrLyGxfsiEWWoMW9Gxscze.jpg', '2024-07-24 20:26:30', '2024-07-24 20:26:30'),
(12, 17, 'image-more/vVqPxsHOQirX8GbpZXgDhceJj37iSUW3uujgDaoP.jpg', '2024-07-24 20:26:55', '2024-07-24 20:26:55'),
(13, 17, 'image-more/fi7lkfUpBvAlfulR6gqa5ny6NW8wv9k7MesvWcRQ.jpg', '2024-07-24 20:27:03', '2024-07-24 20:27:03'),
(14, 16, 'image-more/p2aasAcl1osqMfCivBEIdoT3QSeV9ERRLsilxxjD.jpg', '2024-07-24 21:52:24', '2024-07-24 21:52:24'),
(15, 13, 'image-more/S47R6mCP5z86pxsX26FlZX2X1PiQZV7tvRonVQ3d.jpg', '2024-07-24 21:55:10', '2024-07-24 21:55:10'),
(16, 11, 'image-more/EI6T6lqwQf1ukqqWEjMU99qGnSTrf5iGvGsgjtLd.jpg', '2024-07-29 19:41:58', '2024-07-29 19:41:58'),
(17, 11, 'image-more/7l0idZ2yYHHzSKeUW2r6U6RCXF5kHlUDackpzMrv.jpg', '2024-07-29 19:42:54', '2024-07-29 19:42:54'),
(18, 11, 'image-more/ptkiZsHOvNQdzPDR5u2eQaTRzBFWvEbL6AD05zJW.jpg', '2024-07-29 19:42:58', '2024-07-29 19:42:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(31, '0001_01_01_000000_create_roles_table', 1),
(32, '0001_01_01_000001_create_users_table', 1),
(33, '0001_01_01_000002_create_cache_table', 1),
(34, '0001_01_01_000003_create_jobs_table', 1),
(35, '2024_07_24_024153_create_categories_table', 1),
(36, '2024_07_24_024153_create_products_table', 1),
(37, '2024_07_24_024154_create_images_table', 1),
(38, '2024_07_24_024154_create_orders_table', 1),
(39, '2024_07_24_024154_create_payment_methods_table', 1),
(40, '2024_07_24_024155_create_order_details_table', 1),
(44, '2024_07_27_023638_create_emails_table', 2),
(45, '2024_07_27_080549_create_category_blogs_table', 2),
(46, '2024_07_27_080550_create_posts_table', 3),
(48, '2024_08_11_065121_create_page_contact_table', 4),
(49, '2024_08_11_081403_create_page_general_table', 5),
(50, '2024_08_11_081710_create_page_policy_table', 5),
(52, '2024_08_12_023042_create_notifications_table', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_link` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `content`, `type`, `id_link`, `created_at`, `updated_at`) VALUES
(1, 'New order by Luân', 'order', 117, '2024-09-26 08:53:46', '2024-09-26 08:53:46'),
(2, 'New order by Luân', 'order', 118, '2024-09-27 07:14:10', '2024-09-27 07:14:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `total`, `shipping_address`, `phone`, `email`, `note`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(105, 4, 'ORD-215F8', 1220.00, 'Thôn Cành Lá, xã Cành Cây, huyện Gió Mây, tỉnh Đồi Núi', '0999888777', 'admin@gmail.com', '0', 'cash on delivery', 'delivering', '2024-08-09 18:44:39', '2024-08-11 02:19:55'),
(106, 4, 'ORD-60369', 1220.00, '97 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng', '4366461704', 'niboss458@gmail.com', '0', 'cash on delivery', 'completed', '2024-08-09 18:44:49', '2024-08-11 02:19:48'),
(109, 4, 'ORD-47731', 733.00, '97 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng', '40366461704', 'niboss458@gmail.com', '0', 'cash on delivery', 'processing', '2024-08-11 02:20:36', '2024-08-11 02:23:24'),
(110, 4, 'ORD-34570', 120.00, '97 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng', '4366461704', 'niboss458@gmail.com', '0', 'cash on delivery', 'pending', '2024-08-11 02:22:32', '2024-08-11 02:22:32'),
(111, 4, 'ORD-45E33', 230.00, '97 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng', '4366461704', 'niboss458@gmail.com', '0', 'cash on delivery', 'pending', '2024-08-11 20:09:21', '2024-08-11 20:09:21'),
(112, 4, 'ORD-0B14A', 300.00, '97 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng', '4366461704', 'niboss458@gmail.com', '0', 'cash on delivery', 'pending', '2024-08-11 20:10:40', '2024-08-11 20:10:40'),
(113, 4, 'ORD-9B9B1', 300.00, '97 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng', '4366461704', 'niboss458@gmail.com', '0', 'cash on delivery', 'completed', '2024-08-11 20:11:32', '2024-09-08 20:17:50'),
(114, 4, 'ORD-96828', 754.00, '97 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng', '4366461704', 'niine2004@gmail.com', '0', 'cash on delivery', 'completed', '2024-08-11 20:35:44', '2024-09-08 20:17:45'),
(115, 4, 'ORD-CABF7', 312.00, 'Khối 4, huyện Đăk Tô, tỉnh KonTum', '0334193081', 'caytien412@gmail.com', '0', 'cash on delivery', 'delivering', '2024-08-11 20:43:39', '2024-09-08 20:17:42'),
(116, 4, 'ORD-C459F', 240.00, '97 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng', '4366461704', 'niine2004@gmail.com', '0', 'cash on delivery', 'completed', '2024-08-11 20:58:23', '2024-09-08 20:17:40'),
(118, 10, 'ORD-D16F0', 219.00, 'Thôn Cành Lá, xã Cành Cây, huyện Gió Mây, tỉnh Đồi Núi', '12121212', 'nghiadaica@gmail.com', '0', 'cash on delivery', 'delivering', '2024-09-27 07:14:10', '2024-09-27 07:17:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(317, 105, 3, 300.00, 1, '2024-08-09 18:44:39', '2024-08-09 18:44:39'),
(318, 105, 7, 33.00, 1, '2024-08-09 18:44:39', '2024-08-09 18:44:39'),
(319, 105, 5, 12.00, 2, '2024-08-09 18:44:39', '2024-08-09 18:44:39'),
(320, 105, 14, 230.00, 2, '2024-08-09 18:44:39', '2024-08-09 18:44:39'),
(321, 105, 12, 120.00, 3, '2024-08-09 18:44:39', '2024-08-09 18:44:39'),
(322, 105, 18, 43.00, 1, '2024-08-09 18:44:39', '2024-08-09 18:44:39'),
(323, 106, 3, 300.00, 1, '2024-08-09 18:44:49', '2024-08-09 18:44:49'),
(324, 106, 7, 33.00, 1, '2024-08-09 18:44:49', '2024-08-09 18:44:49'),
(325, 106, 5, 12.00, 2, '2024-08-09 18:44:49', '2024-08-09 18:44:49'),
(326, 106, 14, 230.00, 2, '2024-08-09 18:44:49', '2024-08-09 18:44:49'),
(327, 106, 12, 120.00, 3, '2024-08-09 18:44:49', '2024-08-09 18:44:49'),
(328, 106, 18, 43.00, 1, '2024-08-09 18:44:49', '2024-08-09 18:44:49'),
(337, 109, 16, 721.00, 1, '2024-08-11 02:20:36', '2024-08-11 02:20:36'),
(338, 109, 5, 12.00, 1, '2024-08-11 02:20:36', '2024-08-11 02:20:36'),
(339, 110, 12, 120.00, 1, '2024-08-11 02:22:32', '2024-08-11 02:22:32'),
(340, 111, 14, 230.00, 1, '2024-08-11 20:09:22', '2024-08-11 20:09:22'),
(341, 112, 3, 300.00, 1, '2024-08-11 20:10:40', '2024-08-11 20:10:40'),
(342, 113, 3, 300.00, 1, '2024-08-11 20:11:32', '2024-08-11 20:11:32'),
(343, 114, 16, 721.00, 1, '2024-08-11 20:35:44', '2024-08-11 20:35:44'),
(344, 114, 7, 33.00, 1, '2024-08-11 20:35:44', '2024-08-11 20:35:44'),
(345, 115, 3, 300.00, 1, '2024-08-11 20:43:39', '2024-08-11 20:43:39'),
(346, 115, 5, 12.00, 1, '2024-08-11 20:43:39', '2024-08-11 20:43:39'),
(347, 116, 12, 120.00, 2, '2024-08-11 20:58:23', '2024-08-11 20:58:23'),
(350, 118, 12, 120.00, 1, '2024-09-27 07:14:10', '2024-09-27 07:14:10'),
(351, 118, 7, 33.00, 3, '2024-09-27 07:14:10', '2024-09-27 07:14:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `page_contact`
--

CREATE TABLE `page_contact` (
  `id` bigint UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0366461704',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Đà Nẵng',
  `open_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '10:00 am',
  `close_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '23:00 pm',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'nghiadaica@gmail.com',
  `url_iframe` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page_contact`
--

INSERT INTO `page_contact` (`id`, `phone`, `address`, `open_time`, `close_time`, `email`, `url_iframe`, `created_at`, `updated_at`) VALUES
(1, '0366461704', 'Đà Nẵng', '10:00 am', '23:00 pm', 'nghiadaica@gmail.com', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d245368.28264361413!2d107.9133126717606!3d16.07174599039564!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219c792252a13%3A0x1df0cb4b86727e06!2zxJDDoCBO4bq1bmcsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1723361548879!5m2!1svi!2s', NULL, '2024-08-11 01:03:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `page_general`
--

CREATE TABLE `page_general` (
  `id` bigint UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EgaGear',
  `welcome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Free Shipping for all Order of $99',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page_general`
--

INSERT INTO `page_general` (`id`, `logo`, `app_name`, `welcome`, `created_at`, `updated_at`) VALUES
(1, 'logos/cYXHeqNhK4FoTv4fb38GH6WhsPZelOJq5SzCKqdK.png', 'EgaGear hehehe', 'Free Shipping for all Order of $999', NULL, '2024-09-27 07:18:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `page_policy`
--

CREATE TABLE `page_policy` (
  `id` bigint UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page_policy`
--

INSERT INTO `page_policy` (`id`, `content`, `created_at`, `updated_at`) VALUES
(1, '<p><strong>1. Shipping Policy</strong></p><ul><li>We offer nationwide delivery services with a delivery time of 3-7 business days, depending on the destination.</li><li>Shipping fees are calculated based on the customer’s address and will be communicated before the order is confirmed.</li></ul><p><strong>2. Payment Policy</strong></p><ul><li>Customers can choose from several payment methods, including Cash on Delivery (COD), bank transfer, or online payment through credit/debit cards or e-wallets.</li><li>Payment must be completed before the order is processed and shipped.</li></ul><p><strong>3. Return and Refund Policy</strong></p><ul><li>We accept returns within 14 days of receipt for a full refund or exchange, provided the item is in its original condition and packaging.</li><li>Return shipping costs will be the responsibility of the customer unless the return is due to a defect or error on our part.</li><li>Refunds will be processed within 7 business days after we receive and inspect the returned item.</li></ul><p><strong>4. Privacy Policy</strong></p><ul><li>We are committed to protecting your personal information and ensuring your shopping experience is safe and secure.</li><li>All customer information collected will be used solely for processing orders and improving our services.</li><li>We do not share customer information with third parties unless required by law.</li></ul><p><strong>5. Terms of Service</strong></p><ul><li>By using our website, you agree to our terms and conditions, including our policies on shipping, payment, returns, and privacy.</li><li>We reserve the right to update or modify these policies at any time without prior notice.</li></ul>', NULL, '2024-08-11 07:39:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `image`, `description`, `content`, `status`, `created_at`, `updated_at`) VALUES
(3, 4, 4, 'Air Fryer Chicken Wings', 'post/J75ZqSHMGM3fGqUBsO6Uv4RV2RCJ0H332rma0iXC.jpg', 'Juicy, fast, crispy, and unbelievably tasty! Air fryer chicken wings are the good parts of life delivered under 30 minutes.', '<p><strong>Air fryer chicken wings coming in hot!</strong></p><p>Do you love chicken wings? Do you love your air fryer? To me, chicken wings and the air fryer are a match made in heaven.</p><p>These air fryer chicken wings are faster than going to the bar, ordering, and waiting for them to fry your wings. Even better, they’re super juicy, taste amazing and only take 20 minutes in the air fryer. And they’re not deep fried!</p><p><picture><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963.webp 1450w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963-480x600.webp 480w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963-819x1024.webp 819w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963-1229x1536.webp 1229w\" type=\"image/webp\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963-480x600.jpg 480w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963-819x1024.jpg 819w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963-1229x1536.jpg 1229w\" type=\"image/jpeg\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><img src=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963.jpg\" alt=\"air fryer chicken wing recipe | www.iamafoodblog.com\" srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963-480x600.jpg 480w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963-819x1024.jpg 819w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5963-1229x1536.jpg 1229w\" sizes=\"100vw\" width=\"1450\"></picture></p><h2>Chicken wings in air fryer, a match made in heaven</h2><p>To me, the air fryer is the best option for juicy crispy chicken wings. Air fryers circulate hot air and oil all around the wings to get a perfectly crisp shell while keeping the insides extra juicy. Baking wings in the oven takes an hour, but air fryer chicken wings only take 20 minutes from start to finish which means your wings don’t have a chance to dry out.</p><p>&nbsp;</p><h2>How to make air fryer chicken wings</h2><ol><li><strong>Lightly pat your chicken dry.</strong> Moisture is not your friend when you want a crispy chicken wing, so be sure to pat your wings dry with a paper towel.</li><li><strong>Lightly oil.</strong> Lightly oil the chicken by tossing it with oil or spraying it with spray oil. This will promote even browning.</li><li><strong>Coat the chicken.</strong> This is where the magic happens. Toss the wings in a large bowl with a bit of baking powder, garlic powder, onion powder, salt, and pepper.</li><li><strong>Air fry.</strong> Lightly spray (or brush) the air fryer basket with oil. Arrange the wings in a single layer, with some space in between each wing.</li><li><strong>Flip.</strong> Flip the wings and fry again.</li><li><strong>Toss.</strong> Enjoy the wings as is or toss with sauce!</li></ol><p><picture><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931.webp 1450w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931-480x600.webp 480w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931-819x1024.webp 819w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931-1229x1536.webp 1229w\" type=\"image/webp\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931-480x600.jpg 480w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931-819x1024.jpg 819w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931-1229x1536.jpg 1229w\" type=\"image/jpeg\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><img src=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931.jpg\" alt=\"extra crispy air fryer chicken wings | www.iamafoodblog.com\" srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931-480x600.jpg 480w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931-819x1024.jpg 819w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5931-1229x1536.jpg 1229w\" sizes=\"100vw\" width=\"1450\"></picture></p><p>&nbsp;</p><h2>How long to cook chicken wings in air fryer:</h2><p>It takes 20 minutes to cook wings in the air fryer. Cook your wings for 15 minutes at 400°F, flip them and cook them for another 5 minutes at 400°F. If you want extra crispy wings, let them rest for 5 minutes then give them another 5 minute blast at 400ºF to get them extra crunchy.</p><p>Wings cook based on wing size and how packed your air fryer is, if your wings are extra big, add an extra 5 minutes to the cook time.</p><h2>Basic air fryer chicken wings recipe</h2><p>The key to really tasty air fryer chicken wings is a well seasoned base. You know how wings taste super good and flavorful at restaurants in way that never seems achievable at home? The secret is seasoning your wings before you sauce them. It’s layers on layers of flavor, all the way down!</p><p>For these wings, I coated them in a bit of baking powder, along with some salt, garlic powder, onion powder, and pepper. The result was unbelievably juicy, crisp, and flavorful.</p><p>This basic seasoning mix of salt, garlic, onion, and pepper is the perfect base layer for all other sauces. It will make your wings extra: extra flavorful, extra saucy (because the sauce will have something to cling to), and extra delicious.</p><p><picture><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5935.webp 1450w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5935-600x401.webp 600w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5935-1024x684.webp 1024w\" type=\"image/webp\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5935.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5935-600x401.jpg 600w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5935-1024x684.jpg 1024w\" type=\"image/jpeg\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><img src=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5935.jpg\" alt=\"air fryer chicken wings tossed in hot sauce | www.iamafoodblog.com\" srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5935.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5935-600x401.jpg 600w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5935-1024x684.jpg 1024w\" sizes=\"100vw\" width=\"1450\"></picture></p><h2>Extra crispy air fryer chicken wings</h2><p>The secret to<i> extra crispy</i> air fryer chicken wings is baking powder <strong>(not baking soda)</strong> and salt. Basically, the pH of the baking powder makes the surface of the wings brown more easily. A bit of salt draws out any extra moisture off the surface of the skin and your air fried chicken wings end up crispy and golden.</p><p><picture><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5933.webp 1450w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5933-600x400.webp 600w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5933-1024x683.webp 1024w\" type=\"image/webp\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5933.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5933-600x400.jpg 600w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5933-1024x683.jpg 1024w\" type=\"image/jpeg\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><img src=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5933.jpg\" alt=\"chicken wings in air fryer | www.iamafoodblog.com\" srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5933.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5933-600x400.jpg 600w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5933-1024x683.jpg 1024w\" sizes=\"100vw\" width=\"1450\"></picture></p><h2>Buffalo wings vs other sauces</h2><p>These wings are 100% good enough to eat naked, on their own. But variety is the spice of life too, amirite?!</p><p>Air fryer chicken wings make the best ever buffalo wings. Buffalo wings are super simple: equal parts Frank’s Red Hot and melted butter. We like to mix it up and use other hot sauces too, like <a href=\"https://iamafoodblog.com/crispy-oven-sriracha-buffalo-wings-recipe/\">sriracha buffalo</a> or Crystal buffalo.</p><p>&nbsp;</p><p>Truth is, we almost always reduce the amount of butter or leave it out entirely for a healthier twist. We made these specific wings with just <a href=\"https://amzn.to/3icmLOc\">Secret Aardvark Habanero Sauce</a> (the best hot sauce ever) and they were phenomenal. You can also make these wings:</p><ul><li><strong>Korean wings</strong> – in small pan, heat up 1 tablespoon each of ketchup, gochujang, honey, and brown sugar, 1/2 tablespoon of soy sauce, toasted sesame oil, and grated ginger, along with 2 cloves crushed garlic. <a href=\"https://iamafoodblog.com/air-fryer-korean-fried-chicken-recipe/\">Read more about Korean Fried Chicken here.</a></li><li><strong>Pok Pok fish sauce wings</strong> – combine 1 tablespoon each of lime juice, fish sauce, and sugar, along with 1 clove crushed garlic and 1/2 sliced Thai bird’s eye chili. Let sit for 10 minutes for the flavors to meld before tossing.&nbsp;<a href=\"https://iamafoodblog.com/extra-easy-pok-pok-style-fish-sauce-chicken-wings/\">Read more about Pok Pok Style Fish Sauce Chicken Wings here.</a></li><li><strong>Honey garlic wings</strong> – Melt 1 tablespoon of butter in a small pan over medium heat and add 8 cloves of crushed garlic and cook until soft but not brown. Stir in 2 tablespoons honey, 2 teaspoons soy sauce, and 1 tablespoon water, bring to a simmer, then toss with the wings.</li><li><strong>Ranch Wings</strong> – Ranch is a must for dipping and let me tell you, tossing wings in ranch powder is a pro move. <a href=\"https://iamafoodblog.com/air-fryer-ranch-wings/\">For the recipe, check out this whole post on ranch wings.</a></li><li><strong>Vietnamese wings</strong> – this is a dry toss that is out of this world, believe me. It’s the ultimate umami wings. I could eat pounds and pounds of these wings and never get tired of them.&nbsp;<a href=\"https://iamafoodblog.com/air-fryer-vietnamese-chicken-wings/\">For more information, check out this post on Vietnamese air fryer wings.</a></li></ul><p><picture><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737.webp 1450w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737-480x600.webp 480w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737-819x1024.webp 819w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737-1228x1536.webp 1228w\" type=\"image/webp\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737-480x600.jpg 480w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737-819x1024.jpg 819w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737-1228x1536.jpg 1228w\" type=\"image/jpeg\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><img src=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737.jpg\" alt=\"air fryer ranch wings | www.iamafoodblog.com\" srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737-480x600.jpg 480w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737-819x1024.jpg 819w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2022/05/ranch-wings-2737-1228x1536.jpg 1228w\" sizes=\"100vw\" width=\"1450\"></picture></p><h2>Frozen chicken wings in the air fryer</h2><p><strong>Can you make frozen chicken wings in the air fryer?</strong> Surprisingly, you can! You’ll need to cook the wings a bit longer and they won’t come out as crispy, but if you’re in hurry, it’s a pretty amazing party trick.</p><h3>To make air fryer frozen chicken wings:</h3><ol><li><strong>Toss</strong> the wings in the baking powder spice mix and lay the wings out in a single layer in the air fryer basket.</li><li><strong>Set</strong> the air fryer to 400°F for 15 minutes, flip, and cook for another 10 minutes.</li><li><strong>Flip</strong> them again, give them a spray with some oil, and cook for 5 minutes.</li><li><strong>Give</strong> them one final flip, spray, and cook for a final 5 minutes.</li></ol><p>In total, <strong>air fryer frozen wings will take about 35 minutes</strong> depending on how crispy you want them.</p><p><picture><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945.webp 1450w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945-480x600.webp 480w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945-819x1024.webp 819w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945-1229x1536.webp 1229w\" type=\"image/webp\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945-480x600.jpg 480w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945-819x1024.jpg 819w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945-1229x1536.jpg 1229w\" type=\"image/jpeg\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><img src=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945.jpg\" alt=\"air fryer chicken wings | www.iamafoodblog.com\" srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945-480x600.jpg 480w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945-819x1024.jpg 819w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5945-1229x1536.jpg 1229w\" sizes=\"100vw\" width=\"1450\"></picture></p><h2>How many wings can I make at once?</h2><p>You can make about 1 pound of wings at once, depending on how big the wings are. If you’re a wing lover, look into getting <a href=\"https://amzn.to/2Zk2VZN\">a rack for your air fryer</a> because you can triple your wing making abilities.</p><p>If you’re buying a rack, whether <a href=\"https://amzn.to/2Zk2VZN\">online</a> or offline, don’t forget to check the diameter so you can be sure it fits in your air fryer!</p><p><picture><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5930.webp 1450w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5930-600x401.webp 600w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5930-1024x684.webp 1024w\" type=\"image/webp\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5930.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5930-600x401.jpg 600w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5930-1024x684.jpg 1024w\" type=\"image/jpeg\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><img src=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5930.jpg\" alt=\"chicken wings in air fryer | www.iamafoodblog.com\" srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5930.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5930-600x401.jpg 600w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5930-1024x684.jpg 1024w\" sizes=\"100vw\" width=\"1450\"></picture></p><p>&nbsp;</p><h2>Which air fryer do you have?</h2><p>We’ve used a lot of air fryers and <a href=\"https://amzn.to/4cCcgQl\">this one</a> is our new daily driver and it’s been awesome. The window is more than just fun (though it is too!) it’s also great to see your food frying so you can make sure everything is A-OK.</p><h2>Can I make these in an oven?</h2><p>Yes, you can bake them in the oven, it takes 45 minutes @ 400ºF. Stick them on a wire rack on a foil lined baking sheet and flip them half way through. If you have convection mode, it means you have a giant air fryer! Just follow the same instructions as with an air fryer, maybe with an extra 5 minutes in case the oven temp is not as accurate.</p><h2>Tips for the best air fryer chicken wings:</h2><ul><li>Season your chicken</li><li>Dry the chicken as much as possible, the drier the chicken, the crispier</li><li>Don’t crowd the air fryer</li><li>Use tongs to flip your wings instead of shaking the basket</li><li>For ultimate crisp ones, double fry: let the chicken rest after frying, the pop it back into the air fryer for an extra 5 minutes</li></ul><p><picture><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5940.webp 1450w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5940-600x401.webp 600w,https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5940-1024x684.webp 1024w\" type=\"image/webp\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><source srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5940.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5940-600x401.jpg 600w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5940-1024x684.jpg 1024w\" type=\"image/jpeg\" sizes=\"(max-width: 1450px) 100vw, 1450px\"><img src=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5940.jpg\" alt=\"air fryer chicken wings in aardvark sauce | www.iamafoodblog.com\" srcset=\"https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5940.jpg 1450w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5940-600x401.jpg 600w, https://iamafoodblog.b-cdn.net/wp-content/uploads/2020/09/air-fryer-chicken-wings-5940-1024x684.jpg 1024w\" sizes=\"100vw\" width=\"1450\"></picture></p>', 1, '2024-07-29 02:15:37', '2024-08-11 06:55:50'),
(4, 4, 4, 'Green Chile Chicken Enchiladas', 'post/pDYr70uvgjZLP31hLU11YZ6fQJUyvXByzgLgnRtI.webp', 'Homemade-from-scratch green chile enchilada sauce, shredded chicken breast, and fluffy corn tortillas make for the best ever chicken enchiladas.', '<p>&nbsp;</p><p><strong>If you’re looking for a cozy, warming, filling, all-in-one dish, enchiladas are it!</strong></p><p>Corn tortillas wrapped up around a super savory meaty filling, smothered in homemade enchilada sauce and topped off with cheese…drool.</p><p>I first fell in love with enchiladas in New Mexico. Mike and I were on a road trip and boy oh boy did I fall hard for the the land of enchantment – which handily happens to be the state slogan. One of the best meals we ate was at Mary &amp; Tito’s: the enchiladas (extra chile please!) are something I still dream about.</p><p>&nbsp;</p><p>If you love enchiladas that are plump, juicy, full of filling, with a lot of sauce and cheese, this is the enchilada recipe for you!</p><p>&nbsp;</p><p>What is an enchilada?</p><p>If you haven’t had the pleasure of having one before, an enchilada is a rolled corn tortilla stuffed with meat (or beans or vegetables), covered with sauce, and baked. Enchiladas are originally from Mexico, but a lot of people associate them with American Tex-mex. The ones we are making today are New Mexico style, but they are both really good!</p><p>&nbsp;</p><p>How to make enchiladas</p><p>They may seem complicated, but if you can roll up a tortilla, you can enchilada!</p><p><strong>Prep the sauce.</strong> We’re going to go all out and make a homemade green enchilada sauce but if you’re in a hurry, you can used jarred enchilada sauce – you can find both red and green sauce in the Mexican aisle at the grocery store.</p><p><strong>Make the filling.</strong> Don’t go rolling up just plain meat inside your enchiladas! You want the filling to be flavorful, juicy, and moist. Give your filling an extra boost by mixing in a good amount of enchilada sauce and cheese.</p><p><strong>Roll.</strong> Time to roll! Lightly heat up your tortilla, the spoon some filling in the center. Roll the tortilla up tightly and place it seam side down in an oven safe baking dish.</p><p><strong>Sauce.</strong> Spoon on some extra enchilada sauce and finish with generous amount of cheese.</p><p><strong>Bake.</strong> Bake the enchiladas until they are heated through and the cheese is melty and delicious.</p><p><strong>Top and enjoy!</strong> Finish everything off with some toppings: cilantro, onions, salsa, sour cream, extra chiles. Enjoy hot!</p><p>&nbsp;</p><p>Ingredient notes</p><p><strong>Enchilada sauce</strong> – enchilada sauce is surprisingly easy to make, especially because a blender does all the work for you. That being said, you can use store bought sauce if you’re in a hurry.<br>&nbsp;</p><p><strong>Chicken</strong> – I like to air fry the chicken because air fried chicken is SO juicy, but you can also use leftover rotisserie chicken or baked chicken too.</p><p><strong>Cheese</strong> – A blanket of melty cheese on top as well as cheese inside the enchiladas make these guys extra cheesy comfort food.</p><p><strong>Tortillas</strong> – I like to use corn tortillas, which is traditional, but enchiladas with flour tortillas are popular too and flour tortillas are a lot softer, making them very easy to roll.</p><p>&nbsp;</p><p><strong>Toppings</strong> – What are enchiladas without toppings? Sour cream is a must! I also like a squeeze of lime, diced red onions, sliced avocados, and chopped cilantro.</p><p>&nbsp;</p><p>Red vs green</p><p>Generally, there are two kinds of enchiladas: red or green. Red enchiladas have red enchilada sauce, made from dried red chile peppers. Green enchiladas have green chile sauce, made from roasted green chile peppers. We’re going to make green enchiladas because I am obsessed with green chile!</p><p>&nbsp;</p><p>&nbsp;</p><p>Variations</p><p>I love chicken enchiladas, but to be honest, you can fill these with almost anything, including <i>all</i> the meats: seasoned ground beef, barbacoa,&nbsp;carnitas, chicken tinga (shown below),&nbsp;al pastor, or&nbsp;carne adovada.</p><p>&nbsp;</p>', 1, '2024-07-29 02:38:21', '2024-07-29 02:38:32'),
(5, 4, 9, 'A Guide to a Balanced Diet', 'post/W3CL3zBucBF4J5ouLAY8nry0PVXYTqedgsdjaJ3n.jpg', 'A balanced diet fulfills all of a person’s nutritional needs. It comprises foods from five groups — fruits, vegetables, protein, grains, and dairy — and can help manage weight and reduce the risk of disease.', '<p>Dietary guidelines evolve with scientific advances, so it can be challenging to stay on top of current recommendations and know what to eat.</p><p>In this article, we look at current dietary recommendations and describe how to build a balanced diet.</p><p>&nbsp;</p><p><strong>What is a balanced diet?</strong></p><p><span style=\"color:transparent;\">Share on Pinterest</span>Eating a balanced diet will help a person stay healthy.</p><p>A balanced diet is one that fulfills all of a person’s nutritional needs. Humans need a certain amount of calories and nutrients to stay healthy.</p><p>A balanced diet provides all the nutrients a person requires, without going over the recommended daily calorie intake.</p><p>By eating a balanced diet, people can get the nutrients and calories they need and avoid eating junk food, or food without nutritional value.</p><p>The United States Department of Agriculture (USDA) used to recommend following a food pyramid. However, as nutritional science has changed, they now recommend eating foods from the five groups and building a balanced plate.</p><p>According to the USDA’s recommendations, half of a person’s plate should consist of fruits and vegetables.</p><p>The other half should be made up of grains and protein. They recommend accompanying each meal with a serving of low-fat dairy or another source of the nutrients found in dairy.</p><p>&nbsp;</p><p><strong>The 5 food groups</strong></p><p>A healthful, balanced diet includes foods from these five groups:</p><p>vegetables</p><p>fruits</p><p>grains</p><p>protein</p><p>dairy</p><p><strong>Vegetables</strong></p><p>The vegetable group includes five subgroups:</p><p>leafy greens</p><p>red or orange vegetables</p><p>starchy vegetables</p><p>beans and peas (legumes)</p><p>other vegetables, such as eggplant or zucchini</p><p>To get enough nutrients and keep dietary boredom at bay, people should choose a variety of vegetables.</p><p>Additionally, the USDA recommendTrusted Source that people eat vegetables from each of the five subgroups every week.</p><p>People may enjoy vegetables raw or cooked. However, it is important to remember that cooking vegetables removes some of their nutritional value. Also, some methods, such as deep-frying, can add unhealthful fats to a dish.</p><p><strong>Fruits</strong></p><p>A balanced diet also includes plenty of fruit. Instead of getting fruit from juice, nutrition experts recommend eating whole fruits.</p><p>Juice contains fewer nutrients. Also, the manufacturing process often adds empty calories due to added sugar. People should opt for fresh or frozen fruits, or fruits canned in water instead of syrup.</p><p><strong>Grains</strong></p><p><span style=\"color:transparent;\">Share on Pinterest</span>Whole grains usually contain more protein than refined grains.</p><p>There are two subgroups: whole grains and refined grains.</p><p>Whole grains include all three parts of the grain, which are the bran, germ, and endosperm. The body breaks down whole grains slowly, so they have less effect on a person’s blood sugar.</p><p>Additionally, whole grains tend to contain more fiber and protein than refined grains.</p><p>Refined grains are processed and do not contain the three original components. Refined grains also tend to have less protein and fiber, and they can cause blood sugar spikes.</p><p>Grains used to form the base of the government-approved food pyramid, meaning that most of a person’s daily caloric intake came from grains. However, the updated guidelines suggest that grains should make up only a quarter of a person’s plate.</p><p>At least half of the grains that a person eats daily should be whole grains. Healthful whole grains include:</p><p>quinoa</p><p>oats</p><p>brown rice</p><p>barley</p><p>buckwheat</p><p><strong>Protein</strong></p><p>The 2015–2020 Dietary Guidelines for Americans state that all people should include nutrient-dense protein as part of their regular diet.</p><p>The guidelines suggest that this protein should make up a quarter of a person’s plate.</p><p>Nutritious protein choices include:</p><p>lean beef and pork</p><p>chicken and turkey</p><p>fish</p><p>beans, peas, and legumes</p><p><strong>Dairy</strong></p><p>Dairy and fortified soy products are a vital source of calcium. The USDA recommend consuming low-fat versions whenever possible.</p><p>Low-fat dairy and soy products include:</p><p>ricotta or cottage cheese</p><p>low-fat milk</p><p>yogurt</p><p>soy milk</p><p>People who are lactose intolerant can opt for low-lactose or lactose-free products, or choose soy-based sources of calcium and other nutrients.</p><p>Nutrition resources</p><p>For more science-backed resources on nutrition, visit our dedicated hub.</p><p>Was this helpful?</p><p><strong>Losing weight</strong></p><p><span style=\"color:transparent;\">Share on Pinterest</span>A person can burn calories by taking the stairs.</p><p>A poor diet is a common reason why people struggle with weight loss.</p><p>When combined with a regular exercise routine, a balanced diet can help a person reduce their risk factors for obesity or gaining weight.</p><p>A balanced diet can help a person lose weight by:</p><p>increasing their protein intake</p><p>avoiding excessive carbohydrates or processed foods</p><p>getting essential nutrients, including minerals, vitamins, and fiber</p><p>preventing binge eating</p><p>People interested in losing weight should begin or enhance an exercise routine.</p><p>For some people, adding 30 minutes of walking each day and making minor changes, such as taking the stairs, can help them burn calories and lose weight.</p><p>For those that can, adding moderate exercise that includes cardio and resistance training will help speed weight loss.</p><p>&nbsp;</p><p><strong>Summary</strong></p><p>Eating a balanced diet means eating foods from the five major groups.</p><p>Dietary guidelines change over time, as scientists discover new information about nutrition. Current recommendations suggest that a person’s plate should contain primarily vegetables and fruits, some lean protein, some dairy, and soluble fiber.</p><p>People interested in weight loss should also consider introducing moderate exercise into their routines.</p><p><br>&nbsp;</p>', 1, '2024-07-29 02:41:36', '2024-07-29 02:41:40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `information` text COLLATE utf8mb4_unicode_ci,
  `quantity` int NOT NULL,
  `status` int NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `product_name`, `image`, `price`, `discount`, `description`, `information`, `quantity`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 'Meat', 'products/KGzCpMVqRjRlzqLWE8YudsoBzUbIK6VuxewAu63o.jpg', 20.00, 0, '<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p><p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>', '<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p><p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.</p>', 1000, 1, 6, '2024-07-24 00:37:25', '2024-07-24 01:27:34'),
(3, 'Mango', 'products/m15wbO9cTxIOqzenpFQUJGct0ItAoyKLAYqAlMZl.jpg', 300.00, 0, '<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p><p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a.</p>', '<p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus.</p><p>Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus nibh. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.</p>', 1000, 1, 7, '2024-07-24 00:38:53', '2024-07-24 01:27:32'),
(4, 'Banana', 'products/JRVGZZw7Lwok33UHSMbJPmTswRNqnKEo5PinnIUK.jpg', 20.00, 0, '<p><span style=\"background-color:rgb(255,255,255);color:rgb(102,102,102);\">Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus.</span></p>', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(102,102,102);\">Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus.</span></p>', 1000, 1, 2, '2024-07-24 01:29:46', '2024-07-24 01:34:59'),
(5, 'Guava', 'products/XoX5HfUzgiW1fFAolTwtopEueDMgVsJ9a3jOi89S.jpg', 12.00, 0, '<p><span style=\"background-color:rgb(255,255,255);color:rgb(102,102,102);\">Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus.</span></p>', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(102,102,102);\">Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Proin eget tortor risus.</span></p>', 1000, 1, 7, '2024-07-24 01:30:50', '2024-07-24 01:34:56'),
(6, 'Watermelon', 'products/xGGN9aLSgSIweiKHyxv709eztCXJs7PmcSJbtkBd.jpg', 12.00, 0, '<p>Watermelon</p>', '<p>Watermelon</p>', 1000, 1, 7, '2024-07-24 01:31:17', '2024-07-24 01:34:50'),
(7, 'Blueberry', 'products/YuDYT5x0wBmYC2bq3GCgU0UoYA5cozQVNlmlgczo.jpg', 33.00, 0, '<p>Blueberry</p>', '<p>Blueberry</p>', 1000, 1, 2, '2024-07-24 01:31:55', '2024-07-24 01:34:47'),
(8, 'Hambuger', 'products/UPzxoilmnZrupbmTbTxncMSpk7tzxPujsSdRh0th.jpg', 55.00, 0, '<p>Hambuger</p>', '<p>Hambuger</p>', 1000, 1, 8, '2024-07-24 01:34:40', '2024-07-24 01:34:53'),
(9, 'Red Apple', 'products/2QJrdur8f8pbjiBLPLfB88RHlkxKvotzfUrC8s8d.jpg', 34.00, 0, '<p>Red Apple</p>', '<p>Red Apple</p>', 1000, 1, 7, '2024-07-24 01:40:21', '2024-07-24 01:40:26'),
(10, 'Orange Juice', 'products/12zwjqnxbFGPxJqgw65BxexsT7bqrdA1xX9cXc9T.jpg', 65.00, 0, '<p>Orange Juice</p>', '<p>Orange Juice</p>', 1000, 1, 2, '2024-07-24 01:43:18', '2024-07-29 02:30:52'),
(11, 'Chicken thighs', 'products/4X1FYOYsmtMB4md2ItGedLd9FRRlTLyYZKNWISG8.jpg', 45.00, 0, '<p>Chicken thighs</p>', '<p>Chicken thighs</p>', 1000, 0, 8, '2024-07-24 01:43:58', '2024-07-29 19:57:04'),
(12, 'Mixed Fruit', 'products/cfQ2gl0DXlxYKUaVrJKLX5XaC5KR5XYioGHJtft5.jpg', 120.00, 15, '<p>Mixed Fruit</p>', '<p>Mixed Fruit</p>', 1000, 1, 7, '2024-07-24 01:45:00', '2024-07-24 02:40:09'),
(13, 'Sliwki cale owooe', 'products/gROCQxmxD9kDANEQzm9lbZEpq5immcGMwrW4wwUS.jpg', 77.00, 0, '<p>Sliwki cale owooe</p>', '<p>Sliwki cale owooe</p>', 1000, 1, 4, '2024-07-24 01:45:59', '2024-07-29 02:30:55'),
(14, 'Mixed Fruit Juice', 'products/Pg008eTYmaf7ediw16Y3wvPgNwjdDVmr33XJd95o.jpg', 230.00, 0, '<p>Mixed Fruit Juice</p>', '<p>Mixed Fruit Juice</p>', 1000, 1, 2, '2024-07-24 01:46:54', '2024-07-24 01:54:44'),
(15, 'Mixed Vegetables', 'products/XGtEu7NfP4LUBfa0UCVLIMvRAB3pLvpV3m8hlyW3.jpg', 472.00, 0, '<p>Mixed Vegetables</p>', '<p>Mixed Vegetables</p>', 1000, 1, 5, '2024-07-24 01:47:29', '2024-07-24 01:54:38'),
(16, 'Fruit & More', 'products/xx7xom8038tsslICqtOwVp4QL8pfJQoHL5b2HMNe.jpg', 721.00, 0, '<p>Fruit &amp; More</p>', '<p>Fruit &amp; More</p>', 1000, 1, 4, '2024-07-24 01:48:14', '2024-07-29 02:30:47'),
(17, 'Vegetables Three', 'products/xQy9crgYk7iknxVixENymQhZnTwdGMVF9B8LGE8a.jpg', 62.00, 0, '<p>Vegetables Three</p>', '<p>Vegetables Three</p>', 1000, 1, 5, '2024-07-24 01:49:20', '2024-07-29 02:30:50'),
(18, 'Bell pepper', 'products/l92v2C7rdYG4yqWsZHFXwJI5ZdGbPVjPIx5hV3Hm.jpg', 43.00, 10, '<p>Bell pepper</p>', '<p>Bell pepper</p>', 1000, 1, 5, '2024-07-24 01:49:48', '2024-07-24 02:40:00'),
(19, 'Vegetable spinach', 'products/ocb9G2LFrDzqkCDj6ysxzIFQo0BaezOYLtHL3HcG.jpg', 38.00, 0, '<p>Vegetable spinach</p>', '<p>Vegetable spinach</p>', 1000, 1, 5, '2024-07-24 01:50:30', '2024-09-27 07:16:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-07-23 20:50:05', '2024-07-23 20:50:05'),
(2, 'staff', '2024-07-23 20:50:05', '2024-07-23 20:50:05'),
(3, 'user', '2024-07-23 20:50:05', '2024-07-23 20:50:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('GauwuGG9ZRLbWvgTGtU7v9tiXe6gK1Y3PVK7GHhf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36 Edg/129.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibERMcFJ0d0xUaFd3MlVXVWdEQVBIU3NYMGhrUzloZUJhUTdTYUZXYSI7czo0OiJjYXJ0IjthOjE6e2k6MTY7YTo1OntzOjI6ImlkIjtpOjE2O3M6NDoibmFtZSI7czoxMjoiRnJ1aXQgJiBNb3JlIjtzOjU6ImltYWdlIjtzOjUzOiJwcm9kdWN0cy94eDd4b204MDM4dHNzbElDcXRPd1ZwNFFMOHBmSlFvSEw1YjJITU5lLmpwZyI7czo1OiJwcmljZSI7czo2OiI3MjEuMDAiO3M6ODoicXVhbnRpdHkiO2k6MTt9fXM6OToiZmF2b3VyaXRlIjthOjE6e2k6MTY7YTo0OntzOjI6ImlkIjtpOjE2O3M6NDoibmFtZSI7czoxMjoiRnJ1aXQgJiBNb3JlIjtzOjU6ImltYWdlIjtzOjUzOiJwcm9kdWN0cy94eDd4b204MDM4dHNzbElDcXRPd1ZwNFFMOHBmSlFvSEw1YjJITU5lLmpwZyI7czo1OiJwcmljZSI7czo2OiI3MjEuMDAiO319czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fX0=', 1727446847);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disable` int NOT NULL DEFAULT '0',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `role_id`, `avatar`, `disable`, `address`, `phone`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 1, 'avatar/chs15qp6FKKUVwP6YaAwaIaR3QN6skDQnYmoYYnx.jpg', 0, '97 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng', '0366461704', 'Trần Quang Nghĩa', 'niboss458@gmail.com', '2024-07-26 20:36:43', '$2y$12$I.6b9w9dl7KD5EgJMxFeF.F64BGAEKp/5Rgi/C32BcEf4qVE5Aquy', 'lCByGKpTWtGOzZllj9Pmo3dRu5lSNpB4D93s0ftkjRNtd8JCjMnPaQkhHCZO', '2024-07-26 20:35:22', '2024-09-08 20:16:31'),
(5, 3, NULL, 1, NULL, NULL, 'Nguyễn Văn A', 'nguyenvana@gmail.com', NULL, '$2y$12$HSupv/hUXbV9le6bGdPTu.GI2Usowj/v7Euq3Yw9KxF9RPGhzhjdu', NULL, '2024-07-26 20:36:30', '2024-09-27 07:15:18'),
(7, 1, 'avatar/DDJB38BwKJP4nExwsk2njMotybXPffln5gIR8Wio.jpg', 0, 'Khối 4, huyện Đăk Tô, tỉnh KonTum', '0334093181', 'Nguyễn Thị Thanh Thảo', 'caytien412@gmail.com', NULL, '$2y$12$Seh4vKeT2NvL8Oz5QGammOs4hICXrOpVNjdwhyeAXxMuMIPgig3P2', NULL, '2024-07-26 21:49:32', '2024-08-10 00:20:38'),
(10, 1, 'avatar/51nmQm5eWqsQZIrvpuwn0fXvDeFHGuPCyMz268DC.jpg', 0, 'đn', '0999888777', 'Luân', 'niine2004@gmail.com', '2024-09-27 07:13:45', '$2y$12$q2fNMF8A50/PDkWVSam97.OTq5iBj3SdFN4YWFztIFBCjY2lEjhnq', NULL, '2024-09-27 07:12:56', '2024-09-27 07:14:43');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_blogs`
--
ALTER TABLE `category_blogs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `page_contact`
--
ALTER TABLE `page_contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `page_general`
--
ALTER TABLE `page_general`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `page_policy`
--
ALTER TABLE `page_policy`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `category_blogs`
--
ALTER TABLE `category_blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT cho bảng `page_contact`
--
ALTER TABLE `page_contact`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `page_general`
--
ALTER TABLE `page_general`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `page_policy`
--
ALTER TABLE `page_policy`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category_blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
