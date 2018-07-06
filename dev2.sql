-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 06, 2018 at 03:52 PM
-- Server version: 5.5.60-0+deb8u1-log
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dev2`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '3', 1505277335),
('admin', '6', 1528784861),
('adminAccess', '3', 1528957577),
('user', '1', 1505277321),
('user', '10', 1528977219),
('user', '9', 1528792605);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/admin/*', 2, NULL, NULL, NULL, 1528958896, 1528958896),
('/admin/default/*', 2, NULL, NULL, NULL, 1528987384, 1528987384),
('/admin/default/index', 2, NULL, NULL, NULL, 1528987526, 1528987526),
('/admin/manifestation/*', 2, NULL, NULL, NULL, 1528987436, 1528987436),
('/admin/users/update', 2, NULL, NULL, NULL, 1528987614, 1528987614),
('/admin/users/view', 2, NULL, NULL, NULL, 1528987614, 1528987614),
('/gii/*', 2, NULL, NULL, NULL, 1528958896, 1528958896),
('/rbac/*', 2, NULL, NULL, NULL, 1528958896, 1528958896),
('admin', 1, 'главный администратор', NULL, NULL, 1505277261, 1505277261),
('adminAccess', 2, 'общий доступ в админку', NULL, NULL, 1505276934, 1505276934),
('projectAccess', 2, 'доступ к просмотру проектов', NULL, NULL, 1505277021, 1505277021),
('updateOwnProject', 2, 'возможность обновить только свой проэкт', 'Author', NULL, 1505284426, 1505284426),
('updateProject', 2, 'возможность обновить проект', NULL, NULL, 1505281078, 1505281078),
('user', 1, 'Просто зарегестрированный пользователь', NULL, NULL, 1505276865, 1505277082),
('userAccess', 2, 'доступ к модулю rbac', NULL, NULL, 1505277067, 1505277067);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('adminAccess', '/admin/*'),
('user', '/admin/default/*'),
('user', '/admin/manifestation/*'),
('user', '/admin/users/update'),
('user', '/admin/users/view'),
('adminAccess', '/gii/*'),
('adminAccess', '/rbac/*'),
('admin', 'adminAccess'),
('user', 'updateOwnProject'),
('updateOwnProject', 'updateProject'),
('admin', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_rule`
--

INSERT INTO `auth_rule` (`name`, `data`, `created_at`, `updated_at`) VALUES
('Author', 0x4f3a32353a226170705c636f6d706f6e656e74735c417574686f7252756c65223a333a7b733a343a226e616d65223b733a363a22417574686f72223b733a393a22637265617465644174223b693a313530353238313031373b733a393a22757064617465644174223b693a313530353238313031373b7d, 1505281017, 1505281017);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE IF NOT EXISTS `image` (
`id` int(11) NOT NULL,
  `filePath` varchar(400) NOT NULL,
  `itemId` int(11) DEFAULT NULL,
  `isMain` tinyint(1) DEFAULT NULL,
  `modelName` varchar(150) NOT NULL,
  `urlAlias` varchar(400) NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manifestation`
--

CREATE TABLE IF NOT EXISTS `manifestation` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `manifestation`
--

INSERT INTO `manifestation` (`id`, `user_id`, `date`, `title`, `image`, `type`, `description`, `text`) VALUES
(1, 3, '2018-06-15 15:31:33', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/logo-triangle1.png', 'image/png', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(2, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(3, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(4, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(5, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(6, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(7, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(8, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(9, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(10, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(11, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(12, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(13, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(14, 3, '2018-06-15 15:31:33', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/logo-triangle1.png', 'image/png', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(15, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(16, 3, '2018-06-15 15:31:33', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/logo-triangle1.png', 'image/png', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(17, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(18, 3, '2018-06-15 15:31:33', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/logo-triangle1.png', 'image/png', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(19, 3, '2018-06-15 15:31:40', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/dsc_0989.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(20, 3, '2018-06-15 15:31:33', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/logo-triangle1.png', 'image/png', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(21, 3, '2018-06-26 17:22:09', 'На прошлой неделе в Одесской государственной академии', '/images/manifestation/o_nas.jpg', 'image/jpeg', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов.</p>', '<p>На прошлой неделе в Одесской государственной академии строительства и архитектуры проходил конкурс, где выбирали лучшие проекты по благоустройству территории вуза. Свое видение редизайна представили десять будущих архитекторов. Перед студентами стояла задача изменить все пять скверов, расположенных на территории академии, с учетом их функционального назначения. Среди участников компетентного жюри, выступил, глава наблюдательного совета Промышленно-строительной группы &laquo;Камбио-Инвест&raquo;, Васильковский Игорь Иванович. Как грамотный руководитель, его заинтересовали амбиционные студенты, которых пригласили с экскурсией на наше предприятие.</p>'),
(22, 3, '2018-06-25 13:48:47', '', '/images/manifestation/KM36.jpg', 'image/jpeg', '<p>qweqweqweqw</p>', '<p>&nbsp; qwqw eqw eq</p>'),
(23, 3, '2018-06-25 16:41:03', '', '/images/manifestation/colormin-bg.jpg', 'image/jpeg', '', ''),
(24, 3, '2018-06-25 17:42:20', '', '/images/manifestation/colormin-bg.jpg', 'image/jpeg', '', ''),
(25, 3, '2018-06-25 17:48:39', '', '/images/manifestation/o_nas.jpg', 'image/jpeg', '', ''),
(26, 3, '2018-06-26 16:11:36', '', '/images/manifestation/o_nas.jpg', 'image/jpeg', '', ''),
(27, 3, '2018-06-26 17:39:02', 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrr', '/images/manifestation/1530263037-131069.png', 'image/jpeg', '<p>rrrrrrrrrrrrrrrrrrrrrrrrrrrrr</p>', '<p>rrrrrrrrrrrrrrrrrrrrrrrrrrrrr</p>'),
(28, 3, '2018-06-27 15:08:01', '', '/images/manifestation/1530264346-661138.png', 'image/jpeg', '', ''),
(29, 0, '0000-00-00 00:00:00', '', '1530262188-925651.png', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1529071177),
('m140622_111540_create_image_table', 1529071185),
('m140622_111545_add_name_to_image_table', 1529071185);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(11) NOT NULL,
  `username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Admin', 'DeZt9GzDV6jSEls0VZwuW5Ln8ZX3be-6', '$2y$10$y.tKHAZWrzeGZwyw/iW8K.9Ou19VJSsrJ.m7zaLdn5f3kd6FRKJQW', NULL, 'admin@gmail.com', 10, 1505276337, 1505276337),
(10, 'test', 'DeZt9GzDV6jSEls0VZwuW5Ln8ZX3be-6', '$2y$10$y.tKHAZWrzeGZwyw/iW8K.9Ou19VJSsrJ.m7zaLdn5f3kd6FRKJQW', NULL, 'test@test.ua', 10, 1528977219, 1528977219);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
 ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
 ADD PRIMARY KEY (`name`), ADD KEY `rule_name` (`rule_name`), ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
 ADD PRIMARY KEY (`parent`,`child`), ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manifestation`
--
ALTER TABLE `manifestation`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
 ADD PRIMARY KEY (`version`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `manifestation`
--
ALTER TABLE `manifestation`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
