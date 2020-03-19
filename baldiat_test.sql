-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: baldiat_test
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

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
-- Table structure for table `billboard`
--

DROP TABLE IF EXISTS `billboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billboard` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billboard_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billboard_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `length` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `font_language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alley` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `building_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billboard_license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billboard_license_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license_end_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `user_id_created` bigint(20) unsigned NOT NULL,
  `user_id_modified` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `billboard_user_id_created_foreign` (`user_id_created`),
  KEY `billboard_user_id_modified_foreign` (`user_id_modified`),
  CONSTRAINT `billboard_user_id_created_foreign` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`),
  CONSTRAINT `billboard_user_id_modified_foreign` FOREIGN KEY (`user_id_modified`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1566920105815 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billboard`
--

LOCK TABLES `billboard` WRITE;
/*!40000 ALTER TABLE `billboard` DISABLE KEYS */;
INSERT INTO `billboard` VALUES (1566912384425,'Judududu','Ududu','لوحة ضوئية','555','555555','115255','1','31.3189246','29.9834684','الكرادةsueueu','كرادة خارجudududu','8eieieie8e8','Jeudueu','55552','رخصة مؤقتة','ieieieiei','2019-8-24','2019-8-31',NULL,8,8,'2019-08-27 11:25:29','2019-08-27 13:07:08'),(1566912384426,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,'2019-08-27 13:04:21','2019-08-27 13:04:21'),(1566912384427,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,'2019-08-27 13:05:13','2019-08-27 13:05:13'),(1566918792618,NULL,NULL,'اختر نوع اللوحة',NULL,NULL,NULL,'1','-122.08400000000002','37.421998333333335','الكرادة','كرادة خارج',NULL,NULL,NULL,'رخصة مؤقتة',NULL,'2019-8-6','2019-8-26',NULL,8,8,'2019-08-27 13:15:05','2019-08-27 14:20:58'),(1566918792619,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,'2019-08-27 13:18:36','2019-08-27 13:18:36'),(1566918792620,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,'2019-08-27 13:19:47','2019-08-27 13:19:47'),(1566920105814,NULL,NULL,'اختر نوع اللوحة',NULL,NULL,NULL,'0','-122.08400000000002','37.421998333333335','الكرادة','كرادة خارج',NULL,NULL,NULL,'اختر نوع الرخصة',NULL,NULL,NULL,NULL,8,8,'2019-08-27 14:20:36','2019-08-27 14:41:48');
/*!40000 ALTER TABLE `billboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id_created` bigint(20) unsigned NOT NULL,
  `user_id_modified` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  UNIQUE KEY `categories_code_unique` (`code`),
  KEY `categories_user_id_created_foreign` (`user_id_created`),
  KEY `categories_user_id_modified_foreign` (`user_id_modified`),
  CONSTRAINT `categories_user_id_created_foreign` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`),
  CONSTRAINT `categories_user_id_modified_foreign` FOREIGN KEY (`user_id_modified`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'مخالفة بناء','21520853',1,1,'2019-07-22 14:29:32','2019-07-22 14:29:32'),(2,'مخالفة نظافة','93655019',1,1,'2019-07-22 14:29:32','2019-07-22 14:29:32'),(3,'مخالفة نطاق جغرافي','75470470',1,1,'2019-07-22 14:29:32','2019-07-22 14:29:32'),(4,'مخالفة الضوابط العامة','48635035',1,1,'2019-07-22 14:29:32','2019-07-22 14:29:32');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `violation_monitoring_id` bigint(20) unsigned NOT NULL,
  `source` longblob NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id_created` bigint(20) unsigned NOT NULL,
  `user_id_modified` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_violation_monitoring_id_foreign` (`violation_monitoring_id`),
  KEY `images_user_id_created_foreign` (`user_id_created`),
  KEY `images_user_id_modified_foreign` (`user_id_modified`),
  CONSTRAINT `images_user_id_created_foreign` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`),
  CONSTRAINT `images_user_id_modified_foreign` FOREIGN KEY (`user_id_modified`) REFERENCES `users` (`id`),
  CONSTRAINT `images_violation_monitoring_id_foreign` FOREIGN KEY (`violation_monitoring_id`) REFERENCES `violations_monitoring` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_06_02_104431_create_categories_table',1),(9,'2019_06_02_104827_create_violations_table',1),(10,'2019_06_02_105825_create_shop_activities_table',1),(11,'2019_06_02_110307_create_shop_data_table',1),(12,'2019_06_02_115147_create_billboard_table',1),(13,'2019_06_02_121957_create_violations_monitoring_table',1),(14,'2019_06_02_122545_create_images_table',1),(15,'2019_06_02_124655_create_scheduling_visits_user_table',1),(16,'2019_06_20_153858_add_latitude_and_longitude_to_shop_data',1),(17,'2019_06_20_154658_add_latitude_and_longitude_to_billboard',1),(18,'2019_07_03_162114_add_notes_shop_data',1),(19,'2019_07_03_163745_change_longitude_latitude_to_nullable_shop_data',1),(20,'2019_07_03_171603_change_license_number_to_string_shop_data',1),(21,'2019_07_03_181620_change_license_number_to_string_billboard',1),(22,'2019_07_07_151836_set_license_type_null_shop_data',1),(23,'2019_07_08_115156_add_is_done_violations_monitoring',1),(24,'2019_07_11_145848_add_fcm_token_users',1),(25,'2019_07_21_094438_add_phone_users',1),(26,'2019_08_26_125225_add_refuse_shop_data',2),(27,'2019_08_26_142224_change_columns_to_nullable_shop_data',2),(28,'2019_08_26_151235_change_columns_to_nullable_billboard',2),(29,'2019_08_26_152045_add_note_billboard',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('38c0de6e190a198727048b944b8b2cbba62aedeb487e169046dd25c4cf940e91ed901ff2013d4da9',5,3,'Personal Access Token','[]',0,'2019-07-30 06:29:29','2019-07-30 06:29:29','2020-07-30 08:29:29'),('3a7b2be7281bd94dd8b4c2cdbda1a1e305a57da0a521b273f42ab95a7c094c6318dcaf9fead49b9f',3,7,'Personal Access Token','[]',0,'2019-09-22 07:22:01','2019-09-22 07:22:01','2020-09-22 09:22:01'),('3d27ca72c53c18d1448bda1d60523b455caca8474814fa6a508883e1c89ae4509c05042375738e51',3,7,'Personal Access Token','[]',0,'2019-09-18 09:39:14','2019-09-18 09:39:14','2020-09-18 11:39:14'),('401e47c3ffae0842a0e75b2dd83b95aa0823293b8062938f2d5577fb7abca2f18e52e24d3f90a4c1',3,7,'Personal Access Token','[]',0,'2019-09-18 05:25:26','2019-09-18 05:25:26','2020-09-18 07:25:26'),('4e39eb5bbbe1d3845a0a1ce410bbc7d9b9cd962b2b962ee7bc893672224f9cd9ba980ed609ceea43',5,7,'Personal Access Token','[]',0,'2019-07-30 06:36:54','2019-07-30 06:36:54','2020-07-30 08:36:54'),('60459d38429252010fd5586cbedd3521b1cd2b37d6f6f62904d1adeca22ba053bb9f3e225149514d',8,7,'Personal Access Token','[]',0,'2019-07-30 10:21:19','2019-07-30 10:21:19','2020-07-30 12:21:19'),('65ea8dcfc72672156d03192e2b2427aa2f101c8ecf10cce7c5a20dcd19e7838205ddfa1f21dfb351',3,7,'Personal Access Token','[]',0,'2019-09-18 09:39:15','2019-09-18 09:39:15','2020-09-18 11:39:15'),('69c2933d2b1fd64a3288f2dd6df613e0146012dbd005d72761f4be8ad9d527ba164b324b56be7faa',5,7,'Personal Access Token','[]',0,'2019-08-27 13:04:09','2019-08-27 13:04:09','2020-08-27 15:04:09'),('761b92348b9f08b398abb24569e5c1d7828e8bf559815c91edb70c85a42f661e3e7bd8894350ccb8',3,7,'Personal Access Token','[]',0,'2019-09-17 13:36:39','2019-09-17 13:36:39','2020-09-17 15:36:39'),('a23836ed78be77cb45c398d54496e265eb352c5d998c2debd8dde85b3c7ac0e65b3a5fa9822eb2c5',8,7,'Personal Access Token','[]',0,'2019-08-27 11:17:09','2019-08-27 11:17:09','2020-08-27 13:17:09'),('a419799cd172d4e85d86473a51c7331adbab23ccb17689d14233f3a0752a9ab170348b449ff24cf6',3,7,'Personal Access Token','[]',0,'2019-09-18 09:39:13','2019-09-18 09:39:13','2020-09-18 11:39:13'),('aa189de9f1496cf38c6b328d99d58b40d2bde51a37406fcfc83242e178da9b198651a5473a60b5ed',8,7,'Personal Access Token','[]',0,'2019-08-27 10:52:31','2019-08-27 10:52:31','2020-08-27 12:52:31'),('bd613b2fb4be73839f6b5f6f7316489698d04f640eb4af36248f161dc399b284f2bcaf7c8db84305',5,7,'Personal Access Token','[]',0,'2019-07-30 07:20:46','2019-07-30 07:20:46','2020-07-30 09:20:46'),('becbd289e0af89251a324ba6fcf42723d87dec2555aae807fd438c39e797673868b52b1c50b77e91',3,7,'Personal Access Token','[]',0,'2019-09-18 09:38:43','2019-09-18 09:38:43','2020-09-18 11:38:43'),('d89e5f712fb809439e230cbf674c960fd676c6a2bb10b50b3417ad9426f08a9aac6bcfd13ec864ce',5,7,'Personal Access Token','[]',0,'2019-07-30 06:48:43','2019-07-30 06:48:43','2020-07-30 08:48:43'),('e2ce31ae65345c9ee15a1c61a70b4f32a30905bb9efafd319870c385cb0de7c11fc2560ee0c7707d',3,7,'Personal Access Token','[]',0,'2019-09-18 09:39:12','2019-09-18 09:39:12','2020-09-18 11:39:12'),('f1e7dd49b7a77498e29f73a52e084474c486e7e12ab685ac9a29b13836516ac34f45ade8daa747d6',5,7,'Personal Access Token','[]',0,'2019-08-01 11:02:36','2019-08-01 11:02:36','2020-08-01 13:02:36'),('fd758cd0898b69253c49d294de9fbdded41f725da308004c5c031fb95ea85f14f6f36c0a0b0edd14',8,3,'Personal Access Token','[]',0,'2019-07-30 06:05:04','2019-07-30 06:05:04','2020-07-30 08:05:04');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','fEFiRaIYUSao9y0os08LIg9umLKBMzkcXmqA7OL8','http://localhost',1,0,0,'2019-07-22 14:28:13','2019-07-22 14:28:13'),(2,NULL,'Laravel Password Grant Client','U58vGIDvdWxS2EjkygbdvM5C1jpleouXGf6pc4OM','http://localhost',0,1,0,'2019-07-22 14:28:13','2019-07-22 14:28:13'),(3,NULL,'Laravel Personal Access Client','A6wADE4fsMNfCXlOrsirnsrY5cjwJZ7NQ1DItjH9','http://localhost',1,0,0,'2019-07-29 07:01:56','2019-07-29 07:01:56'),(4,NULL,'Laravel Password Grant Client','cYO2suyyiYi83E5x3eV9sdWEFubcNN77Gb9HuMYa','http://localhost',0,1,0,'2019-07-29 07:01:56','2019-07-29 07:01:56'),(5,NULL,'Laravel Personal Access Client','55nXFWsWhE5ccvoKUS2YTQhFHQKLxYbD1T8GLsXF','http://localhost',1,0,0,'2019-07-30 06:34:03','2019-07-30 06:34:03'),(6,NULL,'Laravel Password Grant Client','7MY55fcAHEdWOLpnAAHVOc5CBsNwU7tgExHVFJJK','http://localhost',0,1,0,'2019-07-30 06:34:03','2019-07-30 06:34:03'),(7,NULL,'Laravel Personal Access Client','2jAIaz6tlgOBVdIrwxkhv2ITfep3BqWt9OnaujDW','http://localhost',1,0,0,'2019-07-30 06:34:36','2019-07-30 06:34:36'),(8,NULL,'Laravel Password Grant Client','j1nUw2F7SfxSNzaYKcEOeoK3CzZic4u4nxYjzxCy','http://localhost',0,1,0,'2019-07-30 06:34:36','2019-07-30 06:34:36');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2019-07-22 14:28:13','2019-07-22 14:28:13'),(2,3,'2019-07-29 07:01:56','2019-07-29 07:01:56'),(3,5,'2019-07-30 06:34:03','2019-07-30 06:34:03'),(4,7,'2019-07-30 06:34:36','2019-07-30 06:34:36');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduling_visits_user`
--

DROP TABLE IF EXISTS `scheduling_visits_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduling_visits_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `shop_data_id` bigint(20) unsigned NOT NULL,
  `visit_date` date NOT NULL,
  `user_id_created` bigint(20) unsigned NOT NULL,
  `user_id_modified` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `scheduling_visits_user_user_id_foreign` (`user_id`),
  KEY `scheduling_visits_user_shop_data_id_foreign` (`shop_data_id`),
  KEY `scheduling_visits_user_user_id_created_foreign` (`user_id_created`),
  KEY `scheduling_visits_user_user_id_modified_foreign` (`user_id_modified`),
  CONSTRAINT `scheduling_visits_user_shop_data_id_foreign` FOREIGN KEY (`shop_data_id`) REFERENCES `shop_data` (`id`),
  CONSTRAINT `scheduling_visits_user_user_id_created_foreign` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`),
  CONSTRAINT `scheduling_visits_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `scheduling_visits_user_user_id_modified_foreign` FOREIGN KEY (`user_id_modified`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduling_visits_user`
--

LOCK TABLES `scheduling_visits_user` WRITE;
/*!40000 ALTER TABLE `scheduling_visits_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduling_visits_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_activities`
--

DROP TABLE IF EXISTS `shop_activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_activities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id_created` bigint(20) unsigned NOT NULL,
  `user_id_modified` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shop_activities_name_unique` (`name`),
  UNIQUE KEY `shop_activities_code_unique` (`code`),
  KEY `shop_activities_user_id_created_foreign` (`user_id_created`),
  KEY `shop_activities_user_id_modified_foreign` (`user_id_modified`),
  CONSTRAINT `shop_activities_user_id_created_foreign` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`),
  CONSTRAINT `shop_activities_user_id_modified_foreign` FOREIGN KEY (`user_id_modified`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_activities`
--

LOCK TABLES `shop_activities` WRITE;
/*!40000 ALTER TABLE `shop_activities` DISABLE KEYS */;
INSERT INTO `shop_activities` VALUES (1,'ادوات كهربائية','70534009',1,1,'2019-07-22 14:29:51','2019-07-22 14:29:51'),(2,'صيدلية','99661649',1,1,'2019-07-22 14:29:51','2019-07-22 14:29:51'),(3,'مكتبة','42114420',1,1,'2019-07-22 14:29:51','2019-07-22 14:29:51');
/*!40000 ALTER TABLE `shop_activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_data`
--

DROP TABLE IF EXISTS `shop_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_data` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refuse` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shop_activity_id` bigint(20) unsigned NOT NULL,
  `width` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `length` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `floor_number` int(11) NOT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alley` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locality` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locality_number` int(11) NOT NULL,
  `license_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license_end_date` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billboard_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billboard_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billboard_width` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billboard_length` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billboard_height` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billboard_font_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `user_id_created` bigint(20) unsigned NOT NULL,
  `user_id_modified` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shop_data_shop_activity_id_foreign` (`shop_activity_id`),
  KEY `shop_data_user_id_created_foreign` (`user_id_created`),
  KEY `shop_data_user_id_modified_foreign` (`user_id_modified`),
  CONSTRAINT `shop_data_shop_activity_id_foreign` FOREIGN KEY (`shop_activity_id`) REFERENCES `shop_activities` (`id`),
  CONSTRAINT `shop_data_user_id_created_foreign` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`),
  CONSTRAINT `shop_data_user_id_modified_foreign` FOREIGN KEY (`user_id_modified`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1568880812513 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_data`
--

LOCK TABLES `shop_data` WRITE;
/*!40000 ALTER TABLE `shop_data` DISABLE KEYS */;
INSERT INTO `shop_data` VALUES (1566911106430,NULL,NULL,'2',3,NULL,NULL,'978979',9879,'-122.08400000000002','37.421998333333335','الكرادة','كرادة خارج','m,.967','.,m',789,NULL,NULL,NULL,NULL,'7899','اختر نوع اللوحة*',NULL,NULL,NULL,'1',NULL,8,8,'2019-08-27 14:31:41','2019-08-27 14:31:41'),(1568735288041,'Jjjjj',NULL,'2',1,'777455','855','8888',855,'31.3189098','29.9834776','الكرادة','كرادة خارج','Hhh','Tggg0',14455,'huh','Hhhh','2019-09-15','2019-09-16','Uhhu','لوحة ضوئية','4455','44445','255555','1','Cttt',3,3,'2019-09-17 13:46:34','2019-09-22 07:25:40'),(1568804379050,'trgtrhgtrhtrhtruuuu',NULL,'2',1,'777','4444','2222',555,'-122.0840165','37.4218947','الكرادة','كرادة خارج','mmm','rrrrr',44444,'mmm','mmmm',NULL,NULL,'jjjj','لوحة عادية',NULL,NULL,NULL,'1',NULL,3,3,'2019-09-18 09:01:16','2019-09-19 11:06:57'),(1568804762539,'Mnaaaaj',NULL,'2',1,NULL,NULL,'47855',88,'33.312805','44.361488','الكرادة','كرادة خارج','Hdhd','Shhs',55,NULL,NULL,NULL,NULL,'Jjj','لوحة ضوئية',NULL,NULL,NULL,'2',NULL,3,3,'2019-09-18 09:03:37','2019-09-18 09:03:37'),(1568880812512,'Hvghgh',NULL,'1',2,NULL,NULL,'555',5555,'33.312805','44.361488','الكرادة','كرادة خارج','Jjh','Ggg',885,NULL,NULL,NULL,NULL,'Uuuu','لوحة ضوئية',NULL,NULL,NULL,'3',NULL,3,3,'2019-09-19 06:12:47','2019-09-19 06:12:47');
/*!40000 ALTER TABLE `shop_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` smallint(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id_created` bigint(20) unsigned DEFAULT NULL,
  `user_id_modified` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_user_id_created_foreign` (`user_id_created`),
  KEY `users_user_id_modified_foreign` (`user_id_modified`),
  CONSTRAINT `users_user_id_created_foreign` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`),
  CONSTRAINT `users_user_id_modified_foreign` FOREIGN KEY (`user_id_modified`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Admin','admin','admin@admin.com',NULL,1,1,'$2y$10$EgbWc4sVy2PLOkqV3hWgu.h23dVLbiMm7wiWBTNY8ivPPQSUKrbKu','szrOAAsaqjhOpves0pS1eZrx1ZUJEtKSVCh1iHE5zFpw0iLTwiuvUoKcInBQ',NULL,NULL,NULL,'2019-07-22 14:29:13','2019-07-22 14:29:13'),(2,'Sid','Prosacco','giovanna00','mbednar@kohler.com',NULL,2,1,'$2y$10$PgaXpo0bIV5dm2H1inOQu.yXfDebosgjL0pOljCzGS89tJC5gvYD2','HUYL7MrETByWqD9W2xXWD0J7YGeio0n12VfQ3b9v1NQKzmh9zO',NULL,1,1,'2019-07-22 14:29:13','2019-07-22 14:29:13'),(3,'Winston','Rodriguez','albert.hickle','roscoe27@yahoo.com',NULL,2,1,'$2y$10$.ruQKWDRFkVU9eNmQcznvuq8g9BmeT08kcm3PltwhPEigW416/Amq','7QGHubHracUcbyEZJfxd36sL5ClUaWAyXK5suM6qfTJyWAWSEb','dph6i0-ywec:APA91bHafDYxz4YMb7JkMOqBSk1E3JtfJqBCFouPeu3OQiWlk2X-vPQS7G2w7veI3Wquj8Nf5uMUfrlthcoM5iAl1_kRVXEcgD7e6cARN32obVr_Lg98pGjiMvpQOXXr26YCleExWkJG',1,1,'2019-07-22 14:29:13','2019-09-22 07:22:03'),(4,'Reece','Botsford','wilhelm60','fstiedemann@greenholt.com',NULL,2,1,'$2y$10$Qpl9xgI.UDBW13J1gpSeh.BBZz7mrsiGiKFOIqWOBzxYJGeB8mXVG','k8QoWPYprW29O2vtk11Vpuq5TKqz90zLnE3NROBKgX3yGhn9ps',NULL,1,1,'2019-07-22 14:29:13','2019-07-22 14:29:13'),(5,'Jarod','McKenzie','lesch.reilly','lucy.robel@yahoo.com',NULL,2,1,'$2y$10$bjLmtFUf1GdX3hfZ4IREeO0fsQvkdM0tn8N/R9m5RkIoHC.wfYsdu','RHwPBBk5VVq6n9J47ZKnUPoN46kAyIjQkewW9RJEyEp15rP5DS',NULL,1,1,'2019-07-22 14:29:13','2019-07-22 14:29:13'),(6,'Mazie','Lowe','elliott.bayer','yesenia.schultz@kiehn.com',NULL,2,1,'$2y$10$3jquIZzPazCETME7fMpzRO3Sbt5yEilvWBvDx.i4G8vzNb/RSlxFW','E3uOcs6q9u7hHx4DfedjUYDFgT0ZNwyU9IUwgYDTWDQfCBH7rs',NULL,1,1,'2019-07-22 14:29:13','2019-07-22 14:29:13'),(7,'Soledad','Roberts','xhickle','cronin.lenora@hotmail.com',NULL,2,1,'$2y$10$somIKHECTggb18zHLibi2uopdmV4zRJy8XT4pBRgqajZc6LJR779q','r1IfY2rKKSQ8mT8SzdzG765JAif6tk7KcSgc9Gs2h8DIW7xYUg',NULL,1,1,'2019-07-22 14:29:13','2019-07-22 14:29:13'),(8,'test','test','test','test@g.com','5245654556',2,1,'$2y$10$4H35uy9BKUmRIFCuqeovHuaCLuQWuwYBpQOuF4PBWBtoDUVJ5on5a','nkMA9BoZsO3ltuPJl8bPxSp2OEqTHgLoLV6ywJZ6pIdyxRm7Bo','dWibTG389QQ:APA91bEWfAGR-_C5scxlVI2qEDHhRItNMaD2d0BkztcTojBUom08dpkG6qY2MSDITO8ZJnsXvEi34y59ZbPtf8fW1LzSHPEK-XD4XdsZKFsS7cdgqoQ5fPcQ5LPBb0jt_xDq5X4r23u3',1,1,'2019-07-30 05:54:43','2019-08-27 11:17:16');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `violations`
--

DROP TABLE IF EXISTS `violations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `violations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL COMMENT '1=Demolition and removal Shop, 2=Closing Shop, 3=Pay fees',
  `financial_value` decimal(8,2) DEFAULT NULL,
  `user_id_created` bigint(20) unsigned NOT NULL,
  `user_id_modified` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `violations_name_unique` (`name`),
  KEY `violations_category_id_foreign` (`category_id`),
  KEY `violations_user_id_created_foreign` (`user_id_created`),
  KEY `violations_user_id_modified_foreign` (`user_id_modified`),
  CONSTRAINT `violations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `violations_user_id_created_foreign` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`),
  CONSTRAINT `violations_user_id_modified_foreign` FOREIGN KEY (`user_id_modified`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violations`
--

LOCK TABLES `violations` WRITE;
/*!40000 ALTER TABLE `violations` DISABLE KEYS */;
INSERT INTO `violations` VALUES (1,3,'انشاء مخبز في منطقة سكنية',3,50.50,1,1,'2019-07-22 14:30:06','2019-07-22 14:30:06'),(2,3,'فتح محل تسجيلات في منطقة سكنية',2,NULL,1,1,'2019-07-22 14:30:06','2019-07-22 14:30:06'),(3,2,'رمي انقاض او نفايات في غير المكان المخصص لها',1,NULL,1,1,'2019-07-22 14:30:06','2019-07-22 14:30:06');
/*!40000 ALTER TABLE `violations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `violations_monitoring`
--

DROP TABLE IF EXISTS `violations_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `violations_monitoring` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shop_data_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  `violation_id` bigint(20) unsigned NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_done` tinyint(1) NOT NULL DEFAULT '0',
  `user_id_created` bigint(20) unsigned NOT NULL,
  `user_id_modified` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `violations_monitoring_shop_data_id_foreign` (`shop_data_id`),
  KEY `violations_monitoring_category_id_foreign` (`category_id`),
  KEY `violations_monitoring_violation_id_foreign` (`violation_id`),
  KEY `violations_monitoring_user_id_created_foreign` (`user_id_created`),
  KEY `violations_monitoring_user_id_modified_foreign` (`user_id_modified`),
  CONSTRAINT `violations_monitoring_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `violations_monitoring_shop_data_id_foreign` FOREIGN KEY (`shop_data_id`) REFERENCES `shop_data` (`id`),
  CONSTRAINT `violations_monitoring_user_id_created_foreign` FOREIGN KEY (`user_id_created`) REFERENCES `users` (`id`),
  CONSTRAINT `violations_monitoring_user_id_modified_foreign` FOREIGN KEY (`user_id_modified`) REFERENCES `users` (`id`),
  CONSTRAINT `violations_monitoring_violation_id_foreign` FOREIGN KEY (`violation_id`) REFERENCES `violations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1568807860056 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `violations_monitoring`
--

LOCK TABLES `violations_monitoring` WRITE;
/*!40000 ALTER TABLE `violations_monitoring` DISABLE KEYS */;
INSERT INTO `violations_monitoring` VALUES (1568807860055,1568804762539,2,3,'لا توجد ملاحظات',0,3,3,'2019-09-18 09:55:13','2019-09-18 10:38:45');
/*!40000 ALTER TABLE `violations_monitoring` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-24 12:06:06
