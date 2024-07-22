-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: 336proj
-- ------------------------------------------------------
-- Server version	8.0.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `SSN` int NOT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`SSN`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `AnswerID` int NOT NULL AUTO_INCREMENT,
  `QuestionID` int DEFAULT NULL,
  `SSN` int DEFAULT NULL,
  `AnswerText` text NOT NULL,
  `PostDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`AnswerID`),
  KEY `QuestionID` (`QuestionID`),
  KEY `SSN` (`SSN`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `questions` (`QuestionID`),
  CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`SSN`) REFERENCES `servicerep` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `Disabled` tinyint(1) DEFAULT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'asdf','asdf','asdf','asdf','2024-07-21',0,'asdf');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `QuestionID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `Title` varchar(255) NOT NULL,
  `QuestionText` text NOT NULL,
  `PostDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`QuestionID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `ReservationNumber` int NOT NULL AUTO_INCREMENT,
  `ReservationDate` date DEFAULT NULL,
  `MadeDate` date DEFAULT NULL,
  `Passenger` int DEFAULT NULL,
  `TotalFare` decimal(5,2) DEFAULT NULL,
  `Type` enum('ONE_WAY','ROUND_TRIP') DEFAULT NULL,
  `Origin` int DEFAULT NULL,
  `Destination` int DEFAULT NULL,
  `TransitLineName` varchar(255) DEFAULT NULL,
  `TrainID` int DEFAULT NULL,
  `DepartureTime` datetime DEFAULT NULL,
  `ArrivalTime` datetime DEFAULT NULL,
  `ReturnDepartureTime` datetime DEFAULT NULL,
  `ReturnArrivalTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ReservationNumber`),
  KEY `Passenger` (`Passenger`),
  KEY `Origin` (`Origin`),
  KEY `Destination` (`Destination`),
  KEY `TrainID` (`TrainID`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`Passenger`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`Origin`) REFERENCES `station` (`StationID`),
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`Destination`) REFERENCES `station` (`StationID`),
  CONSTRAINT `reservation_ibfk_4` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicerep`
--

DROP TABLE IF EXISTS `servicerep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicerep` (
  `SSN` int NOT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`SSN`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicerep`
--

LOCK TABLES `servicerep` WRITE;
/*!40000 ALTER TABLE `servicerep` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicerep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `StationID` int NOT NULL AUTO_INCREMENT,
  `StationName` varchar(255) DEFAULT NULL,
  `CityName` varchar(255) DEFAULT NULL,
  `StateName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`StationID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'Trenton','Trenton','New Jersey'),(2,'Metropark','Edison','New Jersey'),(3,'New York Penn','New York','New York'),(4,'Rahway','Rahway','New Jersey'),(5,'Newark Penn','Newark','New Jersey');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `TrainID` int NOT NULL,
  PRIMARY KEY (`TrainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (0),(1),(2);
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainschedule`
--

DROP TABLE IF EXISTS `trainschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainschedule` (
  `TransitLineName` varchar(255) DEFAULT NULL,
  `TrainID` int DEFAULT NULL,
  `Origin` int DEFAULT NULL,
  `Destination` int DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  `ArrivalTime` time DEFAULT NULL,
  `Fare` decimal(5,2) DEFAULT NULL,
  `trainschedulecol` varchar(45) DEFAULT NULL,
  `Uid` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Uid`),
  KEY `TrainID` (`TrainID`),
  KEY `Origin` (`Origin`),
  KEY `Destination` (`Destination`),
  CONSTRAINT `trainschedule_ibfk_1` FOREIGN KEY (`TrainID`) REFERENCES `train` (`TrainID`),
  CONSTRAINT `trainschedule_ibfk_2` FOREIGN KEY (`Origin`) REFERENCES `station` (`StationID`),
  CONSTRAINT `trainschedule_ibfk_3` FOREIGN KEY (`Destination`) REFERENCES `station` (`StationID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainschedule`
--

LOCK TABLES `trainschedule` WRITE;
/*!40000 ALTER TABLE `trainschedule` DISABLE KEYS */;
INSERT INTO `trainschedule` VALUES ('Northeast Corridor Daily AM',0,1,3,'08:00:00','10:00:00',20.00,'1,2,3,4,5,6,7',1);
/*!40000 ALTER TABLE `trainschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainstops`
--

DROP TABLE IF EXISTS `trainstops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainstops` (
  `StopID` int NOT NULL AUTO_INCREMENT,
  `TrainID` int DEFAULT NULL,
  `StationID` int DEFAULT NULL,
  `ArrivalTime` time DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  `SchedID` int DEFAULT NULL,
  PRIMARY KEY (`StopID`),
  KEY `TrainID` (`TrainID`),
  KEY `StationID` (`StationID`),
  KEY `trainstops_ibfk_3_idx` (`SchedID`),
  CONSTRAINT `trainstops_ibfk_1` FOREIGN KEY (`TrainID`) REFERENCES `trainschedule` (`TrainID`),
  CONSTRAINT `trainstops_ibfk_2` FOREIGN KEY (`StationID`) REFERENCES `station` (`StationID`),
  CONSTRAINT `trainstops_ibfk_3` FOREIGN KEY (`SchedID`) REFERENCES `trainschedule` (`Uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainstops`
--

LOCK TABLES `trainstops` WRITE;
/*!40000 ALTER TABLE `trainstops` DISABLE KEYS */;
INSERT INTO `trainstops` VALUES (1,0,2,'09:00:00','09:05:00',1),(2,0,4,'09:30:00','09:35:00',1),(3,0,5,'09:50:00','09:55:00',1);
/*!40000 ALTER TABLE `trainstops` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-21 23:15:50
