-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 22, 2025 lúc 12:13 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `binh_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('admin@yomail.com|127.0.0.1', 'i:1;', 1740707304),
('admin@yomail.com|127.0.0.1:timer', 'i:1740707304;', 1740707304);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(18, 'Laptop', 'categories/FisDu0LPiGC8MwKgHAIA1MU1OPlarvr3mGgHe7Vu.webp', 1, '2025-02-27 02:05:47', '2025-02-27 02:05:50'),
(19, 'Máy tính bảng', 'categories/4fcSpQtK7tbbFOJWKetm82VQPvgakMfgWYB2nITE.webp', 1, '2025-02-27 02:08:01', '2025-02-27 02:08:54'),
(20, 'Điện thoại', 'categories/Ei5ytvX66Xh820UyZAxZaUJwSfuF8XipCoZPVhOq.webp', 1, '2025-02-27 02:08:14', '2025-02-27 02:08:53'),
(21, 'Tai nghe', 'categories/2eBjWkvYuDKMZxtW4ncYlRPoUwgXgJI76nsvahZZ.webp', 1, '2025-02-27 02:09:45', '2025-02-27 02:11:12'),
(22, 'Bàn phím', 'categories/EZh035hCVvEiWOyFnqmleYqu2Wz6Z1qcrKnPGfTh.webp', 1, '2025-02-27 02:09:57', '2025-02-27 02:11:19'),
(23, 'Sạc dự phòng', 'categories/qMzH8hEFx3Oe6gvZEjwVEP4iuKLyIB1q2W5pNc22.webp', 1, '2025-02-27 02:10:08', '2025-02-27 02:11:21'),
(24, 'Chuột + Lót chuột', 'categories/UoGJrtWvOdc1jDUyQurPTPqefWHQ6qkAqtV1t4ZL.webp', 1, '2025-02-27 02:10:23', '2025-02-27 02:11:24'),
(25, 'Củ sạc', 'categories/yiN9ZGEosZk8VYBx2cswlXudFnrXKBdSlmFpPlXg.webp', 1, '2025-02-27 02:10:36', '2025-02-27 02:11:17'),
(26, 'Máy tính bàn (PC)', 'categories/E3ZhaQUoq48B1L1wbowHploWSkcoDc9veRWsvVx2.webp', 1, '2025-02-27 02:10:53', '2025-02-27 02:11:16'),
(27, 'Màn hình', 'categories/KKtpvrNwDXPTdAJSkA8IX5xsJIh1VHLjwonprgMO.webp', 1, '2025-02-27 02:11:06', '2025-02-27 02:11:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_blogs`
--

CREATE TABLE `category_blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
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
(34, 'abc', 'caytien412@gmail.com', 'pp00000', '2024-09-27 07:18:15', '2024-09-27 07:18:15'),
(35, 'cccc', 'niboss458@gmail.com', 'cccq111', '2024-09-28 08:18:11', '2024-09-28 08:18:11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(19, 23, 'image-more/5NMLQ1ijFtpH4k3VsI4C1SW2CYDuA7vEiFnkTFGl.webp', '2025-02-27 02:14:40', '2025-02-27 02:14:40'),
(20, 23, 'image-more/zejfDnISqIqM86BUEtT7mk0vdVB30ulUz1KqHJIO.webp', '2025-02-27 02:14:44', '2025-02-27 02:14:44'),
(21, 23, 'image-more/Qtie10kBfBSuBewXgWsfGZEYqPo2amN1cmIkVifu.webp', '2025-02-27 02:14:47', '2025-02-27 02:14:47'),
(22, 23, 'image-more/PcMqwPOPkxeLLUxf8qi6LKlhRczHQNXtD9Khhkak.webp', '2025-02-27 02:14:50', '2025-02-27 02:14:50'),
(23, 24, 'image-more/98My6HjDX0GC0yvM068fVMNRlBzVT7umtiZOkOpv.webp', '2025-02-27 03:43:43', '2025-02-27 03:43:43'),
(24, 24, 'image-more/kZECmt24GedOrHiVYYLilSPxlCKI9lQv6BiZG8ae.webp', '2025-02-27 03:43:46', '2025-02-27 03:43:46'),
(25, 24, 'image-more/cu4G3B3StYhAdXPTjkPrs0MUZLo9iN9uzynjsYWL.webp', '2025-02-27 03:43:50', '2025-02-27 03:43:50'),
(26, 24, 'image-more/yIZTpVLIniJw2NLHmw0LY3CXd1p4xThFacuMpGTL.webp', '2025-02-27 03:43:52', '2025-02-27 03:43:52'),
(27, 25, 'image-more/6CWrqxELyD8CbgimeRp5ceBP61docJULUCHObw83.jpg', '2025-02-27 03:53:29', '2025-02-27 03:53:29'),
(28, 25, 'image-more/K0WteVCuzW38Egcz2vpgwZAp1AN2MRzkpt2g7am9.jpg', '2025-02-27 03:53:31', '2025-02-27 03:53:31'),
(29, 25, 'image-more/BobwSfv5aG2ciG7KlFBzgfP3Fp8LwiC49kDU90Jh.jpg', '2025-02-27 03:53:37', '2025-02-27 03:53:37'),
(30, 25, 'image-more/KOhFoPzvcCgTSgdQwPAcdmvGeNQNymn758ZNYNnm.jpg', '2025-02-27 03:53:40', '2025-02-27 03:53:40'),
(31, 25, 'image-more/StBGTGKkVzWaWJil7RffRug8ugtVIfNFrPYXgzCo.jpg', '2025-02-27 03:53:49', '2025-02-27 03:53:49'),
(32, 25, 'image-more/EfEu5kHwwWOJt9xrq2JHTcI9StIQmt2VG1imKvuw.jpg', '2025-02-27 03:53:54', '2025-02-27 03:53:54'),
(33, 26, 'image-more/vs114WHdqpwi6IG53zSrcyao9IuSZxF8MWPz5dT9.jpg', '2025-02-27 04:01:14', '2025-02-27 04:01:14'),
(34, 26, 'image-more/SaLzq5AJRngnT5rBMh803UvblGUUFz3B2ulHHLuY.jpg', '2025-02-27 04:01:17', '2025-02-27 04:01:17'),
(35, 26, 'image-more/JN2MaosqGljpFfO7JLhTTyAaX2OfFWkyUgRW3VNk.jpg', '2025-02-27 04:01:20', '2025-02-27 04:01:20'),
(36, 26, 'image-more/yGtcf9gtIL6LGOY3PTCA5Lu4o9Hqq447e03FfVOQ.jpg', '2025-02-27 04:01:23', '2025-02-27 04:01:23'),
(37, 27, 'image-more/PdtaNWnabTw7gMs2GLSjvvKa3FtqSdh1RT8n7RcP.jpg', '2025-02-27 04:03:11', '2025-02-27 04:03:11'),
(38, 27, 'image-more/c1Me5yIqlRWzZxVIIwA3O4OtZT3xClShw7kFrYzI.jpg', '2025-02-27 04:03:16', '2025-02-27 04:03:16'),
(39, 27, 'image-more/Cho9tye9bj54doQ3WW2zOAEperUhWc1cPQ40niab.jpg', '2025-02-27 04:03:18', '2025-02-27 04:03:18'),
(40, 27, 'image-more/xBilqd1C9mUP3nU1tNPVFwGT90mBASVnc4IX6vEr.jpg', '2025-02-27 04:03:21', '2025-02-27 04:03:21'),
(41, 27, 'image-more/3Hk84PhQDTkIyuITjuMW1437DAL7NGvLcwERfFDa.jpg', '2025-02-27 04:03:24', '2025-02-27 04:03:24'),
(42, 28, 'image-more/uL5a0nno8aynQSFloivdb8TtEnYyyQ43uKcVTgBq.jpg', '2025-02-28 07:05:53', '2025-02-28 07:05:53'),
(43, 28, 'image-more/hQQQZHzz1ItJdUHMsD2QmKd511Jn82HBxJyfmHfR.jpg', '2025-02-28 07:05:58', '2025-02-28 07:05:58'),
(44, 28, 'image-more/UjlVdPkP5vPE7H4pVWJgyTq8nVCdKVifnMEbIrtQ.jpg', '2025-02-28 07:06:06', '2025-02-28 07:06:06'),
(45, 28, 'image-more/Wr1bOatoow6TMaqQrwbJDGaEGLZhk5yFQSRih9xM.jpg', '2025-02-28 07:06:10', '2025-02-28 07:06:10'),
(46, 28, 'image-more/oPdeTPIKc9yrzdIk1HebMpGkHPizfzsPDeXHjsLd.jpg', '2025-02-28 07:06:13', '2025-02-28 07:06:13'),
(47, 28, 'image-more/RRgOQYHUSzR7LSFuAKIjcrXyz2XNRTLX06w71m0P.jpg', '2025-02-28 07:06:24', '2025-02-28 07:06:24'),
(48, 29, 'image-more/tFPXIuSrzhTcXA8fqWYGttTHphitd0UDmH4pG2l9.jpg', '2025-02-28 07:09:59', '2025-02-28 07:09:59'),
(49, 29, 'image-more/eVYzyLzUowwwIzeMPMQgK1iuU1PR8KpSze6j2YQx.jpg', '2025-02-28 07:10:04', '2025-02-28 07:10:04'),
(50, 29, 'image-more/Scm6hCESwiQglLqN2yH2tLJEUJDsmJ0RI8mwdKTt.jpg', '2025-02-28 07:10:08', '2025-02-28 07:10:08'),
(51, 29, 'image-more/3kSBolLHpLF4owyox7QwxjpCo2JOKyyoSH19bv99.jpg', '2025-02-28 07:10:11', '2025-02-28 07:10:11'),
(52, 29, 'image-more/gQiolbJM6SDG1YHg2ZTj8HONMnFPUZ6PyfOawvsJ.jpg', '2025-02-28 07:10:14', '2025-02-28 07:10:14'),
(53, 29, 'image-more/JHm8ukF6UpJa3VEtzhjSqAnxDbHvATGdE5MAKznL.jpg', '2025-02-28 07:10:18', '2025-02-28 07:10:18'),
(54, 30, 'image-more/Gbe16z4NN1YvFT925WsCr6kIK4IBAp6CDIQYDPnS.jpg', '2025-02-28 07:26:47', '2025-02-28 07:26:47'),
(55, 30, 'image-more/1RkdSCx2W4AUqiLmii7AAASx779ACm7W2BlmWVMO.jpg', '2025-02-28 07:26:51', '2025-02-28 07:26:51'),
(56, 30, 'image-more/bkdQlKdaN2DhN2gWKLpfqGnHUmLEXN5KBWcoX43j.jpg', '2025-02-28 07:26:55', '2025-02-28 07:26:55'),
(57, 30, 'image-more/pzTYwZ4m0YSUcVR6SfCIUhMOF4g7DfI4zOciE29t.jpg', '2025-02-28 07:26:58', '2025-02-28 07:26:58'),
(58, 30, 'image-more/3Gka7HUkdjFtz4WTtM8ukxGg9s1bT2CNjUVpjmba.jpg', '2025-02-28 07:27:01', '2025-02-28 07:27:01'),
(59, 30, 'image-more/MhE3ZyCpCdhl9mFyIkLnoDPkrCJ130v8GsiNr2gQ.jpg', '2025-02-28 07:27:05', '2025-02-28 07:27:05'),
(60, 31, 'image-more/bttZX09XmuzeMV4Flxp0n0mKKIwyktmQE85oHB4e.jpg', '2025-02-28 07:29:39', '2025-02-28 07:29:39'),
(61, 31, 'image-more/i39UXSflZRgpqsadHiqa3mHbEqqiGlcDs9AjNNUy.jpg', '2025-02-28 07:29:45', '2025-02-28 07:29:45'),
(62, 31, 'image-more/atz6Zs4DnOMzQBafq1eWq0wN16Zyk22vGM8A2FC0.jpg', '2025-02-28 07:29:49', '2025-02-28 07:29:49'),
(63, 31, 'image-more/i2OPG0UfL16UFi6Z03DMfFf0NjZixx7F0lWnDiZJ.jpg', '2025-02-28 07:29:53', '2025-02-28 07:29:53'),
(64, 32, 'image-more/QmBlb62sm9XY3P7OFwAvBnndz98OjroQCWniSGDb.jpg', '2025-02-28 07:32:48', '2025-02-28 07:32:48'),
(65, 32, 'image-more/uRxtEtm5vzDIfidjHgSxcO1FTvk11aaRd5hi1vMi.jpg', '2025-02-28 07:32:52', '2025-02-28 07:32:52'),
(66, 32, 'image-more/PW3o9KlhdG8KCS0gxl1ddevjYYqogwXG4yz7f4xd.jpg', '2025-02-28 07:32:55', '2025-02-28 07:32:55'),
(67, 32, 'image-more/QoUv8bTElXfm35PmEIen39rJ2Jz29F5srTRBIReF.jpg', '2025-02-28 07:32:58', '2025-02-28 07:32:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `id_link` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `content`, `type`, `id_link`, `created_at`, `updated_at`) VALUES
(1, 'Đơn hàng mới từ NewStyle Shop', 'order', 126, '2025-02-28 08:37:57', '2025-02-28 08:37:57'),
(2, 'Đơn hàng mới từ admin', 'order', 127, '2025-10-22 02:43:02', '2025-10-22 02:43:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `total` int(11) NOT NULL,
  `shipping_address` text NOT NULL,
  `phone` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `note` varchar(200) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_number`, `total`, `shipping_address`, `phone`, `email`, `note`, `payment_method`, `status`, `created_at`, `updated_at`) VALUES
(127, 11, 'ORD-E5BA9', 38000000, 'Bình', '0889639655', 'vubinh0212004@gmail.com', '0', 'Chuyển Khoản Ngân Hàng', 'paid', '2025-10-22 02:43:02', '2025-10-22 02:48:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `quantity`, `created_at`, `updated_at`) VALUES
(368, 127, 24, 38000000.00, 1, '2025-10-22 02:43:02', '2025-10-22 02:43:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `page_contact`
--

CREATE TABLE `page_contact` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) NOT NULL DEFAULT '0366461704',
  `address` varchar(255) NOT NULL DEFAULT 'Đà Nẵng',
  `open_time` varchar(255) NOT NULL DEFAULT '10:00 am',
  `close_time` varchar(255) NOT NULL DEFAULT '23:00 pm',
  `email` varchar(255) NOT NULL DEFAULT 'nghiadaica@gmail.com',
  `url_iframe` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page_contact`
--

INSERT INTO `page_contact` (`id`, `phone`, `address`, `open_time`, `close_time`, `email`, `url_iframe`, `created_at`, `updated_at`) VALUES
(1, '0999888777', 'Đà Nẵng, Việt Nam', '10:00 am', '23:00 pm', 'egagear@gmail.com', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d245368.28264361413!2d107.9133126717606!3d16.07174599039564!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219c792252a13%3A0x1df0cb4b86727e06!2zxJDDoCBO4bq1bmcsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1723361548879!5m2!1svi!2s', NULL, '2025-02-27 01:21:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `page_general`
--

CREATE TABLE `page_general` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `app_name` varchar(255) NOT NULL DEFAULT 'Ogani',
  `welcome` varchar(255) NOT NULL DEFAULT 'Free Shipping for all Order of $99',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page_general`
--

INSERT INTO `page_general` (`id`, `logo`, `app_name`, `welcome`, `created_at`, `updated_at`) VALUES
(1, 'logos/logo.png', 'EgaGear', 'Miễn phí vận chuyển toàn quốc', NULL, '2024-09-27 07:18:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `page_policy`
--

CREATE TABLE `page_policy` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page_policy`
--

INSERT INTO `page_policy` (`id`, `content`, `created_at`, `updated_at`) VALUES
(1, '<h3>1. Chính sách Giao hàng</h3><p>Chúng tôi cung cấp dịch vụ giao hàng trên toàn quốc với thời gian vận chuyển từ <strong>3-7 ngày làm việc</strong>, tùy theo địa điểm nhận hàng.<br>Phí vận chuyển được tính dựa trên địa chỉ của khách hàng và sẽ được thông báo trước khi xác nhận đơn hàng.</p><h3>2. Chính sách Thanh toán</h3><p>Khách hàng có thể chọn <strong>nhiều phương thức thanh toán</strong>, bao gồm:</p><ul><li>Thanh toán khi nhận hàng (<strong>COD</strong>)</li><li>Chuyển khoản ngân hàng</li><li>Thanh toán trực tuyến qua thẻ tín dụng/thẻ ghi nợ hoặc ví điện tử</li></ul><p>Thanh toán cần được hoàn tất trước khi đơn hàng được xử lý và giao đi.</p><h3>3. Chính sách Đổi trả và Hoàn tiền</h3><ul><li>Chúng tôi chấp nhận đổi trả hàng <strong>trong vòng 14 ngày</strong> kể từ khi nhận hàng để được <strong>hoàn tiền 100% hoặc đổi sản phẩm khác</strong>, với điều kiện sản phẩm còn <strong>nguyên trạng và bao bì ban đầu</strong>.</li><li><strong>Phí vận chuyển hoàn trả</strong> sẽ do khách hàng chịu, trừ khi sản phẩm có lỗi hoặc sai sót từ phía chúng tôi.</li><li><strong>Hoàn tiền</strong> sẽ được xử lý <strong>trong vòng 7 ngày làm việc</strong> sau khi chúng tôi nhận và kiểm tra sản phẩm hoàn trả.</li></ul><h3>4. Chính sách Bảo mật</h3><ul><li>Chúng tôi cam kết <strong>bảo vệ thông tin cá nhân</strong> của khách hàng và đảm bảo trải nghiệm mua sắm <strong>an toàn, bảo mật</strong>.</li><li>Thông tin khách hàng chỉ được sử dụng <strong>để xử lý đơn hàng và cải thiện dịch vụ</strong>.</li><li>Chúng tôi <strong>không chia sẻ thông tin khách hàng</strong> với bên thứ ba, trừ khi có yêu cầu theo quy định của pháp luật.</li></ul><h3>5. Điều khoản Dịch vụ</h3><ul><li>Khi sử dụng website của chúng tôi, khách hàng đồng ý với <strong>các điều khoản và điều kiện</strong>, bao gồm <strong>chính sách giao hàng, thanh toán, đổi trả và bảo mật</strong>.</li><li>Chúng tôi <strong>có quyền cập nhật hoặc thay đổi</strong> các chính sách này bất cứ lúc nào mà không cần thông báo trước.</li></ul>', NULL, '2025-02-27 01:19:17');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `information` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `product_name`, `image`, `price`, `discount`, `description`, `information`, `quantity`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(23, 'Apple iMac M3 MQRU3SA/A  bản nâng cấp 2025', 'products/e3cbDYSxf2Cxdoy7Id0n3trB04oFzpHbIsg7KHZ5.webp', 67200000.00, 10, '<p>Chiếc iMac 24 inch M3 MQRU3SA/A sở hữu thiết kế All-in-One của Apple với kiểu dáng tinh tế, vỏ nhôm nguyên khối mỏng nhẹ cùng màu sắc trẻ trung (ví dụ phiên bản “Pink”/hồng) — phù hợp với không gian làm việc hiện đại hoặc căn hộ nhỏ. Màn hình lớn 24 inch độ phân giải cao, chip M3 mới giúp máy vừa đáp ứng tốt nhu cầu văn phòng, học tập, lướt web, vừa đủ mạnh để xử lý đồ họa nhẹ và giải trí. Nếu bạn đang tìm một máy tính để bàn gọn gàng, bền và hiệu năng “chất” — thì đây là một lựa chọn đáng lưu tâm.</p>', '<p><strong>Bộ xử lý (Chip):</strong> Apple M3 với CPU 8 nhân (4 lõi hiệu năng + 4 lõi tiết kiệm) và GPU 10 nhân trong phiên bản này.&nbsp;<a href=\"https://www.anphatpc.com.vn/may-tinh-all-in-one-apple-imac-24-inch-m3-8-cpu-10-gpu-8gb-512gb-mqru3sa/a-pink-chinh-hang-apple-viet-nam.html?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Bộ nhớ (RAM):</strong> 8 GB unified memory là mức khởi điểm — (không nâng cấp sau mua)<a href=\"https://laptopworld.vn/imac-m3-24-inch-mqru3sa-a.html?utm_source=chatgpt.com\">.&nbsp;</a></p><p><strong>Ổ cứng (SSD):</strong> 512 GB SSD trong cấu hình này — đủ cho hệ điều hành, phần mềm và lưu trữ vừa phải.&nbsp;<a href=\"https://nguyenvu.store/san-pham/apple-imac-m3-mqru3sa-a/?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Màn hình:</strong> 24 inch Retina 4.5K (độ phân giải 4 480 × 2 520), hỗ trợ 1 tỉ màu, độ sáng khoảng 500 nit, dải màu rộng P3 và công nghệ True Tone.&nbsp;<a href=\"https://laptopworld.vn/imac-m3-24-inch-mqru3sa-a.html?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Âm thanh &amp; camera:</strong> Hệ thống âm thanh sáu loa, hỗ trợ Dolby Atmos, ba micro chuẩn studio; camera FaceTime HD 1080p tích hợp xử lý hình ảnh nâng cao.&nbsp;<a href=\"https://nguyenvu.store/san-pham/apple-imac-m3-mqru3sa-a/?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Kết nối &amp; cổng giao tiếp:</strong></p><p>2 x Thunderbolt / USB 4 (tốc độ cao).&nbsp;</p><p>Jack tai nghe 3.5 mm, Wi-Fi 6E, Bluetooth 5.3.&nbsp;</p><p><strong>Thiết kế &amp; kích thước:</strong> Trọng lượng khoảng 4.43 kg; kích thước thân máy khoảng 54.7 cm × 46.1 cm × 14.7 cm.&nbsp;<a href=\"https://nguyenvu.store/san-pham/apple-imac-m3-mqru3sa-a/?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Hệ điều hành:</strong> macOS, hỗ trợ đa nền tảng với iPhone/iPad trong hệ sinh thái Apple, cập nhật phần mềm lâu dài.</p>', 124, 1, 18, '2025-02-27 02:14:30', '2025-10-22 03:07:22'),
(24, 'Laptop Acer Predator Helios Neo PHN16-71-53M7', 'products/gzIYPMn7x3ghINonWFuY3bUpWJ2DBaZUtUTcsRgs.webp', 38000000.00, 0, '<p>Laptop Acer Predator Helios Neo 16 PHN16-71-53M7 là mẫu laptop gaming cao cấp hướng tới game thủ và người sáng tạo nội dung mong muốn một thiết bị mạnh mẽ toàn diện. Với màn hình 16″ tỉ lệ 16:10, cấu hình CPU Intel thế hệ mới và GPU NVIDIA RTX 40-Series, máy mang lại trải nghiệm chơi game, làm việc đồ họa và đa nhiệm cực kỳ ấn tượng. Thiết kế hầm hố với tông màu đen “Obsidian Black”, hệ thống tản nhiệt hiệu suất cao — tất cả để hỗ trợ người dùng “chiến” mà không lo tụt hiệu năng.</p>', '<p><strong>CPU:</strong> Intel® Core™ i5-13500HX (14 nhân/20 luồng) — mang lại hiệu năng mạnh mẽ để chơi game AAA và xử lý tác vụ sáng tạo.&nbsp;</p><p><strong>GPU:</strong> NVIDIA® GeForce RTX™ 4060 (8GB GDDR6) — card đồ họa rời cao cấp, đáp ứng tốt các tựa game và tác vụ dựng hình ở mức cao.&nbsp;</p><p><strong>RAM:</strong> 16 GB DDR5 (có 2 khe hỗ trợ nâng cấp đến 32 GB hoặc hơn tùy cấu hình).&nbsp;</p><p><strong>Ổ cứng:</strong> SSD 512 GB NVMe PCIe — đủ để cài hệ điều hành, game và phần mềm nặng một cách nhanh chóng.&nbsp;</p><p><strong>Màn hình:</strong> 16″, độ phân giải WUXGA (1920×1200), tần số quét 165 Hz, độ sáng ~400 nits, tỉ lệ 16:10 và phủ màu 100% sRGB.&nbsp;<a href=\"https://store.acer.com/vi-vn/predator-helios-neo-16-phn16-71-53m7?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Thiết kế &amp; trọng lượng:</strong> Kích thước khoảng 360.1 × 279.9 × 26.55 mm, trọng lượng khoảng 2.6 kg — thuộc dạng “gọn hơn trước” cho laptop gaming 16″ hiệu suất cao.&nbsp;</p><p><strong>Tản nhiệt:</strong> Hệ thống tản nhiệt cao cấp với 2 quạt, công nghệ AeroBlade™ 3D thế hệ thứ 5 và lớp keo kim loại lỏng giúp duy trì hiệu năng khi chơi game liên tục.&nbsp;<a href=\"https://maytinhnamha.vn/laptop-acer-gaming-predator-helios-neo-phn16-71-53m7-core-i5-13500hx-16gb-ram-512gb-ssd-geforce-rtx-4050-6gb-16-inch-2k-165hz-win-11-den.html?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Cổng giao tiếp &amp; kết nối:</strong> Trang bị đa dạng cổng USB-C, USB-A, HDMI 2.1, RJ-45, Wi-Fi 6E, hỗ trợ nâng cấp RAM/SSD rất thuận tiện.&nbsp;</p><p><strong>Hệ điều hành &amp; bảo hành:</strong> Cài sẵn Windows 11 Home, bảo hành “1 năm 3S1” (1 đổi 1 nếu không hoàn thành bảo hành trong 72 giờ) tại Việt Nam.</p>', 167, 1, 18, '2025-02-27 03:43:36', '2025-10-22 03:06:10'),
(25, 'Laptop Asus Vivobook Go 15 E1504FA R5 7520U', 'products/LWnoBC0V47iVizLcpwy1rSFZqzeSnBPNYvOcziaP.jpg', 12900000.00, 10, '<p>Laptop ASUS Vivobook Go 15 E1504FA là một mẫu máy 15,6 inch hướng tới người dùng học tập, văn phòng và di động—khi bạn cần màn hình rộng nhưng vẫn gọn nhẹ. Với bộ xử lý Ryzen 5 và dung lượng RAM/SSD ổn định, máy cân đối giữa hiệu năng và giá thành. Thiết kế trẻ trung với viền màn hình mỏng – phù hợp khi bạn muốn một chiếc máy “đủ dùng” hàng ngày nhưng không quá “nặng nề” hay cồng kềnh.</p>', '<p><strong>CPU:</strong> AMD Ryzen 5 7520U (4 nhân, 8 luồng, xung cơ bản 2.8GHz — lên tới ~4.3GHz).&nbsp;</p><p><strong>RAM:</strong> 16GB LPDDR5 (on-board) — phiên bản phổ biến là 16GB.&nbsp;<a href=\"https://villman.com/Product-Detail/asus_vivobook-go-15-e1504fa-nj1528wsm--156inch-fhd--amd-ryzen-5-7520--16gb-ram--512gb-ssd--amd-radeon-graphics--win11?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Ổ cứng:</strong> 512GB SSD M.2 NVMe PCIe — đủ dung lượng cho lưu trữ và khởi động nhanh.&nbsp;<a href=\"https://www.asus.com/laptops/for-home/vivobook/vivobook-go-15-oled-e1504f/techspec/?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Màn hình:</strong> 15,6 inch, độ phân giải Full HD (1920×1080), tấm nền thường (LED) với độ sáng ~250 nits, tỷ lệ 16:9, viền mảnh “NanoEdge”.&nbsp;<a href=\"https://www.asus.com/laptops/for-home/vivobook/vivobook-go-15-oled-e1504f/techspec/?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Đồ họa:</strong> Đồ họa tích hợp AMD Radeon Graphics — không phải GPU rời, nhưng phù hợp xử lý tác vụ văn phòng, lướt web, xem phim.&nbsp;</p><p><strong>Cổng kết nối và giao tiếp:</strong></p><p>USB Type-C (USB 3.2 Gen1) + USB Type-A + HDMI 1.4 + jack tai nghe 3.5mm.&nbsp;</p><p>Kết nối không dây Wi-Fi 6E / Bluetooth 5.3 (tuỳ thị trường).&nbsp;</p><p><strong>Thiết kế &amp; trọng lượng:</strong> Trọng lượng khoảng ~1.63 kg, độ dày khoảng ~17.9 mm, thuận tiện mang theo di chuyển.&nbsp;<a href=\"https://www.asus.com/us/laptops/for-home/vivobook/vivobook-go-15-oled-e1504f/techspec/?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Hệ điều hành:</strong> Cài sẵn Windows 11 Home / Windows 11 (tuỳ biến thể) — ready to use ngay khi mua.</p>', 340, 1, 18, '2025-02-27 03:53:15', '2025-10-22 03:05:12'),
(26, 'Laptop HP 15 fc0085AU R5 7430U/16GB/512GB/Win11', 'products/B32TQkiB2PxVh0bWsfWf4ugyYwLvyd0PYiZr8cwb.jpg', 13900000.00, 10, '<p>Laptop HP 15 fc0085AU là mẫu laptop 15,6 inch thuộc phân khúc phổ thông-văn phòng nhưng có cấu hình mạnh mẽ với chip AMD Ryzen 5 7430U và RAM lớn 16 GB, SSD 512 GB. Máy phù hợp cho người dùng học tập, làm việc, lướt web, xử lý đa nhiệm và giải trí nhẹ nhàng trong một thiết kế gọn gàng và dễ dùng.</p>', '<p><strong>CPU:</strong> AMD Ryzen™ 5 7430U (6 nhân, 12 luồng, turbo lên tới 4,3 GHz).&nbsp;</p><p><strong>RAM:</strong> 16 GB DDR4-3200 MT/s (2 x 8GB).&nbsp;</p><p><strong>Ổ cứng:</strong> 512 GB SSD NVMe M.2 — khởi động nhanh, phản hồi tốt trong các tác vụ hằng ngày.&nbsp;</p><p><strong>Màn hình:</strong> 15,6 inch Full HD (1920×1080), công nghệ chống chói (Anti-Glare), độ sáng khoảng 250 nits, độ phủ màu ~45% NTSC.&nbsp;<a href=\"https://menkar.vn/laptop-hp15-fc0085au-r5-7430u-16gb-512gb-win11-a6vv8pa?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Đồ họa:</strong> AMD Radeon Graphics tích hợp — đủ dùng cho làm việc, xem phim, chơi game nhẹ.&nbsp;<a href=\"https://www.hp.com/lk-en/products/laptops/product-details/product-features/2102459748?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Hệ điều hành:</strong> Cài sẵn Windows 11 Home Single Language.&nbsp;<a href=\"https://www.hp.com/bd-en/products/laptops/product-details/2102459748?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Thiết kế &amp; kích thước:</strong> Dòng “HP 15” – vỏ ngoài nhẹ và thân máy dạng phổ thông thuận tiện mang đi học hoặc mang đến văn phòng. (Cân nặng và kích thước cụ thể chưa rõ chi tiết trong nguồn).&nbsp;</p><p><strong>Tính năng thêm:</strong> Hỗ trợ sạc nhanh (HP Fast Charge) và có màn hình Full HD với công nghệ flicker-free để giảm mỏi mắt.</p>', 250, 1, 18, '2025-02-27 04:01:07', '2025-10-22 03:03:20'),
(27, 'Laptop Apple MacBook Air 13 inch M1 8GB/256GB', 'products/A1hspJt6bKWBETQkZ2A8rzu3lFf29mYIGUCpVfyc.png', 17490000.00, 10, '<p>MacBook Air 13 inch với chip Apple M1 là mẫu laptop mỏng nhẹ và mạnh mẽ của Apple, hướng đến người dùng cần một thiết bị đa năng: làm việc văn phòng, học tập, giải trí, và có thể một chút chỉnh sửa hình ảnh/video cơ bản. Thiết kế nhôm nguyên khối, trọng lượng nhẹ và gần như không có quạt tản nhiệt khiến máy rất yên tĩnh khi sử dụng.</p>', '<p><strong>Chip xử lý (CPU + GPU):</strong> Apple M1 với 8 lõi CPU (4 lõi hiệu năng + 4 lõi tiết kiệm) và GPU tích hợp 7 hoặc 8 lõi tùy phiên bản — mang lại khả năng xử lý vượt trội trong tầm giá.&nbsp;<a href=\"https://everymac.com/systems/apple/macbook-air/specs/macbook-air-m1-8-core-7-core-gpu-13-retina-display-2020-specs.html?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>RAM &amp; bộ nhớ lưu trữ:</strong> 8 GB bộ nhớ “unified memory” tích hợp trên chip (không thể nâng cấp sau mua) và ổ SSD 256 GB — đủ dùng cho hầu hết công việc hàng ngày, nhưng nếu chạy nhiều ứng dụng nặng hoặc lưu trữ lớn thì nên cân nhắc phiên bản dung lượng cao hơn.&nbsp;<a href=\"https://nanoreview.net/en/laptop/apple-macbook-air-m1-2020?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Màn hình:</strong> Màn hình Retina 13,3 inch với độ phân giải 2560×1600 pixel, hiển thị sắc nét, màu sắc tốt, và hỗ trợ công nghệ True Tone giúp mắt đỡ mỏi hơn khi sử dụng trong thời gian dài.&nbsp;<a href=\"https://www.bestbuy.com/site/macbook-air-13-3-laptop-apple-m1-chip-8gb-memory-256gb-ssd-space-gray/5721600.p?skuId=5721600&amp;utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Thiết kế &amp; trọng lượng:</strong> Máy rất mỏng nhẹ, trọng lượng khoảng ~1.29 kg (hoặc ~2.8 lb) tùy phiên bản — cực kỳ thuận tiện để mang theo học hoặc di chuyển công tác.&nbsp;<a href=\"https://www.productchart.com/laptops/37024?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Thời lượng pin &amp; hoạt động:</strong> Nhờ chip M1 rất tiết kiệm điện, máy có thể dùng khá lâu trong thực tế (web, video, làm việc) — người dùng ghi nhận có thể lên tới ~15-18 giờ trong điều kiện lý tưởng.&nbsp;</p><p><strong>Cổng kết nối &amp; tính năng:</strong> 2 cổng Thunderbolt/USB-4 (USB-C), hỗ trợ sạc, xuất hình ảnh; Wi-Fi 6, Bluetooth 5.0; Loa stereo, Touch ID tích hợp trên bàn phím — hệ sinh thái Apple thuận tiện nếu bạn đã dùng iPhone/iPad.&nbsp;</p><p><strong>Hệ điều hành:</strong> Cài sẵn macOS, tích hợp tốt với các thiết bị Apple khác và được cập nhật phần mềm nhiều năm — giúp kéo dài “tuổi thọ sử dụng” của máy.</p>', 160, 1, 18, '2025-02-27 04:03:03', '2025-10-22 03:03:33'),
(28, 'Laptop Lenovo Ideapad Slim 3 15IAH8 i5', 'products/UJuvujS6uwD3OGPS2oLnfNxBMRnZ6hXKaFWtZWfV.jpg', 14590000.00, 0, '<p>Laptop Lenovo IdeaPad Slim 3 15IAH8 là mẫu máy mỏng nhẹ, hướng tới người dùng học tập, văn phòng hoặc sinh viên cần một thiết bị ổn định, hiệu năng tốt và dễ di chuyển. Với màn hình lớn 15,6 inch, thiết kế thanh lịch với tông màu trang nhã và cấu hình mới, máy vừa phù hợp cho công việc đa nhiệm vừa đáp ứng nhu cầu giải trí nhẹ nhàng.</p>', '<p><strong>CPU:</strong> Intel Core i5-12450H (8 nhân: 4 nhân hiệu năng + 4 nhân tiết kiệm điện, 12 luồng) với tốc độ tối đa lên tới 4,4GHz. &nbsp;</p><p><strong>RAM:</strong> Hỗ trợ đến 16 GB LPDDR5-4800 (đa số máy bản sẵn 8 GB hoặc 16 GB).&nbsp;</p><p><strong>Ổ cứng:</strong> SSD M.2 NVMe — các bản phổ biến là 512 GB, có hỗ trợ đến 1TB tùy phiên bản.&nbsp;<a href=\"https://icecat.us/p/lenovo/83er006qsp/ideapad-laptops-0197532488953-ideapad%2Bslim%2B3%2B15iah8-117194330.html?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Card đồ họa:</strong> Đồ họa tích hợp Intel UHD Graphics (không có GPU rời) — phù hợp cho làm việc, học tập, giải trí nhưng không chuyên chơi game nặng.&nbsp;<a href=\"https://gzhls.at/blob/ldb/5/6/7/5/e3c9e4c47238229144eeb9aa8a096c20f3d7.pdf?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Màn hình:</strong> 15,6 inch Full HD (1920×1080) — một số phiên bản dùng panel TN hoặc IPS, độ sáng ~250–300 nits, chống chói.&nbsp;<a href=\"https://ecommerce.datablitz.com.ph/products/lenovo-ideapad-slim-3-15iah8-83er00heph-laptop-arctic-grey-15-6-fhd-1920x1080-tn-i5-12450h-16gb-ram-512gb-ssd-integrated-intel-uhd-windows-11-home-lenovo-casual-backpack-b210?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Kết nối &amp; cổng giao tiếp:</strong> Hỗ trợ USB-C, HDMI, WiFi 6 (802.11ax) và Bluetooth. Máy có khả năng xuất hình đến 2 màn ngoài cộng với màn chính.&nbsp;<a href=\"https://psref.lenovo.com/Product/IdeaPad_Slim_3_15IAH8?tab=spec&amp;utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Thiết kế &amp; trọng lượng:</strong> Vỏ hợp kim/nhựa cao cấp, màu sắc trang nhã (“Arctic Grey”, “Abyss Blue”), trọng lượng từ khoảng ~1,6 kg (đối với bản nhẹ) — thuận tiện mang đi.&nbsp;<a href=\"https://www.dateks.lv/en/cenas/portativie-datori/1019215-lenovo-ideapad-slim-3-15iah8-arctic-grey-15-6-fhd-ips-core-i5-12450h-8gb-512gb-ssd-no-os?utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>Hệ điều hành:</strong> Cài sẵn Windows 11 Home/Pro — người dùng mở hộp và sử dụng ngay.</p>', 226, 1, 18, '2025-02-28 07:05:43', '2025-10-22 03:04:05'),
(29, 'Laptop Acer Nitro V 15 ANV15 41 R2UP R5', 'products/32TUeuCxGY9gG8Y5kZnrBBT4uNU1RyWWVtS9U8Sk.jpg', 19600000.00, 10, '<p>Acer Nitro V 15 ANV15-41-R2UP là mẫu laptop gaming 15,6 inch thuộc phân khúc phổ thông nhưng vẫn đảm bảo hiệu năng tốt cho chơi game và làm việc. Máy mang kiểu thiết kế đậm chất game thủ với tông màu đen cổ điển, các đường nét góc cạnh và hệ thống tản nhiệt mở rộng—phù hợp với người dùng cần một chiếc máy “ngon” với mức giá hợp túi tiền.</p>', '<p><strong>CPU:</strong> AMD Ryzen 5 6600H (nhiều nguồn ghi là R5-6600H) — phù hợp cho chơi game và đa nhiệm nhẹ nhàng.&nbsp;</p><p><strong>GPU:</strong> NVIDIA GeForce RTX 2050 (4 GB) trong cấu hình này, đủ để chơi game eSports và xử lý đồ họa cơ bản.&nbsp;<a href=\"https://us.sicce.com/en/catalogsearch/result/?q=Laptop+Acer+Gaming+Nitro+V+15+ANV15+41+R2UP+R5+6600H%2F16GB%2F512GB%2F4GB+RTX2050%2F165Hz%2FWin11+%28NH.QPGSV.004%29&amp;utm_source=chatgpt.com\">&nbsp;</a></p><p><strong>RAM:</strong> 16 GB DDR5 — đủ để chạy game, đa tab làm việc và xử lý các tác vụ vừa phải.</p><p><strong>SSD:</strong> 512 GB NVMe — dung lượng tốt để cài đặt game, phần mềm và lưu trữ dữ liệu cá nhân.</p><p><strong>Màn hình:</strong> 15,6 inch độ phân giải Full HD (1920×1080), tần số quét cao (có thể đến ~165 Hz tùy bản) — giúp hiển thị mượt hơn khi chơi game.&nbsp;</p><p><strong>Cổng kết nối &amp; tính năng khác:</strong> Hỗ trợ HDMI, USB-C, USB-A, kết nối mạng RJ-45 + Wi-Fi, Bluetooth — đáp ứng nhu cầu kết nối đa dạng.&nbsp;</p><p><strong>Thiết kế và trọng lượng:</strong> Kích thước gọn gàng cho máy 15,6″, độ dày khoảng 23,5 mm, trọng lượng khoảng ~2,1 kg — hợp cho người muốn mang máy đi lại.&nbsp;</p><p><strong>Hệ điều hành:</strong> Cài sẵn Windows 11 Home → dùng ngay sau khi mua.</p>', 205, 1, 18, '2025-02-28 07:09:50', '2025-10-22 03:03:54'),
(30, 'Laptop Lenovo Gaming LOQ Essential 15IAX9E i5', 'products/iPEOd5C65tsOZzCs2LNIG5rfegyaNUFyiHxV9Pwz.jpg', 19600000.00, 10, '<p>Laptop Lenovo LOQ Essential 15IAX9E là chiếc máy chơi game tầm trung được thiết kế hướng đến người dùng muốn có hiệu năng mạnh mẽ nhưng vẫn trong ngân sách hợp lý. Với kích thước màn hình 15,6 inch, tần số quét cao và card đồ họa rời, máy vừa đáp ứng tốt việc chơi game vừa có thể dùng cho công việc đa năng. Thiết kế vỏ màu xám “Luna Grey” sang trọng, trọng lượng khoảng 1,77 kg giúp người dùng có thể mang theo dễ dàng hơn so với các dòng gaming cồng kềnh đại trà.</p>', '<p><strong>Bộ xử lý (CPU):</strong> Intel® Core™ i5-12450HX (8 nhân, 12 luồng; xung Turbo lên tới ~4,4 GHz).&nbsp;</p><p><strong>Card đồ họa (GPU):</strong> Có hai cấu hình phổ biến — một là NVIDIA® GeForce RTX 3050 6GB GDDR6 (TGP ~65W), hoặc bản với NVIDIA GeForce RTX 2050 4GB GDDR6 trong một số phiên bản khác. &nbsp;</p><p><strong>RAM:</strong> 16GB DDR5-4800 (1 x 16GB SO-DIMM; hỗ trợ nâng tối đa lên đến 32 GB).&nbsp;</p><p><strong>Ổ cứng (SSD):</strong> 512GB SSD M.2 2242 PCIe 4.0×4 NVMe.&nbsp;</p><p><strong>Màn hình:</strong> 15,6 inch Full HD (1920×1080) IPS, tần số quét 144 Hz, độ sáng khoảng 300 nits, 100% sRGB, chống chói (anti-glare).&nbsp;</p><p><strong>Cổng kết nối &amp; giao tiếp:</strong></p><p>2 x USB-A (USB 3.2 Gen1),&nbsp;</p><p>1 x USB-C (USB 3.2 Gen1 data only),&nbsp;</p><p>1 x HDMI 2.1 (hỗ trợ xuất lên tới 8K/60Hz),&nbsp;</p><p>1 x Ethernet RJ-45, jack tai nghe/mic combo 3,5 mm, card reader 3-in-1,&nbsp;</p><p>Kết nối không dây: Wi-Fi 6 (802.11ax), Bluetooth v5.2.&nbsp;</p><p><strong>Pin &amp; trọng lượng:</strong> Pin dung lượng 57 Wh, trọng lượng khoảng 1,77kg, kích thước thân máy khoảng 359,3 × 236 × 19,9-22,95 mm.&nbsp;</p><p><strong>Thiết kế &amp; vật liệu:</strong> Vỏ làm bằng vật liệu PC-ABS, màu “Luna Grey”, bản lề khả năng mở rộng tốt, bàn phím có đèn nền trắng (White Backlit).&nbsp;</p><p><strong>Hệ điều hành:</strong> Windows 11 Home Single Language bản quyền.</p>', 154, 1, 18, '2025-02-28 07:26:39', '2025-10-22 03:03:49'),
(31, 'Laptop Acer Aspire 16 AI A16 71M 59L5 Ultra 5 125H', 'products/lYNWjTOHvbFVja7C8cDw9NygWdm8xlVmM2DuHYFT.jpg', 18600000.00, 10, '<p>Laptop Acer Aspire 16 AI A16-71M 59L5 Ultra 5-125H là mẫu máy tính xách tay màn hình lớn 16 inch với thiết kế mỏng nhẹ, hướng đến người dùng học sinh – sinh viên và nhân viên văn phòng cần một thiết bị di động nhưng vẫn đáp ứng tốt công việc đa nhiệm. Máy được trang bị bộ vi xử lý thế hệ mới, tích hợp nhiều tính năng AI, giúp nâng cao hiệu suất và trải nghiệm làm việc hiện đại.</p>', '<p><strong>Bộ xử lý (CPU):</strong> Intel® Core™ Ultra 5 125H (1.20 GHz cơ bản, lên tới 4.50 GHz khi tải nặng; 14 nhân – 18 luồng).&nbsp;</p><p><strong>Bộ nhớ RAM:</strong> 16 GB LPDDR5X onboard (bus cao, không có khe nâng thêm).&nbsp;</p><p><strong>Ổ cứng (SSD):</strong> 512 GB SSD NVMe PCIe (hỗ trợ nâng cấp lên tối đa ~2 TB).&nbsp;</p><p><strong>Card đồ họa (GPU):</strong> Intel® Arc Graphics tích hợp, phù hợp cho nhu cầu đồ họa nhẹ, xử lý văn phòng và giải trí thông thường.&nbsp;</p><p><strong>Màn hình:</strong> Kích thước 16 inch, tỷ lệ 16:10, độ phân giải Full HD+ (~1920×1200), tần số quét 60 Hz, độ sáng khoảng 300-350 nits, độ phủ màu khoảng 45% NTSC (dạng màn hình chống chói).&nbsp;</p><p><strong>Kết nối &amp; cổng giao tiếp:</strong></p><p>2 x USB Type-C hỗ trợ USB4 / Thunderbolt 4,&nbsp;</p><p>2 x USB Type-A (USB 3.2 Gen1) + HDMI 2.1 + jack tai nghe 3.5 mm,&nbsp;</p><p>Kết nối không dây: Wi-Fi 6E (802.11ax) và Bluetooth 5.3,&nbsp;</p><p><strong>Pin &amp; khối lượng:</strong> Dung lượng pin khoảng 53-54 Wh, khối lượng máy khoảng 1.64 kg, độ dày ~17.9 mm – dễ dàng mang theo di chuyển.&nbsp;</p><p><strong>Thiết kế &amp; vật liệu:</strong> Vỏ ngoài sử dụng kết hợp nhựa và kim loại ở nắp lưng, bản lề mở rộng đến 180°, trọng lượng và độ mỏng hợp lý cho một máy 16″.&nbsp;</p><p><strong>Hệ điều hành &amp; bảo hành:</strong> Cài sẵn Windows 11 Home, chính sách bảo hành tại Việt Nam được nâng lên 2 năm &amp; có chế độ VIP 3S1 (nhanh – đúng – nói).</p>', 312, 1, 18, '2025-02-28 07:29:26', '2025-10-22 03:03:43'),
(32, 'Laptop MSI Gaming Thin 15 B12UCX i5', 'products/S8F9FYktIvv2JXKPBPj2TixM2wz4kwlZMxxtFXN9.jpg', 15600000.00, 10, '<p>Laptop <strong>MSI Gaming Thin 15 B12UCX i5</strong> là chiếc laptop gaming mỏng nhẹ hướng đến người dùng yêu thích hiệu năng mạnh mẽ trong thiết kế gọn gàng. Máy mang phong cách hiện đại, các đường nét sắc sảo đậm chất game thủ, kết hợp cùng màu đen sang trọng đặc trưng của dòng MSI. Với hiệu năng cao, màn hình tần số quét cao và card đồ họa rời, sản phẩm đáp ứng tốt cả nhu cầu giải trí lẫn công việc, từ chơi game, học tập đến chỉnh sửa đồ họa.</p>', '<p><strong>CPU:</strong> Intel Core i5-12450H (8 nhân, 12 luồng, xung nhịp tối đa 4.4GHz).&nbsp;</p><p><strong>RAM:</strong> 16GB DDR4 3200MHz (nâng cấp tối đa 64GB).&nbsp;</p><p><strong>Ổ cứng:</strong> SSD 512GB NVMe PCIe Gen 4.&nbsp;</p><p><strong>Card đồ họa:</strong> NVIDIA GeForce RTX 2050 4GB GDDR6.&nbsp;</p><p><strong>Màn hình:</strong> 15.6 inch, độ phân giải Full HD (1920 x 1080), tần số quét 144Hz, viền mỏng.&nbsp;</p><p><strong>Bàn phím:</strong> Có đèn nền đỏ, hành trình phím tốt, tối ưu cho game thủ.&nbsp;</p><p><strong>Hệ điều hành:</strong> Windows 11 Home bản quyền.&nbsp;</p><p><strong>Cổng kết nối:&nbsp;</strong></p><p>1x USB Type-C,&nbsp;</p><p>2x USB 3.2 Gen 1 Type-A,&nbsp;</p><p>1x HDMI,&nbsp;</p><p>1x Jack tai nghe 3.5mm,&nbsp;</p><p>1x LAN RJ45.&nbsp;</p><p><strong>Kết nối không dây:</strong> Wi-Fi 6, Bluetooth 5.2.&nbsp;</p><p><strong>Âm thanh:</strong> Công nghệ Nahimic Audio và Hi-Res Audio cho âm thanh sống động.&nbsp;</p><p><strong>Pin:</strong> 3 cell, dung lượng 53.5 Wh, thời lượng sử dụng ổn định.&nbsp;</p><p><strong>Trọng lượng:</strong> Khoảng 1.8 kg.&nbsp;</p><p><strong>Kích thước:</strong> Dày 21.7 mm.&nbsp;</p><p><strong>Chất liệu:</strong> Vỏ nhựa cao cấp, khung máy chắc chắn, tản nhiệt hiệu quả.</p>', 231, 1, 18, '2025-02-28 07:32:37', '2025-10-22 03:03:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
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
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Ke6a433xx2zeqsLWp9aLeHiRx723qw2jqo4zOmhv', 11, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiUHBsYk9TZGNCd3NtNjlaRHZHdFQxZ250SjRMaGFyeVpTQWg5MzNoMyI7czo0OiJjYXJ0IjtOO3M6OToiZmF2b3VyaXRlIjtOO3M6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYWRtaW4tcGFuZWwvcHJvZHVjdCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjExO3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTc2MTEyNjQ3OTt9fQ==', 1761127676);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `disable` int(11) NOT NULL DEFAULT 0,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `role_id`, `avatar`, `disable`, `address`, `phone`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(11, 1, 'avatar/uY5cEFr88TL9OOQ8k8mHICy63bALB7KB06nBK2vK.jpg', 0, 'Địa chỉ test', '0889639655', 'admin', 'admin@gmail.com', NULL, '$2y$12$EwaiW8Hssstydi9Ca4cmTeuh51tvdeafPv6WJB73xOMC23I7xaMVG', NULL, '2025-02-27 01:10:42', '2025-10-22 02:42:01'),
(13, 3, NULL, 0, NULL, NULL, 'Vũ Duy Bình', 'vubinh0212004@gmail.com', NULL, '$2y$12$v4Age5FzNWUhUapZ3vwK.urVNFbi3dKfOYPJg0tSrbtTAlFZW2Xoe', 'OBlfFW68ayBkB7RadgNVImyY3xHzfRJZHo3zTSgQ7ZuYTnwZ52m6IRarR31Q', '2025-10-22 02:45:52', '2025-10-22 02:47:22');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `category_blogs`
--
ALTER TABLE `category_blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=369;

--
-- AUTO_INCREMENT cho bảng `page_contact`
--
ALTER TABLE `page_contact`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `page_general`
--
ALTER TABLE `page_general`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `page_policy`
--
ALTER TABLE `page_policy`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
