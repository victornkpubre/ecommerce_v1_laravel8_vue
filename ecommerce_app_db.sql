-- MySQL dump 10.13  Distrib 5.7.33, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_app
-- ------------------------------------------------------
-- Server version	5.7.33

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
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2019_12_14_000001_create_personal_access_tokens_table',1),(5,'2022_04_02_204740_create_products_table',1),(6,'2022_04_02_205851_create_carts_table',1),(7,'2022_04_06_225311_create_processings_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('victornkpubre@gmail.com','$2y$10$68sH4A76qJDCiYfqmuLevecIOQh90sL4ChPEaOYs8gs4ruUI87FYe','2022-05-31 19:48:19');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processings`
--

DROP TABLE IF EXISTS `processings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processings`
--

LOCK TABLES `processings` WRITE;
/*!40000 ALTER TABLE `processings` DISABLE KEYS */;
/*!40000 ALTER TABLE `processings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Veniam unde quam id.','veniam-unde-quam-id','Cumque enim earum temporibus. Maiores autem aut voluptate aliquid.','https://via.placeholder.com/140x250.png/00ddff?text=sunt','628','578','2022-04-24 22:21:06','2022-04-24 22:21:06'),(2,'Fugit nobis ut expedita.','fugit-nobis-ut-expedita','Quaerat quidem eos temporibus. Amet deleniti voluptas consequatur aut qui nesciunt.','https://via.placeholder.com/140x250.png/0077ff?text=non','501','451','2022-04-24 22:21:06','2022-04-24 22:21:06'),(3,'Ipsa sit veniam et sunt.','ipsa-sit-veniam-et-sunt','Non ut repudiandae minima. Deserunt aut est dolores in incidunt voluptate.','https://via.placeholder.com/140x250.png/003300?text=sed','380','330','2022-04-24 22:21:06','2022-04-24 22:21:06'),(4,'Sed ut rerum at quas.','sed-ut-rerum-at-quas','Nisi iste quia sunt dolorem. Fuga et facilis enim alias id. Ea dicta qui aliquam perspiciatis.','https://via.placeholder.com/140x250.png/00ee99?text=rerum','480','430','2022-04-24 22:21:06','2022-04-24 22:21:06'),(5,'Et iure unde qui et.','et-iure-unde-qui-et','Sapiente facere similique possimus autem. Qui ut quo quas ut aspernatur.','https://via.placeholder.com/140x250.png/00ff55?text=velit','654','604','2022-04-24 22:21:06','2022-04-24 22:21:06'),(6,'Et ut et qui.','et-ut-et-qui','Sed excepturi ut voluptatum sit est porro. Hic eum eius numquam quasi. Praesentium aut qui magnam.','https://via.placeholder.com/140x250.png/005511?text=ipsa','773','723','2022-04-24 22:21:06','2022-04-24 22:21:06'),(7,'A dolor cumque in.','a-dolor-cumque-in','Unde rerum laboriosam sed non. Aspernatur commodi animi praesentium nihil odio nobis.','https://via.placeholder.com/140x250.png/00ccbb?text=excepturi','900','850','2022-04-24 22:21:06','2022-04-24 22:21:06'),(8,'Et quia et ab.','et-quia-et-ab','Nisi officiis voluptatem fugit. Qui tenetur sed eos voluptatum in ratione.','https://via.placeholder.com/140x250.png/000055?text=facere','828','778','2022-04-24 22:21:06','2022-04-24 22:21:06'),(9,'Id quaerat in nesciunt.','id-quaerat-in-nesciunt','Reiciendis autem magnam illum. Vel enim accusamus labore. Minus eum recusandae doloribus libero.','https://via.placeholder.com/140x250.png/00cc66?text=quia','802','752','2022-04-24 22:21:06','2022-04-24 22:21:06'),(10,'Sit totam et et non.','sit-totam-et-et-non','Facere voluptas vel voluptatem ducimus quaerat. Iusto sed necessitatibus sunt magnam qui totam.','https://via.placeholder.com/140x250.png/0044bb?text=impedit','327','277','2022-04-24 22:21:06','2022-04-24 22:21:06'),(11,'Eum dicta quis sit aut.','eum-dicta-quis-sit-aut','Quaerat ipsa magni libero esse illo nesciunt atque et. Ut repellat ut aut tenetur.','https://via.placeholder.com/140x250.png/0011cc?text=nemo','188','138','2022-04-24 22:21:07','2022-04-24 22:21:07'),(12,'Qui autem a quaerat.','qui-autem-a-quaerat','Est eum eum sint porro. Dolores est quod consequatur. Quo eum quia nemo nihil.','https://via.placeholder.com/140x250.png/00ddcc?text=soluta','873','823','2022-04-24 22:21:07','2022-04-24 22:21:07'),(13,'Eaque aliquid aut quae.','eaque-aliquid-aut-quae','Recusandae accusantium vero sapiente impedit. Aliquam amet voluptatem blanditiis animi.','https://via.placeholder.com/140x250.png/0044bb?text=et','219','169','2022-04-24 22:21:07','2022-04-24 22:21:07'),(14,'Molestiae ut ad esse.','molestiae-ut-ad-esse','Sapiente voluptates alias quas consectetur ducimus perspiciatis. Dolore et optio quidem.','https://via.placeholder.com/140x250.png/009966?text=placeat','148','98','2022-04-24 22:21:07','2022-04-24 22:21:07'),(15,'Et pariatur ut harum.','et-pariatur-ut-harum','Vero vitae excepturi quam beatae quidem vel inventore. Ex maxime ullam sapiente facere tempore.','https://via.placeholder.com/140x250.png/00dd99?text=dicta','175','125','2022-04-24 22:21:07','2022-04-24 22:21:07'),(16,'Et vero quis ea qui.','et-vero-quis-ea-qui','Dignissimos explicabo at blanditiis animi nihil quos. Dicta et aspernatur doloremque.','https://via.placeholder.com/140x250.png/0099ff?text=provident','686','636','2022-04-24 22:21:07','2022-04-24 22:21:07'),(17,'Et illum dolores ab ut.','et-illum-dolores-ab-ut','Velit sed corrupti est et iusto possimus. Temporibus sit temporibus saepe. Rerum enim sit quidem.','https://via.placeholder.com/140x250.png/00bb99?text=ut','383','333','2022-04-24 22:21:07','2022-04-24 22:21:07'),(18,'Amet qui et eum.','amet-qui-et-eum','Sunt ea unde ea itaque id sit. Adipisci possimus id molestiae dolores magnam error.','https://via.placeholder.com/140x250.png/009900?text=et','236','186','2022-04-24 22:21:07','2022-04-24 22:21:07'),(19,'Beatae quia aut ab quos.','beatae-quia-aut-ab-quos','Nihil quia iusto labore eaque exercitationem. Libero similique rerum temporibus rerum blanditiis.','https://via.placeholder.com/140x250.png/001199?text=quis','451','401','2022-04-24 22:21:07','2022-04-24 22:21:07'),(20,'Et omnis non sit.','et-omnis-non-sit','Delectus nemo at sint enim dolorum cupiditate. Quos quibusdam maiores omnis libero non.','https://via.placeholder.com/140x250.png/002211?text=magnam','160','110','2022-04-24 22:21:07','2022-04-24 22:21:07'),(21,'Atque cumque odit quos.','atque-cumque-odit-quos','Adipisci atque dolores illum. Ab dignissimos consequatur molestiae sit facere.','https://via.placeholder.com/140x250.png/00ddff?text=id','183','133','2022-04-24 22:21:07','2022-04-24 22:21:07'),(22,'Rerum est aut non et.','rerum-est-aut-non-et','Est culpa consectetur ab. Aut similique ex incidunt recusandae debitis non.','https://via.placeholder.com/140x250.png/0011ee?text=dignissimos','777','727','2022-04-24 22:21:07','2022-04-24 22:21:07'),(23,'Et unde vel quaerat.','et-unde-vel-quaerat','Quas omnis quasi possimus mollitia. In velit reiciendis nam ad aut.','https://via.placeholder.com/140x250.png/004499?text=sed','781','731','2022-04-24 22:21:07','2022-04-24 22:21:07'),(24,'Sequi ea illum beatae.','sequi-ea-illum-beatae','Ducimus pariatur quod in aut. Delectus qui sit et cumque. Vitae et minima ad tempore.','https://via.placeholder.com/140x250.png/00bbff?text=id','547','497','2022-04-24 22:21:07','2022-04-24 22:21:07'),(25,'Est a ea ducimus.','est-a-ea-ducimus','Voluptatem saepe error voluptatum earum. Est aut eos hic voluptas quo. Saepe a velit possimus enim.','https://via.placeholder.com/140x250.png/00cc66?text=eos','764','714','2022-04-24 22:21:07','2022-04-24 22:21:07');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'victor','victornkpubre@gmail.com','2022-05-31 19:30:36','$2y$10$RJ8cNyixpaCybWEG82rB5.MjC4a/IwrltjQGRUuL0FMusecY6shca',NULL,'2022-05-31 19:04:32','2022-05-31 19:30:36');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-01  9:18:31
