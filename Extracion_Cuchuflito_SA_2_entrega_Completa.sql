CREATE DATABASE  IF NOT EXISTS `cuchuflito_sa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cuchuflito_sa`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: cuchuflito_sa
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `ID_Cliente` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `Documento` varchar(45) NOT NULL,
  PRIMARY KEY (`ID_Cliente`),
  UNIQUE KEY `ID_Cliente_UNIQUE` (`ID_Cliente`),
  UNIQUE KEY `Documento_UNIQUE` (`Documento`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Comprador','Eventual','S/D','S/D','S/D','S/D'),(2,'Mariana','Alvarez','Paraguay 123','1151112222','Mar@hotmail.com','25000002'),(3,'Flavia N','Stein','Av Santa Fe 2423','1153853651','Fla@connect.com','23000001'),(4,'Santiago','Gutierrez','Av. Cordoba 2344','1151112222','San@gmail.com','25000001'),(5,'Rodrigo','Lucerna','Azquenaga 2253','1145685642','peridiu@gom.com','26995452'),(6,'Romina','Benitez','Gasco 524','1136985521','romi@landa.com','32654252'),(7,'Luciano','Periodo','Azquenaga 1882','1156982571','luch@gmail.com','24568452'),(8,'Paula','Gutierrez','Av. Pueyredon 1235','1135245879','pachi@gmail.com','25521894'),(9,'Pedro','Gonzalez','Arenales 1433','1159325563','pedro@ola.com','23654816'),(10,'Laura','Molina','Arenales 1965','1135623981','lala@hotmail.com','25631587'),(11,'Francisco','Molinari','Av. Cordoba 5624','1128756851','franchute@gmail.com','26254941');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `ID_Compras` int NOT NULL AUTO_INCREMENT,
  `ID_Proveedor` int NOT NULL,
  `Fecha` date NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `Comprador` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_Compras`),
  UNIQUE KEY `ID_Compras_UNIQUE` (`ID_Compras`),
  KEY `FK_ID_Proveedor_idx` (`ID_Proveedor`),
  KEY `FK_Comprador_idx` (`Comprador`),
  CONSTRAINT `FK_Comprador` FOREIGN KEY (`Comprador`) REFERENCES `empleados` (`Legajo`),
  CONSTRAINT `FK_ID_Proveedor` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedores` (`ID_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (2,1,'2025-08-01',1378750,2),(3,2,'2025-08-01',256000,2),(4,3,'2025-08-01',63500,4),(5,4,'2025-08-01',245120,2),(6,5,'2025-08-01',421700,2),(7,6,'2025-08-01',867200,2),(8,7,'2025-08-01',1711600,2),(9,8,'2025-08-01',1054300,4),(10,9,'2025-08-01',160710,2),(11,10,'2025-08-01',99320,4),(12,12,'2025-08-01',1521850,2),(13,13,'2025-08-01',495600,4),(14,14,'2025-08-01',339990,4);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_productos`
--

DROP TABLE IF EXISTS `compras_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_productos` (
  `ID_Compras` int NOT NULL,
  `ID_Producto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio_Unitario` decimal(10,0) NOT NULL,
  KEY `FK_ID_Compras_idx` (`ID_Compras`),
  KEY `FK_ID_Producto_idx` (`ID_Producto`),
  CONSTRAINT `FK_ID_Compras` FOREIGN KEY (`ID_Compras`) REFERENCES `compras` (`ID_Compras`),
  CONSTRAINT `FK_ID_Producto` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_productos`
--

LOCK TABLES `compras_productos` WRITE;
/*!40000 ALTER TABLE `compras_productos` DISABLE KEYS */;
INSERT INTO `compras_productos` VALUES (2,1,200,1599),(2,2,300,999),(2,3,200,799),(2,4,250,599),(2,5,150,1999),(2,6,150,999),(3,22,80,750),(3,23,80,550),(3,24,80,750),(3,25,80,600),(3,26,80,550),(2,1,200,1599),(2,2,300,999),(2,3,200,799),(2,4,250,599),(2,5,150,1999),(2,6,150,999),(3,22,80,750),(3,23,80,550),(3,24,80,750),(3,25,80,600),(3,26,80,550),(4,27,20,750),(4,28,20,550),(4,29,20,750),(4,30,10,600),(4,31,30,550),(5,12,100,499),(5,16,50,599),(5,21,30,649),(5,32,20,750),(5,33,20,550),(5,34,20,750),(5,35,15,600),(5,36,10,550),(5,52,700,129),(6,50,600,599),(6,54,700,89),(7,37,400,749),(7,38,400,720),(7,39,400,699),(8,7,200,999),(8,8,200,899),(8,9,200,649),(8,13,120,699),(8,17,120,1199),(8,18,100,899),(8,43,300,1499),(8,44,300,749),(8,45,300,699),(9,40,300,299),(9,41,300,279),(9,42,300,259),(9,49,600,659),(9,51,500,663),(9,53,700,109),(10,10,150,499),(10,14,100,599),(10,19,40,649),(11,11,100,499),(11,15,50,599),(11,20,30,649),(12,46,300,349),(12,47,300,319),(12,48,300,269),(12,58,650,153),(12,59,650,185),(12,60,650,129),(12,64,600,350),(12,65,600,230),(12,66,600,440),(12,67,600,542),(13,55,800,75),(13,56,800,60),(13,57,700,108),(13,61,800,114),(13,62,800,95),(13,63,800,181),(14,68,50,1800),(14,69,50,2700),(14,70,50,1700),(14,71,50,2999),(2,1,200,1599),(2,2,300,999),(2,3,200,799),(2,4,250,599),(2,5,150,1999),(2,6,150,999),(3,22,80,750),(3,23,80,550),(3,24,80,750),(3,25,80,600),(3,26,80,550),(4,27,20,750),(4,28,20,550),(4,29,20,750),(4,30,10,600),(4,31,30,550),(5,12,100,499),(5,16,50,599),(5,21,30,649),(5,32,20,750),(5,33,20,550),(5,34,20,750),(5,35,15,600),(5,36,10,550),(5,52,700,129),(6,50,600,599),(6,54,700,89),(7,37,400,749),(7,38,400,720),(7,39,400,699),(8,7,200,999),(8,8,200,899),(8,9,200,649),(8,13,120,699),(8,17,120,1199),(8,18,100,899),(8,43,300,1499),(8,44,300,749),(8,45,300,699),(9,40,300,299),(9,41,300,279),(9,42,300,259),(9,49,600,659),(9,51,500,663),(9,53,700,109),(10,10,150,499),(10,14,100,599),(10,19,40,649),(11,11,100,499),(11,15,50,599),(11,20,30,649),(12,46,300,349),(12,47,300,319),(12,48,300,269),(12,58,650,153),(12,59,650,185),(12,60,650,129),(12,64,600,350),(12,65,600,230),(12,66,600,440),(12,67,600,542),(13,55,800,75),(13,56,800,60),(13,57,700,108),(13,61,800,114),(13,62,800,95),(13,63,800,181),(14,68,50,1800),(14,69,50,2700),(14,70,50,1700),(14,71,50,2999);
/*!40000 ALTER TABLE `compras_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuotas_pago`
--

DROP TABLE IF EXISTS `cuotas_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuotas_pago` (
  `ID_Cuota` int NOT NULL AUTO_INCREMENT,
  `ID_Medio` int NOT NULL,
  `Cantidad_Cuotas` int DEFAULT NULL,
  PRIMARY KEY (`ID_Cuota`),
  KEY `ID_Medio` (`ID_Medio`),
  CONSTRAINT `cuotas_pago_ibfk_2` FOREIGN KEY (`ID_Medio`) REFERENCES `medios_de_pago` (`ID_Medio`),
  CONSTRAINT `chk_cuotas_validas` CHECK ((`Cantidad_Cuotas` in (1,3,6)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuotas_pago`
--

LOCK TABLES `cuotas_pago` WRITE;
/*!40000 ALTER TABLE `cuotas_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuotas_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `Legajo` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre_completo` varchar(100) NOT NULL,
  `DNI/CUIT` varchar(20) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Rol` varchar(50) DEFAULT NULL,
  `ID_Rol` int DEFAULT NULL,
  PRIMARY KEY (`Legajo`),
  UNIQUE KEY `Legajo_UNIQUE` (`Legajo`),
  KEY `FK_Empleados_Roles` (`ID_Rol`),
  CONSTRAINT `FK_Empleados_Roles` FOREIGN KEY (`ID_Rol`) REFERENCES `roles` (`ID_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (2,'Lammen Rosgoniel','27255554239','1151774780','LammenRos@Chuchuflito.com','Socio Gerente',2),(3,'Vendedor 1','27333333339','2215745852','vendedor1@Cuchuflito.com','Vendedor',3),(4,'Vendedor 2','24135555469','1154794545','vendedor2@Cuchuflito.com','Vendedor',3),(5,'Vendedor 3','24134555589','1151135555','vendedor3@Cuchuflito.com','Vendedor',3),(6,'Compras','27235555559','1151125555','compras@Cuchuflito.com','Compras y Deposito',4);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medios_de_pago`
--

DROP TABLE IF EXISTS `medios_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medios_de_pago` (
  `ID_Medio` int NOT NULL,
  `Medio_de_Pago` varchar(45) NOT NULL,
  `Tipo_Pago` varchar(10) DEFAULT NULL,
  `Permite_Cuotas` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID_Medio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medios_de_pago`
--

LOCK TABLES `medios_de_pago` WRITE;
/*!40000 ALTER TABLE `medios_de_pago` DISABLE KEYS */;
INSERT INTO `medios_de_pago` VALUES (1,'Efectivo','Contado',0),(2,'Tarjeta Debito','Contado',0),(3,'Visa',NULL,0),(4,'Masterd Card',NULL,0),(5,'American Express','Crédito',1),(6,'Modo / Mercado Pago','Crédito',1);
/*!40000 ALTER TABLE `medios_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ID_Producto` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` text,
  `Precio` decimal(10,0) DEFAULT NULL,
  `ID_Proveedor` int NOT NULL,
  `Stock` int DEFAULT NULL,
  PRIMARY KEY (`ID_Producto`),
  UNIQUE KEY `ID_Producto_UNIQUE` (`ID_Producto`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'RTX 4090','GPU insignia, Ada Lovelace, 24GB GDDR6X, 16384 núcleos CUDA, ideal para 4K, IA y edición profesional.',1599,1,200),(2,'RTX 4080 SUPER','GPU de alto rendimiento, Ada Lovelace, 16GB GDDR6X, 10240 núcleos CUDA, excelente para gaming 4K y productividad',999,1,300),(3,'RTX 4070 Ti SUPER','GPU para 1440p exigente, Ada Lovelace, 16GB GDDR6X, 8448 núcleos CUDA, buena relación rendimiento/precio.',799,1,200),(4,'RTX 4070 SUPER','GPU de gama media-alta, Ada Lovelace, 12GB GDDR6X, 7168 núcleos CUDA, ideal para gaming competitivo.',599,1,250),(5,'RTX 5090','GPU de ultra rendimiento, arquitectura Blackwell, 32GB GDDR7, 21760 núcleos CUDA, ideal para 4K extremo, IA y simulación.',1999,1,150),(6,'RTX 5800','GPU de gama alta, Blackwell, 16GB GDDR7 a 30Gbps, 10752 núcleos CUDA, excelente para gaming 4K y creación de contenido.',999,1,150),(7,'Radeon RX 7900 XTX','GPU de alta gama, arquitectura RDNA 3, 24GB GDDR6, ideal para gaming en 4K y tareas intensivas',999,7,200),(8,'Radeon RX 7900 XT','GPU de alto rendimiento, RDNA 3, 20GB GDDR6, excelente para 1440p y 4K con buena eficiencia energética',899,7,200),(9,'Radeon RX 7900 GRE','Versión optimizada para entornos profesionales y gaming exigente, RDNA 3, 16GB GDDR6.',649,7,200),(10,'Radeon RX 7800 XT','GPU potente para 1440p, arquitectura RDNA 3, 16GB GDDR6, buena relación rendimiento/precio.',499,9,150),(11,'Radeon RX 7800 XT','GPU potente para 1440p, arquitectura RDNA 3, 16GB GDDR6, buena relación rendimiento/precio.',499,10,100),(12,'Radeon RX 7800 XT','GPU potente para 1440p, arquitectura RDNA 3, 16GB GDDR6, buena relación rendimiento/precio.',499,4,100),(13,'Radeon RX 6950 XT','GPU tope de gama de la generación RDNA 2, 16GB GDDR6, excelente para 4K y productividad.',699,7,120),(14,'Radeon RX 6900 XT','GPU de alto rendimiento, RDNA 2, 16GB GDDR6, gran capacidad para gaming en 4K.',599,9,100),(15,'Radeon RX 6900 XT','GPU de alto rendimiento, RDNA 2, 16GB GDDR6, gran capacidad para gaming en 4K.',599,10,50),(16,'Radeon RX 6900 XT','GPU de alto rendimiento, RDNA 2, 16GB GDDR6, gran capacidad para gaming en 4K.',599,4,50),(17,'Radeon RX 9070 XT','GPU tope de gama RDNA 4, 64 unidades de procesamiento, 64GB GDDR6, aceleradores de rayos e IA de última generación, ideal para 4K y creación de contenido profesional.',1199,7,120),(18,'Radeon RX 9070','GPU de alto rendimiento RDNA 4, 56 unidades de procesamiento, 16GB GDDR6, excelente para gaming en 4K y tareas exigentes con IA.',899,7,100),(19,'Radeon RX 9060 XT','GPU potente para 1440p, RDNA 4, 32 unidades de procesamiento, 32GB GDDR6, buena relación rendimiento/precio con soporte para FSR 4',649,9,40),(20,'Radeon RX 9060 XT','GPU potente para 1440p, RDNA 4, 32 unidades de procesamiento, 32GB GDDR6, buena relación rendimiento/precio con soporte para FSR 4',649,10,30),(21,'Radeon RX 9060 XT','GPU potente para 1440p, RDNA 4, 32 unidades de procesamiento, 32GB GDDR6, buena relación rendimiento/precio con soporte para FSR 4',649,4,30),(22,'RTX 5070 Ti','Rendimiento sólido en 1440p y 4K con DLSS 4 y trazado de rayos Gen 4.',750,2,80),(23,'RTX 5070','Ideal para gaming competitivo en 1080p/1440p, con eficiencia y capacidades IA',550,2,80),(24,'RTX 4070 Ti SUPER','Excelente para 1440p y 4K, con DLSS 3.5 y trazado de rayos Gen 3.',750,2,80),(25,'RTX 4070 SUPER','Rendimiento sólido en 1440p, ideal para creadores y gamers exigentes.',600,2,80),(26,'RTX 4070','Buena opción para gaming en 1080p/1440p con eficiencia energética',550,2,80),(27,'RTX 5070 Ti','Rendimiento sólido en 1440p y 4K con DLSS 4 y trazado de rayos Gen 4.',750,3,20),(28,'RTX 5070','Ideal para gaming competitivo en 1080p/1440p, con eficiencia y capacidades IA',550,3,20),(29,'RTX 4070 Ti SUPER','Excelente para 1440p y 4K, con DLSS 3.5 y trazado de rayos Gen 3.',750,3,20),(30,'RTX 4070 SUPER','Rendimiento sólido en 1440p, ideal para creadores y gamers exigentes.',600,3,10),(31,'RTX 4070','Buena opción para gaming en 1080p/1440p con eficiencia energética',550,3,30),(32,'RTX 5070 Ti','Rendimiento sólido en 1440p y 4K con DLSS 4 y trazado de rayos Gen 4.',750,4,20),(33,'RTX 5070','Ideal para gaming competitivo en 1080p/1440p, con eficiencia y capacidades IA',550,4,20),(34,'RTX 4070 Ti SUPER','Excelente para 1440p y 4K, con DLSS 3.5 y trazado de rayos Gen 3.',750,4,20),(35,'RTX 4070 SUPER','Rendimiento sólido en 1440p, ideal para creadores y gamers exigentes.',600,4,15),(36,'RTX 4070','Buena opción para gaming en 1080p/1440p con eficiencia energética',550,4,10),(37,'Core Ultra 9 285HX','Procesador de alto rendimiento para portátiles gaming y estaciones móviles. 24 núcleos (8P + 16E), hasta 5.5 GHz, con NPU para IA y gráficos integrados Intel Arc. Ideal para multitarea extrema y creación de contenido.',749,6,400),(38,'Core Ultra 9 285K','Versión de escritorio desbloqueada, con 24 núcleos y arquitectura Arrow Lake S. Potente para gaming 4K, edición de video y simulaciones complejas.',720,6,400),(39,'Core i9-14900KS','Último modelo de Raptor Lake S, con 6.0 GHz de turbo. Excelente para overclocking y tareas exigentes, aunque sin NPU integrada.',699,6,400),(40,'Core Ultra 5 235A','14 núcleos (6P + 8E), ideal para gaming en 1080p/1440p y productividad diaria. Arquitectura Arrow Lake con eficiencia energética y soporte IA.',299,8,300),(41,'Core Ultra 5 235TA','Variante optimizada para portátiles, con buen rendimiento multihilo y gráficos integrados. Perfecto para usuarios que buscan equilibrio.',279,8,300),(42,'Core Ultra 5 235UA','Chip compacto con núcleos de bajo consumo (LP-E), pensado para laptops livianas y tareas cotidianas con IA integrada.',259,8,300),(43,'Ryzen Threadripper 9980X','64 núcleos y 128 hilos, diseñado para estaciones de trabajo, renderizado 3D, simulaciones y cargas masivas. Arquitectura Zen 5.',1499,7,300),(44,'Ryzen 9 9950X3D','16 núcleos con tecnología 3D V-Cache de segunda generación. Ideal para gaming extremo y creación de contenido con baja latencia.',749,7,300),(45,'Ryzen 9 9950X','Versión sin V-Cache, pero con gran potencia para tareas exigentes. Turbo de hasta 5.7 GHz y excelente rendimiento multihilo.',699,7,300),(46,'Ryzen 7 9700F','8 núcleos, sin gráficos integrados, pensado para gamers y creadores que usan GPU dedicada. Zen 5 con buen rendimiento por dólar.',349,12,300),(47,'Ryzen 7 7700X','Zen 4, 8 núcleos, ideal para gaming en 1440p y edición ligera. Buen balance entre precio y potencia.',319,12,300),(48,'Ryzen 5 7600X','6 núcleos, turbo de 5.3 GHz, excelente para gaming en 1080p y tareas generales. Muy eficiente y competitivo.',269,12,300),(49,'ASUS ROG Maximus Z890 Hero','ATX, socket LGA1851, DDR5 hasta 9200 MHz, 6x M.2, Wi-Fi 7, Thunderbolt 4, ideal para overclocking y gaming extremo.',659,8,600),(50,'Gigabyte Z890 AORUS Master','ATX, LGA1851, DDR5 hasta 9500 MHz, 5x M.2, red 10 GbE, AI Snatch para optimización automática. Potente y elegante.',599,5,600),(51,'ASUS ROG Crosshair X870E Hero','ATX, socket AM5, DDR5, PCIe 5.0, Wi-Fi 7, ideal para Ryzen 9000 y setups de alto rendimiento',663,8,500),(52,'MSI Pro B650M-P ','Micro-ATX, socket AM5, DDR5, PCIe 4.0, LAN 2.5Gb, ideal para Ryzen 7000 y 8000. Moderna y accesible.',129,4,700),(53,'ASUS Prime B760M-K D4','Micro-ATX, LGA1700, DDR4, USB 3.2 Gen 1, buena opción para Intel 12ª y 13ª Gen. Estable y compacta.',109,8,700),(54,'GIGABYTE B550M K','Micro-ATX, socket AM4, PCIe 4.0, Dual M.2, excelente calidad-precio para Ryzen 5000.',89,5,700),(55,'Kingston Fury Beast DDR4 3200MHz','Módulo UDIMM DDR4, 16GB, frecuencia 3200MHz, CL16, voltaje 1.35V, ideal para gaming y productividad.',75,13,800),(56,'Hiksemi Armor DDR4 3200MHz','Módulo UDIMM DDR4, 16GB, frecuencia 3200MHz, voltaje 1.2V, buena opción para PCs de gama media.',60,13,800),(57,'Corsair Vengeance RGB Pro DDR4 3600MHz','Módulo UDIMM DDR4, 16GB, frecuencia 3600MHz, RGB, ideal para setups gamer con estética personalizada.',108,13,700),(58,'Kingston Fury Beast DDR4 3200MHz RGB','Módulo UDIMM DDR4, 32GB, frecuencia 3200MHz, RGB, voltaje 1.2V, excelente para multitarea y gaming avanzado.',153,12,650),(59,'Corsair Vengeance DDR5 6000MHz RGB','Kit 2x16GB DDR5, frecuencia 6000MHz, CL36, RGB, compatible con Intel y AMD EXPO. Ideal para setups de alto rendimiento.',185,12,650),(60,'Lexar LD4AS032G-B3200GSST DDR4 3200MHz','Módulo UDIMM DDR4, 32GB, frecuencia 3200MHz, voltaje 1.2V, buena opción para productividad y gaming moderado.',129,12,650),(61,'Kingston NV2 SNV2S/1000G – 1TB','SSD M.2 NVMe PCIe 4.0, velocidad de lectura hasta 3500MB/s. Ideal para notebooks y PCs modernas.',114,13,800),(62,'Western Digital SN350 Green – 1TB','SSD M.2 NVMe PCIe Gen3, lectura hasta 2400MB/s. Excelente relación precio-rendimiento.',95,13,800),(63,'Hiksemi Future Lite – 2TB','SSD M.2 PCIe Gen4 x4, lectura ultra rápida, ideal para cargas pesadas y multitarea.',181,13,800),(64,'Kingston Fury Renegade 2TB NVMe PCIe Gen4','Velocidad de lectura/escritura de hasta 7300/7000 MB/s. Ideal para gaming extremo y edición profesional. Compatible con PS5.',350,12,600),(65,'Hiksemi Future X Lite 2TB Gen','SSD NVMe Gen4 x4, lectura hasta 7100MB/s. Disipador incluido. Excelente para multitarea intensiva.',230,12,600),(66,'Kingston NV2 Gen4 4TB SNV2S/4000G','Interfaz PCIe 4.0 x4, lectura hasta 3500MB/s. Gran capacidad para almacenamiento masivo con eficiencia térmica.',440,12,600),(67,'ADATA XPG MARS 980 Blade Gen5 4TB','PCIe Gen5 x4, lectura hasta 14.000MB/s, escritura hasta 13.000MB/s. Rendimiento extremo para entornos exigentes.',542,12,600),(68,'MacBook Air M2 (13\")','Ultraliviana, con chip M2, ideal para estudiantes, profesionales móviles y tareas creativas ligeras. Excelente autonomía y diseño minimalista.',1800,14,50),(69,'MacBook Pro M3 (14\")','Potencia profesional con chip M3, pantalla Liquid Retina XDR, ideal para edición de video, programación y diseño gráfico exigente.',2700,14,50),(70,'MacBook Air M4 (13.6\")','Última generación con chip M4, 16GB RAM, SSD de 512GB. Rendimiento mejorado y diseño refinado. Perfecta para multitarea y portabilidad.',1700,14,50),(71,'MacBook Pro M1 Max (16\")','Chip M1 Max, 32GB RAM, SSD de 1TB. Rendimiento extremo para edición 4K, modelado 3D y flujos de trabajo pesados.',2999,14,10);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `ID_Proveedor` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_Proveedor`),
  UNIQUE KEY `ID_Proveedor_UNIQUE` (`ID_Proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'NVIDIA','Gorostiaga 6532','1156981482','ventas@nvidia.com'),(2,'EVGA','Bolivar 4563','1135698347','ventas@evga.com'),(3,'Zontac','Lima 1234','1156985273','ventas@zontac.com'),(4,'MSI','Av. Las Heras 2345','1142841258','ventas@msi.com'),(5,'Gigabyte','Lima 322','1154218519','ventas@gigabyte.com'),(6,'Intel','Av. Carabobo 2536','1142851951','venta@intel.com'),(7,'AMD','Av. Las Heras 252','1139542571','ventas@amd.com'),(8,'ASUS','Rodriguez Peña 195','1145631842','ventas@asus.com'),(9,'Sapphire','Lima 135','1162158521','ventas@Sapphire.com'),(10,'Biostar','Av. Cordoba 235','1162587126','ventas@biostar.com'),(11,'ASRock','Av. Rivadavia 2541','1157153647','ventas@ASRock.com'),(12,'IBM','Lima 235','1167153647','ventas@ibm.com'),(13,'Texas Instruments','Av. Carabobo 652','1137429841','ventas@texa.com'),(14,'Apple','Av. Rivadavia 561','1145317824','ventas@apple.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `ID_Rol` int NOT NULL AUTO_INCREMENT,
  `Rol` varchar(50) NOT NULL,
  `Descripcion` text,
  PRIMARY KEY (`ID_Rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'Socio Gerente','Socio con facultades ejecutivas que representa legal y operativamente a la empresa.'),(3,'Vendedor','Responsable de ofrecer productos, cerrar ventas y cultivar relaciones comerciales.'),(4,'Compras y Deposito','Gestiona la adquisición, recepción y almacenamiento de productos, asegurando abastecimiento eficiente, control de inventario y trazabilidad operativa.'),(5,'Capital Humano','Supervisa el desempeño individual, gestiona vínculos laborales y promueve el desarrollo estratégico del talento dentro de la organización.');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `ID_Ventas` int NOT NULL AUTO_INCREMENT,
  `ID_Cliente` int NOT NULL,
  `Fecha` date NOT NULL,
  `Total` decimal(10,0) NOT NULL,
  `Medio_de_pago` int NOT NULL,
  `Vendedor` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_Ventas`),
  UNIQUE KEY `ID_Ventas_UNIQUE` (`ID_Ventas`),
  KEY `FK_Ventas_Clientes_idx` (`ID_Cliente`),
  KEY `FK_Medio:Pago_idx` (`Medio_de_pago`),
  KEY `FK_Vendedor_idx` (`Vendedor`),
  CONSTRAINT `FK_Medio_Pago` FOREIGN KEY (`Medio_de_pago`) REFERENCES `medios_de_pago` (`ID_Medio`),
  CONSTRAINT `FK_Vendedor` FOREIGN KEY (`Vendedor`) REFERENCES `empleados` (`Legajo`),
  CONSTRAINT `FK_Ventas_Clientes` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,'2025-08-03',2999,6,3),(2,1,'2025-08-03',1599,3,3),(3,3,'2025-08-03',699,5,4),(4,2,'2025-08-29',3998,2,2),(5,3,'2025-08-29',3996,2,3),(6,4,'2025-08-29',2599,6,4),(7,4,'2025-08-29',2599,3,4);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_productos`
--

DROP TABLE IF EXISTS `ventas_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_productos` (
  `ID_Ventas` int NOT NULL,
  `ID_Producto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio_Unitario` decimal(10,0) NOT NULL,
  KEY `FK_ID_Producto_idx` (`ID_Producto`),
  KEY `FK_OD_Venta_idx` (`ID_Ventas`),
  CONSTRAINT `FK_ID_Venta` FOREIGN KEY (`ID_Ventas`) REFERENCES `ventas` (`ID_Ventas`),
  CONSTRAINT `FK_Venta_Producto` FOREIGN KEY (`ID_Producto`) REFERENCES `productos` (`ID_Producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_productos`
--

LOCK TABLES `ventas_productos` WRITE;
/*!40000 ALTER TABLE `ventas_productos` DISABLE KEYS */;
INSERT INTO `ventas_productos` VALUES (1,71,1,2999),(2,1,1,1599),(3,13,1,699),(4,5,2,1999),(5,6,4,999),(6,71,1,2599),(7,71,1,2599);
/*!40000 ALTER TABLE `ventas_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_compras_detalladas`
--

DROP TABLE IF EXISTS `vista_compras_detalladas`;
/*!50001 DROP VIEW IF EXISTS `vista_compras_detalladas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_compras_detalladas` AS SELECT 
 1 AS `ID_Compras`,
 1 AS `Fecha`,
 1 AS `Producto`,
 1 AS `Cantidad`,
 1 AS `Precio_Unitario`,
 1 AS `Proveedor`,
 1 AS `Email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_compras_facturadas`
--

DROP TABLE IF EXISTS `vista_compras_facturadas`;
/*!50001 DROP VIEW IF EXISTS `vista_compras_facturadas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_compras_facturadas` AS SELECT 
 1 AS `ID_compras`,
 1 AS `Fecha`,
 1 AS `Nombre_Proveedor`,
 1 AS `Total_Facturado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_control_inventario`
--

DROP TABLE IF EXISTS `vista_control_inventario`;
/*!50001 DROP VIEW IF EXISTS `vista_control_inventario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_control_inventario` AS SELECT 
 1 AS `ID_Producto`,
 1 AS `Nombre`,
 1 AS `Descripcion`,
 1 AS `stock_actual`,
 1 AS `total_comprado`,
 1 AS `total_vendido`,
 1 AS `stock_recalculado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_inventario_por_proveedor`
--

DROP TABLE IF EXISTS `vista_inventario_por_proveedor`;
/*!50001 DROP VIEW IF EXISTS `vista_inventario_por_proveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_inventario_por_proveedor` AS SELECT 
 1 AS `ID_Proveedor`,
 1 AS `nombre_proveedor`,
 1 AS `ID_Producto`,
 1 AS `nombre_producto`,
 1 AS `Descripcion`,
 1 AS `total_comprado`,
 1 AS `total_vendido`,
 1 AS `stock_actual`,
 1 AS `stock_recalculado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_productos_agrupados`
--

DROP TABLE IF EXISTS `vista_productos_agrupados`;
/*!50001 DROP VIEW IF EXISTS `vista_productos_agrupados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_productos_agrupados` AS SELECT 
 1 AS `Nombre`,
 1 AS `stock_total`,
 1 AS `descripciones`,
 1 AS `costos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_ventas_detalladas`
--

DROP TABLE IF EXISTS `vista_ventas_detalladas`;
/*!50001 DROP VIEW IF EXISTS `vista_ventas_detalladas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_ventas_detalladas` AS SELECT 
 1 AS `ID_Ventas`,
 1 AS `Fecha`,
 1 AS `Producto`,
 1 AS `Cantidad`,
 1 AS `Precio_Unitario`,
 1 AS `Medio_de_Pago`,
 1 AS `Cliente`,
 1 AS `Apellido_Cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'cuchuflito_sa'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_stock_actual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_stock_actual`(ID_Producto INT) RETURNS int
    READS SQL DATA
BEGIN
  DECLARE entradas INT;
  DECLARE salidas INT;
  DECLARE stock_actual INT;

  SELECT SUM(cantidad) INTO entradas
  FROM compras_productos
  WHERE ID_Producto = ID_Producto;

  SELECT SUM(cantidad) INTO salidas
  FROM ventas_productos
  WHERE ID_Producto = ID_Producto;

  SET stock_actual = IFNULL(entradas, 0) - IFNULL(salidas, 0);
  RETURN stock_actual;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_compras_x_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_compras_x_proveedor`(p_ID_Proveedor INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
  DECLARE total_compra DECIMAL(10,2);

  SELECT SUM(total) INTO total_compra
  FROM compras
  WHERE ID_Proveedor = p_ID_Proveedor;

  RETURN IFNULL(total_compra, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_cuotas_x_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_cuotas_x_venta`(p_ID_Venta INT) RETURNS decimal(10,2)
    READS SQL DATA
BEGIN
  DECLARE total DECIMAL(10,2);

  SELECT SUM(Monto_Cuota) INTO total
  FROM cuotas_pago
  WHERE ID_Venta = p_ID_Venta;

  RETURN IFNULL(total, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerResumenComprasPorEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerResumenComprasPorEmpleado`()
BEGIN
    SELECT 
        e.Nombre_Completo AS Nombre_Empleado,
        COUNT(c.Comprador) AS Cantidad_Compras,
        SUM(c.Total) AS Monto_Total,
        AVG(c.Total) AS Promedio_Compra
    FROM compras c
    INNER JOIN empleados e ON c.Comprador = e.Legajo
    GROUP BY e.Nombre_Completo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerResumenVentasPorEmpleado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerResumenVentasPorEmpleado`()
BEGIN
    SELECT 
        e.Nombre_Completo AS Nombre_Empleado,
        COUNT(v.Vendedor) AS Cantidad_Ventas,
        SUM(v.Total) AS Monto_Total,
        AVG(v.Total) AS Promedio_Venta
    FROM ventas v
    INNER JOIN empleados e ON v.Vendedor = e.Legajo
    GROUP BY e.Nombre_Completo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_compra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_compra`(
    IN ID_Proveedor INT,
    IN ID_Producto INT,
    IN Cantidad INT,
    IN Precio_Unitario DECIMAL(10,2)
)
BEGIN
    DECLARE nueva_compra_id INT;

    -- Insertar en compras
    INSERT INTO compras (ID_Proveedor, Fecha, Total)
    VALUES (ID_Proveedor, NOW(), Cantidad * Precio_Unitario);

    SET nueva_compra_id = LAST_INSERT_ID();

    -- Insertar en compras_productos
    INSERT INTO compras_productos (ID_Compra, ID_Producto, Cantidad, Precio_Unitario)
    VALUES (nueva_compra_id, ID_Producto, Dantidad, Precio_Unitario);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_venta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_venta`(
    IN ID_Cliente INT,
    IN Medio_de_Pago INT,
    IN Vendedor INT,
    IN ID_Producto INT,
    IN Cantidad INT,
    IN Precio_Unitario DECIMAL(10,2)
)
BEGIN
    DECLARE nueva_venta_id INT;

    -- Insertar en ventas
    INSERT INTO ventas (ID_Cliente, Medio_de_Pago, Vendedor, Fecha, Total)
    VALUES (ID_Cliente, Medio_de_Pago, Vendedor, NOW(), Cantidad * Precio_Unitario);

    SET nueva_venta_id = LAST_INSERT_ID();

    -- Insertar en ventas_productos
    INSERT INTO ventas_productos (ID_Ventas, ID_Producto, Cantidad, Precio_Unitario)
    VALUES (nueva_venta_id, ID_Producto, Cantidad, Precio_Unitario);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_venta_con_cuotas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_venta_con_cuotas`(
    IN ID_Cliente INT,
    IN Medio_de_Pago INT,
    IN Vendedor INT,
    IN ID_Producto INT,
    IN Cantidad INT,
    IN Precio_Unitario DECIMAL(10,2),
    IN Numero_Cuotas INT
)
BEGIN
    DECLARE nueva_venta_id INT;
    DECLARE Total DECIMAL(10,2);
    DECLARE Monto_Cuota DECIMAL(10,2);
    DECLARE i INT DEFAULT 1;

    SET Total = Cantidad * Precio_Unitario;
    SET Monto_Cuota = ROUND(Total / Numero_Cuotas, 2);

    -- Insertar en ventas
    INSERT INTO ventas (ID_Cliente, Medio_de_Pago, Vendedor, Fecha, Total)
    VALUES (ID_Cliente, Medio_de_Pago, Vendedor, NOW(), Total);

    SET nueva_venta_id = LAST_INSERT_ID();

    -- Insertar en ventas_productos
    INSERT INTO ventas_productos (ID_Ventas, ID_Producto, Cantidad, Precio_Unitario)
    VALUES (nueva_venta_id, ID_Producto, Cantidad, Precio_Unitario);

    -- Insertar en pagos_cuotas
    WHILE i <= Numero_Cuotas DO
        INSERT INTO pagos_cuotas (ID_Venta, Numero_Cuota, Monto, Fecha_Vencimiento, Estado)
        VALUES (
            nueva_venta_id,
            i,
            Monto_Cuota,
            DATE_ADD(NOW(), INTERVAL i MONTH),
            'Pendiente'
        );
        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_compras_detalladas`
--

/*!50001 DROP VIEW IF EXISTS `vista_compras_detalladas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_compras_detalladas` AS select `c`.`ID_Compras` AS `ID_Compras`,`c`.`Fecha` AS `Fecha`,`pr`.`Nombre` AS `Producto`,`cp`.`Cantidad` AS `Cantidad`,`cp`.`Precio_Unitario` AS `Precio_Unitario`,`prov`.`Nombre` AS `Proveedor`,`prov`.`Email` AS `Email` from (((`compras` `c` join `compras_productos` `cp` on((`c`.`ID_Compras` = `cp`.`ID_Compras`))) join `productos` `pr` on((`cp`.`ID_Producto` = `pr`.`ID_Producto`))) join `proveedores` `prov` on((`c`.`ID_Proveedor` = `prov`.`ID_Proveedor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_compras_facturadas`
--

/*!50001 DROP VIEW IF EXISTS `vista_compras_facturadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_compras_facturadas` AS select `c`.`ID_Compras` AS `ID_compras`,`c`.`Fecha` AS `Fecha`,`p`.`Nombre` AS `Nombre_Proveedor`,`c`.`Total` AS `Total_Facturado` from (`compras` `c` join `proveedores` `p` on((`c`.`ID_Proveedor` = `p`.`ID_Proveedor`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_control_inventario`
--

/*!50001 DROP VIEW IF EXISTS `vista_control_inventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_control_inventario` AS select `p`.`ID_Producto` AS `ID_Producto`,`p`.`Nombre` AS `Nombre`,`p`.`Descripcion` AS `Descripcion`,`p`.`Stock` AS `stock_actual`,ifnull(sum(`cp`.`Cantidad`),0) AS `total_comprado`,ifnull(sum(`vp`.`Cantidad`),0) AS `total_vendido`,((`p`.`Stock` + ifnull(sum(`vp`.`Cantidad`),0)) - ifnull(sum(`cp`.`Cantidad`),0)) AS `stock_recalculado` from ((`productos` `p` left join `compras_productos` `cp` on((`p`.`ID_Producto` = `cp`.`ID_Producto`))) left join `ventas_productos` `vp` on((`p`.`ID_Producto` = `vp`.`ID_Producto`))) group by `p`.`ID_Producto`,`p`.`Nombre`,`p`.`Descripcion`,`p`.`Stock` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_inventario_por_proveedor`
--

/*!50001 DROP VIEW IF EXISTS `vista_inventario_por_proveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_inventario_por_proveedor` AS select `pr`.`ID_Proveedor` AS `ID_Proveedor`,`pr`.`Nombre` AS `nombre_proveedor`,`p`.`ID_Producto` AS `ID_Producto`,`p`.`Nombre` AS `nombre_producto`,`p`.`Descripcion` AS `Descripcion`,ifnull(sum(`cp`.`Cantidad`),0) AS `total_comprado`,ifnull(sum(`vp`.`Cantidad`),0) AS `total_vendido`,`p`.`Stock` AS `stock_actual`,((`p`.`Stock` + ifnull(sum(`vp`.`Cantidad`),0)) - ifnull(sum(`cp`.`Cantidad`),0)) AS `stock_recalculado` from ((((`productos` `p` left join `compras_productos` `cp` on((`p`.`ID_Producto` = `cp`.`ID_Producto`))) left join `compras` `c` on((`cp`.`ID_Compras` = `c`.`ID_Compras`))) left join `proveedores` `pr` on((`c`.`ID_Proveedor` = `pr`.`ID_Proveedor`))) left join `ventas_productos` `vp` on((`p`.`ID_Producto` = `vp`.`ID_Producto`))) group by `pr`.`ID_Proveedor`,`pr`.`Nombre`,`p`.`ID_Producto`,`p`.`Nombre`,`p`.`Descripcion`,`p`.`Stock` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_productos_agrupados`
--

/*!50001 DROP VIEW IF EXISTS `vista_productos_agrupados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_productos_agrupados` AS select `productos`.`Nombre` AS `Nombre`,sum(`productos`.`Stock`) AS `stock_total`,group_concat(distinct `productos`.`Descripcion` separator '; ') AS `descripciones`,group_concat(distinct `productos`.`Precio` separator '; ') AS `costos` from `productos` group by `productos`.`Nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_ventas_detalladas`
--

/*!50001 DROP VIEW IF EXISTS `vista_ventas_detalladas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_ventas_detalladas` AS select `v`.`ID_Ventas` AS `ID_Ventas`,`v`.`Fecha` AS `Fecha`,`p`.`Nombre` AS `Producto`,`vp`.`Cantidad` AS `Cantidad`,`vp`.`Precio_Unitario` AS `Precio_Unitario`,`mp`.`Medio_de_Pago` AS `Medio_de_Pago`,`c`.`Nombre` AS `Cliente`,`c`.`Apellido` AS `Apellido_Cliente` from ((((`ventas` `v` join `ventas_productos` `vp` on((`v`.`ID_Ventas` = `vp`.`ID_Ventas`))) join `productos` `p` on((`vp`.`ID_Producto` = `p`.`ID_Producto`))) join `medios_de_pago` `mp` on((`v`.`Medio_de_pago` = `mp`.`ID_Medio`))) join `clientes` `c` on((`v`.`ID_Cliente` = `c`.`ID_Cliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-02 18:46:42
