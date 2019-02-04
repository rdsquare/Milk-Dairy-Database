-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: mds
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

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
-- Table structure for table `AddMilkLog`
--

DROP TABLE IF EXISTS `AddMilkLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AddMilkLog` (
  `ACustID` char(13) NOT NULL,
  `OfDate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IsMorning` char(1) DEFAULT NULL,
  `AnimalName` char(20) DEFAULT NULL,
  `Quantity` float DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `IsKg` char(1) DEFAULT NULL,
  `LocalDID` char(6) NOT NULL,
  PRIMARY KEY (`ACustID`,`DateATime`,`OfDate`,`LocalDID`),
  KEY `FK_AMLACID` (`ACustID`,`LocalDID`),
  CONSTRAINT `FK_AMLACID` FOREIGN KEY (`ACustID`, `LocalDID`) REFERENCES `AdditionalCust` (`Contact`, `LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AddMilkLog`
--

LOCK TABLES `AddMilkLog` WRITE;
/*!40000 ALTER TABLE `AddMilkLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `AddMilkLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdditionalCust`
--

DROP TABLE IF EXISTS `AdditionalCust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdditionalCust` (
  `Contact` char(13) NOT NULL,
  `CustName` char(50) DEFAULT NULL,
  `LocalDID` char(6) NOT NULL,
  PRIMARY KEY (`Contact`,`LocalDID`),
  KEY `FK_ACLDID` (`LocalDID`),
  CONSTRAINT `FK_ACLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdditionalCust`
--

LOCK TABLES `AdditionalCust` WRITE;
/*!40000 ALTER TABLE `AdditionalCust` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdditionalCust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnimalFood`
--

DROP TABLE IF EXISTS `AnimalFood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnimalFood` (
  `ProductID` char(10) NOT NULL,
  `Appearance` varchar(20) DEFAULT NULL,
  `Ingredients` varchar(100) DEFAULT NULL,
  `LocalDID` char(6) NOT NULL,
  PRIMARY KEY (`ProductID`,`LocalDID`),
  CONSTRAINT `FK_AFPID` FOREIGN KEY (`ProductID`, `LocalDID`) REFERENCES `Product` (`ProductID`, `LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnimalFood`
--

LOCK TABLES `AnimalFood` WRITE;
/*!40000 ALTER TABLE `AnimalFood` DISABLE KEYS */;
/*!40000 ALTER TABLE `AnimalFood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnimalMedicine`
--

DROP TABLE IF EXISTS `AnimalMedicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnimalMedicine` (
  `ProductID` char(10) NOT NULL,
  `Apperance` varchar(20) DEFAULT NULL,
  `FromWhere` varchar(100) DEFAULT NULL,
  `AnimalType` varchar(20) DEFAULT NULL,
  `LocalDID` char(6) NOT NULL,
  PRIMARY KEY (`ProductID`,`LocalDID`),
  CONSTRAINT `FK_AMPID` FOREIGN KEY (`ProductID`, `LocalDID`) REFERENCES `Product` (`ProductID`, `LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnimalMedicine`
--

LOCK TABLES `AnimalMedicine` WRITE;
/*!40000 ALTER TABLE `AnimalMedicine` DISABLE KEYS */;
/*!40000 ALTER TABLE `AnimalMedicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AttendenceLog`
--

DROP TABLE IF EXISTS `AttendenceLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AttendenceLog` (
  `EmpID` int(11) NOT NULL,
  `OfDate` date NOT NULL,
  `IsMorning` char(1) NOT NULL,
  `IsPresent` char(1) DEFAULT NULL,
  PRIMARY KEY (`EmpID`,`OfDate`,`IsMorning`),
  CONSTRAINT `FK_ALEID` FOREIGN KEY (`EmpID`) REFERENCES `Employee` (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AttendenceLog`
--

LOCK TABLES `AttendenceLog` WRITE;
/*!40000 ALTER TABLE `AttendenceLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `AttendenceLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BankAccountNo`
--

DROP TABLE IF EXISTS `BankAccountNo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BankAccountNo` (
  `BID` int(11) NOT NULL,
  `DCAccount` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BID`),
  CONSTRAINT `FK_BANBID` FOREIGN KEY (`BID`) REFERENCES `BankInfo` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BankAccountNo`
--

LOCK TABLES `BankAccountNo` WRITE;
/*!40000 ALTER TABLE `BankAccountNo` DISABLE KEYS */;
/*!40000 ALTER TABLE `BankAccountNo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BankInfo`
--

DROP TABLE IF EXISTS `BankInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BankInfo` (
  `BID` int(11) NOT NULL,
  `NameOnAccount` varchar(30) DEFAULT NULL,
  `ACType` varchar(20) DEFAULT NULL,
  `BankName` varchar(30) DEFAULT NULL,
  `IFSC_Code` varchar(20) DEFAULT NULL,
  `BranchName` varchar(50) DEFAULT NULL,
  `CVV` char(3) DEFAULT NULL,
  `Expdate` date DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BankInfo`
--

LOCK TABLES `BankInfo` WRITE;
/*!40000 ALTER TABLE `BankInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `BankInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BranchMilkLog`
--

DROP TABLE IF EXISTS `BranchMilkLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BranchMilkLog` (
  `BranchID` char(6) NOT NULL,
  `Ofdate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IsMorning` char(1) NOT NULL,
  `TMQuantity` float DEFAULT NULL,
  `TClyQuantity` int(11) DEFAULT NULL,
  `CSN` char(7) DEFAULT NULL,
  `FAT` float DEFAULT NULL,
  `SNF` float DEFAULT NULL,
  `WaterP` float DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `IsKg` char(1) DEFAULT NULL,
  `ArriveTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TransID` int(11) DEFAULT NULL,
  `MilkTypeID` int(11) DEFAULT NULL,
  `LocalDID` char(6) NOT NULL,
  PRIMARY KEY (`BranchID`,`Ofdate`,`DateATime`,`IsMorning`,`LocalDID`),
  KEY `FK_BMLTID` (`TransID`),
  KEY `FK_BMLMTID` (`MilkTypeID`),
  KEY `FK_BMLLDID` (`LocalDID`),
  CONSTRAINT `FK_BMLBID` FOREIGN KEY (`BranchID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_BMLLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_BMLMTID` FOREIGN KEY (`MilkTypeID`) REFERENCES `MilkType` (`MilkTypeID`),
  CONSTRAINT `FK_BMLTID` FOREIGN KEY (`TransID`) REFERENCES `Transport` (`TransID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BranchMilkLog`
--

LOCK TABLES `BranchMilkLog` WRITE;
/*!40000 ALTER TABLE `BranchMilkLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `BranchMilkLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BranchPayLog`
--

DROP TABLE IF EXISTS `BranchPayLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BranchPayLog` (
  `BranchID` char(6) NOT NULL,
  `ToDate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TotalMilkAmount` double DEFAULT NULL,
  `AdvAmount` double DEFAULT NULL,
  `AmountTBPay` double DEFAULT NULL,
  `Paid` double DEFAULT NULL,
  `PayTypeNo` int(11) DEFAULT NULL,
  `PayDetail` varchar(300) DEFAULT NULL,
  `PayAccount` varchar(300) DEFAULT NULL,
  `ToBID` int(11) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`BranchID`,`ToDate`,`DateATime`),
  KEY `FK_BPLPTN` (`PayTypeNo`),
  KEY `FK_BPLTBID` (`ToBID`),
  KEY `FK_BPLLDID` (`LocalDID`),
  CONSTRAINT `FK_BPLBID` FOREIGN KEY (`BranchID`) REFERENCES `DairyHB` (`LocalDID`),
  CONSTRAINT `FK_BPLLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_BPLPTN` FOREIGN KEY (`PayTypeNo`) REFERENCES `PayType` (`PayTypeNo`),
  CONSTRAINT `FK_BPLTBID` FOREIGN KEY (`ToBID`) REFERENCES `BankInfo` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BranchPayLog`
--

LOCK TABLES `BranchPayLog` WRITE;
/*!40000 ALTER TABLE `BranchPayLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `BranchPayLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConsDebit`
--

DROP TABLE IF EXISTS `ConsDebit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsDebit` (
  `ConsID` char(10) NOT NULL,
  `OnDate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DebAmount` double DEFAULT NULL,
  `PayTypeNo` int(11) DEFAULT NULL,
  `PayDetail` varchar(300) DEFAULT NULL,
  `PayAccount` varchar(300) DEFAULT NULL,
  `ToBID` int(11) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`ConsID`,`OnDate`,`DateATime`),
  KEY `FK_CDPTN` (`PayTypeNo`),
  KEY `FK_CDTBID` (`ToBID`),
  KEY `FK_CDLDID` (`LocalDID`),
  CONSTRAINT `FK_CDCID` FOREIGN KEY (`ConsID`) REFERENCES `Consumer` (`ConsID`),
  CONSTRAINT `FK_CDLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_CDPTN` FOREIGN KEY (`PayTypeNo`) REFERENCES `PayType` (`PayTypeNo`),
  CONSTRAINT `FK_CDTBID` FOREIGN KEY (`ToBID`) REFERENCES `BankInfo` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConsDebit`
--

LOCK TABLES `ConsDebit` WRITE;
/*!40000 ALTER TABLE `ConsDebit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsDebit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConsMilkLog`
--

DROP TABLE IF EXISTS `ConsMilkLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsMilkLog` (
  `ConsID` char(10) NOT NULL,
  `OfDate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IsMorning` char(1) DEFAULT NULL,
  `Quantity` float DEFAULT NULL,
  `SNF` float DEFAULT NULL,
  `WaterP` char(4) DEFAULT NULL,
  `FAT` float DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `MilkTypeID` int(11) DEFAULT NULL,
  `IsKg` char(1) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`ConsID`,`OfDate`,`DateATime`),
  KEY `FK_CMLMTID` (`MilkTypeID`),
  KEY `FK_CMLLDID` (`LocalDID`),
  CONSTRAINT `FK_CMLCID` FOREIGN KEY (`ConsID`) REFERENCES `Consumer` (`ConsID`),
  CONSTRAINT `FK_CMLLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_CMLMTID` FOREIGN KEY (`MilkTypeID`) REFERENCES `MilkType` (`MilkTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConsMilkLog`
--

LOCK TABLES `ConsMilkLog` WRITE;
/*!40000 ALTER TABLE `ConsMilkLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsMilkLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConsPay`
--

DROP TABLE IF EXISTS `ConsPay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsPay` (
  `ConsID` char(10) NOT NULL,
  `ToDate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TotalMilkAmount` double DEFAULT NULL,
  `DebitAmount` double DEFAULT NULL,
  `AmountTBPay` double DEFAULT NULL,
  `Paid` double DEFAULT NULL,
  `PayTypeNo` int(11) DEFAULT NULL,
  `PayDetail` varchar(300) DEFAULT NULL,
  `PayAccount` varchar(300) DEFAULT NULL,
  `ToBID` int(11) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`ConsID`,`ToDate`,`DateATime`),
  KEY `FK_CPPTN` (`PayTypeNo`),
  KEY `FK_CPTBID` (`ToBID`),
  KEY `FK_CPLDID` (`LocalDID`),
  CONSTRAINT `FK_CPCID` FOREIGN KEY (`ConsID`) REFERENCES `Consumer` (`ConsID`),
  CONSTRAINT `FK_CPLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_CPPTN` FOREIGN KEY (`PayTypeNo`) REFERENCES `PayType` (`PayTypeNo`),
  CONSTRAINT `FK_CPTBID` FOREIGN KEY (`ToBID`) REFERENCES `BankInfo` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConsPay`
--

LOCK TABLES `ConsPay` WRITE;
/*!40000 ALTER TABLE `ConsPay` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsPay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Consumer`
--

DROP TABLE IF EXISTS `Consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Consumer` (
  `ConsID` char(10) NOT NULL,
  `ConsFName` varchar(20) DEFAULT NULL,
  `ConsMName` varchar(20) DEFAULT NULL,
  `ConsLName` varchar(20) DEFAULT NULL,
  `Pcontact` char(13) DEFAULT NULL,
  `Scontact` char(13) DEFAULT NULL,
  `Street` varchar(40) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Pincode` char(6) DEFAULT NULL,
  `Email_ID` varchar(50) DEFAULT NULL,
  `IsApp` char(1) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`ConsID`),
  KEY `FK_CLDID` (`LocalDID`),
  CONSTRAINT `FK_CLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consumer`
--

LOCK TABLES `Consumer` WRITE;
/*!40000 ALTER TABLE `Consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConsumerAccount`
--

DROP TABLE IF EXISTS `ConsumerAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsumerAccount` (
  `ConsID` char(10) NOT NULL,
  `BID` int(11) NOT NULL,
  PRIMARY KEY (`ConsID`,`BID`),
  KEY `FK_CABID` (`BID`),
  CONSTRAINT `FK_CABID` FOREIGN KEY (`BID`) REFERENCES `BankInfo` (`BID`),
  CONSTRAINT `FK_CACID` FOREIGN KEY (`ConsID`) REFERENCES `Consumer` (`ConsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConsumerAccount`
--

LOCK TABLES `ConsumerAccount` WRITE;
/*!40000 ALTER TABLE `ConsumerAccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsumerAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ConsumerPAE`
--

DROP TABLE IF EXISTS `ConsumerPAE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ConsumerPAE` (
  `ConsID` char(10) NOT NULL,
  `AdhaarNo` char(12) DEFAULT NULL,
  PRIMARY KEY (`ConsID`),
  CONSTRAINT `FK_CPAECID` FOREIGN KEY (`ConsID`) REFERENCES `Consumer` (`ConsID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ConsumerPAE`
--

LOCK TABLES `ConsumerPAE` WRITE;
/*!40000 ALTER TABLE `ConsumerPAE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ConsumerPAE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dairy`
--

DROP TABLE IF EXISTS `Dairy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Dairy` (
  `LocalDID` char(6) NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `Street` varchar(40) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `EstDate` date DEFAULT NULL,
  `Tagline` varchar(50) DEFAULT NULL,
  `Logo` blob,
  `Description` varchar(500) DEFAULT NULL,
  `Website` varchar(40) DEFAULT NULL,
  `Pincode` char(6) DEFAULT NULL,
  PRIMARY KEY (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dairy`
--

LOCK TABLES `Dairy` WRITE;
/*!40000 ALTER TABLE `Dairy` DISABLE KEYS */;
/*!40000 ALTER TABLE `Dairy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DairyAccountNo`
--

DROP TABLE IF EXISTS `DairyAccountNo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DairyAccountNo` (
  `BID` int(11) NOT NULL,
  `DCAccountNo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`BID`),
  CONSTRAINT `FK_DANBID` FOREIGN KEY (`BID`) REFERENCES `DairyPayInfo` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DairyAccountNo`
--

LOCK TABLES `DairyAccountNo` WRITE;
/*!40000 ALTER TABLE `DairyAccountNo` DISABLE KEYS */;
/*!40000 ALTER TABLE `DairyAccountNo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DairyHB`
--

DROP TABLE IF EXISTS `DairyHB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DairyHB` (
  `LocalDID` char(6) NOT NULL,
  `HBID` char(6) NOT NULL,
  `IsActive` char(1) DEFAULT NULL,
  PRIMARY KEY (`LocalDID`,`HBID`),
  KEY `FK_DHHBID` (`HBID`),
  CONSTRAINT `FK_DHHBID` FOREIGN KEY (`HBID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_DHLID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DairyHB`
--

LOCK TABLES `DairyHB` WRITE;
/*!40000 ALTER TABLE `DairyHB` DISABLE KEYS */;
/*!40000 ALTER TABLE `DairyHB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DairyOwner`
--

DROP TABLE IF EXISTS `DairyOwner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DairyOwner` (
  `OwnerID` char(6) NOT NULL,
  `DOFName` varchar(10) DEFAULT NULL,
  `DOMName` varchar(10) DEFAULT NULL,
  `DOLName` varchar(10) DEFAULT NULL,
  `ProfilePic` blob,
  `FAP` blob,
  `BAP` blob,
  `PContact` char(13) DEFAULT NULL,
  `SContact` char(13) DEFAULT NULL,
  `Street` varchar(40) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Pincode` char(6) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DairyOwner`
--

LOCK TABLES `DairyOwner` WRITE;
/*!40000 ALTER TABLE `DairyOwner` DISABLE KEYS */;
/*!40000 ALTER TABLE `DairyOwner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DairyOwnerAadhaar`
--

DROP TABLE IF EXISTS `DairyOwnerAadhaar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DairyOwnerAadhaar` (
  `OwnerID` char(6) NOT NULL,
  `AadhaarCard` char(12) DEFAULT NULL,
  PRIMARY KEY (`OwnerID`),
  CONSTRAINT `FK_DOADHOID` FOREIGN KEY (`OwnerID`) REFERENCES `DairyOwner` (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DairyOwnerAadhaar`
--

LOCK TABLES `DairyOwnerAadhaar` WRITE;
/*!40000 ALTER TABLE `DairyOwnerAadhaar` DISABLE KEYS */;
/*!40000 ALTER TABLE `DairyOwnerAadhaar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DairyOwnerLog`
--

DROP TABLE IF EXISTS `DairyOwnerLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DairyOwnerLog` (
  `LocalDID` char(6) NOT NULL,
  `OwnerID` char(6) DEFAULT NULL,
  PRIMARY KEY (`LocalDID`),
  KEY `FK_DOLOID` (`OwnerID`),
  CONSTRAINT `FK_DOLLID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_DOLOID` FOREIGN KEY (`OwnerID`) REFERENCES `DairyOwner` (`OwnerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DairyOwnerLog`
--

LOCK TABLES `DairyOwnerLog` WRITE;
/*!40000 ALTER TABLE `DairyOwnerLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `DairyOwnerLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DairyPayInfo`
--

DROP TABLE IF EXISTS `DairyPayInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DairyPayInfo` (
  `BID` int(11) NOT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  `NameOnAccount` varchar(30) DEFAULT NULL,
  `ACType` varchar(20) DEFAULT NULL,
  `BankName` varchar(30) DEFAULT NULL,
  `IFSC_Code` varchar(20) DEFAULT NULL,
  `BranchName` varchar(50) DEFAULT NULL,
  `CVV` char(3) DEFAULT NULL,
  `Expdate` date DEFAULT NULL,
  PRIMARY KEY (`BID`),
  KEY `FK_DPILID` (`LocalDID`),
  CONSTRAINT `FK_DPILID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DairyPayInfo`
--

LOCK TABLES `DairyPayInfo` WRITE;
/*!40000 ALTER TABLE `DairyPayInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `DairyPayInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DairyPicture`
--

DROP TABLE IF EXISTS `DairyPicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DairyPicture` (
  `ImgNo` int(11) NOT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  `Picture` blob,
  PRIMARY KEY (`ImgNo`),
  KEY `FK_DPLID` (`LocalDID`),
  CONSTRAINT `FK_DPLID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DairyPicture`
--

LOCK TABLES `DairyPicture` WRITE;
/*!40000 ALTER TABLE `DairyPicture` DISABLE KEYS */;
/*!40000 ALTER TABLE `DairyPicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DairyRequestLog`
--

DROP TABLE IF EXISTS `DairyRequestLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DairyRequestLog` (
  `SendDateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SendDairy` char(6) NOT NULL,
  `ToDairy` char(6) NOT NULL,
  `IsDeniedAccept` char(1) DEFAULT NULL,
  `AcceptDeniedDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `RForHD` char(1) DEFAULT NULL,
  PRIMARY KEY (`SendDateTime`,`SendDairy`,`ToDairy`),
  KEY `FK_DRLSD` (`SendDairy`),
  KEY `FK_DRLTD` (`ToDairy`),
  CONSTRAINT `FK_DRLSD` FOREIGN KEY (`SendDairy`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_DRLTD` FOREIGN KEY (`ToDairy`) REFERENCES `Dairy` (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DairyRequestLog`
--

LOCK TABLES `DairyRequestLog` WRITE;
/*!40000 ALTER TABLE `DairyRequestLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `DairyRequestLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DairyWPED`
--

DROP TABLE IF EXISTS `DairyWPED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DairyWPED` (
  `LocalDID` char(6) NOT NULL,
  `Email_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LocalDID`),
  CONSTRAINT `FK_DWLID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DairyWPED`
--

LOCK TABLES `DairyWPED` WRITE;
/*!40000 ALTER TABLE `DairyWPED` DISABLE KEYS */;
/*!40000 ALTER TABLE `DairyWPED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `DepID` char(2) NOT NULL,
  `DepName` varchar(40) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `LocalDID` char(6) NOT NULL,
  PRIMARY KEY (`DepID`,`LocalDID`),
  KEY `FK_DLDID` (`LocalDID`),
  CONSTRAINT `FK_DLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DepartmentMang`
--

DROP TABLE IF EXISTS `DepartmentMang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DepartmentMang` (
  `MangID` int(11) NOT NULL,
  `DepID` char(2) DEFAULT NULL,
  PRIMARY KEY (`MangID`),
  KEY `FK_DMDID` (`DepID`),
  CONSTRAINT `FK_DMDID` FOREIGN KEY (`DepID`) REFERENCES `Department` (`DepID`),
  CONSTRAINT `FK_DMMID` FOREIGN KEY (`MangID`) REFERENCES `Employee` (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DepartmentMang`
--

LOCK TABLES `DepartmentMang` WRITE;
/*!40000 ALTER TABLE `DepartmentMang` DISABLE KEYS */;
/*!40000 ALTER TABLE `DepartmentMang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmpDebit`
--

DROP TABLE IF EXISTS `EmpDebit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmpDebit` (
  `EmpID` int(11) NOT NULL,
  `OnDate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AdvAmount` double DEFAULT NULL,
  `PayTypeNo` int(11) DEFAULT NULL,
  `PayDetail` varchar(300) DEFAULT NULL,
  `PayAccount` varchar(300) DEFAULT NULL,
  `ToBID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EmpID`,`OnDate`),
  KEY `FK_EDPTN` (`PayTypeNo`),
  KEY `FK_EDTBID` (`ToBID`),
  CONSTRAINT `FK_EDEPID` FOREIGN KEY (`EmpID`) REFERENCES `Employee` (`EmpID`),
  CONSTRAINT `FK_EDPTN` FOREIGN KEY (`PayTypeNo`) REFERENCES `PayType` (`PayTypeNo`),
  CONSTRAINT `FK_EDTBID` FOREIGN KEY (`ToBID`) REFERENCES `BankInfo` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmpDebit`
--

LOCK TABLES `EmpDebit` WRITE;
/*!40000 ALTER TABLE `EmpDebit` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmpDebit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmpPay`
--

DROP TABLE IF EXISTS `EmpPay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmpPay` (
  `EmpID` int(11) NOT NULL,
  `ToDate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TotalSalaryAmount` double DEFAULT NULL,
  `AdvAmount` double DEFAULT NULL,
  `ProductAmount` double DEFAULT NULL,
  `Paid` double DEFAULT NULL,
  `PayTypeNo` int(11) DEFAULT NULL,
  `PayDetail` varchar(300) DEFAULT NULL,
  `PayAccount` varchar(300) DEFAULT NULL,
  `ToBID` int(11) DEFAULT NULL,
  `Salary` double DEFAULT NULL,
  PRIMARY KEY (`EmpID`,`ToDate`,`DateATime`),
  KEY `FK_EPPTN` (`PayTypeNo`),
  KEY `FK_EPTEBID` (`ToBID`),
  CONSTRAINT `FK_EPEID` FOREIGN KEY (`EmpID`) REFERENCES `Employee` (`EmpID`),
  CONSTRAINT `FK_EPPTN` FOREIGN KEY (`PayTypeNo`) REFERENCES `PayType` (`PayTypeNo`),
  CONSTRAINT `FK_EPTEBID` FOREIGN KEY (`ToBID`) REFERENCES `BankInfo` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmpPay`
--

LOCK TABLES `EmpPay` WRITE;
/*!40000 ALTER TABLE `EmpPay` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmpPay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `EmpID` int(11) NOT NULL,
  `EMPFName` varchar(20) DEFAULT NULL,
  `EMPMName` varchar(20) DEFAULT NULL,
  `EMPLName` varchar(20) DEFAULT NULL,
  `DOJoin` date DEFAULT NULL,
  `EmpDOB` date DEFAULT NULL,
  `Pcontact` char(13) DEFAULT NULL,
  `Scontact` char(13) DEFAULT NULL,
  `Street` varchar(40) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Hqualification` varchar(50) DEFAULT NULL,
  `IsActive` char(1) DEFAULT NULL,
  `Pincode` char(6) DEFAULT NULL,
  `Email_ID` varchar(50) DEFAULT NULL,
  `Salary` double DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`EmpID`),
  KEY `FK_ELDID` (`LocalDID`),
  CONSTRAINT `FK_ELDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeAccount`
--

DROP TABLE IF EXISTS `EmployeeAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmployeeAccount` (
  `EmpID` int(11) NOT NULL,
  `BID` int(11) NOT NULL,
  PRIMARY KEY (`EmpID`,`BID`),
  KEY `FK_EABID` (`BID`),
  CONSTRAINT `FK_EABID` FOREIGN KEY (`BID`) REFERENCES `BankInfo` (`BID`),
  CONSTRAINT `FK_EAEID` FOREIGN KEY (`EmpID`) REFERENCES `Employee` (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeAccount`
--

LOCK TABLES `EmployeeAccount` WRITE;
/*!40000 ALTER TABLE `EmployeeAccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmployeeAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeeDep`
--

DROP TABLE IF EXISTS `EmployeeDep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmployeeDep` (
  `EmpID` int(11) NOT NULL,
  `DepID` char(2) NOT NULL,
  `Designation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EmpID`,`DepID`),
  KEY `FK_EDDID` (`DepID`),
  CONSTRAINT `FK_EDDID` FOREIGN KEY (`DepID`) REFERENCES `Department` (`DepID`),
  CONSTRAINT `FK_EDEID` FOREIGN KEY (`EmpID`) REFERENCES `Employee` (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeeDep`
--

LOCK TABLES `EmployeeDep` WRITE;
/*!40000 ALTER TABLE `EmployeeDep` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmployeeDep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmployeePAE`
--

DROP TABLE IF EXISTS `EmployeePAE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmployeePAE` (
  `EmpID` int(11) NOT NULL,
  `AdhaarNo` char(12) DEFAULT NULL,
  PRIMARY KEY (`EmpID`),
  CONSTRAINT `FK_EPAEEID` FOREIGN KEY (`EmpID`) REFERENCES `Employee` (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmployeePAE`
--

LOCK TABLES `EmployeePAE` WRITE;
/*!40000 ALTER TABLE `EmployeePAE` DISABLE KEYS */;
/*!40000 ALTER TABLE `EmployeePAE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Founder`
--

DROP TABLE IF EXISTS `Founder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Founder` (
  `FID` char(2) NOT NULL,
  `FFName` varchar(10) DEFAULT NULL,
  `FMName` varchar(10) DEFAULT NULL,
  `FLastName` varchar(10) DEFAULT NULL,
  `ProfilePic` blob,
  `FaFName` varchar(10) DEFAULT NULL,
  `FaMName` varchar(10) DEFAULT NULL,
  `FaLName` varchar(10) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Specialties` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Founder`
--

LOCK TABLES `Founder` WRITE;
/*!40000 ALTER TABLE `Founder` DISABLE KEYS */;
/*!40000 ALTER TABLE `Founder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FounderWebsite`
--

DROP TABLE IF EXISTS `FounderWebsite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FounderWebsite` (
  `Website` varchar(30) NOT NULL,
  `FID` char(2) DEFAULT NULL,
  PRIMARY KEY (`Website`),
  KEY `FK_FOUNDFID` (`FID`),
  CONSTRAINT `FK_FOUNDFID` FOREIGN KEY (`FID`) REFERENCES `Founder` (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FounderWebsite`
--

LOCK TABLES `FounderWebsite` WRITE;
/*!40000 ALTER TABLE `FounderWebsite` DISABLE KEYS */;
/*!40000 ALTER TABLE `FounderWebsite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HighOfDairy`
--

DROP TABLE IF EXISTS `HighOfDairy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HighOfDairy` (
  `LocalDID` char(6) NOT NULL,
  `ProdID` char(10) DEFAULT NULL,
  `ConsID` char(10) DEFAULT NULL,
  PRIMARY KEY (`LocalDID`),
  CONSTRAINT `FK_HODLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HighOfDairy`
--

LOCK TABLES `HighOfDairy` WRITE;
/*!40000 ALTER TABLE `HighOfDairy` DISABLE KEYS */;
/*!40000 ALTER TABLE `HighOfDairy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HumanFood`
--

DROP TABLE IF EXISTS `HumanFood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HumanFood` (
  `ProductID` char(10) NOT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `Ingredients` varchar(100) DEFAULT NULL,
  `LocalDID` char(6) NOT NULL,
  PRIMARY KEY (`ProductID`,`LocalDID`),
  CONSTRAINT `FK_HFPID` FOREIGN KEY (`ProductID`, `LocalDID`) REFERENCES `Product` (`ProductID`, `LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HumanFood`
--

LOCK TABLES `HumanFood` WRITE;
/*!40000 ALTER TABLE `HumanFood` DISABLE KEYS */;
/*!40000 ALTER TABLE `HumanFood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MDS`
--

DROP TABLE IF EXISTS `MDS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MDS` (
  `MDSID` char(1) NOT NULL,
  `Name` varchar(10) DEFAULT NULL,
  `FounDate` date DEFAULT NULL,
  `TagLine` varchar(50) DEFAULT NULL,
  `Logo` blob,
  `Description` varchar(500) DEFAULT NULL,
  `Street` varchar(30) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Pincode` char(6) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MDSID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MDS`
--

LOCK TABLES `MDS` WRITE;
/*!40000 ALTER TABLE `MDS` DISABLE KEYS */;
/*!40000 ALTER TABLE `MDS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MDSContact`
--

DROP TABLE IF EXISTS `MDSContact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MDSContact` (
  `MDSID` char(1) NOT NULL,
  `Contact` char(13) NOT NULL,
  PRIMARY KEY (`MDSID`,`Contact`),
  CONSTRAINT `FK_MDSCONTMID` FOREIGN KEY (`MDSID`) REFERENCES `MDS` (`MDSID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MDSContact`
--

LOCK TABLES `MDSContact` WRITE;
/*!40000 ALTER TABLE `MDSContact` DISABLE KEYS */;
/*!40000 ALTER TABLE `MDSContact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MDSFounder`
--

DROP TABLE IF EXISTS `MDSFounder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MDSFounder` (
  `MDSID` char(1) NOT NULL,
  `FID` char(2) NOT NULL,
  PRIMARY KEY (`MDSID`,`FID`),
  KEY `FK_MFOUNDERFID` (`FID`),
  CONSTRAINT `FK_MFOUNDERFID` FOREIGN KEY (`FID`) REFERENCES `Founder` (`FID`),
  CONSTRAINT `FK_MFOUNDERMID` FOREIGN KEY (`MDSID`) REFERENCES `MDS` (`MDSID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MDSFounder`
--

LOCK TABLES `MDSFounder` WRITE;
/*!40000 ALTER TABLE `MDSFounder` DISABLE KEYS */;
/*!40000 ALTER TABLE `MDSFounder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MDSPicture`
--

DROP TABLE IF EXISTS `MDSPicture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MDSPicture` (
  `ImgNo` int(11) NOT NULL,
  `MDSID` char(1) DEFAULT NULL,
  `Picture` blob,
  PRIMARY KEY (`ImgNo`),
  KEY `FK_MDSPICTUREMID` (`MDSID`),
  CONSTRAINT `FK_MDSPICTUREMID` FOREIGN KEY (`MDSID`) REFERENCES `MDS` (`MDSID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MDSPicture`
--

LOCK TABLES `MDSPicture` WRITE;
/*!40000 ALTER TABLE `MDSPicture` DISABLE KEYS */;
/*!40000 ALTER TABLE `MDSPicture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MDSWPE`
--

DROP TABLE IF EXISTS `MDSWPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MDSWPE` (
  `MDSID` char(1) NOT NULL,
  `Website` varchar(30) DEFAULT NULL,
  `Email_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MDSID`),
  CONSTRAINT `FK_MDSMID` FOREIGN KEY (`MDSID`) REFERENCES `MDS` (`MDSID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MDSWPE`
--

LOCK TABLES `MDSWPE` WRITE;
/*!40000 ALTER TABLE `MDSWPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `MDSWPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ManagerDepLog`
--

DROP TABLE IF EXISTS `ManagerDepLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ManagerDepLog` (
  `MangID` int(11) NOT NULL,
  `DepID` char(2) NOT NULL,
  `FromDate` date NOT NULL,
  `ToDate` date DEFAULT NULL,
  PRIMARY KEY (`MangID`,`DepID`,`FromDate`),
  KEY `FK_MDLDID` (`DepID`),
  CONSTRAINT `FK_MDLDID` FOREIGN KEY (`DepID`) REFERENCES `Department` (`DepID`),
  CONSTRAINT `FK_MDLMID` FOREIGN KEY (`MangID`) REFERENCES `Employee` (`EmpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ManagerDepLog`
--

LOCK TABLES `ManagerDepLog` WRITE;
/*!40000 ALTER TABLE `ManagerDepLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ManagerDepLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MilkType`
--

DROP TABLE IF EXISTS `MilkType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MilkType` (
  `MilkTypeID` int(11) NOT NULL,
  `MilkType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`MilkTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MilkType`
--

LOCK TABLES `MilkType` WRITE;
/*!40000 ALTER TABLE `MilkType` DISABLE KEYS */;
/*!40000 ALTER TABLE `MilkType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NotificationAttach`
--

DROP TABLE IF EXISTS `NotificationAttach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NotificationAttach` (
  `NotifyNo` int(11) NOT NULL,
  `FileAttachAddress` varchar(500) NOT NULL,
  PRIMARY KEY (`NotifyNo`,`FileAttachAddress`),
  CONSTRAINT `FK_NANN` FOREIGN KEY (`NotifyNo`) REFERENCES `NotificationLog` (`NotifyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NotificationAttach`
--

LOCK TABLES `NotificationAttach` WRITE;
/*!40000 ALTER TABLE `NotificationAttach` DISABLE KEYS */;
/*!40000 ALTER TABLE `NotificationAttach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NotificationLog`
--

DROP TABLE IF EXISTS `NotificationLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NotificationLog` (
  `NotifyNo` int(11) NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FromSend` char(10) DEFAULT NULL,
  `ToRecip` char(10) DEFAULT NULL,
  `Subject` varchar(200) DEFAULT NULL,
  `MsgBody` varchar(3000) DEFAULT NULL,
  `IsRead` char(1) DEFAULT NULL,
  `IsSeen` char(1) DEFAULT NULL,
  PRIMARY KEY (`NotifyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NotificationLog`
--

LOCK TABLES `NotificationLog` WRITE;
/*!40000 ALTER TABLE `NotificationLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `NotificationLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackagingType`
--

DROP TABLE IF EXISTS `PackagingType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PackagingType` (
  `PackTypeID` int(11) NOT NULL,
  `PackType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PackTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackagingType`
--

LOCK TABLES `PackagingType` WRITE;
/*!40000 ALTER TABLE `PackagingType` DISABLE KEYS */;
/*!40000 ALTER TABLE `PackagingType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PayType`
--

DROP TABLE IF EXISTS `PayType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PayType` (
  `PayTypeNo` int(11) NOT NULL,
  `PayType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PayTypeNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PayType`
--

LOCK TABLES `PayType` WRITE;
/*!40000 ALTER TABLE `PayType` DISABLE KEYS */;
/*!40000 ALTER TABLE `PayType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlantSeed`
--

DROP TABLE IF EXISTS `PlantSeed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlantSeed` (
  `ProductID` char(10) NOT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `PlantName` varchar(30) DEFAULT NULL,
  `LocalDID` char(6) NOT NULL,
  PRIMARY KEY (`ProductID`,`LocalDID`),
  CONSTRAINT `FK_PSPID` FOREIGN KEY (`ProductID`, `LocalDID`) REFERENCES `Product` (`ProductID`, `LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlantSeed`
--

LOCK TABLES `PlantSeed` WRITE;
/*!40000 ALTER TABLE `PlantSeed` DISABLE KEYS */;
/*!40000 ALTER TABLE `PlantSeed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProdAdvPay`
--

DROP TABLE IF EXISTS `ProdAdvPay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProdAdvPay` (
  `ProdID` char(10) NOT NULL,
  `OnDate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `AdvAmount` double DEFAULT NULL,
  `PayTypeNo` int(11) DEFAULT NULL,
  `PayDetail` varchar(300) DEFAULT NULL,
  `PayAccount` varchar(300) DEFAULT NULL,
  `ToBID` int(11) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`ProdID`,`OnDate`,`DateATime`),
  KEY `FK_PAPPTN` (`PayTypeNo`),
  KEY `FK_PAPTBID` (`ToBID`),
  KEY `FK_PAPLDID` (`LocalDID`),
  CONSTRAINT `FK_PAPLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_PAPPID` FOREIGN KEY (`ProdID`) REFERENCES `Producer` (`ProdID`),
  CONSTRAINT `FK_PAPPTN` FOREIGN KEY (`PayTypeNo`) REFERENCES `PayType` (`PayTypeNo`),
  CONSTRAINT `FK_PAPTBID` FOREIGN KEY (`ToBID`) REFERENCES `BankInfo` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProdAdvPay`
--

LOCK TABLES `ProdAdvPay` WRITE;
/*!40000 ALTER TABLE `ProdAdvPay` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProdAdvPay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProdMilkLog`
--

DROP TABLE IF EXISTS `ProdMilkLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProdMilkLog` (
  `ProdID` char(10) NOT NULL,
  `Ofdate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IsMorning` char(1) DEFAULT NULL,
  `Quantity` float DEFAULT NULL,
  `SNF` float DEFAULT NULL,
  `WaterP` char(4) DEFAULT NULL,
  `FAT` float DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `MilkTypeID` int(11) DEFAULT NULL,
  `IsKg` char(1) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`ProdID`,`Ofdate`,`DateATime`),
  KEY `FK_PMLMTID` (`MilkTypeID`),
  KEY `FK_PMLLDID` (`LocalDID`),
  CONSTRAINT `FK_PMLLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_PMLMTID` FOREIGN KEY (`MilkTypeID`) REFERENCES `MilkType` (`MilkTypeID`),
  CONSTRAINT `FK_PMLPID` FOREIGN KEY (`ProdID`) REFERENCES `Producer` (`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProdMilkLog`
--

LOCK TABLES `ProdMilkLog` WRITE;
/*!40000 ALTER TABLE `ProdMilkLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProdMilkLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProdPay`
--

DROP TABLE IF EXISTS `ProdPay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProdPay` (
  `ProdID` char(10) NOT NULL,
  `ToDate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TotalMilkAmount` double DEFAULT NULL,
  `AdvAmount` double DEFAULT NULL,
  `ProductAmount` double DEFAULT NULL,
  `Paid` double DEFAULT NULL,
  `PayTypeNo` int(11) DEFAULT NULL,
  `PayDetail` varchar(300) DEFAULT NULL,
  `PayAccount` varchar(300) DEFAULT NULL,
  `ToBID` int(11) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`ProdID`,`ToDate`,`DateATime`),
  KEY `FK_PPPTN` (`PayTypeNo`),
  KEY `FK_PPTBID` (`ToBID`),
  KEY `FK_PPLDID` (`LocalDID`),
  CONSTRAINT `FK_PPLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_PPPID` FOREIGN KEY (`ProdID`) REFERENCES `Producer` (`ProdID`),
  CONSTRAINT `FK_PPPTN` FOREIGN KEY (`PayTypeNo`) REFERENCES `PayType` (`PayTypeNo`),
  CONSTRAINT `FK_PPTBID` FOREIGN KEY (`ToBID`) REFERENCES `BankInfo` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProdPay`
--

LOCK TABLES `ProdPay` WRITE;
/*!40000 ALTER TABLE `ProdPay` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProdPay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Producer`
--

DROP TABLE IF EXISTS `Producer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Producer` (
  `ProdID` char(10) NOT NULL,
  `ProdFName` varchar(20) DEFAULT NULL,
  `ProdMName` varchar(20) DEFAULT NULL,
  `ProdLName` varchar(20) DEFAULT NULL,
  `Pcontact` char(13) DEFAULT NULL,
  `Scontact` char(13) DEFAULT NULL,
  `Street` varchar(40) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Pincode` char(6) DEFAULT NULL,
  `Email_ID` varchar(50) DEFAULT NULL,
  `IsApp` char(1) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`ProdID`),
  KEY `FK_PLDID` (`LocalDID`),
  CONSTRAINT `FK_PLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Producer`
--

LOCK TABLES `Producer` WRITE;
/*!40000 ALTER TABLE `Producer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Producer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProducerAccount`
--

DROP TABLE IF EXISTS `ProducerAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProducerAccount` (
  `ProdID` char(10) NOT NULL,
  `BID` int(11) NOT NULL,
  PRIMARY KEY (`ProdID`,`BID`),
  KEY `FK_PABID` (`BID`),
  CONSTRAINT `FK_PABID` FOREIGN KEY (`BID`) REFERENCES `BankInfo` (`BID`),
  CONSTRAINT `FK_PAPID` FOREIGN KEY (`ProdID`) REFERENCES `Producer` (`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProducerAccount`
--

LOCK TABLES `ProducerAccount` WRITE;
/*!40000 ALTER TABLE `ProducerAccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProducerAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProducerPAE`
--

DROP TABLE IF EXISTS `ProducerPAE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProducerPAE` (
  `ProdID` char(10) NOT NULL,
  `AdhaarNo` char(12) DEFAULT NULL,
  PRIMARY KEY (`ProdID`),
  CONSTRAINT `FK_PPAEPID` FOREIGN KEY (`ProdID`) REFERENCES `Producer` (`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProducerPAE`
--

LOCK TABLES `ProducerPAE` WRITE;
/*!40000 ALTER TABLE `ProducerPAE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProducerPAE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `ProductID` char(10) NOT NULL,
  `ProductName` varchar(40) DEFAULT NULL,
  `BrandName` varchar(30) DEFAULT NULL,
  `Price` varchar(20) DEFAULT NULL,
  `Quantity` float DEFAULT NULL,
  `PackTypeID` int(11) DEFAULT NULL,
  `ProductCatID` int(11) DEFAULT NULL,
  `WTID` int(11) DEFAULT NULL,
  `Decription` varchar(1000) DEFAULT NULL,
  `LocalDID` char(6) NOT NULL,
  PRIMARY KEY (`ProductID`,`LocalDID`),
  KEY `FK_PPPETID` (`PackTypeID`),
  KEY `FK_PPCID` (`ProductCatID`),
  KEY `FK_PWTID` (`WTID`),
  KEY `FK_PLDDID` (`LocalDID`),
  CONSTRAINT `FK_PLDDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_PPCID` FOREIGN KEY (`ProductCatID`) REFERENCES `ProductCategory` (`ProductCatID`),
  CONSTRAINT `FK_PPPETID` FOREIGN KEY (`PackTypeID`) REFERENCES `PackagingType` (`PackTypeID`),
  CONSTRAINT `FK_PWTID` FOREIGN KEY (`WTID`) REFERENCES `WeightType` (`WTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductArriveLog`
--

DROP TABLE IF EXISTS `ProductArriveLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductArriveLog` (
  `ProductID` char(10) NOT NULL,
  `OnDate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TotalQuantity` double DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `FromAddress` varchar(100) DEFAULT NULL,
  `LocalDID` char(6) NOT NULL,
  PRIMARY KEY (`ProductID`,`OnDate`,`DateATime`,`LocalDID`),
  KEY `FK_PALPID` (`ProductID`,`LocalDID`),
  CONSTRAINT `FK_PALPID` FOREIGN KEY (`ProductID`, `LocalDID`) REFERENCES `Product` (`ProductID`, `LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductArriveLog`
--

LOCK TABLES `ProductArriveLog` WRITE;
/*!40000 ALTER TABLE `ProductArriveLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductArriveLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductCategory`
--

DROP TABLE IF EXISTS `ProductCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductCategory` (
  `ProductCatID` int(11) NOT NULL,
  `ProductCatName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ProductCatID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductCategory`
--

LOCK TABLES `ProductCategory` WRITE;
/*!40000 ALTER TABLE `ProductCategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductGst`
--

DROP TABLE IF EXISTS `ProductGst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductGst` (
  `ProductID` char(10) NOT NULL,
  `LocalDID` char(6) NOT NULL,
  `gst` float DEFAULT NULL,
  PRIMARY KEY (`ProductID`,`LocalDID`),
  CONSTRAINT `FK_PGPIDLDID` FOREIGN KEY (`ProductID`, `LocalDID`) REFERENCES `Product` (`ProductID`, `LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductGst`
--

LOCK TABLES `ProductGst` WRITE;
/*!40000 ALTER TABLE `ProductGst` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductGst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductSELog`
--

DROP TABLE IF EXISTS `ProductSELog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductSELog` (
  `EmpID` int(11) NOT NULL,
  `OnDate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ProductID` char(10) NOT NULL,
  `TotalQuantity` double DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `IsPaid` char(1) DEFAULT NULL,
  `LocalDID` char(6) NOT NULL,
  PRIMARY KEY (`ProductID`,`EmpID`,`OnDate`,`DateATime`,`LocalDID`),
  KEY `FK_PSELEID` (`EmpID`),
  KEY `FK_PSELPID` (`ProductID`,`LocalDID`),
  CONSTRAINT `FK_PSELEID` FOREIGN KEY (`EmpID`) REFERENCES `Employee` (`EmpID`),
  CONSTRAINT `FK_PSELPID` FOREIGN KEY (`ProductID`, `LocalDID`) REFERENCES `Product` (`ProductID`, `LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductSELog`
--

LOCK TABLES `ProductSELog` WRITE;
/*!40000 ALTER TABLE `ProductSELog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductSELog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductSILog`
--

DROP TABLE IF EXISTS `ProductSILog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductSILog` (
  `ACustID` char(13) DEFAULT NULL,
  `OnDate` date DEFAULT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ProductID` char(10) DEFAULT NULL,
  `TotalQuantity` double DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `IsPaid` char(1) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductSILog`
--

LOCK TABLES `ProductSILog` WRITE;
/*!40000 ALTER TABLE `ProductSILog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductSILog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductSPLog`
--

DROP TABLE IF EXISTS `ProductSPLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductSPLog` (
  `ProdID` char(6) NOT NULL,
  `OnDate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ProductID` char(10) NOT NULL,
  `TotalQuantity` double DEFAULT NULL,
  `Price` double DEFAULT NULL,
  `IsPaid` char(1) DEFAULT NULL,
  `LocalDID` char(6) NOT NULL,
  PRIMARY KEY (`ProductID`,`ProdID`,`OnDate`,`DateATime`,`LocalDID`),
  KEY `FK_PSPLPID` (`ProdID`),
  KEY `FK_PSPLPDID` (`ProductID`,`LocalDID`),
  CONSTRAINT `FK_PSPLPDID` FOREIGN KEY (`ProductID`, `LocalDID`) REFERENCES `Product` (`ProductID`, `LocalDID`),
  CONSTRAINT `FK_PSPLPID` FOREIGN KEY (`ProdID`) REFERENCES `Producer` (`ProdID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductSPLog`
--

LOCK TABLES `ProductSPLog` WRITE;
/*!40000 ALTER TABLE `ProductSPLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductSPLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEMilkRecord`
--

DROP TABLE IF EXISTS `SEMilkRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEMilkRecord` (
  `HBID` char(6) NOT NULL,
  `Ofdate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IsMorning` char(1) DEFAULT NULL,
  `TransID` int(11) DEFAULT NULL,
  `TClyQuantity` int(11) DEFAULT NULL,
  `TmQuantity` float DEFAULT NULL,
  `CSN` varchar(7) DEFAULT NULL,
  `FAT` float DEFAULT NULL,
  `SNF` float DEFAULT NULL,
  `WaterP` char(4) DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `IsKg` char(1) DEFAULT NULL,
  `MilkTypeID` int(11) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`HBID`,`Ofdate`,`DateATime`),
  KEY `FK_SMRTID` (`TransID`),
  KEY `FK_SMRMTID` (`MilkTypeID`),
  KEY `FK_SMRLDID` (`LocalDID`),
  CONSTRAINT `FK_SEMRHBID` FOREIGN KEY (`HBID`) REFERENCES `DairyHB` (`LocalDID`),
  CONSTRAINT `FK_SMRLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_SMRMTID` FOREIGN KEY (`MilkTypeID`) REFERENCES `MilkType` (`MilkTypeID`),
  CONSTRAINT `FK_SMRTID` FOREIGN KEY (`TransID`) REFERENCES `Transport` (`TransID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEMilkRecord`
--

LOCK TABLES `SEMilkRecord` WRITE;
/*!40000 ALTER TABLE `SEMilkRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEMilkRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SEPayRecord`
--

DROP TABLE IF EXISTS `SEPayRecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SEPayRecord` (
  `HBID` char(6) NOT NULL,
  `Todate` date NOT NULL,
  `DateATime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TotalMilkAmount` double DEFAULT NULL,
  `AdvAmount` double DEFAULT NULL,
  `AmountTBPay` double DEFAULT NULL,
  `Paid` double DEFAULT NULL,
  `AdvPay` double DEFAULT NULL,
  `PayTypeNo` int(11) DEFAULT NULL,
  `PayDetail` varchar(300) DEFAULT NULL,
  `ToBID` int(11) DEFAULT NULL,
  `PayAccount` varchar(300) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`HBID`,`Todate`,`DateATime`),
  KEY `FK_SEPRPTN` (`PayTypeNo`),
  KEY `FK_SEPRTBID` (`ToBID`),
  KEY `FK_SEPLDID` (`LocalDID`),
  CONSTRAINT `FK_SEPLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`),
  CONSTRAINT `FK_SEPRHBID` FOREIGN KEY (`HBID`) REFERENCES `DairyHB` (`LocalDID`),
  CONSTRAINT `FK_SEPRPTN` FOREIGN KEY (`PayTypeNo`) REFERENCES `PayType` (`PayTypeNo`),
  CONSTRAINT `FK_SEPRTBID` FOREIGN KEY (`ToBID`) REFERENCES `BankInfo` (`BID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SEPayRecord`
--

LOCK TABLES `SEPayRecord` WRITE;
/*!40000 ALTER TABLE `SEPayRecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `SEPayRecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transport`
--

DROP TABLE IF EXISTS `Transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transport` (
  `TransID` int(11) NOT NULL,
  `VehicleNo` varchar(20) DEFAULT NULL,
  `DrivFName` varchar(20) DEFAULT NULL,
  `DrivMName` varchar(20) DEFAULT NULL,
  `DrivLName` varchar(20) DEFAULT NULL,
  `DLicenseNo` varchar(30) DEFAULT NULL,
  `Pcontact` char(13) DEFAULT NULL,
  `Scontact` char(13) DEFAULT NULL,
  `LocalDID` char(6) DEFAULT NULL,
  PRIMARY KEY (`TransID`),
  KEY `FK_TLDID` (`LocalDID`),
  CONSTRAINT `FK_TLDID` FOREIGN KEY (`LocalDID`) REFERENCES `Dairy` (`LocalDID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transport`
--

LOCK TABLES `Transport` WRITE;
/*!40000 ALTER TABLE `Transport` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserPass`
--

DROP TABLE IF EXISTS `UserPass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserPass` (
  `custID` char(10) NOT NULL,
  `userName` char(40) DEFAULT NULL,
  `userPass` char(40) DEFAULT NULL,
  PRIMARY KEY (`custID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserPass`
--

LOCK TABLES `UserPass` WRITE;
/*!40000 ALTER TABLE `UserPass` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserPass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WeightType`
--

DROP TABLE IF EXISTS `WeightType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WeightType` (
  `WTID` int(11) NOT NULL,
  `WeightType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`WTID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WeightType`
--

LOCK TABLES `WeightType` WRITE;
/*!40000 ALTER TABLE `WeightType` DISABLE KEYS */;
/*!40000 ALTER TABLE `WeightType` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-04 20:49:33
