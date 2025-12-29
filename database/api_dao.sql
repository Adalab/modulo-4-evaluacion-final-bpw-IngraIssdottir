CREATE DATABASE  IF NOT EXISTS `api_dao` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `api_dao`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: api_dao
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `characters`
--

DROP TABLE IF EXISTS `characters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `characters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int DEFAULT NULL,
  `description` text,
  `background` text,
  `skills` text,
  `relationship` varchar(150) DEFAULT NULL,
  `occupation_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_characters_occupations` (`occupation_id`),
  CONSTRAINT `fk_characters_occupations` FOREIGN KEY (`occupation_id`) REFERENCES `occupations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characters`
--

LOCK TABLES `characters` WRITE;
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT INTO `characters` VALUES (1,'Alistair',32,'A stern-looking young man with a strong chin. Very handsome.','Bastard son of the king, raised in the Chantry and later recruited by the Grey Wardens.','Trained warrior, capable of dispelling magic.','Companion',1),(2,'Morrigan',30,'A dark and pragmatic witch with little regard for conventional morality.','Raised in the Korcari Wilds by her mother Flemeth, isolated from society.','Powerful magic, wilderness survival.','Party member',9),(3,'Wynne',55,'A wise and compassionate mage, respected mentor within the Circle.','Taken to the Circle at a young age, later bonded with a Spirit of Faith.','Healing magic, spiritual abilities.','Mentor',3),(4,'Oghren',35,'A foul-mouthed dwarven warrior with a tragic past.','Once a respected warrior of Orzammar, later disgraced after his wife disappeared showed obsession with the Deep Roads.','Heavy combat, endurance.','Party member',4),(5,'Zevran Arainai',24,'A charming and dangerous assassin with a playful demeanor.','Sold into slavery and trained by the Antivan Crows.','Stealth, agility, poisons.','Companion',5),(6,'Leliana',26,'A cheerful and spiritual bard with a mysterious past.','Former Orlesian bard and spy who sought refuge in the Chantry.','Singing, diplomacy, archery.','Party member',6),(7,'Teyrn Loghain mac Tir',50,'A war hero turned regent, willing to sacrifice anything to save Ferelden.','Farmer turned general and close ally of King Maric.','Strategy, leadership, combat.','Antagonist',7),(8,'Dog',3,'A loyal and intelligent mabari war dog.','Ferelden Mabari, raised to serve and protect.','Tracking, combat assistance.','Loyal companion',8);
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occupations`
--

DROP TABLE IF EXISTS `occupations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `occupations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occupations`
--

LOCK TABLES `occupations` WRITE;
/*!40000 ALTER TABLE `occupations` DISABLE KEYS */;
INSERT INTO `occupations` VALUES (5,'Assassin'),(6,'Bard'),(3,'Circle Mage'),(1,'Grey Warden'),(7,'Regent'),(8,'Wardog'),(4,'Warrior'),(9,'Witch');
/*!40000 ALTER TABLE `occupations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-29 13:12:26
