-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for cv
CREATE DATABASE IF NOT EXISTS `cv` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cv`;

-- Dumping structure for table cv.experience
CREATE TABLE IF NOT EXISTS `experience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL DEFAULT '',
  `term` varchar(255) NOT NULL,
  `experience_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_experience_experience_types` (`experience_type`),
  CONSTRAINT `FK_experience_experience_types` FOREIGN KEY (`experience_type`) REFERENCES `experience_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table cv.experience: ~20 rows (approximately)
DELETE FROM `experience`;
/*!40000 ALTER TABLE `experience` DISABLE KEYS */;
INSERT INTO `experience` (`id`, `key`, `value`, `term`, `experience_type`) VALUES
	(1, 'PHP', '80%', '', 1),
	(2, 'MySQL', '65%', '', 1),
	(3, 'NodeJS / TypeScript', '55%', '', 1),
	(4, 'Angular 6', '35%', '', 1),
	(5, 'JavaScript', '50%', '', 1),
	(6, 'C#', '40%', '', 1),
	(7, 'Reversed IP Lookup API', 'A small API that provides an information about domains that contain the same IP address as the given. The main idea is to find out what other domains are hosted on the same server as the given. The API may receive a domain name or an IP address of the target and returns a JSON with list of all found domains. It uses MySQL database with over 200 million records, containing domain names and IP addresses. This project was developed on a client\'s request and it\'s currently in production. You can see the project structure in this GitHub repository: https://github.com/svetoslav0/web-researcher', '', 2),
	(8, 'Script-ioner - A Trivia Quiz Multiplayer Game', 'Script-ioner is web-based quiz multiplayer game and it was developed during my internship in Casualino JSC (more information about this internship can be found in the \'Background\' section). When the game starts the player must type his/her username. After that he/she either visits the \'waiting room\' or joins a game deppending on whether anyone else is waiting for a player to join his/her game or a new room has to be created. When the game starts, ten random questions are fetched from the database and their answers are randomized too. The database contains two tables - one for the questions and one for the answers, so one question can have different number of answers and different number of right and wrong answers. The game also has a timer, so the player must be careful of his/her time, because if it expires, the game ends and he/she cannot answer the remaining questions. In that case the answered questions will be counted in the results at the end of the game. The results page shows if the player is a winner or a loser. Other information is also provided, such as every player\'s point. There is a formula for calculation of the point and it deppends on the given answers and the total time that the player needed to answers the questions. Each of the can also see all the questions from their game with the right and the given answers. This project was developed with the following technologies: TypeScript, Express.js, MySQL, Socket.io and Angular 6. GitHub Repository: https://github.com/svetoslav0/script-ioner', '', 2),
	(10, 'Electronic Journal - Thesis For Naval Academy "N. Y. Vaptsarov"', 'This project is a system for adding, viewing (and when needed - editing or deleting) grades for the students of the Naval Academy. It is divided into three different roles - Administrator, Teacher and Student. The application recognizes the type of the user automatically when he/she logs in. The Administrator can do all operations for every student. He/she has to choose speciality, subject and student that he/she wants to apply some operations to. There are searching fields on every page with different criterias like the name or the code of a subject, the name or the faculty number of a student. The teacher can see only the subjects he/she teaches and can add grades only on students who learn these subjects. Every other operation, such as editing or deleting grade, adding grade to a student who doesn\'t learn this subject or adding a grade on a subject that the logged teacher is not teaching, is validating and cannot be done from a teacher. The student can only see his/her grades on all of the subjects he/she learns, divided by years and semesters of learning. When choosing a subject he/she may click on it and a list of all of the grades for the selected subject are listed. This was developed is that way, because a single student may have more than one grade on a given subject. For example: he/she fails on the regular exam.', '', 2),
	(11, 'Upgrading an already existing E-Shop application', 'Back in 2017, a small task was given to me: to upgrade an existing application. That was the first project I have ever worked on. It contained an admin panel where administrator could add, edit or remove categories, sub-categories and inside - different items. The task was simple: to add function for applying, editing and removing discounts on a category, sub-category or a single item. When an administrator applies discount to a sub-category, he/she has to select how the discount will be applied. Either to rewrite the discounts on the single items or to ignore them. The same way works applying a discount to a whole category. The administrator has to choose how will it be applied, deppending on the existing discounts of a sub-category and a single item.', '', 2),
	(12, 'Freelance Project', 'A small API for reversed IP lookup with database that contains hundreds of millions of rows. ', 'August 2019', 3),
	(13, 'Back-End Internship', 'Internship in Casualino JSC where I have developed a web-based multiplayer quiz game for educational purposes. ', 'February 2019 - April 2019', 3),
	(14, 'Lecturer and Assistant Lecturer', 'Teaching at Software University in Varna for a course Programming Basics with C#. Demonstration of good and bad practices and solving a lot of exercises in front of the students.', 'March 2019 - April 2019, October 2018 - December 2018', 3),
	(15, 'Freelance project', 'Upgrading an existing E-Shop application. Added function to apply discount on different items, sub-categories or a category with different options. ', 'October 2018', 3),
	(18, 'OOP', '80%', '', 1),
	(19, 'MVC', '70%', '', 1),
	(20, 'Socket.io', '50%', '', 1),
	(21, 'CodeIgniter', '75%', '', 1),
	(22, 'HTML/CSS', '60%', '', 1),
	(23, 'MongoDB', '35%', '', 1);
/*!40000 ALTER TABLE `experience` ENABLE KEYS */;

-- Dumping structure for table cv.experience_types
CREATE TABLE IF NOT EXISTS `experience_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table cv.experience_types: ~3 rows (approximately)
DELETE FROM `experience_types`;
/*!40000 ALTER TABLE `experience_types` DISABLE KEYS */;
INSERT INTO `experience_types` (`id`, `name`) VALUES
	(1, 'Skills'),
	(2, 'Projects'),
	(3, 'Professional Experience');
/*!40000 ALTER TABLE `experience_types` ENABLE KEYS */;

-- Dumping structure for table cv.info_types
CREATE TABLE IF NOT EXISTS `info_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table cv.info_types: ~2 rows (approximately)
DELETE FROM `info_types`;
/*!40000 ALTER TABLE `info_types` DISABLE KEYS */;
INSERT INTO `info_types` (`id`, `name`) VALUES
	(1, 'Bio'),
	(2, 'Education');
/*!40000 ALTER TABLE `info_types` ENABLE KEYS */;

-- Dumping structure for table cv.personal_info
CREATE TABLE IF NOT EXISTS `personal_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `term` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_personal_info_info_types` (`type`),
  CONSTRAINT `FK_personal_info_info_types` FOREIGN KEY (`type`) REFERENCES `info_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table cv.personal_info: ~9 rows (approximately)
DELETE FROM `personal_info`;
/*!40000 ALTER TABLE `personal_info` DISABLE KEYS */;
INSERT INTO `personal_info` (`id`, `key`, `value`, `term`, `type`) VALUES
	(1, 'Name', 'Svetoslav', '', 1),
	(2, 'Surname', 'Nedelchev', '', 1),
	(3, 'Age', '22', '', 1),
	(4, 'Email', 'svet.nedelchev@gmail.com', '', 1),
	(5, 'Phone', '+359 897 / 37 78 76', '', 1),
	(6, 'Location', 'Sofia, Bulgaria', '', 1),
	(7, 'High School Of Mathematics (Maths and English)', 'Mathematics and English', 'September 2010 - May 2015', 2),
	(8, 'Naval Academy "N. Y. Vaptsarov" (Information and Communications Technologies)', 'Information and Communications Technologies', 'September 2015 - June 2019', 2),
	(10, 'Software University - SoftUni', 'Software Engineering Program - PHP and JavaScript Development ', 'Since January 2018', 2);
/*!40000 ALTER TABLE `personal_info` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
