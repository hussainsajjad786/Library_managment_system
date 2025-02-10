-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 10, 2025 at 03:32 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` enum('admin') NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `created_at`, `role`) VALUES
(1, 'Admins', 'admin@gmail.com', '$2y$10$G2KfdxpOFOTgVMmW9l3do.eouCaWABTB2TWGKspj2Z2DY.0khiDLG', '2025-01-27 18:41:34', 'admin'),
(2, 'sajjad shigri1', 'shigri@gmail.com', '$2y$10$wMC/ORq3DXapR6mAbT4dlO7bWFM6XNZAgO6xjWsLUQ6Tybocqw.SC', '2025-01-28 19:50:25', 'admin'),
(3, 'ali', 'ali@gmail.com', '$2y$10$G97bKbh2ePqAqDbP2glGf.hUurZFY1Dy/6XyCKqF0wFBqqBjq3RCe', '2025-01-28 20:08:05', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bio` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `name`, `bio`) VALUES
(2, 'George Orwellabccc', 'English novelist, essayist, and critic, known for 1984 and Animal Farm.'),
(3, 'Stephen Hawking', 'Renowned theoretical physicist and author of A Brief History of Time.'),
(4, 'Isaac Asimovjjj', 'American author and professor of biochemistry, famous for his science fiction works.'),
(5, 'Malcolm Gladwell', 'Canadian journalist and author of The Tipping Point and Outliers.'),
(6, 'Jane Austen', 'English novelist known for her classic works such as Pride and Prejudice.'),
(7, 'Yuval Noah Harari', 'Historian and author of Sapiens: A Brief History of Humankind.'),
(9, 'dddddddddd', 'dsdd ggg ss'),
(10, '12ssssss', 'in the name of allah who is the msot'),
(11, 'musth', 'univeersity'),
(12, 'mustddd', 'this is univeristyeee'),
(13, 'sajid noor', 'ganche'),
(14, 'dddddssseeeeeee', 'gggggggggg');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `publish_date` date DEFAULT NULL,
  `status` enum('available','issued') DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `category_id`, `author_id`, `publish_date`, `status`) VALUES
(3, 'A Brief History of Time', 3, 10, '1988-04-01', 'available'),
(4, 'Foundation', 3, 4, '1951-05-01', 'available'),
(5, 'Outliers', 2, 5, '2008-11-18', 'available'),
(6, 'Pride and Prejudice', 1, 6, '1813-01-28', 'available'),
(7, 'Sapiens: A Brief History of Humankind', 4, 7, '2011-06-04', 'available'),
(8, 'never mind', 3, 2, '2025-02-13', 'available'),
(10, '250 humanh', 3, 5, '2025-02-07', 'available'),
(14, 'gilgit baltistan', 4, 13, '2025-02-26', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Science'),
(4, 'History'),
(5, 'Biography'),
(6, 'Fantasy'),
(7, 'Technology'),
(8, 'sajjad'),
(9, 'ahamd'),
(10, 'saaaa'),
(11, 'sajjadrrrrrr'),
(12, 'ddddddd');

-- --------------------------------------------------------

--
-- Table structure for table `issued_books`
--

CREATE TABLE `issued_books` (
  `issue_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_date` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `status` enum('issued','returned') DEFAULT 'issued'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issued_books`
--

INSERT INTO `issued_books` (`issue_id`, `book_id`, `user_id`, `issue_date`, `return_date`, `status`) VALUES
(5, 5, 1, '2025-01-29', '2026-02-21', 'returned'),
(6, 10, 4, '2025-03-01', NULL, 'issued'),
(7, 4, 7, '2025-02-27', NULL, 'issued'),
(8, 4, 7, '2025-02-26', '2025-03-08', 'returned'),
(10, 3, 12, '2025-02-11', NULL, 'issued'),
(11, 3, 12, '2025-02-11', NULL, 'issued'),
(14, 14, 11, '2025-02-28', '2026-04-27', 'returned');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `mobile`, `address`, `role`) VALUES
(1, 'Sajjad Hussain', 'hussainsajjad1010@gmail.com', '$2y$10$YxbAh0aOl8XTCpusrEhdCeBAqz8sq47lwnJ.xDh9nwtrygNlmtfNe', '923495736218', 'tokmalhor12', 'user'),
(3, 'Sajjad Hussain', 'hussainsajjad101220@gmail.com', '$2y$10$yk9Px9vbN/ztNm249JNFdOgaVkQxw2Ak4tYDkfnAB.Jp8jPnjbHpi', '923495736218', 'tokmalhor', 'user'),
(4, 'ali', 'fff@gmail.com', '1234', ' 923554253871', '  ', 'user'),
(6, 'Sajjad Hussain122', 'mazz@gmail.com', '$2y$10$fo0zwhLOG91lWKfR4QQcdeufpqSAfzfDz43sBeSRid1FcXkXAOUmm', '6789', 'abcd', 'user'),
(7, 'aslam', 'asla@gmail.com', '$2y$10$mtC00BUQNsTkWKic0RJndueAdCIjPX6hm53ppwZclq02ZZddeqDQi', '923554253871', 'fjdfjds', 'user'),
(8, 'syed muntaz', 'muntaz@gmail.com', '$2y$10$PijOnI7nukPJbHHe/WL9o.TrbYW9Xw8uJYhIOg80Ffza5BxeoZHdS', '454333', 'roundu', 'user'),
(9, 'baqir', 'baqir@gmail.com', '$2y$10$D471/fIJv6fHGOMiORpjqeNoKkG0qmh5sqxA/eFnjh1Ykmq5tMxB.', '88876655', 'gilgit\r\n', 'user'),
(10, 'aaaa', 'aaa@gmail.com', '$2y$10$lfgYtno/WQ0eB.obcPResewKl7pPsXXA8xwuTac8XeBbtiiXw83Va', '888888888888', 'df  sdfsdhfsdif', 'user'),
(11, 'sirasim', 'asimjaved@gmail.com', '$2y$10$2MwmK/jBnVZvCfj4RKKRPu51njZ3/ofEsoaZ8LGiq1IcWdFavLJ8S', '9876533', 'mirpur', 'user'),
(12, 'shahid ali', 'shahid@gmail.com', '$2y$10$zuZZPZOGFhR9jFlWRTkq8uNFwnnuhW7Ra0WDURbfcuFjmPqnRONRK', '45454545', 'karchi', 'user'),
(13, 'must ajk', 'must1212@gmail.com', '$2y$10$hqB/VAQUuVqSbm8k3XFaF.RY9yvOEwa1DEUgxZLiwVfGHLiiw2Ffu', '12345', 'mirpur', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `issued_books`
--
ALTER TABLE `issued_books`
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `issued_books`
--
ALTER TABLE `issued_books`
  MODIFY `issue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`);

--
-- Constraints for table `issued_books`
--
ALTER TABLE `issued_books`
  ADD CONSTRAINT `issued_books_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `issued_books_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
