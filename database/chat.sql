-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2024 at 09:40 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chat`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatrooms`
--

CREATE TABLE `chatrooms` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `msg` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chatrooms`
--

INSERT INTO `chatrooms` (`id`, `userid`, `msg`, `created_on`) VALUES
(1, 2, 'Hi Karan', '2024-05-06 01:54:04'),
(2, 1, 'Hi Divya', '2024-05-06 01:54:28'),
(3, 1, 'How Are You', '2024-05-06 01:54:54'),
(4, 2, 'Good', '2024-05-06 01:55:05'),
(5, 1, 'Hi', '2024-05-06 01:55:50'),
(6, 2, 'Hi', '2024-05-06 01:57:23'),
(7, 1, 'How Are You?', '2024-05-06 01:58:31'),
(8, 2, 'Fine', '2024-05-06 01:58:46'),
(9, 2, 'Hi', '2024-05-06 06:00:46'),
(10, 1, 'Hi Karan', '2024-05-06 06:04:21'),
(11, 2, 'Hi D', '2024-05-06 06:04:54'),
(12, 1, 'Hi Divya', '2024-05-06 06:39:18'),
(13, 2, 'hi Karan', '2024-05-06 06:39:59'),
(14, 1, 'good', '2024-05-06 06:40:48'),
(15, 2, 'ok', '2024-05-06 06:41:08'),
(16, 2, 'good', '2024-05-06 06:41:27'),
(17, 2, 'hmm', '2024-05-06 06:41:38'),
(18, 1, 'hmm', '2024-05-06 06:41:43'),
(19, 1, 'done', '2024-05-06 06:41:54'),
(20, 2, 'HI', '2024-05-06 07:00:51'),
(21, 1, 'Hi', '2024-05-07 09:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `chat_message`
--

CREATE TABLE `chat_message` (
  `chat_message_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `chat_message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Yes','No') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `chat_user_table`
--

CREATE TABLE `chat_user_table` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `user_email` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `user_password` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `user_profile` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `user_status` enum('Disabled','Enable') CHARACTER SET utf8mb4 NOT NULL,
  `user_created_on` datetime NOT NULL,
  `user_verification_code` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `user_login_status` enum('Logout','Login') CHARACTER SET utf8mb4 NOT NULL,
  `user_token` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `user_connection_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat_user_table`
--

INSERT INTO `chat_user_table` (`user_id`, `user_name`, `user_email`, `user_password`, `user_profile`, `user_status`, `user_created_on`, `user_verification_code`, `user_login_status`, `user_token`, `user_connection_id`) VALUES
(1, 'Karan Lalwani', 'klalwani865@gmail.com', 'password', 'images/1714839365.png', 'Enable', '2024-05-04 18:16:05', '093fa42304f6eb9549b98a5ee62b4443', 'Login', '7dedf0ba115a1f5fbd68bc5c3c3ba05c', 89),
(2, 'Divya Lalwani', 'lalwanid998@gmail.com', 'password', 'images/1714839991.png', 'Enable', '2024-05-04 18:26:31', 'b5c7ffdc72f5dd9a1b7a1441983a6db7', 'Login', 'ebceeff8926d07c07cce9d34bee6e523', 101);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatrooms`
--
ALTER TABLE `chatrooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_message`
--
ALTER TABLE `chat_message`
  ADD PRIMARY KEY (`chat_message_id`);

--
-- Indexes for table `chat_user_table`
--
ALTER TABLE `chat_user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatrooms`
--
ALTER TABLE `chatrooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `chat_message`
--
ALTER TABLE `chat_message`
  MODIFY `chat_message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_user_table`
--
ALTER TABLE `chat_user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
