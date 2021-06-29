CREATE DATABASE  IF NOT EXISTS `recipe_sharing` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `recipe_sharing`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: recipe_sharing
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `Rating_Id` int NOT NULL,
  `User_Id` int NOT NULL,
  `Recipe_id` int NOT NULL,
  `rating` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Rating_Id`),
  KEY `User_Id` (`User_Id`),
  KEY `Recipe_id` (`Recipe_id`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`Recipe_id`) REFERENCES `recipe` (`Recipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `Recipe_id` int NOT NULL AUTO_INCREMENT,
  `Recipe_Name` varchar(495) NOT NULL,
  `Recipe_Ingredients` varchar(495) NOT NULL,
  `Recipe_description` varchar(495) NOT NULL,
  `User_Id` int NOT NULL,
  PRIMARY KEY (`Recipe_id`),
  KEY `User_Id` (`User_Id`),
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'Maggie','Maggie, Water, powder','Add water add maggie powder and noodles and boil it',1),(2,'lemon juice','lemon,water, salt, sugar','Mix lemon juice,sugar,salt in water',1),(23,'sandwich','bread,meat,vegetables','add meat and vegetables and cheese roast it ',1),(90,'tamarind Rice','Rice,tamarind,peanuts,cashews','Add tamarind in cooked rice and mix cashews and peanuts ',1),(92,'burger','add chese and meat to the bread and toast','bread, chese, meat',1);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_calorie`
--

DROP TABLE IF EXISTS `recipe_calorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_calorie` (
  `Recipe_calorie_Id` int NOT NULL,
  `Number_of_Calories` float DEFAULT NULL,
  `Fat_Content` float DEFAULT NULL,
  `Protein` float DEFAULT NULL,
  `Recipe_id` int DEFAULT NULL,
  PRIMARY KEY (`Recipe_calorie_Id`),
  KEY `Recipe_id` (`Recipe_id`),
  CONSTRAINT `recipe_calorie_ibfk_1` FOREIGN KEY (`Recipe_id`) REFERENCES `recipe` (`Recipe_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_calorie`
--

LOCK TABLES `recipe_calorie` WRITE;
/*!40000 ALTER TABLE `recipe_calorie` DISABLE KEYS */;
INSERT INTO `recipe_calorie` VALUES (1,124,2,1,2),(29,123,2,1,92),(72,12,2,3,23),(90,124,2,2,90);
/*!40000 ALTER TABLE `recipe_calorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `Role_Id` int NOT NULL,
  `User_Id` int NOT NULL,
  PRIMARY KEY (`Role_Id`),
  KEY `User_Id` (`User_Id`),
  CONSTRAINT `role_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `users` (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (74,41),(513,350);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_Id` int NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Phone_Number` bigint NOT NULL,
  `Email_Id` varchar(65) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`User_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rama Krishna','Pendurthi',2162358415,'r.pendurthi@vikes.csuohio.edu','1234'),(41,'mouli','cheka',9989865554,'cheka@gmail.com','1234'),(64,'Rama Krishna','Pendurthi',2162358415,'r.pendurthii@vikes.csuohio.edu','1234'),(350,'sanath','peela',800821414,'peela@gmail.com','1234');
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

-- Dump completed on 2021-06-26 18:35:44
