-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: cis330.ca9iefbk06km.us-east-1.rds.amazonaws.com    Database: yelp
-- ------------------------------------------------------
-- Server version 5.5.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `businesses`
--

DROP TABLE IF EXISTS `businesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businesses` (
`business_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
`full_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`open` tinyint(1) DEFAULT NULL,
`photo_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`review_count` int(11) DEFAULT NULL,
`name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`longitude` float DEFAULT NULL,
`state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`stars` float DEFAULT NULL,
`latitude` float DEFAULT NULL,
`created_at` datetime NOT NULL,
`updated_at` datetime NOT NULL,
PRIMARY KEY (`business_id`),
KEY `index_businesses_on_business_id` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businesses_categories`
--

DROP TABLE IF EXISTS `businesses_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businesses_categories` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`business_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`category_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businesses_neighborhoods`
--

DROP TABLE IF EXISTS `businesses_neighborhoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businesses_neighborhoods` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`business_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`neighboorhood_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `businesses_schools`
--

DROP TABLE IF EXISTS `businesses_schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `businesses_schools` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`business_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`school_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
`name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
`created_at` datetime NOT NULL,
`updated_at` datetime NOT NULL,
PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neighborhoods`
--

DROP TABLE IF EXISTS `neighborhoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neighborhoods` (
`name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
`created_at` datetime NOT NULL,
`updated_at` datetime NOT NULL,
PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rails_admin_histories`
--

DROP TABLE IF EXISTS `rails_admin_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rails_admin_histories` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`message` text COLLATE utf8_unicode_ci,
`username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`item` int(11) DEFAULT NULL,
`table` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`month` smallint(6) DEFAULT NULL,
`year` bigint(20) DEFAULT NULL,
`created_at` datetime NOT NULL,
`updated_at` datetime NOT NULL,
PRIMARY KEY (`id`),
KEY `index_rails_admin_histories` (`item`,`table`,`month`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
`review_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
`yelp_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`stars` int(11) DEFAULT NULL,
`date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`business_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`created_at` datetime NOT NULL,
`updated_at` datetime NOT NULL,
PRIMARY KEY (`review_id`),
KEY `index_reviews_on_review_id` (`review_id`),
KEY `index_reviews_on_yelp_user_id` (`yelp_user_id`),
KEY `index_reviews_on_business_id` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
`version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
`name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
`created_at` datetime NOT NULL,
`updated_at` datetime NOT NULL,
PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
`encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
`reset_password_token` varchar(255) COLLATE utf8_unicod_eci DEFAULT NULL,
`reset_password_sent_at` datetime DEFAULT NULL,
`remember_created_at` datetime DEFAULT NULL,
`sign_in_count` int(11) DEFAULT '0',
`current_sign_in_at` datetime DEFAULT NULL,
`last_sign_in_at` datetime DEFAULT NULL,
`current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`created_at` datetime NOT NULL,
`updated_at` datetime NOT NULL,
PRIMARY KEY (`id`),
UNIQUE KEY `index_users_on_email` (`email`),
UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votes` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`cool` int(11) DEFAULT NULL,
`funny` int(11) DEFAULT NULL,
`useful` int(11) DEFAULT NULL,
`yelp_user_id` int(11) DEFAULT NULL,
`review_id` int(11) DEFAULT NULL,
`created_at` datetime NOT NULL,
`updated_at` datetime NOT NULL,
PRIMARY KEY (`id`),
KEY `index_votes_on_yelp_user_id` (`yelp_user_id`),
KEY `index_votes_on_review_id` (`review_id`)
) ENGINE=InnoDB AUTO_INCREMENT=463001 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `yelp_users`
--

DROP TABLE IF EXISTS `yelp_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yelp_users` (
`user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
`name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
`average_stars` float DEFAULT NULL,
`review_count` int(11) DEFAULT NULL,
`created_at` datetime NOT NULL,
`updated_at` datetime NOT NULL,
PRIMARY KEY (`user_id`),
KEY `index_yelp_users_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-26 19:10:52
