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
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8 ;
CREATE TABLE `grade` (
  `gradeId` int(11) NOT NULL AUTO_INCREMENT,
  `stuId` varchar(20) NOT NULL,
  `stuName` varchar(20) NOT NULL,
  `courseId` varchar(20) NOT NULL,
  `tcId` varchar(20) NOT NULL,
  `courseGrade` varchar(20) NOT NULL,
  `classId` varchar(20) NOT NULL,
  PRIMARY KEY (`gradeId`),
  KEY `course_id_fk` (`courseId`),
  KEY `stu_id_fk` (`stuId`),
  KEY `class_id_fk` (`classId`),
  KEY `tc_name_fk` (`tcId`),
  CONSTRAINT `class_id_fk` FOREIGN KEY (`classId`) REFERENCES `classes` (`classid`),
  CONSTRAINT `course_id_fk` FOREIGN KEY (`courseId`) REFERENCES `course` (`courseid`),
  CONSTRAINT `stu_id_fk` FOREIGN KEY (`stuId`) REFERENCES `student` (`stuid`),
  CONSTRAINT `tc_name_fk` FOREIGN KEY (`tcId`) REFERENCES `administrator` (`tcid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,'stu001','小红','course001','tc001','89','16CS'),(2,'stu001','小红','course002','tc002','85','16CS'),(3,'stu001','小红','course003','tc003','89','16CS'),(4,'stu001','小红','course004','tc004','80','16CS');
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-09 19:38:05
