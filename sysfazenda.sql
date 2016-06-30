CREATE DATABASE  IF NOT EXISTS `sysfazenda` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sysfazenda`;
-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sysfazenda
-- ------------------------------------------------------
-- Server version	5.5.49-0+deb8u1

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
-- Table structure for table `animais`
--

DROP TABLE IF EXISTS `animais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animais` (
  `id_animal` int(11) NOT NULL AUTO_INCREMENT,
  `data_registro` datetime DEFAULT NULL,
  `id_fazenda` int(11) DEFAULT NULL,
  `numero_brinco` varchar(50) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `data_nascimento` datetime DEFAULT NULL,
  `peso` decimal(20,4) DEFAULT NULL,
  `tipo_registro` char(1) DEFAULT NULL,
  `procedencia` varchar(45) DEFAULT NULL,
  `caracteristicas` varchar(200) DEFAULT NULL,
  `obs` varchar(200) DEFAULT NULL,
  `id_mae` int(11) DEFAULT NULL,
  `id_pai` int(11) DEFAULT NULL,
  `id_semen` varchar(45) DEFAULT NULL,
  `flag_descontinuado` int(11) DEFAULT NULL,
  `data_descontinuado` datetime DEFAULT NULL,
  `motivo_descontinuado` varchar(100) DEFAULT NULL,
  `caminho_imagem` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_animal`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animais`
--

LOCK TABLES `animais` WRITE;
/*!40000 ALTER TABLE `animais` DISABLE KEYS */;
INSERT INTO `animais` VALUES (1,'2016-06-16 00:00:00',2,'1213a212a2','Animal numero 1','F','2016-06-09 00:00:00',1.0000,'3','procedencia','Alto e Forte','teste',5,7,'3',1,'2016-06-01 00:00:00','teste',NULL),(3,'2016-06-15 00:00:00',1,'1212','Boi João','M','2016-06-16 00:00:00',10.0000,'3','procedencia','caracteristicas','observação',0,0,'',2,'0000-00-00 00:00:00','',NULL),(5,'1969-12-31 21:00:04',1,'brinco','nome','M','1969-12-31 21:00:01',123.0000,'3','procedencia','caracteristicas','observação',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'2016-06-04 00:00:00',1,'brinco','nome','M','1969-12-31 21:00:01',123.0000,'1','procedencia','caracteristicas','observação',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'2016-06-04 00:00:00',1,'777yhs44RR','Boi bandido','M','2016-06-15 00:00:00',235.0000,'3','procedencia','caracteristicas','observação',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'2016-06-10 00:00:00',1,'1232131','hgljhgjhgj','M','2016-06-11 00:00:00',1000.0000,'1','mmlkmlk','çlkçl','çljkljl',1,3,'1',0,'0000-00-00 00:00:00','hhjhjhkj',NULL),(10,'2016-06-10 00:00:00',1,'132132','hkhkj','M','2016-06-01 00:00:00',10.0000,'1','nknknm','mçmçm','jkjlkjlk',1,3,'1',0,'2016-06-16 00:00:00','nlkhjhj',NULL),(11,'2016-06-15 00:00:00',1,'121212','Boy Marcio','M','2016-06-01 00:00:00',800.0000,'1','Procedencia','caracteristicas','Ob',1,5,'1',2,'0000-00-00 00:00:00','',NULL),(12,'2016-06-15 00:00:00',1,'77777','teste','M','2016-06-01 00:00:00',32.0000,'1','','','',0,0,'',2,'0000-00-00 00:00:00','',NULL),(13,'2016-06-20 00:00:00',1,'3232323','Teste 2\'','F','2016-06-04 00:00:00',200.0000,'1','','','',0,0,'',2,'0000-00-00 00:00:00','',NULL),(14,'2016-06-13 00:00:00',2,'787878','teste','M','2016-06-16 00:00:00',1000.0000,'1','','','',0,0,'',2,'0000-00-00 00:00:00','',NULL);
/*!40000 ALTER TABLE `animais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixa` (
  `id_caixa` int(11) NOT NULL AUTO_INCREMENT,
  `data_registro` datetime DEFAULT NULL,
  `historico` varchar(200) DEFAULT NULL,
  `valor` decimal(20,4) DEFAULT NULL,
  `id_fazenda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_caixa`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` VALUES (1,'2016-06-06 00:00:00','historico',100.0000,1),(2,'2016-06-08 00:00:00','teste',15.0000,2),(3,'2016-06-08 00:00:00','teste',-10.0000,1),(4,'2016-01-01 00:00:00','Entrada 01-01',1000.0000,1),(5,'2016-01-05 00:00:00','saida',-232.0000,1),(6,'2016-02-03 00:00:00','entrada fev',132.2500,1),(7,'2016-02-15 00:00:00','mais uma entrada',52.0000,1),(8,'2016-03-30 00:00:00','entrada',215.0000,1),(9,'2016-03-31 00:00:00','entrada 02',123.0000,1),(10,'2016-04-04 00:00:00','entrada',25.3200,1),(11,'2016-04-15 00:00:00','teste',-250.0000,1),(12,'2016-06-01 00:00:00','teste',100.1000,1),(13,'2016-06-27 00:00:00','teste de decima,',10.5000,1);
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas` (
  `id_consulta` int(11) NOT NULL AUTO_INCREMENT,
  `data_registro` datetime DEFAULT NULL,
  `id_animal` int(11) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `tipo_registro` char(1) DEFAULT NULL COMMENT '1 - vacina, 2 - Materniadade, 3 - Inseminação, 4 - Veterinário, 5 - Pesagem, 6 - Transferência',
  `id_fazenda` int(11) DEFAULT NULL,
  `peso_atual` decimal(20,4) DEFAULT NULL,
  `cria` int(11) DEFAULT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_consulta`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
INSERT INTO `consultas` VALUES (1,'2016-06-07 00:00:00',7,10,'2',1,100.0000,1,'animal numero 1 teste'),(2,'2016-06-08 00:00:00',5,1,'2',2,500.0000,0,'teste de descrição'),(3,'2016-06-07 00:00:00',3,10,'2',1,10.0000,6,'teste'),(4,'2016-06-10 00:00:00',1,54,'2',1,54.0000,5,''),(5,'2016-06-21 00:00:00',3,13,'2',1,120.0000,0,''),(6,'2016-06-10 00:00:00',7,32,'2',2,900.0000,8,'teste');
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fazendas`
--

DROP TABLE IF EXISTS `fazendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fazendas` (
  `id_fazenda` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `localidade` varchar(100) DEFAULT NULL,
  `area_total` decimal(20,4) DEFAULT NULL,
  `area_util` decimal(20,4) DEFAULT NULL,
  `cartao_produtor` varchar(45) DEFAULT NULL,
  `id_responsavel` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fazenda`),
  KEY `fk_fazendas_responsavel_idx` (`id_responsavel`),
  CONSTRAINT `fk_fazendas_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `responsaveis` (`id_responsavel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fazendas`
--

LOCK TABLES `fazendas` WRITE;
/*!40000 ALTER TABLE `fazendas` DISABLE KEYS */;
INSERT INTO `fazendas` VALUES (1,'Fazenda do Marcio','Jundiaí',2000.0000,1000.0000,'090sssas9090',1),(2,'Fazenda da Gabriela','Jundiaí',5000.0000,4000.0000,'hmahn21212',2),(3,'Fazenda numero 3','Itu',10000.0000,8500.0000,'ASED23265AAAs',1),(12,'Nova Fazenda 2','',0.0000,0.0000,'',1);
/*!40000 ALTER TABLE `fazendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nascimentos`
--

DROP TABLE IF EXISTS `nascimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nascimentos` (
  `id_nascimento` int(11) NOT NULL AUTO_INCREMENT,
  `data_registro` datetime DEFAULT NULL,
  `id_fazenda` int(11) DEFAULT NULL,
  `numero_brinco` varchar(50) DEFAULT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `data_nascimento` datetime DEFAULT NULL,
  `tipo_registro` varchar(45) DEFAULT NULL,
  `id_pai` int(11) DEFAULT NULL,
  `id_mae` int(11) DEFAULT NULL,
  `id_semen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_nascimento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nascimentos`
--

LOCK TABLES `nascimentos` WRITE;
/*!40000 ALTER TABLE `nascimentos` DISABLE KEYS */;
INSERT INTO `nascimentos` VALUES (1,'2016-06-01 00:00:00',1,'5647855','Boi bandidinho','M','2016-05-31 00:00:00','nascimento',5,1,2),(2,'2016-06-08 00:00:00',3,'4545454','zé','M','2016-06-03 00:00:00','121212',2,7,1);
/*!40000 ALTER TABLE `nascimentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsaveis`
--

DROP TABLE IF EXISTS `responsaveis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsaveis` (
  `id_responsavel` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_responsavel`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsaveis`
--

LOCK TABLES `responsaveis` WRITE;
/*!40000 ALTER TABLE `responsaveis` DISABLE KEYS */;
INSERT INTO `responsaveis` VALUES (1,'Marcio'),(2,'Gabriela');
/*!40000 ALTER TABLE `responsaveis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semen`
--

DROP TABLE IF EXISTS `semen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semen` (
  `id_semen` int(11) NOT NULL AUTO_INCREMENT,
  `data_registro` datetime DEFAULT NULL,
  `id_animal` int(11) DEFAULT NULL,
  `procedencia` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_semen`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semen`
--

LOCK TABLES `semen` WRITE;
/*!40000 ALTER TABLE `semen` DISABLE KEYS */;
INSERT INTO `semen` VALUES (1,'2016-06-17 00:00:00',5,'teste procedencia'),(2,'2016-06-21 00:00:00',7,'Procedencia 2'),(3,'2016-06-16 00:00:00',1,'Procedencia 3');
/*!40000 ALTER TABLE `semen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Marcio','123');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-30 18:11:02
