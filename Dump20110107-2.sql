CREATE DATABASE  IF NOT EXISTS `webportfolio` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `webportfolio`;
-- MySQL dump 10.13  Distrib 5.1.40, for Win32 (ia32)
--
-- Host: localhost    Database: webportfolio
-- ------------------------------------------------------
-- Server version	5.1.48-community

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
-- Table structure for table `purchasehistory`
--

DROP TABLE IF EXISTS `purchasehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchasehistory` (
  `PurchaseHistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `portfolioID` int(11) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `shares` decimal(10,5) NOT NULL,
  `date` date NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `type` varchar(4) NOT NULL,
  `commission` decimal(10,2) DEFAULT '0.00',
  `currency` char(1) NOT NULL,
  PRIMARY KEY (`PurchaseHistoryID`),
  KEY `fk_purchasehistory_holdings1` (`portfolioID`,`symbol`),
  CONSTRAINT `fk_purchasehistory_holdings1` FOREIGN KEY (`portfolioID`, `symbol`) REFERENCES `holdings` (`portfolioID`, `symbol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasehistory`
--

LOCK TABLES `purchasehistory` WRITE;
/*!40000 ALTER TABLE `purchasehistory` DISABLE KEYS */;
INSERT INTO `purchasehistory` VALUES (234,2,'CLX','23.00000','2010-04-27','64.0800','BUY','4.95','U'),(235,2,'JNJ','23.00000','2010-04-27','64.5800','BUY','4.95','U'),(236,2,'KFT','50.00000','2010-04-27','29.7899','BUY','4.95','U'),(237,2,'KO','28.00000','2010-04-27','53.2600','BUY','4.95','U'),(238,2,'T','57.00000','2010-04-27','26.0900','BUY','4.95','U'),(239,2,'TAP','34.00000','2010-04-27','43.3700','BUY','4.95','U'),(240,2,'TRP','31.00000','2010-04-27','36.7500','BUY','4.95','U'),(241,2,'KFT','-8.00000','2010-05-20','29.3700','SELL','4.95','U'),(242,3,'BDX','21.00000','2010-05-26','71.6600','BUY','4.95','U'),(243,3,'BP','35.00000','2010-05-26','42.6200','BUY','4.95','U'),(244,3,'PEP','24.00000','2010-05-26','62.1500','BUY','4.95','U'),(245,3,'SYY','64.00000','2010-05-26','29.3100','BUY','4.95','U'),(246,3,'WMT','30.00000','2010-05-26','50.3300','BUY','4.95','U'),(247,3,'XOM','25.00000','2010-05-26','60.0400','BUY','4.95','U'),(248,3,'SYY','-2.00000','2010-06-01','29.5500','SELL','4.95','U'),(255,4,'BNS','32.00000','2010-06-10','47.9900','BUY','4.95','U'),(256,4,'JNJ','26.00000','2010-06-10','58.5600','BUY','4.95','U'),(257,4,'RY','30.00000','2010-06-10','51.0500','BUY','4.95','U'),(258,4,'TD','23.00000','2010-06-10','67.7700','BUY','4.95','U'),(259,4,'BP','50.00000','2010-06-16','30.3300','BUY','4.95','U'),(260,4,'ADM','73.00000','2010-06-18','27.3195','BUY','4.95','U'),(299,5,'FFH.TO','7.97395','2010-01-28','371.5524','BUY','0.00','C'),(300,5,'FFH.TO','0.48307','2010-01-28','367.6255','BUY','0.00','C'),(301,5,'CDZ.TO','266.00000','2010-03-10','18.8600','BUY','5.99','C'),(302,5,'ABT','25.00000','2010-05-10','49.6100','BUY','4.95','U'),(303,5,'KMB','24.00000','2010-05-10','62.8300','BUY','4.95','U'),(304,5,'MKC','39.00000','2010-05-10','39.1400','BUY','4.95','U'),(305,5,'OMI','52.00000','2010-05-10','29.8600','BUY','4.95','U'),(306,5,'AFL','34.00000','2010-06-18','44.4895','BUY','4.95','U'),(307,5,'AZN','33.00000','2010-06-18','45.6700','BUY','4.95','U'),(308,5,'COP','27.00000','2010-06-18','55.7300','BUY','4.95','U'),(309,5,'SNY','50.00000','2010-06-18','30.5300','BUY','4.95','U'),(310,5,'COP','29.00000','2010-06-24','52.3500','BUY','4.95','U'),(311,5,'SNY','50.00000','2010-06-24','30.4100','BUY','4.95','U'),(312,5,'MRU-A.TO','70.00000','2010-07-15','43.1100','BUY','5.21','C'),(313,5,'PG','24.00000','2010-07-15','62.7300','BUY','4.95','U'),(314,5,'SJR-B.TO','155.00000','2010-07-15','19.3799','BUY','4.95','U'),(316,2,'TRP','-31.00000','2010-09-15','37.1200','SELL','4.95','U'),(317,2,'T','-57.00000','2010-09-15','27.9100','SELL','4.95','U'),(318,2,'KFT','-42.00000','2010-09-15','31.1500','SELL','4.95','U'),(319,5,'SJR-B.TO','-155.00000','2010-09-15','21.3801','SELL','5.01','U'),(320,5,'KMB','-24.00000','2010-09-15','66.3500','SELL','4.98','U'),(321,5,'OMI','58.00000','2010-09-15','26.0300','BUY','4.95','U'),(322,5,'FFH.TO','0.87805','2010-09-03','420.5205','BUY','0.00','C'),(323,5,'FFH.TO','0.26339','2010-09-03','420.5205','BUY','0.00','C'),(324,2,'MDT','75.00000','2010-09-20','33.4300','BUY','4.95','U'),(325,5,'FFH.TO','0.88755','2010-10-05','416.0221','BUY','0.00','C'),(326,5,'FFH.TO','0.26624','2010-10-05','416.0221','BUY','0.00','C'),(327,2,'BAC','118.00000','2010-10-13','13.3400','BUY','4.95','U'),(328,5,'FFH.TO','0.91091','2010-11-03','405.3548','BUY','0.00','C'),(329,5,'FFH.TO','0.27324','2010-11-03','405.3548','BUY','0.00','C'),(330,5,'BAC','135.00000','2010-11-23','11.1500','BUY','4.95','U'),(331,5,'ABT','34.00000','2010-11-30','46.2900','BUY','4.95','U'),(332,5,'NVS','56.00000','2010-11-30','53.3900','BUY','4.95','U'),(333,5,'FFH.TO','0.92308','2010-12-03','400.0094','BUY','0.00','U'),(334,5,'FFH.TO','0.27689','2010-12-03','400.0094','BUY','0.00','U');
/*!40000 ALTER TABLE `purchasehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposithistory`
--

DROP TABLE IF EXISTS `deposithistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposithistory` (
  `depositHistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `portfolioID` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` char(1) NOT NULL DEFAULT 'U',
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`depositHistoryID`),
  KEY `fk_depositHistory_portfolios` (`portfolioID`),
  CONSTRAINT `fk_depositHistory_portfolios` FOREIGN KEY (`portfolioID`) REFERENCES `portfolios` (`PortfolioID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposithistory`
--

LOCK TABLES `deposithistory` WRITE;
/*!40000 ALTER TABLE `deposithistory` DISABLE KEYS */;
INSERT INTO `deposithistory` VALUES (110,2,'DEPOSIT','2010-04-26','10058.54','C',NULL),(111,2,'EXCHANGE','2010-04-27','-10294.21','C',NULL),(112,2,'EXCHANGE','2010-04-27','10075.57','U',NULL),(113,2,'EXCHANGE','2010-05-20','-230.00','U',NULL),(114,2,'EXCHANGE','2010-05-20','245.11','C',NULL),(115,2,'WITHDRAWAL','2010-06-14','-9.44','C',NULL),(116,2,'EXCHANGE','2010-06-16','-18.65','U',NULL),(117,2,'EXCHANGE','2010-06-16','19.04','C',NULL),(118,2,'WITHDRAWAL','2010-06-17','-19.04','C',NULL),(119,2,'EXCHANGE','2010-07-05','-10.47','U',NULL),(120,2,'EXCHANGE','2010-07-05','11.09','C',NULL),(121,2,'WITHDRAWAL','2010-07-06','-11.09','C',NULL),(122,2,'WITHDRAWAL','2010-07-15','-10.35','U',NULL),(123,3,'DEPOSIT','2010-05-17','10060.66','C',NULL),(124,3,'EXCHANGE','2010-05-26','-10111.84','C',NULL),(125,3,'EXCHANGE','2010-05-26','9404.61','U',NULL),(126,3,'EXCHANGE','2010-05-27','-0.01','U',NULL),(127,3,'EXCHANGE','2010-05-27','0.01','C',NULL),(128,3,'EXCHANGE','2010-06-01','-48.71','U',NULL),(129,3,'EXCHANGE','2010-06-01','51.17','C',NULL),(135,4,'DEPOSIT','2010-05-17','10054.89','C',NULL),(136,4,'EXCHANGE','2010-06-10','-6391.54','C',NULL),(137,4,'EXCHANGE','2010-06-10','6168.25','U',NULL),(138,4,'EXCHANGE','2010-06-14','-3663.35','C',NULL),(139,4,'EXCHANGE','2010-06-14','3533.66','U',NULL),(160,5,'DEPOSIT','2010-03-04','5000.00','C',NULL),(161,5,'DEPOSIT','2010-05-05','6530.03','C',NULL),(162,5,'EXCHANGE','2010-05-07','-6543.72','C',NULL),(163,5,'EXCHANGE','2010-05-07','6204.93','U',NULL),(164,5,'DEPOSIT','2010-06-14','9.44','C',NULL),(165,5,'DEPOSIT','2010-06-17','9000.00','C',NULL),(166,5,'DEPOSIT','2010-06-17','19.04','C',NULL),(167,5,'EXCHANGE','2010-06-22','-9046.70','C',NULL),(168,5,'EXCHANGE','2010-06-22','8682.05','U',NULL),(169,5,'DEPOSIT','2010-07-06','11.09','C',NULL),(170,5,'EXCHANGE','2010-07-08','-29.58','C',NULL),(171,5,'EXCHANGE','2010-07-08','27.93','U',NULL),(172,5,'DEPOSIT','2010-07-15','10.35','U',NULL),(173,5,'ADJUSTMENT','2010-07-19','4.95','C',NULL),(174,5,'DEPOSIT','2010-08-05','1700.00','C',NULL),(175,5,'ADJUSTMENT','2010-08-12','-14.85','C',NULL),(176,5,'ADJUSTMENT','2010-08-13','14.85','C',NULL),(177,5,'ADJUSTMENT','2010-08-13','14.85','C',NULL),(178,5,'DEPOSIT','2010-01-28','2962.74','C',NULL),(179,5,'ADJUSTMENT','2010-08-18','-7.28','C',NULL),(180,5,'ADJUSTMENT','2010-08-18','-15.92','U',NULL),(193,5,'ADJUSTMENT','2010-08-26','1.38','U',NULL),(194,5,'ADJUSTMENT','2010-08-26','1.38','U',NULL),(195,5,'ADJUSTMENT','2010-08-26','-1.38','U',NULL),(196,5,'ADJUSTMENT','2010-08-26','-2.76','U',NULL),(197,5,'ADJUSTMENT','2010-09-20','-4.69','C',NULL),(198,5,'ADJUSTMENT','2010-09-20','-18.16','U',NULL),(199,5,'DEPOSIT','2010-10-05','480.00','C',''),(200,5,'DEPOSIT','2010-09-03','480.00','C',''),(201,5,'ADJUSTMENT','2010-10-20','-4.66','C','Interest'),(202,5,'ADJUSTMENT','2010-10-20','-5.98','U','Interest'),(203,2,'ADJUSTMENT','2010-10-21','9.90','C','AFFLT REBATE'),(204,5,'ADJUSTMENT','2010-10-21','14.85','C','AFFLT REBATE'),(205,5,'DEPOSIT','2010-11-03','480.00','C','fairfax'),(206,5,'DEPOSIT','2010-11-02','2200.00','C',''),(207,5,'EXCHANGE','2010-11-04','-962.48','C','cover margin account from MBNA money'),(208,5,'EXCHANGE','2010-11-04','946.30','U','cover margin account from MBNA money'),(209,5,'ADJUSTMENT','2010-11-18','-2.81','U','interest'),(210,5,'ADJUSTMENT','2010-11-18','-2.60','C','interest'),(211,2,'ADJUSTMENT','2010-11-23','4.95','C','AFFLT REBATE'),(212,5,'DEPOSIT','2010-11-26','1300.00','C',''),(213,5,'DEPOSIT','2010-11-30','3500.00','C','MBNA'),(214,5,'EXCHANGE','2010-12-02','-1327.79','C',''),(215,5,'EXCHANGE','2010-12-02','1305.08','U',''),(216,5,'EXCHANGE','2010-12-02','-3500.00','C',''),(217,5,'EXCHANGE','2010-12-02','3440.14','U',''),(218,5,'DEPOSIT','2010-12-06','900.00','C',''),(219,5,'EXCHANGE','2010-12-06','-900.00','C',''),(220,5,'EXCHANGE','2010-12-06','884.35','U',''),(221,5,'DEPOSIT','2010-12-03','480.00','C','fairfax purchase plan'),(222,5,'ADJUSTMENT','2010-12-15','-14.85','C','AFFLT REBATE'),(223,5,'ADJUSTMENT','2010-12-16','29.70','C','AFFLT REBATE'),(224,5,'ADJUSTMENT','2010-12-20','-2.01','U','INTEREST TO DEC 16');
/*!40000 ALTER TABLE `deposithistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holdings`
--

DROP TABLE IF EXISTS `holdings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holdings` (
  `HoldingsID` int(11) NOT NULL AUTO_INCREMENT,
  `portfolioID` int(11) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  PRIMARY KEY (`HoldingsID`),
  UNIQUE KEY `PortfolioID_Symbol_UNIQUE` (`portfolioID`,`symbol`),
  KEY `fk_Holdings_Portfolios` (`symbol`),
  KEY `fk_Holdings_Symbol` (`portfolioID`),
  CONSTRAINT `fk_holdings_portfolios1` FOREIGN KEY (`portfolioID`) REFERENCES `portfolios` (`PortfolioID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Holdings_HoldingsData` FOREIGN KEY (`symbol`) REFERENCES `holdingsdata` (`Symbol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holdings`
--

LOCK TABLES `holdings` WRITE;
/*!40000 ALTER TABLE `holdings` DISABLE KEYS */;
INSERT INTO `holdings` VALUES (93,1,'CASH'),(287,2,'BAC'),(225,2,'CASH'),(227,2,'CLX'),(228,2,'JNJ'),(229,2,'KFT'),(230,2,'KO'),(286,2,'MDT'),(231,2,'T'),(232,2,'TAP'),(233,2,'TRP'),(234,3,'BDX'),(235,3,'BP'),(226,3,'CASH'),(236,3,'PEP'),(237,3,'SYY'),(238,3,'WMT'),(239,3,'XOM'),(251,4,'ADM'),(246,4,'BNS'),(250,4,'BP'),(247,4,'JNJ'),(248,4,'RY'),(249,4,'TD'),(275,5,'ABT'),(279,5,'AFL'),(280,5,'AZN'),(288,5,'bac'),(252,5,'CASH'),(274,5,'CDZ.TO'),(281,5,'COP'),(273,5,'FFH.TO'),(276,5,'KMB'),(277,5,'MKC'),(283,5,'MRU-A.TO'),(289,5,'NVS'),(278,5,'OMI'),(284,5,'PG'),(285,5,'SJR-B.TO'),(282,5,'SNY');
/*!40000 ALTER TABLE `holdings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolios`
--

DROP TABLE IF EXISTS `portfolios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolios` (
  `PortfolioID` int(11) NOT NULL AUTO_INCREMENT,
  `portfolioName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PortfolioID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolios`
--

LOCK TABLES `portfolios` WRITE;
/*!40000 ALTER TABLE `portfolios` DISABLE KEYS */;
INSERT INTO `portfolios` VALUES (1,'Complete Portfolio'),(2,'Leon\'s TFSA'),(3,'Yana\'s TFSA'),(4,'Yury\'s TFSA'),(5,'Leon\'s Unregistered');
/*!40000 ALTER TABLE `portfolios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `webportfolio`.`insertCashHolding`
AFTER INSERT ON `webportfolio`.`portfolios`
FOR EACH ROW
insert into holdings (PortfolioID, Symbol)
values (NEW.portfolioID, "CASH") */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cashhistory`
--

DROP TABLE IF EXISTS `cashhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashhistory` (
  `CashHistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `portfolioID` int(11) NOT NULL,
  `sourcesymbol` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Tax` decimal(10,2) NOT NULL,
  `currency` char(1) NOT NULL DEFAULT 'U',
  `note` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`CashHistoryID`),
  KEY `fk_cashhistory_holdings1` (`portfolioID`,`sourcesymbol`),
  KEY `fk_cashhistory_holdings` (`portfolioID`,`sourcesymbol`),
  CONSTRAINT `fk_cashhistory_holdings` FOREIGN KEY (`portfolioID`, `sourcesymbol`) REFERENCES `holdings` (`PortfolioID`, `Symbol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=470 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashhistory`
--

LOCK TABLES `cashhistory` WRITE;
/*!40000 ALTER TABLE `cashhistory` DISABLE KEYS */;
INSERT INTO `cashhistory` VALUES (290,2,'JNJ','DIVIDEND','2010-06-15','12.42','1.86','U',NULL),(291,2,'TAP','DIVIDEND','2010-06-15','9.52','1.43','U',NULL),(292,2,'KO','DIVIDEND','2010-07-02','12.32','1.85','U',NULL),(293,2,'KFT','DIVIDEND','2010-07-14','12.18','1.83','U',NULL),(294,2,'TRP','DIVIDEND','2010-07-30','12.01','0.00','U',NULL),(295,2,'T','DIVIDEND','2010-08-03','23.94','3.59','U',NULL),(303,3,'BDX','DIVIDEND','2010-06-30','7.77','1.17','U',NULL),(304,3,'PEP','DIVIDEND','2010-06-30','11.52','1.73','U',NULL),(305,3,'SYY','DIVIDEND','2010-07-23','15.50','2.33','U',NULL),(320,4,'BNS','DIVIDEND','2010-07-28','15.04','0.00','U',NULL),(321,4,'TD','DIVIDEND','2010-06-30','13.65','0.00','U',NULL),(351,2,'CLX','DIVIDEND','2010-08-13','12.65','1.90','U',NULL),(380,5,'FFH.TO','DIVIDEND','2010-01-28','177.59','0.00','C',NULL),(383,5,'CDZ.TO','DIVIDEND','2010-04-08','18.22','0.00','C',NULL),(384,5,'CDZ.TO','DIVIDEND','2010-05-06','18.22','0.00','C',NULL),(389,5,'CDZ.TO','DIVIDEND','2010-06-04','18.22','0.00','C',NULL),(396,5,'OMI','DIVIDEND','2010-06-30','9.20','2.76','U',NULL),(397,5,'KMB','DIVIDEND','2010-07-02','15.84','4.75','U',NULL),(398,5,'CDZ.TO','DIVIDEND','2010-07-07','18.49','0.00','C',NULL),(399,5,'KMB','ADJUSTMENT','2010-07-13','-2.38','0.00','U',NULL),(400,5,'KMB','ADJUSTMENT','2010-07-13','4.75','0.00','U',NULL),(401,5,'OMI','ADJUSTMENT','2010-07-13','-1.38','0.00','U',NULL),(402,5,'OMI','ADJUSTMENT','2010-07-13','2.76','0.00','U',NULL),(406,5,'MKC','DIVIDEND','2010-07-20','10.14','1.52','U',NULL),(407,5,'OMI','ADJUSTMENT','2010-07-20','-1.38','0.00','U',NULL),(408,5,'OMI','ADJUSTMENT','2010-07-20','2.76','0.00','U',NULL),(409,5,'CDZ.TO','DIVIDEND','2010-08-06','18.49','0.00','C',NULL),(410,5,'ABT','DIVIDEND','2010-08-16','11.00','1.65','U',NULL),(411,5,'PG','DIVIDEND','2010-08-16','11.56','1.73','U',NULL),(412,5,'SJR-B.TO','DIVIDEND','2010-08-30','10.68','0.00','U',''),(413,4,'RY','DIVIDEND','2010-08-24','14.05','0.00','U',''),(414,5,'COP','DIVIDEND','2010-09-01','30.80','4.62','U',''),(415,5,'AFL','DIVIDEND','2010-09-01','9.52','1.43','U',''),(420,5,'MRU-A.TO','DIVIDEND','2010-09-03','11.90','0.00','C',''),(421,5,'CDZ.TO','DIVIDEND','2010-09-07','18.49','0.00','C',''),(422,3,'WMT','DIVIDEND','2010-09-07','9.08','1.36','U',''),(423,4,'ADM','DIVIDEND','2010-09-09','10.95','1.64','U',''),(424,3,'XOM','DIVIDEND','2010-09-13','11.00','1.65','U',''),(431,2,'JNJ','DIVIDEND','2010-09-15','12.42','1.86','U',''),(432,5,'AZN','DIVIDEND','2010-09-13','23.10','0.00','U',''),(433,4,'JNJ','DIVIDEND','2010-09-14','14.04','2.11','U',''),(434,2,'TAP','DIVIDEND','2010-09-15','9.52','1.43','U',''),(435,5,'SJR-B.TO','DIVIDEND','2010-09-30','10.99','0.00','U',''),(436,5,'OMI','DIVIDEND','2010-09-30','9.20','1.38','U',''),(437,3,'BDX','DIVIDEND','2010-09-30','7.77','1.17','U',''),(438,3,'PEP','DIVIDEND','2010-10-01','11.52','1.73','U',''),(439,2,'KO','DIVIDEND','2010-10-04','12.32','1.85','U',''),(440,5,'KMB','DIVIDEND','2010-10-05','15.84','2.38','U',''),(441,5,'CDZ.TO','DIVIDEND','2010-10-06','18.49','0.00','C',''),(442,3,'SYY','DIVIDEND','2010-10-22','15.50','2.33','U',''),(443,5,'MKC','DIVIDEND','2010-10-25','10.14','1.52','U',''),(444,4,'BNS','DIVIDEND','2010-10-27','15.15','0.00','U',''),(445,2,'MDT','DIVIDEND','2010-10-29','16.88','2.53','U',''),(446,4,'TD','DIVIDEND','2010-11-01','13.77','0.00','U',''),(447,5,'CDZ.TO','DIVIDEND','2010-11-04','18.49','0.00','C',''),(448,2,'CLX','DIVIDEND','2010-11-12','12.65','1.90','U',''),(449,5,'PG','DIVIDEND','2010-11-15','11.56','1.73','U',''),(450,5,'ABT','DIVIDEND','2010-11-15','11.00','1.65','U',''),(451,5,'MRU-A.TO','DIVIDEND','2010-11-16','11.90','0.00','U',''),(452,4,'RY','DIVIDEND','2010-11-24','14.71','0.00','U',''),(453,5,'AFL','DIVIDEND','2010-12-01','10.20','1.53','U',''),(454,5,'COP','DIVIDEND','2010-12-01','30.80','4.62','U',''),(455,5,'CDZ.TO','DIVIDEND','2010-12-06','18.49','0.00','C',''),(456,4,'ADM','DIVIDEND','2010-12-09','10.95','1.64','U',''),(457,3,'XOM','DIVIDEND','2010-12-10','11.00','1.65','U',''),(458,2,'JNJ','DIVIDEND','2010-12-15','12.42','1.86','U','test'),(459,2,'KO','DIVIDEND','2010-12-15','12.32','1.85','U','test'),(460,2,'TAP','DIVIDEND','2010-12-15','9.52','1.43','U','test'),(463,4,'JNJ','DIVIDEND','2010-12-14','14.04','2.11','U','test'),(464,5,'BAC','DIVIDEND','2010-12-24','1.35','0.20','U','test'),(465,2,'BAC','DIVIDEND','2010-12-24','1.18','0.18','U','test'),(466,5,'OMI','DIVIDEND','2010-12-31','19.47','2.92','U',''),(467,3,'BDX','DIVIDEND','2010-12-31','8.61','1.29','U',''),(468,3,'PEP','DIVIDEND','2011-01-03','11.52','1.73','U',''),(469,3,'WMT','DIVIDEND','2011-01-03','9.08','1.36','U','');
/*!40000 ALTER TABLE `cashhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holdingsdata`
--

DROP TABLE IF EXISTS `holdingsdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holdingsdata` (
  `Symbol` varchar(10) NOT NULL,
  `industry` varchar(45) NOT NULL,
  `growthRate` float NOT NULL,
  PRIMARY KEY (`Symbol`),
  KEY `fk_holdingsData_holdings` (`Symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holdingsdata`
--

LOCK TABLES `holdingsdata` WRITE;
/*!40000 ALTER TABLE `holdingsdata` DISABLE KEYS */;
INSERT INTO `holdingsdata` VALUES ('ABT','Unknown',10),('ADM','Unknown',10),('AFL','Unknown',10),('AZN','Unknown',10),('BAC','Financial',-11.89),('BDX','Unknown',10),('BNS','Unknown',10),('BP','Unknown',10),('CASH','CASH',0),('CDZ.TO','Unknown',4.9),('CLX','Consumer/Non-Cyclical',3.4),('COP','Unknown',10),('FFH.TO','Unknown',2.6),('JNJ','Drug Manufacturers - Major',10),('KFT','Unknown',10),('KMB','Unknown',10),('KO','Beverages - Soft Drinks',10),('MDT','Healthcare',18.43),('MKC','Unknown',10),('MRU-A.TO','Unknown',10),('NVS','Healthcare',13.65),('OMI','Unknown',10),('PEP','Unknown',10),('PG','Unknown',10),('RY','Unknown',10),('SJR-B.TO','Unknown',10),('SNY','Unknown',10),('SYY','Unknown',10),('T','Telecom Services',10),('TAP','Beverages - Brewers',10),('TD','Unknown',10),('TRP','Gas Utilities',10),('WMT','Unknown',10),('XOM','Unknown',10);
/*!40000 ALTER TABLE `holdingsdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `viewallcash`
--

DROP TABLE IF EXISTS `viewallcash`;
/*!50001 DROP VIEW IF EXISTS `viewallcash`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewallcash` (
  `PortfolioID` int(11),
  `Symbol` varchar(10),
  `type` varchar(10),
  `date` date,
  `amount` decimal(21,9),
  `Tax` decimal(18,2),
  `Currency` char(1),
  `value` decimal(22,9),
  `note` varchar(256)
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `viewallcash`
--

/*!50001 DROP TABLE IF EXISTS `viewallcash`*/;
/*!50001 DROP VIEW IF EXISTS `viewallcash`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewallcash` AS select `deposithistory`.`portfolioID` AS `PortfolioID`,'CASH' AS `Symbol`,`deposithistory`.`type` AS `type`,`deposithistory`.`date` AS `date`,`deposithistory`.`amount` AS `amount`,0 AS `Tax`,`deposithistory`.`currency` AS `Currency`,`deposithistory`.`amount` AS `value`,`deposithistory`.`note` AS `note` from `deposithistory` union all select `cashhistory`.`portfolioID` AS `PortfolioID`,`cashhistory`.`sourcesymbol` AS `sourceSymbol`,`cashhistory`.`type` AS `type`,`cashhistory`.`date` AS `date`,`cashhistory`.`Amount` AS `amount`,`cashhistory`.`Tax` AS `Tax`,`cashhistory`.`currency` AS `Currency`,(`cashhistory`.`Amount` - `cashhistory`.`Tax`) AS `value`,`cashhistory`.`sourcesymbol` AS `note` from `cashhistory` union all select `purchasehistory`.`portfolioID` AS `PortfolioID`,`purchasehistory`.`symbol` AS `symbol`,`purchasehistory`.`type` AS `type`,`purchasehistory`.`date` AS `date`,((-(1) * `purchasehistory`.`shares`) * `purchasehistory`.`price`) AS `amount`,0 AS `tax`,`purchasehistory`.`currency` AS `Currency`,(((-(1) * `purchasehistory`.`shares`) * `purchasehistory`.`price`) - `purchasehistory`.`commission`) AS `value`,'' AS `note` from `purchasehistory` order by `date` desc,`type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'webportfolio'
--
/*!50003 DROP FUNCTION IF EXISTS `functionCalculateAnnualGrowthRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `functionCalculateAnnualGrowthRate`(
        pID integer,
        symbol varchar(10),
        currentPrice float
    ) RETURNS double(10,2)
BEGIN

declare growthRate double (10,2);
declare totalShares double(10,2);

set totalShares = (select sum(shares)
                    FROM `webportfolio`.`purchasehistory` as history
                    where (portfolioID = pID or pID = 1)
                   and history.symbol = symbol);
                   
set growthRate = (SELECT 
Sum(shares/totalShares*(pow(currentPrice/price,1/((to_days(current_Date()) - to_days(date))/365)) - 1)*100) as `Growth Rate`
FROM `webportfolio`.`purchasehistory` as `history`
where (portfolioID = pID or pID = 1) 
    and `history`.symbol = symbol 
    and to_days(current_Date()) - to_days(date) > 30);

return growthRate;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `functionConvertCurrency` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `functionConvertCurrency`(
        amount double(10,2),
        exchangeRate float,
        currency char(1),
        resultCurrency char(1)
    ) RETURNS double(10,2)
BEGIN
    declare total double(10,2);
    
    if currency = 'C' then
        set total = amount/exchangeRate;
    else
        set total = amount;
    end if;
    
    if resultCurrency = 'C' then
        return total*exchangeRate;
    end if;
    
    return total;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `functionTotalCash` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `functionTotalCash`(
        pID int,
        exchangeRate float,
        resultingCurrency char(1)
    ) RETURNS double(10,2)
BEGIN
    declare canadian float;
    declare american float;
    
    set canadian =  (SELECT sum(value) 
                    FROM webportfolio.viewallcash
                    where currency = "C" 
                        and (portfolioID = pID
                            or pID = 1)) ;

    set american =  (SELECT sum(value) 
                    FROM webportfolio.viewallcash
                    where currency = "U" 
                        and (portfolioID = pID
                            or pID = 1)) ;
    if canadian is null then
        set canadian = 0;
    end if;
    if american is null then
        set american = 0;
    end if;
    if resultingCurrency = 'U' then    
        return canadian/exchangeRate + american;
    else
        return american*exchangeRate + canadian;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `functionTotalCost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 FUNCTION `functionTotalCost`(
        pID int,
        exchangeRate float,
        resultingCurrency char(1)        
    ) RETURNS double(10,2)
BEGIN
    declare canadian float;
    declare american float;
    
    set canadian =  (SELECT sum(amount) 
                    FROM webportfolio.deposithistory
                    where type = "DEPOSIT" 
                        and currency = "C" 
                        and (portfolioID = pID
                            or pID = 1)) ;

    set american =  (SELECT sum(amount) 
                    FROM webportfolio.deposithistory
                    where type = "DEPOSIT" 
                        and currency = "U" 
                        and (portfolioID = pID
                            or pID = 1)) ;
    if canadian is null then
        set canadian = 0;
    end if;
    if american is null then
        set american = 0;
    end if;
    if resultingCurrency = 'U' then    
        return canadian/exchangeRate + american;
    else
        return american*exchangeRate + canadian;
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `routineInsertHolding` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `routineInsertHolding`(portfolioID int, 
                                  symbol varchar(10), 
                                  industry varchar(45),
                                  growthRate float,
                                  purchaseType varchar(4),
                                  shares double(10,5),                                  
                                  purchaseDate date,
                                  purchasePrice float,                                  
                                  commission float,
                                  currency char(1),
                                  note varchar(256))
BEGIN
    declare dataCount  int;
    declare amount float;
    
    select count(*) into dataCount
    from holdingsData as h
    where h.symbol = symbol;    
    
    /*
        first insert all the data if this is a new symbol
    */
    if dataCount = 0 then 
        insert into holdingsdata(`symbol`, `Industry`, `growthRate`)
        values(symbol,industry,growthRate);
    end if;
    
    select count(*) into dataCount
    from holdings as h
    where h.symbol = symbol and h.portfolioID = portfolioID;        
    
    if dataCount = 0 then     
        insert into holdings (`PortfolioID`, `Symbol`)
        values(portfolioID, symbol);
    end if;
    
    /*
        now save the purchase data
    */

    if purchaseType = 'SELL' then               
        set shares = -1*shares;              
    end if;    
    
    insert into `webportfolio`.`purchaseHistory` 
    (`PortfolioID`, `Symbol`, `Shares`, `date`, `price`, `type`, `Commission`, `Currency`) 
    VALUES (portfolioID, symbol, shares, purchaseDate, purchasePrice, purchaseType, commission, currency);    
 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `routineModifyCash` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `routineModifyCash`(PortfolioID int,
                                    sourceSymbol varchar(10),
                                    TransactionType varchar(10),
                                    TransactionDate date,
                                    amountOut float,
                                    amountIn float,
                                    commission float,
                                    tax float,
                                    currency char(1),
                                    note varchar(256))
BEGIN
    declare total float;
    declare newCurrency char(1);
    set total = amountOut;
    
    if transactionType = 'WITHDRAWAL' or transactionType = 'EXCHANGE' then
        set total = -1*amountOut - commission;
    else
        set total = amountOut - commission;
    end if;
    
    if sourceSymbol = 'CASH' then    
        insert into `webportfolio`.`depositHistory` 
        (`PortfolioID`, `type`, `date`, `amount`, `currency`, `note`) 
        VALUES (PortfolioID, TransactionType, TransactionDate, total, currency, note);
        /*
            if it's an exchange then another entry is added
        */        
        if transactionType = 'EXCHANGE' then
            if currency = 'C' then
                set newCurrency = 'U';
            else
                set newCurrency = 'C';
            end if;
            insert into `webportfolio`.`depositHistory` 
            (`PortfolioID`, `type`, `date`, `amount`, `currency`, `note`) 
            VALUES (PortfolioID, TransactionType, TransactionDate, amountIn, newCurrency, note);                       
        end if;        
    else
        insert into `webportfolio`.`cashHistory` 
        (`PortfolioID`, `sourceSymbol`, `type`, `date`, `amount`, `tax`, `currency`, `note`) 
        VALUES (PortfolioID, sourceSymbol, TransactionType, TransactionDate, total, tax, currency, note);
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tempViewAllCash` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `tempViewAllCash`()
BEGIN

select PortfolioID,
       'CASH' AS `Symbol`,
       type,
       date,
       amount,
       0 AS `Tax`,
       Currency,
       amount AS `value`,
       note as `note`
from `deposithistory` 
union all
select PortfolioID, 
       sourceSymbol,
       type,
       date,
       amount,
       Tax,
       Currency,
       (`cashhistory`.`Amount` - `cashhistory`.`Tax`) AS `value` ,
       sourceSymbol as `note`
from `cashhistory` 
union all
select PortfolioID, 
       symbol,
       type,
       date,
       -1*shares*price as `amount`,
       0 as tax,
       Currency,
       (-1*shares*price - commission) AS `value` ,
       '' as `note`
from `purchasehistory` 
order by `date` desc, `type`;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewHoldings` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `viewHoldings`(
        pID int,
        exchangeRate float,
        resultingCurrency char(1)
    )
BEGIN
    
    if pID = 1 then
        select `data`.symbol, 
                industry,
                growthRate,
                sum(shares) as `shares`, 
                price,
                currency,
                sum(functionConvertCurrency((shares * price + commission),exchangeRate,currency,resultingCurrency)) as `totalCost`,
                0 as `marketValue`
        from webportfolio.purchasehistory as `purchase`
        left join holdingsData as `data`
        on `data`.symbol = `purchase`.symbol
        group by `purchase`.symbol
        union all
        select  "CASH" as `symbol`,
                "industry" as `CASH`,
                0 as `growthRate`,
                1 as `shares`,
                0 as price,
                "U" as `currency`,
                functionTotalCash(pID,exchangeRate,resultingCurrency) as `totalCost`,
                functionTotalCash(pID,exchangeRate,resultingCurrency) as `marketValue`;  
    else
        select `data`.symbol, 
                industry,
                growthRate,
                sum(shares) as `shares`, 
                price,
                currency,
                sum(functionConvertCurrency((shares * price + commission),exchangeRate,currency,resultingCurrency)) as `totalCost`,
                0 as `marketValue`
        from webportfolio.purchasehistory as `purchase`
        left join holdingsData as `data`
        on `data`.symbol = `purchase`.symbol
        group by `purchase`.portfolioID, `purchase`.symbol        
        having `purchase`.portfolioID = pID        
        union
        select  "CASH" as `symbol`,
                "industry" as `CASH`,
                0 as `growthRate`,
                1 as `shares`,
                0 as price,
                "U" as `currency`,
                functionTotalCash(pID,exchangeRate,resultingCurrency) as `totalCost`,
                functionTotalCash(pID,exchangeRate,resultingCurrency) as `marketValue`
        from viewAllCash as `cash`
        where `cash`.portfolioID = pID;
    end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewPurchaseHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `viewPurchaseHistory`(
        pID int,
        symbol varchar(10)
    )
BEGIN
    select *, (shares * price + commission) as Value 
    from purchaseHistory as history
    where history.symbol = symbol
        and (history.portfolioID = pID
            or pID = 1);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewPurchaseTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `viewPurchaseTotal`(
        pID int,
        symbol varchar(10)
    )
BEGIN
    SELECT *, sum(shares * price + commission) as total 
    FROM `webportfolio`.`purchasehistory` as history
    where history.symbol = symbol
        and (history.portfolioID = pID
            or pID = 1)
    group by symbol;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewTransactionHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `viewTransactionHistory`(
        pID int,
        symbol varchar(10)
    )
BEGIN
        if symbol = "CASH" then
            select *
            from ViewAllCash
            where portfolioID = pID or pID = 1
            order by date desc, type;       
        else
            SELECT *, amount - tax as Value
            FROM `webportfolio`.`cashHistory` as history     
            where (history.type = "DIVIDEND" 
                    or history.type = "ADJUSTMENT")
                and history.sourceSymbol = symbol
                and (history.portfolioID = pID
                    or pID = 1);
        end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `viewTransactionsTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `viewTransactionsTotal`(
        pID int,
        symbol varchar(10),
        exchangeRate float,
        resultingCurrency char(1)
    )
BEGIN
    if symbol = "CASH" then
        select functionTotalCash(pID, exchangeRate, resultingCurrency) as `total`;
    else
        SELECT *, sum(amount - tax)  as `total`
        FROM `webportfolio`.`cashhistory` as history
        where history.type = 'dividend' 
            and history.sourceSymbol = symbol
            and (history.portfolioID = pID or PID = 1)
        group by sourceSymbol;   
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-01-07 17:11:59
