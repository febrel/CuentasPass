CREATE DATABASE  IF NOT EXISTS `crud` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `crud`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: crud
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentas` (
  `id_cuentas` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `usuario` varchar(200) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `arreglo` varchar(500) NOT NULL,
  `id_usuario_fk` int(11) NOT NULL,
  PRIMARY KEY (`id_cuentas`),
  KEY `fk_cuentas_usua_idx` (`id_usuario_fk`),
  CONSTRAINT `fk_cuentas_usua` FOREIGN KEY (`id_usuario_fk`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (1,'Gmail','febreluis1993@gmail.com','Y4aSRx07>nB:B','94-108-116-107-44-104-33-120-107-107-48-55-53-63-56-63-75-57-113-55-122-54-',1),(2,'Gmail 2','febreluis06@gmail.com','dGOs\"/mX:)ym','50-108-119-107-41-104-80-120-92-107-70-55-118-63-68-63-68-57-95-48-48-114-',1),(3,'Gmail 3','universidad.utpl.loja@gmail.com','6qN!?/r(P)(Q','91-123-58-122-93-118-38-114-110-114-70-117-82-112-68-103-64-63-48-48-',1),(4,'Hotmail','ghetto_06@hotmail.com','l)o#WQs<&CF<5Sg','78-109-119-110-44-107-50-122-114-122-96-117-58-120-119-117-105-105-69-113-76-63-51-57-54-48-',1),(5,'Hotmail 2','febre_1993@hotmail.com','iRwa#XAXI,b','53-108-67-107-56-104-41-120-65-107-38-54-111-60-82-55-90-54-',1),(6,'Outlook','FebreSarango65@outlook.com','\\s2/;eDf6TMIk','111-108-48-107-122-104-67-120-116-107-88-114-63-123-52-111-76-121-56-60-85-59-71-48-',1),(7,'Polaris','febre_1993@hotmail.com','UHSqHpWu8Sk+.`FX\\','105-108-82-107-64-104-73-120-45-107-55-118-43-117-98-114-35-103-100-120-89-111-45-121-77-63-121-57-39-48-',1),(8,'Mercado Libre Peru','FebreSarango65@outlook.com','Ka0wB5v5dg5d(uG8)','61-59-38-89-121-93-52-103-36-121-52-123-44-80-79-72-108-73-110-110-39-89-57-76-42-118-58-59-112-58-',1),(9,'Udemy','febreluis1993@gmail.com','ao>/-6XQd8S@0Nk','81-123-121-106-42-107-90-115-35-127-34-108-79-107-101-104-115-120-61-107-108-63-64-57-',1),(10,'IMGBB','febre_1993@hotmail.com','_)E_S\'[d(aD$H/','43-111-59-115-114-109-64-104-57-104-39-108-71-107-78-104-108-120-87-107-50-63-117-57-83-48-',1),(11,'GitLab','febreluis1993@gmail.com','F7MAaxq8WY1','98-109-41-111-75-122-112-108-84-107-57-104-77-120-44-107-81-60-',1),(12,'GitLab 2','lafebre@utpl.edu.ec','F]O*SR9BW:g','63-55-72-56-44-57-55-58-47-59-44-60-49-61-107-62-35-48-',1),(13,'Twiter','febreluis1993@gmail.com','x`A]R4N2dt2?<2l&','98-108-100-107-67-104-49-120-44-107-116-122-112-125-38-111-112-122-96-107-84-120-112-63-35-57-70-48-',1),(14,'MySQL','febredb','&PyHi;N9','89-108-69-107-86-104-47-120-59-107-74-54-94-60-',1),(15,'Mega','febre_1993@hotmail.com','0T-U&\\\'F+wXR','85-108-94-107-120-104-74-120-97-107-93-115-64-107-113-109-98-103-51-63-119-57-',1),(16,'Mega 2','ghetto_06@hotmail.com','X]xG.J(p3i[37','55-108-40-107-100-104-59-120-54-107-87-115-67-107-109-109-116-103-43-63-82-57-',1),(17,'Mega 3','FebreSarango65@outlook.com','VR_3z=++`L\"PDB','62-108-105-107-41-104-108-120-36-107-105-115-66-107-113-109-91-103-49-63-47-57-',1),(18,'Xiaomi','febreluis1993@gmail.com','\\/kTRv+#w@y2_FL%','83-108-39-107-61-104-56-120-92-107-46-126-87-111-57-103-112-117-91-115-106-111-98-63-66-57-67-48-',1),(19,'Canvas','febreluis1993@gmail.com','XZK72G[5c:8dM>7d','85-108-78-107-117-104-39-120-78-107-121-105-94-103-70-116-69-124-34-103-33-121-62-56-105-58-43-48-',1),(20,'Wunderlist','febreluis1993@gmail.com',']^t.s0HI62ns4<','99-108-78-107-120-104-117-120-58-107-88-123-105-116-58-106-53-107-98-120-76-63-104-57-105-48-',1),(21,'Scribd','febre_1993@hotmail.com','pEf(D-Se^\\tt','102-108-87-107-91-104-105-120-40-107-112-55-101-63-92-63-47-57-44-48-',1),(22,'Facebook','FebreSarango65@outlook.com','e&;%aqB@U?$0S9_pt','76-108-120-107-35-104-115-120-121-107-37-121-94-103-85-120-64-103-101-116-76-109-116-117-77-60-60-59-86-48-',1),(23,'Stormboard','febreluis1993@gmail.com','UpB=&<^yTD\'\\A4=j&','68-108-37-107-71-104-71-120-55-107-60-54-79-60-68-114-74-114-38-123-51-124-101-111-91-103-110-48-',1),(24,' Cisco','febreluis1993@gmail.com','\"_e=Beq*[\"ww^<','108-76-64-107-73-104-104-120-101-107-69-105-101-111-49-121-35-105-93-117-109-63-43-57-',1),(25,'Flaticon','ghetto_06@hotmail.com','\\HiB\\)2I2pEqRP`T.','43-71-96-75-56-109-58-110-50-87-36-125-65-110-49-115-54-59-72-60-57-128-115-116-65-92-99-58-90-95-',1),(26,'Wbstool','febreluis1993@gmail.com','O2=Vnq2LTMv\'Sa+24','76-72-43-120-111-93-58-76-37-77-38-121-101-127-107-104-58-71-99-62-83-104-112-60-64-104-41-110-105-112-',1),(27,'Mendeley','febreluis1993@gmail.com','aj6*nvYqu(^j]PgF[\\','106-115-114-107-100-116-119-106-75-107-58-114-115-107-42-127-92-108-90-107-122-104-94-120-81-107-67-63-101-57-',1),(28,'Oracle','febreluis1993@gmail.com','rL\"dyX!,*\\6>E0Y]','40-85-69-120-109-103-114-105-79-114-91-107-121-108-64-120-108-107-71-104-110-120-64-107-93-54-87-60-',1),(29,'Oracle 2','ORACLE2 SYS SYSTEM','9kq>WC@2qr*','117-117-56-120-119-103-76-105-109-114-91-107-64-63-50-57-',1),(30,'Poryectos PRO*','ghetto_06@hotmail.com','yk9:,aj/0*U','74-127-40-63-111-74-83-77-39-88-37-84-97-126-41-77-',1),(31,'Crunchyrool','febreluis1993@gmail.com','OKNd+;)J<K','63-108-94-107-94-104-41-120-43-107-65-101-62-55-113-63-',1),(32,'Orcanos','febre_1993@hotmail.com','m=&[ddq73fH$Sg','71-117-36-120-61-105-95-103-111-116-108-117-62-121-113-108-42-107-66-104-70-120-64-107-',1),(33,'Hiropolis','febreluis1993@gmail.com','RbWrOe2`VWi7\'','120-110-75-111-90-120-54-117-88-108-97-107-98-104-79-120-51-107-80-63-62-57-',1),(34,'APpacheToncat','admin','AaSm/b1','61-108-108-107-46-104-39-120-34-107-42-114-',1);
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(200) NOT NULL,
  `username` varchar(200) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'1104128689','lafebre','luis123','lafebre@utpl.edu.ec','0982588124'),(2,'1104128686','marifebre','mari123','mffebre@utpl.edu.ec','0989988143');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'crud'
--

--
-- Dumping routines for database 'crud'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-25  0:11:51
