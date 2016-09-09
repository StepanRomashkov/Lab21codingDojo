CREATE DATABASE  IF NOT EXISTS `students` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `students`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: students
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `streetAdress` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `zip` int(11) DEFAULT NULL,
  `contactPhone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `bootcamp_id` int(11) NOT NULL,
  `birthDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bootcamp_id_idx` (`bootcamp_id`),
  KEY `state_id_idx` (`state_id`),
  CONSTRAINT `bootcamp_id` FOREIGN KEY (`bootcamp_id`) REFERENCES `bootcamp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `state_id` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Stepan','Romashkov','29510 Elmwood ave.','Garden City',22,48135,'248-707-6519','akumajo27@gmail.com',1,'1979-12-12'),(2,'Garry','Parker','34567 Flint st.','Detroit',22,32871,'984-654-6544','garryparker@hotmail.com',2,'1998-08-05'),(6,'rewad','wergh','werty','qwert',23,23456,'2246547','sdv@wreg.ery',1,'1991-06-05'),(7,'WevWV','wEVWV','WVRSV','verbverb',13,24356,'2345678','wec@poj.wv',1,'1980-02-13'),(9,'hdz','p\'k;l','eszxd','3weazdf',10,98765,'875643656','rzrez@ytdc.oiy',1,'2016-09-13'),(15,'5trd','i8utu','i8tkuyf','iuyfjyutfjyt',17,676,'098765','trdsfx@uted.tes',1,'2016-10-02'),(16,'utrx','utrx','rdexyrex','rxyrex',4,34567,'324567890','redx@tezx.oiu',2,'2000-02-02'),(18,'qedcx','trx','trxtrx','trxtx',41,22345,'1235','asxa@rfverv.efc',1,'1994-06-14'),(23,'wefq','wec','qwedqwepok','qwret',23,54367,'1242357778','wqed@ert.we',1,'2012-07-19'),(24,'wecd','qwxxqqwxqw','pokpom','utres',7,34567,'456789009','wed@wfrev.erv',1,'1974-01-14'),(25,'John','Dow','404 Nowhere ave','Springfield',3,53257,'404-234-3467','johndow@nonet.com',1,'1999-04-04'),(26,'Sam','Fargo','25346 Shell st','New York',32,86553,'245-235-2345','sam@isam.net',4,'1997-07-15'),(34,'wevoki','utrd','edxyuxcu','trxutrx',7,23457,'359764754','yrdz@oi.iu',1,'1980-07-08');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-09  2:55:47
