-- MySQL dump 10.19  Distrib 10.3.28-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: UbicuaBD
-- ------------------------------------------------------
-- Server version	10.3.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico` (
  `id_planta` bigint(20) unsigned DEFAULT NULL,
  `humedad_aire` bigint(20) DEFAULT NULL,
  `humedad_tierra` bigint(20) DEFAULT NULL,
  `luz` bigint(20) DEFAULT NULL,
  `temperatura` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `id_planta` (`id_planta`),
  CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`id_planta`) REFERENCES `planta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invernadero`
--

DROP TABLE IF EXISTS `invernadero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invernadero` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invernadero`
--

LOCK TABLES `invernadero` WRITE;
/*!40000 ALTER TABLE `invernadero` DISABLE KEYS */;
INSERT INTO `invernadero` VALUES (4,'ALCALÁ DE HENARES','2021-12-25 16:26:40','2021-12-25 08:26:40'),(5,'BILBAO','2021-12-25 16:26:58','2021-12-25 08:26:58'),(6,'MADRID','2021-12-25 16:27:06','2021-12-25 08:27:06'),(7,'HUESCA','2021-12-25 16:27:13','2021-12-25 08:27:13'),(8,'JAÉN','2021-12-25 16:27:20','2021-12-25 08:27:20');
/*!40000 ALTER TABLE `invernadero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invernadero_usuario`
--

DROP TABLE IF EXISTS `invernadero_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invernadero_usuario` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_invernadero` bigint(20) unsigned NOT NULL,
  `id_usuario` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_invernadero` (`id_invernadero`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `invernadero_usuario_ibfk_1` FOREIGN KEY (`id_invernadero`) REFERENCES `invernadero` (`id`),
  CONSTRAINT `invernadero_usuario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invernadero_usuario`
--

LOCK TABLES `invernadero_usuario` WRITE;
/*!40000 ALTER TABLE `invernadero_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `invernadero_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planta`
--

DROP TABLE IF EXISTS `planta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_invernadero` bigint(20) unsigned DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_invernadero` (`id_invernadero`),
  KEY `tipo` (`tipo`),
  CONSTRAINT `planta_ibfk_1` FOREIGN KEY (`id_invernadero`) REFERENCES `invernadero` (`id`),
  CONSTRAINT `planta_ibfk_2` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planta`
--

LOCK TABLES `planta` WRITE;
/*!40000 ALTER TABLE `planta` DISABLE KEYS */;
/*!40000 ALTER TABLE `planta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `nombre` varchar(30) NOT NULL,
  `humedad_aire_min` bigint(20) DEFAULT NULL,
  `humedad_aire_max` bigint(20) DEFAULT NULL,
  `humedad_tierra_min` bigint(20) DEFAULT NULL,
  `humedad_tierra_max` bigint(20) DEFAULT NULL,
  `luz_min` bigint(20) DEFAULT NULL,
  `luz_max` bigint(20) DEFAULT NULL,
  `temperatura_min` bigint(20) DEFAULT NULL,
  `temperatura_max` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `observaciones` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES ('CLAVEL',40,60,60,70,25000,45000,10,21,'2021-12-25 18:46:19','2021-12-25 10:46:19','Puede soportar temperaturas de hasta -3º/-4ºC sin congelarse, pero no recomendado'),('CRISANTEMO',60,70,70,80,75000,95000,18,25,'2021-12-25 18:10:44','2021-12-25 10:26:22','Colocar mallas en los bordes del invernadero, eliminación de malas hierbas, más de 30 especies provenientes de Asia'),('MARGARITA',40,60,30,40,NULL,NULL,15,25,'2021-12-25 17:36:48','2021-12-25 10:25:22','Si se marchita -> falta agua, Si flores caen -> demasiado calor, Si capullo no abre -> falta luz'),('ROSA',50,60,70,75,95000,105000,17,25,'2021-12-25 18:24:32','2021-12-25 10:24:32','Diferentes niveles en vivero -> humedad = 98/100%');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `email` varchar(50) NOT NULL,
  `contraseña` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
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

-- Dump completed on 2021-12-27 17:10:40
