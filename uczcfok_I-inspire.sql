-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Host: mysql-server.ucl.ac.uk:3306
-- Generation Time: Mar 04, 2020 at 10:52 PM
-- Server version: 5.6.36
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `uczcfok I-inspire`
--

-- --------------------------------------------------------

--
-- Table structure for table `assistant`
--

CREATE TABLE IF NOT EXISTS `assistant` (
  `id` int(11) NOT NULL,
  `training` varchar(100) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `assistant`
--

INSERT INTO `assistant` (`id`,`training`) VALUES
(3,'ratio of health=0.85');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facilitator_id` int(11) DEFAULT NULL,
  `venue_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `event_info` varchar(50) DEFAULT NULL COMMENT 'venue_id&room_id&date_time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `check_event` (`event_info`),
  KEY `fk1` (`venue_id`),
  KEY `fk2` (`facilitator_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `facilitator_id`, `venue_id`, `room_id`, `date_time`, `type`, `event_info`) VALUES
(1, 1, 7, 2, '2020-02-29 10:00:00', 'op', '7&2&2020-02-29 10:00:00'),
(3, 1, 1, 2, '2020-03-13 12:00:00', 'eb', '1&2&2020-03-13 12:00:00'),
(5, 1, 7, 2, '2020-02-29 14:00:00', 'op', '7&2&2020-02-29 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `exclusive_to_business_event`
--

CREATE TABLE IF NOT EXISTS `exclusive_to_business_event` (
  `id` int(11) NOT NULL,
  `assistant_id` int(11) DEFAULT NULL,
  `name_of_business` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assistant_id` (`assistant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exclusive_to_business_event`
--

INSERT INTO `exclusive_to_business_event` (`id`, `assistant_id`, `name_of_business`) VALUES
(3, 3, 'project managements');

-- --------------------------------------------------------

--
-- Table structure for table `facilitator`
--

CREATE TABLE IF NOT EXISTS `facilitator` (
  `id` int(11) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `facilitator`
--

INSERT INTO `facilitator` (`id`, `qualification`) VALUES
(1, 'event managment=.7&ratio of succeeded events=0.8');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `open_to_public_event`
--

CREATE TABLE IF NOT EXISTS `open_to_public_event` (
  `id` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `open_to_public_event`
--

INSERT INTO `open_to_public_event` (`id`) VALUES
(1),
(5);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE IF NOT EXISTS `person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(15) NOT NULL,
  `last_name` varchar(15) NOT NULL,
  `info` varchar(500) NOT NULL,
  `birth_date` date NOT NULL,
  `combined_data` varchar(50) NOT NULL COMMENT 'combination of name&birth_date',
  `actor_type` varchar(20) NOT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `person_id` (`person_id`),
  UNIQUE KEY `combined_data` (`combined_data`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_id`, `first_name`, `last_name`, `info`, `birth_date`, `combined_data`, `actor_type`) VALUES
(1, 'alex', 'jax', 'an expert facilitator in our events'' types', '1980-06-02', 'alexJAX&1980-06-02', 'facilit'),
(3, 'max', 'william', 'a new assistant for exclusive business events with a HSE certificate', '1990-02-02', 'maxWILLIAM&1990-02-02', 'assis'),
(5, 'frank', 'john', 'a new member likes open to public events', '1991-02-04', 'frankJOHN&1991-02-04', 'memb'),
(7, 'junior', 'faw', 'a new member likes exclusive business events', '1992-04-07', 'juniorFAW&1992-04-07', 'memb');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `id` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `max_capacity` int(11) NOT NULL,
  KEY `venue_id` (`venue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `venue_id`, `max_capacity`) VALUES
(1, 1, 100),
(2, 1, 100),
(3, 1, 110),
(4, 1, 100),
(5, 1, 110),
(1, 7, 100),
(2, 7, 100),
(3, 7, 110),
(4, 7, 100),
(5, 7, 110),
(6, 7, 100),
(7, 7, 100);

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE IF NOT EXISTS `venue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) unique NOT NULL,
  `number_of_rooms` int(11) NOT NULL,
  `country` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `street_info` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id`, `name`,`number_of_rooms`, `country`, `city`, `street_info`) VALUES
(1,'Fx conference', 5, 'UK', 'london', 'via london street 55'),
(7,'Alpha ',7, 'UK', 'london', 'via san martin 77');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assistant`
--
ALTER TABLE `assistant`
  ADD CONSTRAINT `assistant_ibfk_1` FOREIGN KEY (`id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`facilitator_id`) REFERENCES `facilitator` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exclusive_to_business_event`
--
ALTER TABLE `exclusive_to_business_event`
  ADD CONSTRAINT `exclusive_to_business_event_ibfk_1` FOREIGN KEY (`id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exclusive_to_business_event_ibfk_2` FOREIGN KEY (`assistant_id`) REFERENCES `assistant` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `facilitator`
--
ALTER TABLE `facilitator`
  ADD CONSTRAINT `facilitator_ibfk_1` FOREIGN KEY (`id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`id`) REFERENCES `person` (`person_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `open_to_public_event`
--
ALTER TABLE `open_to_public_event`
  ADD CONSTRAINT `open_to_public_event_ibfk_1` FOREIGN KEY (`id`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
