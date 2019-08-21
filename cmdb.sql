-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: cmdb
-- ------------------------------------------------------
-- Server version	5.7.16

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
-- Current Database: `cmdb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cmdb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `cmdb`;

--
-- Table structure for table `api_applicationinfo`
--

DROP TABLE IF EXISTS `api_applicationinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_applicationinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `usage` varchar(128) NOT NULL,
  `port` int(11) NOT NULL,
  `outside_ip` varchar(64) DEFAULT NULL,
  `inside_ip` varchar(64) DEFAULT NULL,
  `path_install` varchar(512) NOT NULL,
  `path_configure` varchar(512) NOT NULL,
  `path_data` varchar(512) DEFAULT NULL,
  `path_log` varchar(512) DEFAULT NULL,
  `descriptions` longtext,
  `business_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_applicationinfo_business_id_310bb9b3_fk_api_business_id` (`business_id`),
  CONSTRAINT `api_applicationinfo_business_id_310bb9b3_fk_api_business_id` FOREIGN KEY (`business_id`) REFERENCES `api_business` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_applicationinfo`
--

LOCK TABLES `api_applicationinfo` WRITE;
/*!40000 ALTER TABLE `api_applicationinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_applicationinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_asset`
--

DROP TABLE IF EXISTS `api_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_asset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modle` varchar(255) DEFAULT NULL,
  `region` varchar(255) NOT NULL,
  `device_status` smallint(6) NOT NULL,
  `cabinet` varchar(30) DEFAULT NULL,
  `cabinet_order` varchar(30) DEFAULT NULL,
  `provider_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_asset_provider_id_542307f9_fk_api_providerinfo_id` (`provider_id`),
  CONSTRAINT `api_asset_provider_id_542307f9_fk_api_providerinfo_id` FOREIGN KEY (`provider_id`) REFERENCES `api_providerinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_asset`
--

LOCK TABLES `api_asset` WRITE;
/*!40000 ALTER TABLE `api_asset` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_business`
--

DROP TABLE IF EXISTS `api_business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `administrator` varchar(10) NOT NULL,
  `descriptions` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_business`
--

LOCK TABLES `api_business` WRITE;
/*!40000 ALTER TABLE `api_business` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_disk`
--

DROP TABLE IF EXISTS `api_disk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_disk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `size` varchar(20) NOT NULL,
  `server_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_disk_server_id_9d5beaca_fk_api_server_id` (`server_id`),
  CONSTRAINT `api_disk_server_id_9d5beaca_fk_api_server_id` FOREIGN KEY (`server_id`) REFERENCES `api_server` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_disk`
--

LOCK TABLES `api_disk` WRITE;
/*!40000 ALTER TABLE `api_disk` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_disk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_dns`
--

DROP TABLE IF EXISTS `api_dns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_dns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `ipaddr` char(39) NOT NULL,
  `usage` varchar(512) NOT NULL,
  `business_id` int(11) DEFAULT NULL,
  `master_domain_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `api_dns_business_id_c43edb93_fk_api_business_id` (`business_id`),
  KEY `api_dns_master_domain_name_i_275c3f03_fk_api_maste` (`master_domain_name_id`),
  CONSTRAINT `api_dns_business_id_c43edb93_fk_api_business_id` FOREIGN KEY (`business_id`) REFERENCES `api_business` (`id`),
  CONSTRAINT `api_dns_master_domain_name_i_275c3f03_fk_api_maste` FOREIGN KEY (`master_domain_name_id`) REFERENCES `api_masterdomainname` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_dns`
--

LOCK TABLES `api_dns` WRITE;
/*!40000 ALTER TABLE `api_dns` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_dns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_masterdomainname`
--

DROP TABLE IF EXISTS `api_masterdomainname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_masterdomainname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `record` varchar(128) NOT NULL,
  `holder` varchar(20) NOT NULL,
  `creation_date` date NOT NULL,
  `expire_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_masterdomainname`
--

LOCK TABLES `api_masterdomainname` WRITE;
/*!40000 ALTER TABLE `api_masterdomainname` DISABLE KEYS */;
INSERT INTO `api_masterdomainname` VALUES (6,'lndba.com','xx科技有限公司','xxx','2019-03-03','2029-03-03');
/*!40000 ALTER TABLE `api_masterdomainname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_nic`
--

DROP TABLE IF EXISTS `api_nic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_nic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `ipaddr` char(39) NOT NULL,
  `netmask` varchar(64) DEFAULT NULL,
  `hwaddr` varchar(64) DEFAULT NULL,
  `speed` varchar(20) DEFAULT NULL,
  `bandwidth` varchar(20) DEFAULT NULL,
  `server_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_nic_server_id_3e36f46a_fk_api_server_id` (`server_id`),
  CONSTRAINT `api_nic_server_id_3e36f46a_fk_api_server_id` FOREIGN KEY (`server_id`) REFERENCES `api_server` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_nic`
--

LOCK TABLES `api_nic` WRITE;
/*!40000 ALTER TABLE `api_nic` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_nic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_platforminfo`
--

DROP TABLE IF EXISTS `api_platforminfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_platforminfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `addr` varchar(128) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `provider_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_platforminfo_provider_id_fb0ea899_fk_api_providerinfo_id` (`provider_id`),
  CONSTRAINT `api_platforminfo_provider_id_fb0ea899_fk_api_providerinfo_id` FOREIGN KEY (`provider_id`) REFERENCES `api_providerinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_platforminfo`
--

LOCK TABLES `api_platforminfo` WRITE;
/*!40000 ALTER TABLE `api_platforminfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_platforminfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_providerinfo`
--

DROP TABLE IF EXISTS `api_providerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_providerinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_providerinfo`
--

LOCK TABLES `api_providerinfo` WRITE;
/*!40000 ALTER TABLE `api_providerinfo` DISABLE KEYS */;
INSERT INTO `api_providerinfo` VALUES (1,'阿里云','https://www.aliyun.com/','',''),(2,'腾讯云','https://cloud.tencent.com/',NULL,''),(3,'华为云','https://www.huaweicloud.com/','',''),(4,'AWS','https://aws.amazon.com/','','');
/*!40000 ALTER TABLE `api_providerinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_server`
--

DROP TABLE IF EXISTS `api_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(128) NOT NULL,
  `manager_ip` varchar(64) DEFAULT NULL,
  `cpu_model` varchar(128) NOT NULL,
  `cpu_core` int(11) NOT NULL,
  `memory_size` varchar(10) NOT NULL,
  `swap_size` varchar(10) DEFAULT NULL,
  `os` varchar(20) NOT NULL,
  `os_version` varchar(20) NOT NULL,
  `os_type` varchar(10) NOT NULL,
  `kernel_version` varchar(128) NOT NULL,
  `descriptions` longtext,
  `expire_date` date DEFAULT NULL,
  `asset_id` int(11) NOT NULL,
  `outside_ip` char(39) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_id` (`asset_id`),
  CONSTRAINT `api_server_asset_id_0b475704_fk_api_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `api_asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_server`
--

LOCK TABLES `api_server` WRITE;
/*!40000 ALTER TABLE `api_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_userinfo`
--

DROP TABLE IF EXISTS `api_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `telephone` (`telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_userinfo`
--

LOCK TABLES `api_userinfo` WRITE;
/*!40000 ALTER TABLE `api_userinfo` DISABLE KEYS */;
INSERT INTO `api_userinfo` VALUES (1,'pbkdf2_sha256$36000$8cGNR6IO0wCu$SDSRLFn4R1M+20RCZutNPq6Gt32nbFJzWZGa+4Lnckg=','2019-07-10 08:55:13.059808',1,'root','','','',1,1,'2019-07-10 08:48:59.012450',NULL,'/avatar/default.png'),(2,'pbkdf2_sha256$36000$Hgqk9aFOdgZV$cKG97bRPGu948LdBxgZwGfEKvANBZ5F5hnHFmbJYOI0=',NULL,1,'api','','','',1,1,'2019-07-10 08:49:26.990311',NULL,'/avatar/default.png');
/*!40000 ALTER TABLE `api_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_userinfo_groups`
--

DROP TABLE IF EXISTS `api_userinfo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_userinfo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_userinfo_groups_userinfo_id_group_id_308401ad_uniq` (`userinfo_id`,`group_id`),
  KEY `api_userinfo_groups_group_id_008237f8_fk_auth_group_id` (`group_id`),
  CONSTRAINT `api_userinfo_groups_group_id_008237f8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `api_userinfo_groups_userinfo_id_52ef0208_fk_api_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `api_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_userinfo_groups`
--

LOCK TABLES `api_userinfo_groups` WRITE;
/*!40000 ALTER TABLE `api_userinfo_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_userinfo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_userinfo_user_permissions`
--

DROP TABLE IF EXISTS `api_userinfo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_userinfo_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_userinfo_user_permis_userinfo_id_permission_i_e8936345_uniq` (`userinfo_id`,`permission_id`),
  KEY `api_userinfo_user_pe_permission_id_7ec5a50d_fk_auth_perm` (`permission_id`),
  CONSTRAINT `api_userinfo_user_pe_permission_id_7ec5a50d_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `api_userinfo_user_pe_userinfo_id_00c17c5a_fk_api_useri` FOREIGN KEY (`userinfo_id`) REFERENCES `api_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_userinfo_user_permissions`
--

LOCK TABLES `api_userinfo_user_permissions` WRITE;
/*!40000 ALTER TABLE `api_userinfo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_userinfo_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_usertoken`
--

DROP TABLE IF EXISTS `api_usertoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_usertoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `api_usertoken_user_id_5984b1b0_fk_api_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `api_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_usertoken`
--

LOCK TABLES `api_usertoken` WRITE;
/*!40000 ALTER TABLE `api_usertoken` DISABLE KEYS */;
INSERT INTO `api_usertoken` VALUES (1,'6ec2bc87cd0dbb5fe048d90a0212ba30',1),(2,'01f0aeda2839d352cfe2a6c7f82473ac',2);
/*!40000 ALTER TABLE `api_usertoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add user',6,'add_userinfo'),(17,'Can change user',6,'change_userinfo'),(18,'Can delete user',6,'delete_userinfo'),(19,'Can add application info',7,'add_applicationinfo'),(20,'Can change application info',7,'change_applicationinfo'),(21,'Can delete application info',7,'delete_applicationinfo'),(22,'Can add asset',8,'add_asset'),(23,'Can change asset',8,'change_asset'),(24,'Can delete asset',8,'delete_asset'),(25,'Can add business',9,'add_business'),(26,'Can change business',9,'change_business'),(27,'Can delete business',9,'delete_business'),(28,'Can add database info',10,'add_databaseinfo'),(29,'Can change database info',10,'change_databaseinfo'),(30,'Can delete database info',10,'delete_databaseinfo'),(31,'Can add disk',11,'add_disk'),(32,'Can change disk',11,'change_disk'),(33,'Can delete disk',11,'delete_disk'),(34,'Can add disk mount',12,'add_diskmount'),(35,'Can change disk mount',12,'change_diskmount'),(36,'Can delete disk mount',12,'delete_diskmount'),(37,'Can add master domain name',13,'add_masterdomainname'),(38,'Can change master domain name',13,'change_masterdomainname'),(39,'Can delete master domain name',13,'delete_masterdomainname'),(40,'Can add nic',14,'add_nic'),(41,'Can change nic',14,'change_nic'),(42,'Can delete nic',14,'delete_nic'),(43,'Can add provider info',15,'add_providerinfo'),(44,'Can change provider info',15,'change_providerinfo'),(45,'Can delete provider info',15,'delete_providerinfo'),(46,'Can add server',16,'add_server'),(47,'Can change server',16,'change_server'),(48,'Can delete server',16,'delete_server'),(49,'Can add slave domain name',17,'add_slavedomainname'),(50,'Can change slave domain name',17,'change_slavedomainname'),(51,'Can delete slave domain name',17,'delete_slavedomainname'),(52,'Can add tag',18,'add_tag'),(53,'Can change tag',18,'change_tag'),(54,'Can delete tag',18,'delete_tag'),(55,'Can add user token',19,'add_usertoken'),(56,'Can change user token',19,'change_usertoken'),(57,'Can delete user token',19,'delete_usertoken'),(58,'Can add database user info',20,'add_databaseuserinfo'),(59,'Can change database user info',20,'change_databaseuserinfo'),(60,'Can delete database user info',20,'delete_databaseuserinfo'),(61,'Can add dns',21,'add_dns'),(62,'Can change dns',21,'change_dns'),(63,'Can delete dns',21,'delete_dns'),(64,'Can add platform info',22,'add_platforminfo'),(65,'Can change platform info',22,'change_platforminfo'),(66,'Can delete platform info',22,'delete_platforminfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_api_userinfo_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_api_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `api_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-07-10 09:11:53.805655','1','??',1,'[{\"added\": {}}]',8,1),(2,'2019-07-10 09:13:32.079678','2','??',1,'[{\"added\": {}}]',8,1),(3,'2019-07-10 09:13:37.239565','2','??',2,'[]',8,1),(4,'2019-07-10 09:13:43.366848','1','??',2,'[{\"changed\": {\"fields\": [\"provider\"]}}]',8,1),(5,'2019-07-10 09:14:26.080399','2','??1',2,'[{\"changed\": {\"fields\": [\"region\"]}}]',8,1),(6,'2019-07-10 09:14:30.539967','1','??2',2,'[{\"changed\": {\"fields\": [\"region\"]}}]',8,1),(7,'2019-07-10 09:15:29.686218','1','localhost',1,'[{\"added\": {}}]',16,1),(8,'2019-07-10 09:15:59.963313','2','mysql',1,'[{\"added\": {}}]',16,1),(9,'2019-07-10 09:16:31.414176','1','eth0',1,'[{\"added\": {}}]',14,1),(10,'2019-07-10 09:17:05.745491','2','eth1',1,'[{\"added\": {}}]',14,1),(11,'2019-07-10 09:17:21.809940','3','eth0',1,'[{\"added\": {}}]',14,1),(12,'2019-07-10 09:17:40.202425','1','sda',1,'[{\"added\": {}}]',11,1),(13,'2019-07-10 09:17:55.091062','2','sda',1,'[{\"added\": {}}]',11,1),(14,'2019-07-10 09:18:05.993441','3','sdb',1,'[{\"added\": {}}]',11,1),(15,'2019-07-10 09:18:39.324839','1','sda1',1,'[{\"added\": {}}]',12,1),(16,'2019-07-10 09:19:13.717391','2','sda1',1,'[{\"added\": {}}]',12,1),(17,'2019-07-10 09:19:31.651239','3','sdb1',1,'[{\"added\": {}}]',12,1),(18,'2019-07-10 09:20:00.967195','1','sda1',2,'[{\"changed\": {\"fields\": [\"size\"]}}]',12,1),(19,'2019-07-10 09:36:28.828217','1','localhost',2,'[{\"changed\": {\"fields\": [\"manager_ip\"]}}]',16,1),(20,'2019-07-10 09:36:42.081193','2','mysql',2,'[{\"changed\": {\"fields\": [\"manager_ip\"]}}]',16,1),(21,'2019-07-10 09:39:48.202401','2','mysql',2,'[{\"changed\": {\"fields\": [\"outside_ip\", \"manager_ip\"]}}]',16,1),(22,'2019-07-10 09:39:57.065328','1','localhost',2,'[{\"changed\": {\"fields\": [\"outside_ip\", \"manager_ip\"]}}]',16,1),(23,'2019-07-11 15:34:21.075922','1','sda',2,'[{\"changed\": {\"fields\": [\"disk_mount\"]}}]',11,1),(24,'2019-07-11 15:34:33.087404','3','sdb',2,'[{\"changed\": {\"fields\": [\"disk_mount\"]}}]',11,1),(25,'2019-07-11 15:34:43.966755','2','sda',2,'[{\"changed\": {\"fields\": [\"disk_mount\"]}}]',11,1),(26,'2019-07-11 15:34:51.500339','1','sda',2,'[{\"changed\": {\"fields\": [\"disk_mount\"]}}]',11,1),(27,'2019-07-11 15:35:20.938812','1','localhost',2,'[{\"changed\": {\"fields\": [\"disk\"]}}]',16,1),(28,'2019-07-11 15:35:29.573399','2','mysql',2,'[{\"changed\": {\"fields\": [\"disk\"]}}]',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'api','applicationinfo'),(8,'api','asset'),(9,'api','business'),(10,'api','databaseinfo'),(20,'api','databaseuserinfo'),(11,'api','disk'),(12,'api','diskmount'),(21,'api','dns'),(13,'api','masterdomainname'),(14,'api','nic'),(22,'api','platforminfo'),(15,'api','providerinfo'),(16,'api','server'),(17,'api','slavedomainname'),(18,'api','tag'),(6,'api','userinfo'),(19,'api','usertoken'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-07-10 08:47:47.889020'),(2,'contenttypes','0002_remove_content_type_name','2019-07-10 08:47:47.926993'),(3,'auth','0001_initial','2019-07-10 08:47:48.074142'),(4,'auth','0002_alter_permission_name_max_length','2019-07-10 08:47:48.095603'),(5,'auth','0003_alter_user_email_max_length','2019-07-10 08:47:48.102124'),(6,'auth','0004_alter_user_username_opts','2019-07-10 08:47:48.108254'),(7,'auth','0005_alter_user_last_login_null','2019-07-10 08:47:48.114562'),(8,'auth','0006_require_contenttypes_0002','2019-07-10 08:47:48.116187'),(9,'auth','0007_alter_validators_add_error_messages','2019-07-10 08:47:48.122024'),(10,'auth','0008_alter_user_username_max_length','2019-07-10 08:47:48.128227'),(11,'api','0001_initial','2019-07-10 08:47:48.858871'),(12,'admin','0001_initial','2019-07-10 08:47:48.928153'),(13,'admin','0002_logentry_remove_auto_add','2019-07-10 08:47:48.959121'),(14,'api','0002_auto_20190709_1716','2019-07-10 08:47:48.998297'),(15,'api','0003_auto_20190709_1740','2019-07-10 08:47:49.066218'),(16,'api','0004_auto_20190709_1742','2019-07-10 08:47:49.090696'),(17,'api','0005_auto_20190709_1754','2019-07-10 08:47:49.154415'),(18,'api','0006_auto_20190709_1757','2019-07-10 08:47:49.221418'),(19,'api','0007_auto_20190709_1758','2019-07-10 08:47:49.286210'),(20,'api','0008_auto_20190709_1803','2019-07-10 08:47:49.311596'),(21,'api','0009_auto_20190709_1808','2019-07-10 08:47:49.338711'),(22,'api','0010_auto_20190709_1811','2019-07-10 08:47:49.384148'),(23,'api','0011_auto_20190709_1819','2019-07-10 08:47:49.470836'),(24,'api','0012_auto_20190709_1821','2019-07-10 08:47:49.491768'),(25,'api','0013_auto_20190709_1856','2019-07-10 08:47:49.632954'),(26,'api','0014_auto_20190709_1907','2019-07-10 08:47:49.898073'),(27,'api','0015_auto_20190709_1913','2019-07-10 08:47:50.253229'),(28,'api','0016_auto_20190709_1924','2019-07-10 08:47:50.497911'),(29,'api','0017_auto_20190709_1947','2019-07-10 08:47:50.593345'),(30,'api','0018_auto_20190709_1952','2019-07-10 08:47:50.720357'),(31,'api','0019_auto_20190709_1953','2019-07-10 08:47:50.818902'),(32,'api','0020_auto_20190709_2021','2019-07-10 08:47:50.859072'),(33,'api','0021_auto_20190710_1625','2019-07-10 08:47:50.901643'),(34,'api','0022_auto_20190710_1637','2019-07-10 08:47:50.990019'),(35,'api','0023_auto_20190710_1638','2019-07-10 08:47:51.028481'),(36,'api','0024_auto_20190710_1640','2019-07-10 08:47:51.084040'),(37,'api','0025_auto_20190710_1642','2019-07-10 08:47:51.174301'),(38,'api','0026_auto_20190710_1643','2019-07-10 08:47:51.211519'),(39,'sessions','0001_initial','2019-07-10 08:47:51.238853'),(40,'api','0027_auto_20190710_1648','2019-07-10 08:48:10.813234'),(41,'api','0028_auto_20190710_1710','2019-07-10 09:10:23.923585'),(42,'api','0029_auto_20190710_1713','2019-07-10 09:13:28.569240'),(43,'api','0030_auto_20190710_1725','2019-07-10 09:25:10.060714'),(44,'api','0031_server_outside_ip','2019-07-10 09:39:28.972929'),(45,'api','0032_auto_20190710_1740','2019-07-10 09:40:11.599027'),(46,'api','0033_auto_20190710_2040','2019-07-10 12:40:21.499005'),(47,'api','0034_auto_20190710_2116','2019-07-10 13:16:25.265630'),(48,'api','0035_auto_20190711_2317','2019-07-11 15:17:44.918927'),(49,'api','0036_auto_20190711_2318','2019-07-11 15:19:00.499223'),(50,'api','0037_auto_20190711_2319','2019-07-11 15:19:38.409080'),(51,'api','0038_auto_20190711_2322','2019-07-11 15:22:26.652336'),(52,'api','0039_auto_20190711_2333','2019-07-11 15:33:22.376840'),(53,'api','0040_auto_20190711_2336','2019-07-11 15:36:30.273421'),(54,'api','0041_auto_20190711_2356','2019-07-11 15:56:44.380822'),(55,'api','0042_auto_20190712_0011','2019-07-11 16:11:40.091879'),(56,'api','0043_auto_20190715_0955','2019-07-15 01:55:08.731013'),(57,'api','0043_auto_20190715_2006','2019-07-15 12:06:46.027170'),(58,'api','0044_auto_20190715_2205','2019-07-15 14:05:07.462966'),(59,'api','0045_auto_20190716_1501','2019-07-16 07:01:22.822072'),(60,'api','0046_auto_20190716_1723','2019-07-16 09:23:10.437229'),(61,'api','0047_auto_20190716_1723','2019-07-16 09:23:31.576107'),(62,'api','0048_auto_20190716_1738','2019-07-16 09:38:50.869930'),(63,'api','0049_auto_20190717_1049','2019-07-17 02:49:11.390759'),(64,'api','0050_auto_20190717_1051','2019-07-17 02:51:48.696408'),(65,'api','0051_auto_20190717_1405','2019-07-17 06:05:57.153075'),(66,'api','0052_auto_20190717_1517','2019-07-17 07:17:15.845768'),(67,'api','0053_auto_20190717_2158','2019-07-17 13:58:13.405196'),(68,'api','0054_auto_20190717_2202','2019-07-17 14:02:23.583573'),(69,'api','0055_auto_20190718_1101','2019-07-18 03:01:58.112653'),(70,'api','0056_auto_20190718_1118','2019-07-18 03:18:55.777338'),(71,'api','0002_auto_20190718_1125','2019-07-18 03:25:22.734932'),(72,'api','0002_databaseinfo_databaseuserinfo','2019-07-18 03:32:28.683669'),(73,'api','0002_masterdomainname_slavedomainname','2019-07-18 04:14:35.289429'),(74,'api','0003_auto_20190718_1216','2019-07-18 04:16:24.590985'),(75,'api','0002_dns','2019-07-18 10:57:46.563349'),(76,'api','0003_remove_dns_application','2019-07-18 11:27:59.746790'),(77,'api','0004_auto_20190719_1038','2019-07-19 02:38:38.933141'),(78,'api','0005_auto_20190719_1245','2019-07-19 04:45:44.036712'),(79,'api','0006_auto_20190719_1309','2019-07-19 05:09:15.901633'),(80,'api','0007_auto_20190719_1452','2019-07-19 06:52:28.897574'),(81,'api','0008_auto_20190719_1545','2019-07-19 07:46:00.721289'),(82,'api','0009_delete_tag','2019-07-19 08:17:08.517149'),(83,'api','0010_remove_business_asset','2019-07-19 08:23:30.444018'),(84,'api','0011_remove_userinfo_create_time','2019-07-19 09:15:03.248320');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('phms6hs0zy6j4eua3h0lsi2kunnq2lgt','NWZjM2FjYzNhOThjMDNkZjMzM2EwZmEwMmNhNTEzM2YwNmVkMmI5Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYmZlNGE5NmMyZGI3YWYxM2ZjZDM3OTZkYTcyZGNiNzAzZjQ1MTMyIn0=','2019-07-24 08:55:13.062501');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-14  1:37:56
