-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Jun 2024 pada 11.31
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `koperasi_smpn1bjm`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 5, '2024-05-28 19:53:05', '2024-05-28 19:53:05'),
(2, 4, '2024-05-28 20:07:14', '2024-05-28 20:07:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `jobs`
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
-- Struktur dari tabel `job_batches`
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
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_20_025712_product_controller', 1),
(5, '2024_03_21_112448_products', 1),
(6, '2024_04_16_103102_types', 1),
(7, '2024_05_11_111813_carts', 1),
(8, '2024_05_14_125404_notes', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `barang_satuan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`barang_satuan`)),
  `jumlah_barang` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`jumlah_barang`)),
  `total_harga` varchar(255) NOT NULL,
  `total_harga_keseluruhan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `notes`
--

INSERT INTO `notes` (`id`, `nama`, `barang_satuan`, `jumlah_barang`, `total_harga`, `total_harga_keseluruhan`, `created_at`, `updated_at`) VALUES
(1, 'Baju olga', '[\"Baju olga\"]', '[null]', '[null]', 'NaN', '2024-05-18 22:26:40', '2024-05-18 22:26:40'),
(2, 'Baju olga', '[\"Baju olga\"]', '[\"10\"]', '[\"1000000\"]', '1000000', '2024-05-18 22:27:06', '2024-05-18 22:27:06'),
(3, 'Baju olga', '[\"Baju olga\"]', '[\"1.000000\"]', '[\"100000\"]', '100000', '2024-05-18 22:27:48', '2024-05-18 22:27:48'),
(4, 'Baju smp', '[\"Baju smp\"]', '[\"1\"]', '[\"39996\"]', '39996', '2024-05-20 17:49:35', '2024-05-20 17:49:35'),
(5, 'Baju smp', '[\"Baju smp\"]', '[\"1\"]', '[\"39996\"]', '39996', '2024-05-20 17:49:35', '2024-05-20 17:49:35'),
(6, 'topi', '[\"topi\"]', '[\"5\"]', '[\"250000\"]', '250000', '2024-05-20 17:50:24', '2024-05-20 17:50:24'),
(7, 'topi', '[\"topi\"]', '[\"5\"]', '[\"250000\"]', '250000', '2024-05-20 17:50:25', '2024-05-20 17:50:25'),
(8, 'Rizky', '[\"Topi besar\"]', '[\"1\"]', '[\"35000\"]', '35000', '2024-05-21 17:04:34', '2024-05-21 17:04:34'),
(9, 'Amin', '[\"Topi\",\"Sasirangan\"]', '[\"1\",\"3\"]', '[\"34997\",\"165000\"]', '199997', '2024-05-21 17:12:28', '2024-05-21 17:12:28'),
(10, 'Arif', '[\"Topi\",\"Topi\"]', '[\"1\",\"2\"]', '[\"34997\",\"69994\"]', '104991', '2024-05-21 17:15:52', '2024-05-21 17:15:52'),
(11, 'a', '[\"Sasirangan\",\"Sasirangan\"]', '[\"1\",\"1\"]', '[\"55000\",\"55000\"]', '110000', '2024-05-21 17:22:33', '2024-05-21 17:22:33'),
(12, 'rizky', '[\"Sasirangan\",\"Sasirangan\"]', '[\"1\",\"5\"]', '[\"55000\",\"275000\"]', '330000', '2024-05-21 17:31:13', '2024-05-21 17:31:13'),
(13, '1', '[\"Topi\"]', '[\"1\"]', '[\"34997\"]', '34997', '2024-05-21 17:43:38', '2024-05-21 17:43:38'),
(14, 'topi', '[\"Sasirangan\"]', '[\"1\"]', '[\"55000\"]', '55000', '2024-05-21 18:29:55', '2024-05-21 18:29:55'),
(15, 'rizky', '[\"Topi\"]', '[\"1\"]', '[\"34997\"]', '34997', '2024-05-21 19:11:51', '2024-05-21 19:11:51'),
(16, 'Rizky', '[\"Sasirangan\"]', '[\"4\"]', '[\"220000\"]', '220000', '2024-05-27 15:59:18', '2024-05-27 15:59:18'),
(17, 'Rizky', '[\"Sasirangan\"]', '[\"5\"]', '[\"275000\"]', '275000', '2024-05-27 16:22:59', '2024-05-27 16:22:59'),
(18, 'Rizky', '[\"Sasirangan\"]', '[\"5\"]', '[\"275000\"]', '275000', '2024-05-27 16:23:00', '2024-05-27 16:23:00'),
(19, 'Rizky', '[\"Baju smp\"]', '[\"1\"]', '[\"39996\"]', '39996', '2024-05-27 16:45:59', '2024-05-27 16:45:59'),
(20, 'Rizky', '[\"Sasirangan\",\"Topi\"]', '[\"1\",\"1\"]', '[\"55000\",\"30000\"]', '85000', '2024-05-27 20:25:50', '2024-05-27 20:25:50'),
(21, 'Rizky', '[\"Baju smp\"]', '[\"1\"]', '[\"39996\"]', '39996', '2024-05-27 20:27:47', '2024-05-27 20:27:47'),
(22, 'ooo', '[\"Sasirangan\"]', '[\"1\"]', '[\"55000\"]', '55000', '2024-05-28 18:37:47', '2024-05-28 18:37:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `barang` varchar(255) NOT NULL,
  `types` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `barang`, `types`, `harga`, `stok`, `gambar`, `created_at`, `updated_at`) VALUES
(1, 'Baju smp', 'Baju seragam', 39996, 0, 'product-images/lajbg0eoKxVEIt7JEYwQuL7weQq3nY9XmOqcbSdm.jpg', '2024-05-18 22:20:59', '2024-05-27 20:27:47'),
(4, 'Sasirangan', 'Baju sasirangan', 55000, 3, 'product-images/v7Zbta8IJi4twkqjGqr96fIZiAZeNEaB4cX2hrpa.jpg', '2024-05-21 17:11:25', '2024-05-28 18:37:47'),
(5, 'Topi', 'Topi', 30000, 14, 'product-images/g5ooK7QnGEsbcJQbfU67QCcQzR33USzjcAl172Pk.webp', '2024-05-21 19:13:53', '2024-05-27 20:25:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
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
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('B6DnbSbXvGiVOGeiTwBa42jhs32Wnei5Z72I9cx7', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZzc2TmxlT3VGZ09URWZnYWtUa1pnc1ZPRWQxZWNGMFRZYkhNTXpvcyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=', 1716955634),
('SNluryOC91iS0inB7YQc8aRTjgKLm73LjjuXEeJD', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTE8xb1N0QzE1dTJBd3RLU1B0S09XTWg3cUE2WFJSSkhaZjlOQkxNSyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjIxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=', 1717070908);

-- --------------------------------------------------------

--
-- Struktur dari tabel `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `types`
--

INSERT INTO `types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(5, 'Kaos kaki', '2024-05-27 13:28:14', '2024-05-27 13:28:14'),
(6, 'Baju seragam', '2024-05-27 19:46:15', '2024-05-27 19:46:15'),
(7, 'topi', '2024-05-27 20:00:08', '2024-05-27 20:00:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user` enum('user','admin') NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `user`, `created_at`, `updated_at`) VALUES
(1, 'Siswa@gmail.com', '$2y$12$46LKJLb7nVhsB.g6UTZyquw9zH6OSkhuFAJzyR1maBzsRdrCbtVqK', 'user', '2024-05-18 21:58:35', '2024-05-18 21:58:35'),
(4, 'Admin@Gmail.com', '$2y$12$OBoGr31ir6kPTOJLfUT9we6yb4tqNJm.EW0l.G0zt1iPMuXUc4nhC', 'admin', '2024-05-18 22:38:12', '2024-05-18 22:38:12');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
