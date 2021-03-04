-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: grademanage
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `identity` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (14,'tc001','123456','admin'),(15,'tc001','123456','admin'),(16,'tc001','123456','admin'),(17,'tc001','123456','admin'),(18,'tc001','123456','admin'),(19,'stu001','123456','student'),(20,'stu001','123456','student'),(21,'tc001','123456','admin'),(22,'stu001','123456','student'),(23,'stu001','123456','student'),(24,'stu001','123456','student'),(25,'stu001','123456','student'),(26,'tc001','123456','admin'),(27,'stu001','123456','student'),(28,'tc001','123456','admin'),(29,'tc001','123456','admin'),(30,'tc001','123456','admin'),(31,'tc001','123456','admin'),(32,'tc001','123456','admin'),(33,'tc001','123456','admin'),(34,'tc001','123456','admin'),(35,'stu001','123456','student'),(36,'stu001','123456','student'),(37,'tc001','123456','admin'),(38,'stu001','123456','student'),(39,'tc001','123456','admin'),(40,'stu001','123456','student'),(41,'tc001','123456','admin'),(42,'tc001','123456','admin'),(43,'tc001','123456','admin'),(44,'tc001','123456','admin'),(45,'tc001','123456','admin'),(46,'tc001','123456','admin'),(47,'tc001','123456','admin'),(48,'tc001','123456','admin'),(49,'tc001','123456','admin'),(50,'stu001','123456','student'),(51,'tc001','123456','admin'),(52,'tc001','123456','admin'),(53,'tc001','123456','admin'),(54,'tc001','123456','admin'),(55,'tc001','123456','admin'),(56,'tc001','123456','admin'),(57,'tc001','123456','admin'),(58,'tc001','123456','admin'),(59,'stu001','123456','student'),(60,'stu001','123456','student'),(61,'stu001','123456','student'),(62,'stu001','123456','student'),(63,'stu001','123456','student'),(64,'tc001','123456','admin'),(65,'stu001','123456','student'),(66,'tc001','123456','admin'),(67,'stu001','123456','student'),(68,'stu001','123456','student'),(69,'stu001','123456','student'),(70,'stu001','123456','student'),(71,'tc001','123456','admin'),(72,'stu001','123456','student'),(73,'stu001','123456','student'),(74,'tc001','123456','admin'),(75,'tc001','123456','admin'),(76,'stu001','123456','student'),(77,'stu001','123456','student'),(78,'stu001','123456','student'),(79,'tc001','123456','admin'),(80,'stu001','123456','student'),(81,'stu001','123456','student'),(82,'stu001','123456','student'),(83,'tc001','123456','admin'),(84,'tc001','123456','admin'),(85,'stu001','123456','student'),(86,'tc001','123456','admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-09 19:38:04
