-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 04, 2024 alle 12:46
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `palestra`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `activities`
--

INSERT INTO `activities` (`id`, `name`, `description`) VALUES
(1, 'Yoga', 'Pratica yoga per migliorare la flessibilità e ridurre lo stress.'),
(2, 'Pilates', 'Allenamento di Pilates per rafforzare i muscoli addominali e migliorare la postura.'),
(3, 'Zumba', 'Lezione di fitness musicale di gruppo che utilizza i ritmi e i movimenti della musica afro-caraibica, combinati con i movimenti tradizionali dell\'aerobica.'),
(4, 'Spinning', 'Allenamento su biciclette stazionarie, con musica ritmata e variazioni di intensità.'),
(5, 'CrossFit', 'Allenamento ad alta intensità che combina sollevamento pesi, esercizi cardiovascolari e ginnastica.'),
(6, 'Body Pump', 'Allenamento con pesi leggeri e ripetizioni ad alta intensità, mirato a tonificare e scolpire i muscoli di tutto il corpo.'),
(7, 'Body Balance', 'Allenamento che combina yoga, tai chi e pilates per migliorare la flessibilità, la forza e la stabilità mentale.'),
(8, 'HIIT (High-Intensity Interval Training)', 'Allenamento ad alta intensità caratterizzato da brevi raffiche di esercizi intensi seguiti da periodi di recupero.'),
(9, 'Functional Training', 'Allenamento funzionale che mira a migliorare la forza, la flessibilità e la mobilità utilizzando movimenti che simulano le attività quotidiane.');

-- --------------------------------------------------------

--
-- Struttura della tabella `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('bridgette47@example.net|127.0.0.1', 'i:1;', 1717430253),
('bridgette47@example.net|127.0.0.1:timer', 'i:1717430253;', 1717430253),
('drew.hoeger@example.com|127.0.0.1', 'i:1;', 1717490342),
('drew.hoeger@example.com|127.0.0.1:timer', 'i:1717490342;', 1717490342);

-- --------------------------------------------------------

--
-- Struttura della tabella `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `activity_id` bigint(20) UNSIGNED NOT NULL,
  `slot_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `courses`
--

INSERT INTO `courses` (`id`, `title`, `location`, `description`, `activity_id`, `slot_id`) VALUES
(1, 'Corso di Yoga', 'Sala Yoga', 'Lo yoga è un complesso ed immenso corpus teorico-pratico che comprende una filosofia, una cosmogonia, una raffinata psicologia, una mistica, uno studio dettagliato degli stati di coscienza insieme ai mezzi e alle condizioni per realizzarli, un processo spirituale evolutivo', 1, 1),
(2, 'Corso di Pilates', 'Sala Pilates', 'Il Pilates è una disciplina che combina allenamento fisico ad un metodo di respirazione che ha come obiettivo quello di sollecitare la cintura addominale. Si tratta soprattutto di movimenti lenti e ripetuti per assumere consapevolezza del proprio corpo e allenarlo alla forma fisica', 2, 2),
(3, 'Corso di Zumba', 'Sala Zumba ', 'La Zumba, oppure Zumba Fitness, è una lezione di fitness musicale che si svolge in gruppo seguendo i ritmi e i movimenti della musica', 3, 3),
(4, 'Corso di Spinning', 'Sala 3 ', 'Lo Spinning è un/attività di gruppo su bicicletta stazionaria', 4, 4),
(5, 'CrossFit', 'Sala 2 ', NULL, 5, 5),
(6, 'Body Pump', 'Sala 1', NULL, 6, 6),
(7, 'Body Balance', 'Sala 4 ', NULL, 7, 7),
(8, 'HIIT', 'Sala 5 ', NULL, 8, 8),
(9, 'Functional Training', 'Sala 6', NULL, 9, 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `course_user`
--

CREATE TABLE `course_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','accepted','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `course_user`
--

INSERT INTO `course_user` (`id`, `user_id`, `course_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'pending', NULL, NULL),
(2, 1, 2, 'pending', NULL, NULL),
(3, 1, 4, 'accepted', NULL, NULL),
(4, 1, 5, 'accepted', NULL, NULL),
(5, 1, 6, 'pending', NULL, NULL),
(6, 1, 7, 'pending', NULL, NULL),
(9, 2, 1, 'rejected', NULL, NULL),
(10, 2, 2, 'rejected', NULL, NULL),
(11, 2, 5, 'accepted', NULL, NULL),
(12, 2, 9, 'rejected', NULL, NULL),
(13, 3, 1, 'accepted', NULL, NULL),
(14, 3, 2, 'rejected', NULL, NULL),
(15, 3, 3, 'pending', NULL, NULL),
(16, 3, 5, 'pending', NULL, NULL),
(17, 3, 7, 'rejected', NULL, NULL),
(18, 4, 2, 'rejected', NULL, NULL),
(19, 4, 3, 'accepted', NULL, NULL),
(20, 4, 4, 'pending', NULL, NULL),
(21, 4, 6, 'accepted', NULL, NULL),
(22, 4, 7, 'pending', NULL, NULL),
(23, 4, 8, 'accepted', NULL, NULL),
(24, 4, 9, 'pending', NULL, NULL),
(25, 5, 1, 'rejected', NULL, NULL),
(26, 5, 2, 'rejected', NULL, NULL),
(27, 5, 3, 'rejected', NULL, NULL),
(28, 5, 5, 'accepted', NULL, NULL),
(29, 5, 6, 'accepted', NULL, NULL),
(30, 5, 7, 'rejected', NULL, NULL),
(31, 5, 8, 'pending', NULL, NULL),
(32, 6, 1, 'rejected', NULL, NULL),
(33, 6, 2, 'pending', NULL, NULL),
(34, 6, 3, 'rejected', NULL, NULL),
(35, 6, 4, 'rejected', NULL, NULL),
(36, 6, 5, 'rejected', NULL, NULL),
(37, 6, 6, 'pending', NULL, NULL),
(38, 6, 7, 'pending', NULL, NULL),
(39, 6, 8, 'rejected', NULL, NULL),
(40, 6, 9, 'pending', NULL, NULL),
(41, 7, 4, 'rejected', NULL, NULL),
(42, 8, 1, 'pending', NULL, NULL),
(43, 8, 2, 'rejected', NULL, NULL),
(44, 8, 4, 'accepted', NULL, NULL),
(45, 8, 7, 'rejected', NULL, NULL),
(46, 8, 8, 'accepted', NULL, NULL),
(47, 8, 9, 'rejected', NULL, NULL),
(48, 9, 2, 'rejected', NULL, NULL),
(49, 9, 4, 'rejected', NULL, NULL),
(50, 9, 5, 'accepted', NULL, NULL),
(51, 9, 8, 'pending', NULL, NULL),
(52, 10, 5, 'accepted', NULL, NULL),
(53, 10, 6, 'accepted', NULL, NULL),
(54, 11, 1, 'accepted', NULL, NULL),
(55, 11, 2, 'pending', NULL, NULL),
(56, 11, 3, 'accepted', NULL, NULL),
(57, 11, 4, 'rejected', NULL, NULL),
(58, 11, 5, 'rejected', NULL, NULL),
(59, 11, 6, 'accepted', NULL, NULL),
(60, 11, 9, 'pending', NULL, NULL),
(61, 12, 1, 'pending', NULL, NULL),
(62, 12, 9, 'rejected', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `failed_jobs`
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
-- Struttura della tabella `jobs`
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
-- Struttura della tabella `job_batches`
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
-- Struttura della tabella `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_28_133119_create_personal_access_tokens_table', 1),
(5, '2024_05_28_134328_create_activities_table', 1),
(6, '2024_05_28_134403_create_slots_table', 1),
(7, '2024_05_28_134404_create_courses_table', 1),
(8, '2024_05_28_140027_modify_users_table', 1),
(9, '2024_05_30_075017_create_course_user_table', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `sessions`
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
-- Dump dei dati per la tabella `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('jKZbswZTYKdDPntK3Qyoty5j41HKqQxHvn3bxCEr', 15, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMGxVeHdPT2R3UExzclBTNXdQdVlPN3VMMWRURHdRekJRT3YyOGZSRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpdGllcyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE1O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkWWFRSzBSbnRQUVBSRThTajM4Uk1NT3R5dVFiOElvQWp4L1dSL003RUczR0h3Q3dqMEoxWFciO30=', 1717431239),
('LwS3WuLF8t7fRSom3kjgBGiM0nLqKapLv0gu7UV2', 20, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidURFSnk2bkZ5NUMwUGlYU3JId2FJRjVZd0sySDh6anNxT2dJRjVNRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvYWN0aXZpdGllcyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjIwO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkRi9kM0lxTC9mN09hSGYxZzRYS1VjdXRDdVNwdTBYZDIwdDZnMG9ycHcwZVN2NGN5c0wzaHEiO30=', 1717493912);

-- --------------------------------------------------------

--
-- Struttura della tabella `slots`
--

CREATE TABLE `slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `slots`
--

INSERT INTO `slots` (`id`, `course_id`, `day`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 1, 'Monday', '09:00:00', '11:00:00', NULL, NULL),
(2, 2, 'Tuesday', '14:00:00', '16:00:00', NULL, NULL),
(3, 3, 'Friday', '14:00:00', '16:00:00', NULL, NULL),
(4, 4, 'Tuesday', '14:00:00', '16:00:00', NULL, NULL),
(5, 5, 'Wednesday', '14:00:00', '16:00:00', NULL, NULL),
(6, 6, 'Tuesday', '14:00:00', '16:00:00', NULL, NULL),
(7, 7, 'Tuesday', '14:00:00', '16:00:00', NULL, NULL),
(8, 8, 'Wednesday', '18:00:00', '20:00:00', NULL, NULL),
(9, 9, 'Thursday', '14:00:00', '16:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_img` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `profile_img`, `role`) VALUES
(1, 'Mario Rossi', 'mario@example.com', NULL, '$2y$12$VjuwbjJQlr/SeL1.GuS6U.98I6BHnh85y9C.bYPdCJry8v3Xxo2ES', NULL, NULL, NULL, '', 'user'),
(2, 'Frank', 'admin@admin.it', NULL, '$2y$12$tgrhYWW7RsGCxovDydSanOfw1eperp5xjJ5OY4hBTnQyndEpEVGzK', NULL, NULL, NULL, '', 'admin'),
(3, 'Furman Stamm', 'haven59@example.net', '2024-06-03 13:51:37', '$2y$12$o5pjCzpM67CLClHpBMGPp.xG1pUbc.4omdHBzPmr6pBMKVjlMXRsO', '0Ay9FxQF5G', NULL, NULL, NULL, NULL),
(4, 'Jermey Stehr PhD', 'hudson.eric@example.org', '2024-06-03 13:51:37', '$2y$12$o5pjCzpM67CLClHpBMGPp.xG1pUbc.4omdHBzPmr6pBMKVjlMXRsO', 'wtD4yaXGGu', NULL, NULL, NULL, NULL),
(5, 'Destin Stracke', 'apouros@example.org', '2024-06-03 13:51:37', '$2y$12$o5pjCzpM67CLClHpBMGPp.xG1pUbc.4omdHBzPmr6pBMKVjlMXRsO', 'o5UYQPfh5Q', NULL, NULL, NULL, NULL),
(6, 'Dr. Vella Hayes', 'drew.hoeger@example.com', '2024-06-03 13:51:37', '$2y$12$o5pjCzpM67CLClHpBMGPp.xG1pUbc.4omdHBzPmr6pBMKVjlMXRsO', '5oNn0XX5vf', NULL, NULL, NULL, NULL),
(7, 'Rickie Braun', 'mossie69@example.com', '2024-06-03 13:51:37', '$2y$12$o5pjCzpM67CLClHpBMGPp.xG1pUbc.4omdHBzPmr6pBMKVjlMXRsO', 'lVO0tkY7hP', NULL, NULL, NULL, NULL),
(8, 'Talia Shanahan II', 'yfritsch@example.net', '2024-06-03 13:51:37', '$2y$12$o5pjCzpM67CLClHpBMGPp.xG1pUbc.4omdHBzPmr6pBMKVjlMXRsO', 'h8ERL1jIGG', NULL, NULL, NULL, NULL),
(9, 'Keyon Pfannerstill V', 'jordon12@example.net', '2024-06-03 13:51:37', '$2y$12$o5pjCzpM67CLClHpBMGPp.xG1pUbc.4omdHBzPmr6pBMKVjlMXRsO', 'gn6xAG2wbT', NULL, NULL, NULL, NULL),
(10, 'Jennings Hudson', 'rubie.veum@example.net', '2024-06-03 13:51:37', '$2y$12$o5pjCzpM67CLClHpBMGPp.xG1pUbc.4omdHBzPmr6pBMKVjlMXRsO', 'g727Are4iN', NULL, NULL, NULL, NULL),
(11, 'Hyman McCullough', 'bridgette47@example.net', '2024-06-03 13:51:37', '$2y$12$o5pjCzpM67CLClHpBMGPp.xG1pUbc.4omdHBzPmr6pBMKVjlMXRsO', 'NFJenGc7QE', NULL, NULL, NULL, NULL),
(12, 'Greta Cassin', 'herzog.coleman@example.org', '2024-06-03 13:51:37', '$2y$12$o5pjCzpM67CLClHpBMGPp.xG1pUbc.4omdHBzPmr6pBMKVjlMXRsO', 'G5ypUgEwjJ', NULL, NULL, NULL, NULL),
(13, 'Kai Wall', 'fasalivabi@mailinator.com', NULL, '$2y$12$DEvqPdDcKflbLST/I5tXae1jOf3xWxHVTRlOaGyDk5y/RVGy1L0Bm', NULL, NULL, NULL, '/storage/default.jpg', 'user'),
(14, 'frank', 'francescogentilekr@gmail.com', NULL, '$2y$12$8MkrFpkKZre9YSdSPgcZxune5UD/sMnACOtvVBG8zxVWoDQ4voNpG', NULL, NULL, NULL, '/storage/default.jpg', 'user'),
(15, 'Gary Mack', 'baloguzy@mailinator.com', NULL, '$2y$12$YaQK0RntPQPRE8Sj38RMMOtyuQb8IoAjx/WR/M7EG3GHwCwj0J1XW', NULL, NULL, NULL, '/storage/default.jpg', 'user'),
(16, 'Yoshio Contreras', 'gaco@mailinator.com', NULL, '$2y$12$tKN6c0z5Bas293ec5uDGveqsY0iISTinNh0WQUEqnfHBXWmo04DW6', NULL, NULL, NULL, '/storage/default.jpg', 'user'),
(17, 'Jermaine Wilkins', 'furivowef@mailinator.com', NULL, '$2y$12$E1KbbuHKnddGSje83kDoPeyajt4v59Z/a9d28zHlk/pNxDaS2No46', NULL, NULL, NULL, '/storage/default.jpg', 'user'),
(18, 'Charlotte Herrera', 'rixu@mailinator.com', NULL, '$2y$12$P32NpUbKwdAHTgypjH9scuNjtgRwhou70FbcEVyJw1yPG6QLlBVR2', NULL, NULL, NULL, '/storage/default.jpg', 'user'),
(19, 'MacKenzie Middleton', 'hubadu@mailinator.com', NULL, '$2y$12$edHScYyxYitCrQGlwYT8JuWdcfpSvSvpsEJv8YeHRbcXopYx.0fli', NULL, NULL, NULL, '/storage/default.jpg', 'user'),
(20, 'Vaughan Morgan', 'nukozyva@mailinator.com', NULL, '$2y$12$F/d3IqL/f7OaHf1g4XKUcutCuSpu0Xd20t6g0orpw0eSv4cysL3hq', NULL, NULL, NULL, '/storage/icwSmb8SvWd7EFqFMKAXKeVW0svFwmnSt0rTEz8P.png', 'user');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

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
-- Indici per le tabelle `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_activity_id_foreign` (`activity_id`),
  ADD KEY `courses_slot_id_foreign` (`slot_id`);

--
-- Indici per le tabelle `course_user`
--
ALTER TABLE `course_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_user_user_id_foreign` (`user_id`),
  ADD KEY `course_user_course_id_foreign` (`course_id`);

--
-- Indici per le tabelle `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indici per le tabelle `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indici per le tabelle `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indici per le tabelle `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indici per le tabelle `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indici per le tabelle `slots`
--
ALTER TABLE `slots`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `course_user`
--
ALTER TABLE `course_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT per la tabella `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT per la tabella `slots`
--
ALTER TABLE `slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `courses_slot_id_foreign` FOREIGN KEY (`slot_id`) REFERENCES `slots` (`id`);

--
-- Limiti per la tabella `course_user`
--
ALTER TABLE `course_user`
  ADD CONSTRAINT `course_user_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
