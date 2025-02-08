-- MySQL dump 10.13  Distrib 9.2.0, for macos14.7 (arm64)
--
-- Host: localhost    Database: chapter_97
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `airline_ticket`
--

DROP TABLE IF EXISTS `airline_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airline_ticket` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `ticket_type` char(5) DEFAULT NULL,
  `departure_loc` varchar(20) DEFAULT NULL,
  `arrival_loc` varchar(20) DEFAULT NULL,
  `departure_at` datetime DEFAULT NULL,
  `return_at` datetime DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  CONSTRAINT `airline_ticket_chk_1` CHECK ((`ticket_type` in (_utf8mb4'편도',_utf8mb4'왕복')))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline_ticket`
--

LOCK TABLES `airline_ticket` WRITE;
/*!40000 ALTER TABLE `airline_ticket` DISABLE KEYS */;
INSERT INTO `airline_ticket` VALUES (1,'편도','서울','파리','2023-07-20 10:00:00',NULL,100000,120000),(2,'왕복','서울','런던','2023-08-15 15:30:00','2023-08-30 12:00:00',150000,280000),(3,'편도','서울','뉴욕','2023-09-10 08:45:00',NULL,120000,135000),(4,'왕복','서울','바르셀로나','2023-08-05 17:20:00','2023-08-20 19:10:00',180000,310000),(5,'편도','서울','도쿄','2023-09-25 22:00:00',NULL,90000,105000),(6,'왕복','서울','시드니','2023-08-12 09:40:00','2023-08-27 17:30:00',130000,250000),(7,'편도','서울','베니스','2023-09-15 13:15:00',NULL,110000,130000),(8,'왕복','서울','파리','2023-07-28 14:50:00','2023-08-12 10:30:00',200000,350000),(9,'편도','서울','시드니','2023-09-02 21:00:00',NULL,80000,95000),(10,'왕복','서울','로마','2023-08-19 11:10:00','2023-09-02 20:45:00',170000,290000),(11,'편도','서울','베를린','2023-07-15 16:30:00',NULL,95000,110000),(12,'왕복','서울','로스앤젤레스','2023-09-08 10:00:00','2023-09-22 14:20:00',190000,330000),(13,'편도','서울','파리','2023-08-22 18:00:00',NULL,105000,125000),(14,'왕복','서울','도쿄','2023-07-30 09:15:00','2023-08-14 14:50:00',140000,260000),(15,'편도','서울','시드니','2023-09-12 22:30:00',NULL,85000,100000),(16,'왕복','서울','바르셀로나','2023-08-25 12:20:00','2023-09-08 08:45:00',160000,270000),(17,'편도','서울','도쿄','2023-09-05 07:40:00',NULL,115000,140000),(18,'왕복','서울','런던','2023-08-01 13:40:00','2023-08-16 19:30:00',175000,300000),(19,'편도','서울','시드니','2023-07-18 19:00:00',NULL,90000,105000),(20,'왕복','서울','방콕','2023-09-18 16:00:00','2023-10-03 22:00:00',220000,390000),(21,'편도','서울','런던','2023-08-09 10:30:00',NULL,100000,120000);
/*!40000 ALTER TABLE `airline_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int DEFAULT NULL,
  `departure_at` datetime DEFAULT NULL,
  `arrival_at` datetime DEFAULT NULL,
  `departure_loc` varchar(50) DEFAULT NULL,
  `arrival_loc` varchar(50) DEFAULT NULL,
  `flight_price` double DEFAULT NULL,
  `charge` double DEFAULT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `airline_ticket` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,1,'2023-08-15 15:30:00','2023-08-30 12:00:00','서울','런던',140000,60000),(2,1,'2023-08-30 12:00:00','2023-08-15 15:30:00','런던','서울',140000,60000),(3,4,'2023-08-05 17:20:00','2023-08-20 19:10:00','서울','바르셀로나',150000,30000),(4,4,'2023-08-20 19:10:00','2023-08-05 17:20:00','바르셀로나','서울',150000,30000),(5,6,'2023-08-12 09:40:00','2023-08-27 17:30:00','서울','시드니',130000,65000),(6,6,'2023-08-27 17:30:00','2023-08-12 09:40:00','시드니','서울',130000,65000),(7,8,'2023-07-28 14:50:00','2023-08-12 10:30:00','서울','파리',175000,25000),(8,8,'2023-08-12 10:30:00','2023-07-28 14:50:00','파리','서울',175000,25000),(9,10,'2023-08-19 11:10:00','2023-09-02 20:45:00','서울','로마',155000,35000),(10,10,'2023-09-02 20:45:00','2023-08-19 11:10:00','로마','서울',155000,35000),(11,12,'2023-08-25 12:20:00','2023-09-08 08:45:00','서울','바르셀로나',140000,40000),(12,12,'2023-09-08 08:45:00','2023-08-25 12:20:00','바르셀로나','서울',140000,40000),(13,14,'2023-08-01 13:40:00','2023-08-16 19:30:00','서울','런던',187500,37500),(14,14,'2023-08-16 19:30:00','2023-08-01 13:40:00','런던','서울',187500,37500),(15,16,'2023-09-18 16:00:00','2023-10-03 22:00:00','서울','방콕',305000,85000),(16,16,'2023-10-03 22:00:00','2023-09-18 16:00:00','방콕','서울',305000,85000),(17,18,'2023-08-09 10:30:00','2023-08-24 16:20:00','서울','런던',120000,60000),(18,18,'2023-08-24 16:20:00','2023-08-09 10:30:00','런던','서울',120000,60000),(19,20,'2023-09-06 08:00:00','2023-09-21 14:50:00','서울','도쿄',127500,42500),(20,20,'2023-09-21 14:50:00','2023-09-06 08:00:00','도쿄','서울',127500,42500),(21,2,'2023-07-20 10:00:00',NULL,'서울','파리',100000,20000),(22,3,'2023-08-15 15:30:00',NULL,'서울','런던',150000,30000),(23,5,'2023-09-10 08:45:00',NULL,'서울','뉴욕',120000,24000),(24,7,'2023-08-05 17:20:00',NULL,'서울','바르셀로나',180000,36000),(25,9,'2023-09-25 22:00:00',NULL,'서울','도쿄',90000,18000),(26,11,'2023-08-12 09:40:00',NULL,'서울','시드니',130000,26000),(27,13,'2023-09-15 13:15:00',NULL,'서울','베니스',110000,22000),(28,15,'2023-08-22 18:00:00',NULL,'서울','파리',105000,21000),(29,17,'2023-09-02 21:00:00',NULL,'서울','시드니',80000,16000),(30,19,'2023-08-19 11:10:00',NULL,'서울','베를린',95000,19000),(31,21,'2023-09-08 10:00:00',NULL,'서울','로스앤젤레스',190000,38000);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `github_name` varchar(50) DEFAULT NULL,
  `major` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'test1234','tes1t@test.com','password123','홍길동','hong','컴퓨터공학');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `passenger_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `passport_num` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,1,'AB123456'),(2,2,'CD789012'),(3,3,'EF345678'),(4,4,'GH901234'),(5,5,'IJ567890'),(6,6,'KL234567'),(7,7,'MN890123'),(8,8,'OP456789'),(9,9,'QR012345'),(10,10,'ST678901'),(11,11,'UV234567'),(12,12,'WX890123'),(13,13,'YZ456789'),(14,14,'AB012345'),(15,15,'CD678901'),(16,16,'EF234567'),(17,17,'GH890123'),(18,18,'IJ456789'),(19,19,'KL012345'),(20,20,'MN678901');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `passenger_id` int DEFAULT NULL,
  `reservation_id` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `passenger_id` (`passenger_id`),
  KEY `reservation_id` (`reservation_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int NOT NULL AUTO_INCREMENT,
  `passenger_id` int DEFAULT NULL,
  `airline_ticket_id` int DEFAULT NULL,
  `reservation_status` varchar(10) DEFAULT NULL,
  `reserve_at` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `passenger_id` (`passenger_id`),
  KEY `airline_ticket_id` (`airline_ticket_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`airline_ticket_id`) REFERENCES `airline_ticket` (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,1,'확정','2023-07-17 09:00:00'),(2,2,2,'확정','2023-07-18 10:30:00'),(3,3,3,'확정','2023-07-19 14:15:00'),(4,4,4,'확정','2023-07-20 15:30:00'),(5,5,5,'확정','2023-07-21 18:45:00'),(6,6,6,'대기','2023-07-22 11:00:00'),(7,7,7,'대기','2023-07-23 12:30:00'),(8,8,8,'대기','2023-07-24 16:00:00'),(9,9,9,'대기','2023-07-25 10:00:00'),(10,10,10,'대기','2023-07-26 14:45:00'),(11,2,2,'대기','2025-02-07 00:00:00');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `like_travel_place` varchar(30) DEFAULT NULL,
  `phone_num` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'홍길동','파리','+82 10-1234-5678'),(2,'김영희','런던','+82 10-9876-5432'),(3,'이철수','뉴욕','+82 2-1111-2222'),(4,'박영미','바르셀로나','+82 2-5555-5555'),(5,'정재영','도쿄','+82 51-1234-5678'),(6,'이수진','시드니','+82 51-8765-4321'),(7,'김동현','베니스','+82 2-1111-1111'),(8,'최민지','런던','+82 2-2222-2222'),(9,'오영호','파리','+82 10-1234-5678'),(10,'윤지우','시드니','+82 10-9876-5432'),(11,'박서준','도쿄','+82 2-1111-2222'),(12,'강민지','로마','+82 2-5555-5555'),(13,'한민수','베를린','+82 51-1234-5678'),(14,'조현아','바르셀로나','+82 51-8765-4321'),(15,'송진우','방콕','+82 10-1111-2222'),(16,'임예진','시드니','+82 10-9876-5432'),(17,'장영준','도쿄','+82 2-1111-2222'),(18,'신지민','로스앤젤레스','+82 2-5555-5555'),(19,'임도현','런던','+82 51-1234-5678'),(20,'김서연','파리','+82 51-8765-4321');
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

-- Dump completed on 2025-02-07 19:05:16
