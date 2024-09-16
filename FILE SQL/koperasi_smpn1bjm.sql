-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Sep 2024 pada 15.30
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
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `notes`
--

INSERT INTO `notes` (`id`, `nama`, `barang_satuan`, `jumlah_barang`, `total_harga`, `total_harga_keseluruhan`, `created_at`, `updated_at`) VALUES
(80, 'Rizky', '[\"Baju Olahraga\"]', '[\"8\"]', '[\"320000\"]', '320000', '2024-08-19', '2024-08-19 05:18:13'),
(90, 'University Of Oxford', '[\"Baju Putih\",\"Baju Olahraga\"]', '[\"1\",\"1\"]', '[\"50000\",\"40000\"]', '90000', '2024-08-21', '2024-08-21 02:31:45'),
(91, 'Sanjaya', '[\"Baju Putih\"]', '[\"1\"]', '[\"50000\"]', '50000', '2024-08-21', '2024-08-21 15:08:29'),
(92, 'Arif', '[\"Baju Olahraga\"]', '[\"1\"]', '[\"40000\"]', '40000', '2024-08-30', '2024-08-30 02:06:56'),
(93, 'asep', '[\"Baju Batik\"]', '[\"800\"]', '[\"24000000\"]', '24000000', '2024-08-30', '2024-08-30 02:09:20'),
(94, 'fherikyy', '[\"Baju Batik (S)\"]', '[\"1\"]', '[\"135000\"]', '135000', '2024-09-04', '2024-09-03 20:40:08'),
(95, 'Saii', '[\"Baju Batik (M)\"]', '[\"1\"]', '[\"1000000000\"]', '1000000000', '2024-09-11', '2024-09-11 02:21:53'),
(96, 'aaa', '[\"Baju Batik (M)\"]', '[\"1\"]', '[\"1000000000\"]', '1000000000', '2024-09-11', '2024-09-11 02:22:34'),
(97, 'Saii', '[\"Baju Batik (M)\"]', '[\"2\"]', '[\"2000000000\"]', '2000000000', '2024-09-11', '2024-09-11 02:23:50'),
(98, 'Saii', '[\"Kain Batik (2,5 M)\"]', '[\"1\"]', '[\"135000\"]', '135000', '2024-09-11', '2024-09-11 02:25:26'),
(99, 'Arif', '[\"Lambang Koko\"]', '[\"1\"]', '[\"5000\"]', '5000', '2024-09-13', '2024-09-13 11:31:29');

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
(15, 'Baju Batik (S)', 'Seragam Sekolah', 135000, 43, 'product-images/ftYYpYqvTO3IGd1wHAQ1b9F9dXMmsEcig3iGZBZb.png', '2024-09-02 02:51:27', '2024-09-03 20:41:23'),
(16, 'Baju Batik (M)', 'Seragam Sekolah', 1000000000, 79, 'product-images/pTbXmcsvACO2OXaJ2C6oNBU42s0Ycc3HQcYvXth3.png', '2024-09-02 02:53:25', '2024-09-11 02:23:50'),
(17, 'Kain Batik (2,5 M)', 'Seragam Sekolah', 135000, 9, 'product-images/ByRVwsRWIHZW9eOPLRXpMrHJGWezBN4M2akNcakE.png', '2024-09-02 02:56:52', '2024-09-11 02:25:26'),
(18, 'Baju Batik (L)', 'Seragam Sekolah', 135000, 21, 'product-images/INmg4g0Xr7a2hfKjVpGpQ7OEvBh1Q7uleFDuzt93.png', '2024-09-02 03:00:01', '2024-09-02 03:31:41'),
(19, 'Baju Olahraga (M)', 'Seragam Sekolah', 170000, 26, 'product-images/yE80KmSsZdeqqw3OSKlhVGp539Stx5boTdBylNaL.jpg', '2024-09-02 03:20:44', '2024-09-02 03:20:44'),
(20, 'Baju Olahraga (L)', 'Seragam Sekolah', 170000, 2, 'product-images/PCYdMdiCv8pfTOQixtg59O90JMuZBA70NqbJiHN0.jpg', '2024-09-02 03:23:42', '2024-09-02 03:23:42'),
(21, 'Baju Olahraga (XL)', 'Seragam Sekolah', 170000, 33, 'product-images/iadwDoxxNec340icTTizdn54RXNHqoa8Jttw4boA.jpg', '2024-09-02 03:25:27', '2024-09-02 03:25:27'),
(22, 'Baju Olahraga (XXXL / 3L)', 'Seragam Sekolah', 170000, 29, 'product-images/JjyLzW4PH1oUDRMJxssr3qXDqpWbpcnlLdK1nYBc.jpg', '2024-09-02 03:26:46', '2024-09-09 03:11:54'),
(23, 'Kaos Kaki Putih', 'Perlengkapan Seragam Sekolah', 20000, 513, 'product-images/3PwSBtHHXiUx4fuRLgqzJ9mgTAeZ9QIWiXZq5Lbv.png', '2024-09-02 04:28:03', '2024-09-02 04:28:03'),
(24, 'Kaos Kaki Hitam', 'Perlengkapan Seragam Sekolah', 20000, 17, 'product-images/JsF3BalTuzP0ulsuih0ssHtQGoQIWsSJLGoXkEAo.png', '2024-09-02 04:30:10', '2024-09-02 04:30:10'),
(25, 'Kain Sasirangan', 'Seragam Sekolah', 175000, 65, 'product-images/5Q9qCLXkoWfW3sOQw7MWSYJJkTdbucxInO1O4a4R.png', '2024-09-02 04:34:02', '2024-09-02 04:34:02'),
(26, 'Topi Pramuka 049 (Laki-Laki)', 'Perlengkapan Seragam Sekolah', 30000, 115, 'product-images/wUZ9d6lUo5OUgXyIGflzAWc8RtAhlZOxhhuyy0L2.png', '2024-09-02 04:37:25', '2024-09-02 04:41:26'),
(27, 'Topi Biru', 'Perlengkapan Seragam Sekolah', 30000, 225, 'product-images/iddAtUIq1fxKOxpEpqY2D4sBXOD7qUa3kjUm5oIL.png', '2024-09-02 04:48:02', '2024-09-02 04:48:02'),
(28, 'Ikat Pinggang Kecil', 'Perlengkapan Seragam Sekolah', 20000, 5, 'product-images/93xOikZN989emFOVeTgy44u4xyi1QB7GrB8LK7iC.png', '2024-09-03 19:53:44', '2024-09-03 19:56:42'),
(29, 'Ikat Pinggang Besar', 'Perlengkapan Seragam Sekolah', 20000, 45, 'product-images/GSS17sQeyyrdMA5HbtcUHKxsLygqtWSLdstDOPHS.png', '2024-09-03 19:55:46', '2024-09-03 19:56:16'),
(30, 'Baju Koko (S)', 'Seragam Sekolah', 130000, 1, 'product-images/ldUTFUUxfhli6qgy7lj772FNTrZvbN2ar0EK85DK.jpg', '2024-09-03 20:01:53', '2024-09-03 20:01:53'),
(31, 'Baju Koko (L)', 'Seragam Sekolah', 130000, 27, 'product-images/Ac8NdPHtwxXqbHlF0mQaNsW426lWcS8Zyte6QKea.jpg', '2024-09-03 20:02:57', '2024-09-03 20:02:57'),
(32, 'Baju Koko (XL)', 'Seragam Sekolah', 130000, 37, 'product-images/A6kFFNOHAaLZ1O8HmIicsvdlMKklV85JA96VIDTe.jpg', '2024-09-03 20:03:54', '2024-09-03 20:03:54'),
(33, 'Baju Koko (XXL)', 'Seragam Sekolah', 130000, 5, 'product-images/n95ECTgWzxQdzOW90U5TzPqhPSDyNSFrMwisNjsS.jpg', '2024-09-03 20:04:37', '2024-09-03 20:04:37'),
(34, 'Jilbab Putih Biru', 'Perlengkapan Seragam Sekolah', 60000, 212, 'product-images/X5ELgM365expHySuvAahKG4JkH67XHlkjuTSkL1R.jpg', '2024-09-03 20:07:45', '2024-09-03 20:07:45'),
(35, 'Jilbab Pramuka', 'Perlengkapan Seragam Sekolah', 65000, 281, 'product-images/XYdx0Ga30vTEPh0edw9ufnjJZHGBvFBjCbQ3JcWw.jpg', '2024-09-03 20:11:49', '2024-09-03 20:11:49'),
(36, 'Dasi Biru', 'Perlengkapan Seragam Sekolah', 20000, 585, 'product-images/XwuvwNurYwzPzJhAUet7WIeiUZVnRcgXB0ZtYWiU.jpg', '2024-09-03 20:13:07', '2024-09-03 20:13:07'),
(37, 'Topi Pramuka 050 (Perempuan)', 'Perlengkapan Seragam Sekolah', 30000, 92, 'product-images/izhGh80IsncW565cImfsPO56t69QayM5unGjNZ49.png', '2024-09-03 20:20:15', '2024-09-03 20:20:15'),
(38, 'Lambang Kelas 7', 'Lambang Sekolah', 10000, 408, 'product-images/7agfTp0WMkihLUA5zkC0INaSdPj5Ow8jcxAdGfNs.png', '2024-09-03 20:23:41', '2024-09-09 05:42:31'),
(39, 'Lambang Kelas 8', 'Lambang Sekolah', 10000, 163, 'product-images/fNxV9TgrxyaT10qzDcPjQIdqGCsYte5hYCHXrB2P.png', '2024-09-03 20:24:38', '2024-09-09 05:45:51'),
(40, 'Lambang Kelas 9', 'Lambang Sekolah', 10000, 254, 'product-images/Io0AvyywXiNI0f5RM7y6Zg0BcO6lMVTCLwQp7Gnv.png', '2024-09-03 20:25:18', '2024-09-09 05:46:30'),
(46, 'LKS Bahasa Indonesia Kelas 7', 'Buku LKS Kelas 7', 22000, 10000, 'product-images/alLIawxjaCOH4smyK3y4neMU2ce6HM3aeayqfgKM.jpg', '2024-09-09 01:02:22', '2024-09-09 02:28:55'),
(47, 'LKS Bahasa Inggris Kelas 7', 'Buku LKS Kelas 7', 22000, 10000, 'product-images/e5WflRXj5GIns2VDDBfx3wdXCLSW0z7LtwY1r8KM.jpg', '2024-09-09 03:22:39', '2024-09-09 03:22:39'),
(48, 'LKS Penjaskes Kelas 7', 'Buku LKS Kelas 7', 22000, 10000, 'product-images/aZzNtj5GStENCY4FFTBPXMKDhxjkT4RByJzbhx07.jpg', '2024-09-09 03:25:21', '2024-09-09 03:25:21'),
(49, 'LKS Ilmu Pengetahuan Alam Kelas 7', 'Buku LKS Kelas 7', 22000, 1000000, 'product-images/bVzjrCpbT4a9xdHqJ796bS3PVDA7QCCl3Qw5UJJU.jpg', '2024-09-09 03:30:55', '2024-09-09 03:30:55'),
(50, 'LKS Ilmu Pengetahuan Sosial Kelas 7', 'Buku LKS Kelas 7', 22000, 10000, 'product-images/sMYWUa6CPOX6ebPKQsMAusfYnWGWBDB7CcIznnUe.jpg', '2024-09-09 03:33:17', '2024-09-09 03:33:17'),
(51, 'LKS Pendidikan Agama Islam Kelas 7', 'Buku LKS Kelas 7', 22000, 0, 'product-images/NuotlKxkennCNJ44p1V5f9jJgNMTnXJ4izlryRJO.jpg', '2024-09-09 03:34:26', '2024-09-09 03:34:26'),
(52, 'LKS Informatika Kelas 7', 'Buku LKS Kelas 7', 22000, 0, 'product-images/zuXFEZmDfrhTczTesGrfyzl55wvp53QZ798dgcof.jpg', '2024-09-09 03:35:44', '2024-09-09 03:35:44'),
(53, 'LKS Matematika Kelas 7', 'Buku LKS Kelas 7', 22000, 0, 'product-images/CQ5EFe9qwJbWKYp6nsNsr1TDpDYCldWiuulz9RvK.jpg', '2024-09-09 03:37:17', '2024-09-09 03:37:17'),
(54, 'LKS Pendidikan Pancasila Kelas 7', 'Buku LKS Kelas 7', 22000, 0, 'product-images/b3eH2XoLH43GE0YLPTozFakwETwN1old7CnQ1WGv.jpg', '2024-09-09 03:38:27', '2024-09-09 03:38:27'),
(55, 'LKS Seni Musik Kelas 7', 'Buku LKS Kelas 7', 22000, 0, 'product-images/vibVhULIJCpHVRIPevwfuPoGTgCAPWr8pl4neqgA.jpg', '2024-09-09 03:39:13', '2024-09-09 03:39:13'),
(56, 'LKS Prakarya Kelas 7', 'Buku LKS Kelas 7', 22000, 0, 'product-images/ydPaV4zNCWx0jLDwlc14Spq6GGyQmDi9Eqhahoq2.jpg', '2024-09-09 03:40:39', '2024-09-09 03:40:39'),
(57, 'LKS Bahasa Inggris Kelas 8', 'Buku LKS Kelas 8', 22000, 0, 'product-images/5NTixEfhN22w1QDKXY7hmkb8vcK8elOH0FlnXJEz.jpg', '2024-09-09 04:06:59', '2024-09-09 04:06:59'),
(58, 'LKS Matematika Kelas 8', 'Buku LKS Kelas 8', 22000, 0, 'product-images/ztx5dkyxdh3QeRihiEynLM7trIHTQD8U6WtOh3wm.jpg', '2024-09-09 04:08:32', '2024-09-09 04:08:32'),
(59, 'LKS Pendidikan Agama Islam Kelas 8', 'Buku LKS Kelas 8', 22000, 0, 'product-images/inkotIus0EkJeLtGdMuUqcENkFiFosajClqMCzaV.jpg', '2024-09-09 04:15:09', '2024-09-09 04:15:09'),
(60, 'LKS Informatika Kelas 8', 'Buku LKS Kelas 8', 22000, 0, 'product-images/Rp5i3GByLtPJ4ZxwDiSjmSam7CJm7BOgYdcjAQtd.jpg', '2024-09-09 04:18:59', '2024-09-09 04:18:59'),
(61, 'LKS Ilmu Pengetahuan Sosial Kelas 8', 'Buku LKS Kelas 8', 22000, 0, 'product-images/yuatsWEstA3IL0sUrLbnLKMBurXltiRoxeJUZYl9.jpg', '2024-09-09 04:21:06', '2024-09-09 04:21:06'),
(62, 'LKS Ilmu Pengetahuan Alam Kelas 8', 'Buku LKS Kelas 8', 22000, 0, 'product-images/OEFlTerAdWutdJhYjxEzQcMXzXEGInP5mfV8A0gO.jpg', '2024-09-09 04:23:18', '2024-09-09 04:23:18'),
(63, 'LKS Pendidikan Pancasila Kelas 8', 'Buku LKS Kelas 8', 22000, 0, 'product-images/2S8ovBAeZYnhoyxZTruUVjDS4mGC1sYwsQFD6qFt.jpg', '2024-09-09 04:27:16', '2024-09-09 04:27:16'),
(64, 'LKS Seni Musik Kelas 8', 'Buku LKS Kelas 8', 22000, 0, 'product-images/3emcgr535Bp0nmTpm7cPbATEHwYsPTvR9pSIelr7.jpg', '2024-09-09 04:28:04', '2024-09-09 04:28:04'),
(65, 'LKS Seni Tari Kelas 8', 'Buku LKS Kelas 8', 22000, 0, 'product-images/ILxpVnR9VYM4Eqm2DflIhtLb5M813AT5UX2s8V3g.jpg', '2024-09-09 04:29:59', '2024-09-09 04:29:59'),
(66, 'LKS Prakarya Kelas 8', 'Buku LKS Kelas 8', 22000, 0, 'product-images/zlKMdhbFRebfvP7Z4plxpjcjUp2tYuR0GwHh549G.jpg', '2024-09-09 04:30:56', '2024-09-09 04:30:56'),
(67, 'LKS Bahasa Indonesia Kelas 8', 'Buku LKS Kelas 8', 22000, 0, 'product-images/GneV9A67pygO3qGZ375ETHqJ8peaZrLEnetA5i4R.png', '2024-09-09 04:33:14', '2024-09-09 04:33:14'),
(68, 'LKS Penjaskes Kelas 8', 'Buku LKS Kelas 8', 22000, 0, 'product-images/wKBuKLFoTpJAbVbHqKk16QYW6FsAk3JYCC5zxzME.png', '2024-09-09 04:33:55', '2024-09-09 04:33:55'),
(69, 'LKS Bahasa Inggris Kelas 9', 'Buku LKS Kelas 9', 22000, 0, 'product-images/E4jkTiw5yDUT7GPFmLVL4PDkVRmMUTK9vSWyrhMD.jpg', '2024-09-09 04:35:04', '2024-09-09 04:35:04'),
(70, 'LKS Ilmu Pengetahuan Alam Kelas 9', 'Buku LKS Kelas 9', 22000, 0, 'product-images/kRTZfmgn2b6Hxc5J3K9JDafEkBufTS9KOZP18pPt.jpg', '2024-09-09 04:35:43', '2024-09-09 04:35:43'),
(71, 'LKS Ilmu Pengetahuan Sosial Kelas 9', 'Buku LKS Kelas 9', 22000, 0, 'product-images/uBoFZ56d5VuzZoEY0Rp5dNnf9OiyLcWRnoLIX9pS.jpg', '2024-09-09 04:36:30', '2024-09-09 04:37:25'),
(72, 'LKS Penjaskes Kelas 9', 'Buku LKS Kelas 9', 22000, 0, 'product-images/YaKGVD1wBJRZENedFn8IlqU9NA7eO0hQmI1u2qGM.jpg', '2024-09-09 04:40:04', '2024-09-09 04:40:04'),
(73, 'LKS Informatika Kelas 9', 'Buku LKS Kelas 9', 22000, 0, 'product-images/sGNBPJEQ9exDFHEVNlMpNhBwvu5Jp66C9nRvofT2.jpg', '2024-09-09 04:41:12', '2024-09-09 04:41:12'),
(74, 'LKS Pendidikan Pancasila Kelas 9', 'Buku LKS Kelas 9', 22000, 0, 'product-images/SrKSuGaylVfjBVgso0j4F59D02NuTZ6fOpUoiMkY.jpg', '2024-09-09 04:41:54', '2024-09-09 04:41:54'),
(75, 'LKS Pendidikan Agama Islam Kelas 9', 'Buku LKS Kelas 9', 22000, 0, 'product-images/TVWMPKn9gEOT01eO9Q8tvJLDCinozcVYxPk0oSN2.jpg', '2024-09-09 04:42:45', '2024-09-09 04:43:37'),
(76, 'LKS Seni Musik Kelas 9', 'Buku LKS Kelas 9', 22000, 0, 'product-images/DOYhRdClfNAUriL6zri3j0mlpxEXmCnYuWFsd3GV.jpg', '2024-09-09 04:44:32', '2024-09-09 04:44:32'),
(77, 'LKS Bahasa Indonesia Kelas 9', 'Buku LKS Kelas 9', 22000, 0, 'product-images/P36OoeWk7v3xeg2ee8gaWTHjyzF29RitGv09hR6k.jpg', '2024-09-09 04:45:21', '2024-09-09 04:45:21'),
(78, 'LKS Prakarya Kelas 9', 'Buku LKS Kelas 9', 22000, 0, 'product-images/knMt2qobmuuXuDE7MSgxg0w5GqvA44XF1SXbwMyr.png', '2024-09-09 04:46:40', '2024-09-09 04:46:40'),
(79, 'LKS Seni Tari Kelas 9', 'Buku LKS Kelas 9', 22000, 0, 'product-images/Lx0Rs5SnP2QefILZpPaXBgbPVOagF0dwgPOY8GOV.png', '2024-09-09 04:47:24', '2024-09-09 04:47:24'),
(80, 'LKS Matematika Kelas 9', 'Buku LKS Kelas 9', 22000, 0, 'product-images/1jAI2Ju2tV7ogF6aYllQAiHX4KAyqekQEPM7JKve.png', '2024-09-09 04:47:57', '2024-09-09 04:47:57'),
(81, 'LKS Seni Tari Kelas 7', 'Buku LKS Kelas 7', 22000, 0, 'product-images/9jwebErCN2ja1fVCHnzZhQZVXwScQRm3xmwvlRkm.png', '2024-09-09 05:29:09', '2024-09-09 05:29:09'),
(82, 'Lambang Koko', 'Lambang Sekolah', 5000, 223, 'product-images/bTF8nWySpozAQO7bXK6b79DDlMJ9cmrHtD3v9aub.png', '2024-09-09 06:05:07', '2024-09-13 11:31:29'),
(83, 'Lambang OSIS', 'Lambang Sekolah', 10000, 356, 'product-images/ruxF3yGs1ixq50xC7QgvyLVpB2QpJOiLICloLs3U.png', '2024-09-09 06:06:57', '2024-09-09 06:06:57'),
(84, 'Lambang Bendera Merah Putih', 'Lambang Sekolah', 5000, 560, 'product-images/2Cv0qEg2bfPNyG93Jm4A5HsCYUCQr35a4NIwOz39.png', '2024-09-09 06:09:16', '2024-09-09 06:09:16'),
(92, 'Paket Lambang Pramuka', 'Lambang Sekolah', 15000, 0, 'product-images/UacMaf4g0pO6K1JnPga974b5pA73zbfmdIIgg5zW.png', '2024-09-11 03:19:51', '2024-09-11 04:32:47');

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
('4bhSUr2lAkrnqYOlMtDLGzSBNv498Rq2y0DTTCaM', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZ0tRcmRPTDhtTlQxSWN1ZVE1WU43eTI0OWJnNkVubDJRdllMYXRiYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNDt9', 1726198632),
('6lEaDX2bgtNMhJ8HWrLKV4yxDvOQ8zTmHaKV6Dt9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnk5dlZtVkxwOEQ5NFFCcEh3QzBSMUpPRzQ1QUt1c2pHV0Q4QUc1VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC8/dHlwZT1QZXJsZW5na2FwYW4lMjBTZXJhZ2FtJTIwU2Vrb2xhaCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1726230490),
('f9X61toiRA7FVAxxPc0tUwvlh1aoGfvsUzbqm7tm', 14, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Safari/605.1.15', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWGV6Wk85Zk03OFRLNTRoWFkyZElWbUxRZTdvY2JvWWNKd2sxTEV0UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9iZXJhbmRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTQ7fQ==', 1726318100),
('OI3UqiTcJeXOAkgtwMHqU7pK1UazMrAd1M4SK2rS', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoidVZhN0NQNFE2ZjF4ajJDekdYMUxocmdDZU1iUGthYkxzaVJFQ1djNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNDt9', 1726201236);

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
(16, 'Perlengkapan Seragam Sekolah', '2024-09-02 02:21:19', '2024-09-02 02:21:19'),
(17, 'Lambang Sekolah', '2024-09-02 02:21:29', '2024-09-02 02:21:29'),
(18, 'Buku LKS Kelas 7', '2024-09-02 02:22:15', '2024-09-02 02:22:15'),
(19, 'Buku LKS Kelas 8', '2024-09-02 02:22:29', '2024-09-02 02:22:29'),
(20, 'Buku LKS Kelas 9', '2024-09-02 02:22:37', '2024-09-02 02:22:37'),
(21, 'Seragam Sekolah', '2024-09-02 02:23:52', '2024-09-02 02:23:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user` enum('admindata','admincetak') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `user`, `created_at`, `updated_at`) VALUES
(14, 'Admindata@Gmail.com', '$2y$12$xgm7Zv5Uxut7OKc7b7RACeY44qAqeXGWTm1aabaT8dfOVZ.FVJTRm', 'admindata', '2024-09-02 01:05:46', '2024-09-02 01:05:46'),
(15, 'Admincetak@Gmail.com', '$2y$12$NUoGmkJFvFkWbieHqNx2y.vr51zvA8LEmgBjv9jLm3Ds9gtdCtrB2', 'admincetak', '2024-09-02 01:05:46', '2024-09-02 01:05:46');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT untuk tabel `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
