-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `ID_autor` int NOT NULL AUTO_INCREMENT,
  `Nombre_autor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Gabriel García Márquez'),(2,'Isaac Asimov'),(3,'J.K. Rowling');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor_libro`
--

DROP TABLE IF EXISTS `autor_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor_libro` (
  `ID_autor` int NOT NULL,
  `ID_libro` int NOT NULL,
  PRIMARY KEY (`ID_autor`,`ID_libro`),
  KEY `ID_libro` (`ID_libro`),
  CONSTRAINT `autor_libro_ibfk_1` FOREIGN KEY (`ID_autor`) REFERENCES `autor` (`ID_autor`),
  CONSTRAINT `autor_libro_ibfk_2` FOREIGN KEY (`ID_libro`) REFERENCES `libro` (`ID_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor_libro`
--

LOCK TABLES `autor_libro` WRITE;
/*!40000 ALTER TABLE `autor_libro` DISABLE KEYS */;
INSERT INTO `autor_libro` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `autor_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase` (
  `ID_clase` int NOT NULL AUTO_INCREMENT,
  `Nombre_clase` varchar(100) DEFAULT NULL,
  `Tiempo_maximo_prestamo` int DEFAULT NULL,
  PRIMARY KEY (`ID_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (1,'Novela',30),(2,'Ciencia',20),(3,'Historia',15);
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `ID_editorial` int NOT NULL AUTO_INCREMENT,
  `Nombre_editorial` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorial`
--

LOCK TABLES `editorial` WRITE;
/*!40000 ALTER TABLE `editorial` DISABLE KEYS */;
INSERT INTO `editorial` VALUES (1,'Penguin Random House'),(2,'HarperCollins'),(3,'Planeta');
/*!40000 ALTER TABLE `editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libro`
--

DROP TABLE IF EXISTS `libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libro` (
  `ID_libro` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(200) DEFAULT NULL,
  `Numero_paginas` int DEFAULT NULL,
  `ID_clase` int DEFAULT NULL,
  `ID_editorial` int DEFAULT NULL,
  PRIMARY KEY (`ID_libro`),
  KEY `ID_clase` (`ID_clase`),
  KEY `ID_editorial` (`ID_editorial`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`ID_clase`) REFERENCES `clase` (`ID_clase`),
  CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`ID_editorial`) REFERENCES `editorial` (`ID_editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libro`
--

LOCK TABLES `libro` WRITE;
/*!40000 ALTER TABLE `libro` DISABLE KEYS */;
INSERT INTO `libro` VALUES (1,'Cien Años de Soledad',417,1,1),(2,'Fundación',255,2,2),(3,'Harry Potter y la Piedra Filosofal',309,1,3);
/*!40000 ALTER TABLE `libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo`
--

DROP TABLE IF EXISTS `prestamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo` (
  `ID_prestamo` int NOT NULL AUTO_INCREMENT,
  `ID_usuario` int DEFAULT NULL,
  `Fecha_inicio` date DEFAULT NULL,
  `Fecha_devolucion` date DEFAULT NULL,
  PRIMARY KEY (`ID_prestamo`),
  KEY `ID_usuario` (`ID_usuario`),
  CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo`
--

LOCK TABLES `prestamo` WRITE;
/*!40000 ALTER TABLE `prestamo` DISABLE KEYS */;
INSERT INTO `prestamo` VALUES (1,1,'2024-09-01','2024-09-30'),(2,2,'2024-09-05','2024-09-25'),(3,3,'2024-09-07','2024-09-22'),(4,1,'2024-09-01','2024-09-30'),(5,2,'2024-09-05','2024-09-25'),(6,3,'2024-09-07','2024-09-22');
/*!40000 ALTER TABLE `prestamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamo_libro`
--

DROP TABLE IF EXISTS `prestamo_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamo_libro` (
  `ID_prestamo` int NOT NULL,
  `ID_libro` int NOT NULL,
  PRIMARY KEY (`ID_prestamo`,`ID_libro`),
  KEY `ID_libro` (`ID_libro`),
  CONSTRAINT `prestamo_libro_ibfk_1` FOREIGN KEY (`ID_prestamo`) REFERENCES `prestamo` (`ID_prestamo`),
  CONSTRAINT `prestamo_libro_ibfk_2` FOREIGN KEY (`ID_libro`) REFERENCES `libro` (`ID_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamo_libro`
--

LOCK TABLES `prestamo_libro` WRITE;
/*!40000 ALTER TABLE `prestamo_libro` DISABLE KEYS */;
INSERT INTO `prestamo_libro` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `prestamo_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan Pérez','Calle Falsa 123'),(2,'María Gómez','Avenida Siempreviva 742'),(3,'Carlos Díaz','Boulevard de los Sueños 56');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-17 23:38:55
