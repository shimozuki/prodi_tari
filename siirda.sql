-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2021 at 12:52 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siirda`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gurus`
--

CREATE TABLE `gurus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nig` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gurus`
--

INSERT INTO `gurus` (`id`, `id_user`, `nig`, `alamat`, `no_hp`, `created_at`, `updated_at`) VALUES
(2, 2, '21039198910234', 'Palatiga Bawah', '085641217433', '2021-07-13 21:20:53', '2021-07-15 19:55:43'),
(4, 4, '2318676854', 'Lorong Perintis', '085744841299', '2021-07-16 19:57:32', '2021-07-16 19:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `hasils`
--

CREATE TABLE `hasils` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_siswa` bigint(20) UNSIGNED NOT NULL,
  `id_mapel` bigint(20) UNSIGNED NOT NULL,
  `nilai_final` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hasils`
--

INSERT INTO `hasils` (`id`, `id_siswa`, `id_mapel`, `nilai_final`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 80, '2021-07-26 18:05:11', '2021-07-26 18:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `jadwals`
--

CREATE TABLE `jadwals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_mapel` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jadwals`
--

INSERT INTO `jadwals` (`id`, `id_mapel`, `tanggal`, `jam_mulai`, `jam_selesai`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-08-08', '08:00:00', '09:30:00', '2021-07-24 03:11:34', '2021-07-24 03:15:31');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_kelas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_guru` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `id_guru`, `created_at`, `updated_at`) VALUES
(1, 'XI-IPA-4', 2, '2021-07-15 22:33:53', '2021-07-15 22:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajarans`
--

CREATE TABLE `mata_pelajarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_mapel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_mapel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mata_pelajarans`
--

INSERT INTO `mata_pelajarans` (`id`, `kode_mapel`, `nama_mapel`, `kelas`, `status`, `created_at`, `updated_at`) VALUES
(1, 'MP001', 'Bahasa Indonesia Kelas X', 'X', '1', '2021-07-16 20:42:58', '2021-07-23 03:22:43');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_07_07_140516_create_siswas_table', 1),
(5, '2021_07_07_140733_create_mata_pelajarans_table', 1),
(6, '2021_07_07_140755_create_gurus_table', 1),
(7, '2021_07_07_141225_create_jadwals_table', 1),
(8, '2021_07_07_144058_create_ujians_table', 1),
(9, '2021_07_07_144115_create_soals_table', 1),
(10, '2021_07_09_030257_create_opsis_table', 1),
(11, '2021_07_09_124202_create_hasils_table', 1),
(12, '2021_07_09_233736_create_kelas_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `opsis`
--

CREATE TABLE `opsis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_soal` bigint(20) UNSIGNED NOT NULL,
  `nama_opsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `opsis`
--

INSERT INTO `opsis` (`id`, `id_soal`, `nama_opsi`, `created_at`, `updated_at`) VALUES
(6, 2, 'akuuu', '2021-07-23 03:28:25', '2021-07-23 03:28:25'),
(7, 2, 'bukan saya', '2021-07-23 03:28:25', '2021-07-23 03:28:25'),
(8, 2, 'jokowi', '2021-07-23 03:28:25', '2021-07-23 03:28:25'),
(9, 2, 'tidak tau', '2021-07-23 03:28:25', '2021-07-23 03:28:25'),
(10, 2, 'tamvan', '2021-07-23 03:28:25', '2021-07-23 03:28:25'),
(11, 3, 'alat untuk berkomunikasi', '2021-07-23 03:35:57', '2021-07-23 03:35:57'),
(12, 3, 'alat untuk membeli', '2021-07-23 03:35:57', '2021-07-23 03:35:57'),
(13, 3, 'alat untuk menjual', '2021-07-23 03:35:57', '2021-07-23 03:35:57'),
(14, 3, 'alat untuk kesehatan', '2021-07-23 03:35:57', '2021-07-23 03:35:57'),
(15, 3, 'alat untuk mencangkul', '2021-07-23 03:35:57', '2021-07-23 03:35:57'),
(16, 4, 'Bandung', '2021-07-23 03:36:46', '2021-07-23 03:36:46'),
(17, 4, 'Surakarta', '2021-07-23 03:36:46', '2021-07-23 03:36:46'),
(18, 4, 'Jakarta', '2021-07-23 03:36:46', '2021-07-23 03:36:46'),
(19, 4, 'Phuket', '2021-07-23 03:36:46', '2021-07-23 03:36:46'),
(20, 4, 'Bandar Seri Begawan', '2021-07-23 03:36:46', '2021-07-23 03:36:46'),
(21, 5, 'mana saya tau', '2021-07-23 03:38:10', '2021-07-23 03:38:10'),
(22, 5, 'perawatan', '2021-07-23 03:38:10', '2021-07-23 03:38:10'),
(23, 5, 'jarang keluar', '2021-07-23 03:38:10', '2021-07-23 03:38:10'),
(24, 5, 'sering mandi', '2021-07-23 03:38:10', '2021-07-23 03:38:10'),
(25, 5, 'diet', '2021-07-23 03:38:10', '2021-07-23 03:38:10');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswas`
--

CREATE TABLE `siswas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `nis` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_kelas` bigint(20) UNSIGNED NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswas`
--

INSERT INTO `siswas` (`id`, `id_user`, `nis`, `id_kelas`, `alamat`, `no_hp`, `created_at`, `updated_at`) VALUES
(1, 7, '0034729182', 1, 'Keluarahan Batulo', '082255664477', '2021-07-26 06:47:15', '2021-07-26 06:47:15');

-- --------------------------------------------------------

--
-- Table structure for table `soals`
--

CREATE TABLE `soals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_mapel` bigint(20) UNSIGNED NOT NULL,
  `nama_soal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jawaban_benar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `soals`
--

INSERT INTO `soals` (`id`, `id_mapel`, `nama_soal`, `jawaban_benar`, `created_at`, `updated_at`) VALUES
(2, 1, '<p>siapa nama presiden?</p>\n', 'jokowi', '2021-07-23 03:28:25', '2021-07-23 03:28:25'),
(3, 1, '<p>apa yang dimaksud dengan bahasa?</p>\n', 'alat untuk berkomunikasi', '2021-07-23 03:35:57', '2021-07-23 03:35:57'),
(4, 1, '<p>dimana ibukota Indonesia?</p>\n', 'Jakarta', '2021-07-23 03:36:46', '2021-07-23 03:36:46'),
(5, 1, '<p>kenapa aku sangat tampan?</p>\n', 'perawatan', '2021-07-23 03:38:10', '2021-07-23 03:38:10');

-- --------------------------------------------------------

--
-- Table structure for table `ujians`
--

CREATE TABLE `ujians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_siswa` bigint(20) UNSIGNED NOT NULL,
  `id_mapel` bigint(20) UNSIGNED NOT NULL,
  `id_soal` bigint(20) UNSIGNED NOT NULL,
  `betul` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `salah` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ujians`
--

INSERT INTO `ujians` (`id`, `id_siswa`, `id_mapel`, `id_soal`, `betul`, `salah`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 4, '1', '0', '2021-07-26 18:05:11', '2021-07-26 18:05:11'),
(2, 1, 1, 5, '1', '0', '2021-07-26 18:05:11', '2021-07-26 18:05:11'),
(3, 1, 1, 2, '1', '0', '2021-07-26 18:05:11', '2021-07-26 18:05:11'),
(4, 1, 1, 3, '1', '0', '2021-07-26 18:05:11', '2021-07-26 18:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` enum('admin','kepsek','guru','siswa') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `level`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', NULL, 'admin123', NULL, NULL, NULL),
(2, 'Wujuddin', 'ujis@gmail.com', 'guru', NULL, 'ujis123', NULL, '2021-07-13 21:20:53', '2021-07-13 21:20:53'),
(4, 'Zarbeti Zaid', 'beti@gmail.com', 'guru', NULL, 'beti123', NULL, '2021-07-16 19:57:32', '2021-07-16 19:57:32'),
(6, 'thegenzo', 'thegenzo@gmail.com', 'kepsek', NULL, 'genzo123', NULL, '2021-07-24 03:18:29', '2021-07-24 03:21:26'),
(7, 'Rahmat Dicky', 'dicky@gmail.com', 'siswa', NULL, 'dicky123', NULL, '2021-07-26 06:47:15', '2021-07-26 06:47:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gurus`
--
ALTER TABLE `gurus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hasils`
--
ALTER TABLE `hasils`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwals`
--
ALTER TABLE `jadwals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mata_pelajarans`
--
ALTER TABLE `mata_pelajarans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opsis`
--
ALTER TABLE `opsis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `siswas`
--
ALTER TABLE `siswas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soals`
--
ALTER TABLE `soals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ujians`
--
ALTER TABLE `ujians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gurus`
--
ALTER TABLE `gurus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hasils`
--
ALTER TABLE `hasils`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mata_pelajarans`
--
ALTER TABLE `mata_pelajarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `opsis`
--
ALTER TABLE `opsis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `siswas`
--
ALTER TABLE `siswas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `soals`
--
ALTER TABLE `soals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ujians`
--
ALTER TABLE `ujians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
