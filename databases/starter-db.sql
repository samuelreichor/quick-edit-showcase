-- MySQL dump 10.13  Distrib 8.0.36, for Linux (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_fewkyhzoruafwbxsultqcxtyrafxmpqdflfd` (`primaryOwnerId`),
  CONSTRAINT `fk_fewkyhzoruafwbxsultqcxtyrafxmpqdflfd` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xfjomkawvpgqplrpxundaiqvtkynebjfnlwq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ufahblgalhewftwymvsnareanlbgibrbwwsw` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_mxglspvlvzcdfnjvuvpuhimwaopgdewupjmr` (`dateRead`),
  KEY `fk_ioakrrndiqrqcdensoltldlejnmarmormzzy` (`pluginId`),
  CONSTRAINT `fk_ioakrrndiqrqcdensoltldlejnmarmormzzy` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kuqibrbmbwmosoprxlbdpibbvbrmesmjbjii` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zdflvlcpgtqcpbdizhkoegarkcgilibvvmqn` (`sessionId`,`volumeId`),
  KEY `idx_hrpcskydlegzvrrgiyhxqcedofjkrqsrcfoo` (`volumeId`),
  CONSTRAINT `fk_cabeqwhfeswioeqfssmcnxdvzlgylmkvrsih` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_memgybdohdanntangozwsfqnkbqrbshiyufq` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xofvmgsfpkmwzqgdhztnjdlhnzyatiwptpmc` (`filename`,`folderId`),
  KEY `idx_eokjrrhgwcqchsacwdzmkqngbxtniqfhqzhu` (`folderId`),
  KEY `idx_dhhccaafsmdwnpwfxrschnzxpodopkrubxuq` (`volumeId`),
  KEY `fk_ublvpyfmkkcodqqfxhifofgsygnuddzviegb` (`uploaderId`),
  CONSTRAINT `fk_bjsiglsskhlxleheunpdibbiqyipqidfekqa` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_egtxvzfaeonuttylcyyjvszmssxqxxaljmxw` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_idwkstrgrhnplqwnjqzfwarkstjbygzhmafw` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ublvpyfmkkcodqqfxhifofgsygnuddzviegb` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets_sites` (
  `assetId` int NOT NULL,
  `siteId` int NOT NULL,
  `alt` text,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_kxitonjxxnajtruyztrvjndzobdiijmcvwul` (`siteId`),
  CONSTRAINT `fk_kxitonjxxnajtruyztrvjndzobdiijmcvwul` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nwtbzjpyprkehoywghokbrprdraxwqwqxkqm` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticator` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_qegpggxqqgcjhkqcmzhfpxqtatqvzepnphsl` (`userId`),
  CONSTRAINT `fk_qegpggxqqgcjhkqcmzhfpxqtatqvzepnphsl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_caches`
--

DROP TABLE IF EXISTS `blitz_caches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_caches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `uri` varchar(255) NOT NULL,
  `paginate` int DEFAULT NULL,
  `dateCached` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vvvcfewkbgqtqwwyltemxbcniisxuplmrfnt` (`siteId`,`uri`),
  KEY `idx_btlyodqeupvstvzfoiecyifulgwfeswxhcae` (`expiryDate`),
  CONSTRAINT `fk_aratnbkrxqsvtygrebuwesseotbmkappibuy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_cachetags`
--

DROP TABLE IF EXISTS `blitz_cachetags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_cachetags` (
  `cacheId` int NOT NULL,
  `tag` varchar(255) NOT NULL,
  PRIMARY KEY (`cacheId`,`tag`),
  KEY `idx_wfyoogsvncppyjwgkpoasttaqkbxpkgnncxk` (`tag`),
  CONSTRAINT `fk_zailltpjucjcegbjpufafkunybtafyacipvz` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_driverdata`
--

DROP TABLE IF EXISTS `blitz_driverdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_driverdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `driver` varchar(255) NOT NULL,
  `data` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementcaches`
--

DROP TABLE IF EXISTS `blitz_elementcaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementcaches` (
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL,
  PRIMARY KEY (`cacheId`,`elementId`),
  KEY `fk_cmafuwqodppbsfqvjoyjedexymmrzrztyvft` (`elementId`),
  CONSTRAINT `fk_cmafuwqodppbsfqvjoyjedexymmrzrztyvft` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_icbvbyfjtsnsqrtowcxjbvyaalfvdelaygzd` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementexpirydates`
--

DROP TABLE IF EXISTS `blitz_elementexpirydates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementexpirydates` (
  `elementId` int NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`),
  UNIQUE KEY `idx_txkhpznoiidiqxvxwgoyfwthfjbrgcnfdmpk` (`elementId`),
  KEY `idx_hqxmlurbgijtbbqgjxdtlsutfykkxpfsywwc` (`expiryDate`),
  CONSTRAINT `fk_ynyadclfascgxbnaywkccnfxrwzcghrytruh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementfieldcaches`
--

DROP TABLE IF EXISTS `blitz_elementfieldcaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementfieldcaches` (
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL,
  `fieldInstanceUid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cacheId`,`elementId`,`fieldInstanceUid`),
  KEY `fk_iejufnhjupchmbxjctejxfcksnczacsvtrvr` (`elementId`),
  CONSTRAINT `fk_enxzlxvyblvowscfsdqkxygudslldcsvbvnr` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_iejufnhjupchmbxjctejxfcksnczacsvtrvr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementqueries`
--

DROP TABLE IF EXISTS `blitz_elementqueries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementqueries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `index` bigint NOT NULL,
  `type` varchar(255) NOT NULL,
  `params` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gxgfswttfvlqiuzfwybkkzhtiwulfuafbgnd` (`index`),
  KEY `idx_zxztsxhbldxdetyhhvymoovuimjqoeyizenw` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementqueryattributes`
--

DROP TABLE IF EXISTS `blitz_elementqueryattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementqueryattributes` (
  `queryId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  PRIMARY KEY (`queryId`,`attribute`),
  CONSTRAINT `fk_svoekenqxvkrjzztiajusmydgmggdbxggzxp` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementquerycaches`
--

DROP TABLE IF EXISTS `blitz_elementquerycaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementquerycaches` (
  `cacheId` int NOT NULL,
  `queryId` int NOT NULL,
  PRIMARY KEY (`cacheId`,`queryId`),
  KEY `fk_ouwhkkhsxbubmrkyascwzzzehkgawsowgkpd` (`queryId`),
  CONSTRAINT `fk_aebsonaevougfccrxzvrzdaxjbqiexebuuhm` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ouwhkkhsxbubmrkyascwzzzehkgawsowgkpd` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementqueryfields`
--

DROP TABLE IF EXISTS `blitz_elementqueryfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementqueryfields` (
  `queryId` int NOT NULL,
  `fieldInstanceUid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`queryId`,`fieldInstanceUid`),
  CONSTRAINT `fk_dglgpdyuyqfbqeghfmjstvodubiaedirkfwk` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_elementquerysources`
--

DROP TABLE IF EXISTS `blitz_elementquerysources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_elementquerysources` (
  `queryId` int NOT NULL,
  `sourceId` int NOT NULL,
  PRIMARY KEY (`queryId`,`sourceId`),
  CONSTRAINT `fk_ixjebecumojcszwgnrjmxcxvkxzmsmdioptb` FOREIGN KEY (`queryId`) REFERENCES `blitz_elementqueries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_hints`
--

DROP TABLE IF EXISTS `blitz_hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_hints` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `template` varchar(255) NOT NULL,
  `line` int DEFAULT NULL,
  `stackTrace` text,
  `ignored` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yxrccigougzufjzvlgylxcurnxewjozeutou` (`fieldId`,`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_includes`
--

DROP TABLE IF EXISTS `blitz_includes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_includes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `index` bigint NOT NULL,
  `siteId` int NOT NULL,
  `template` varchar(255) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_setxzmveauhqlcsknfvzupjmtdpulrhydnow` (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blitz_ssiincludecaches`
--

DROP TABLE IF EXISTS `blitz_ssiincludecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blitz_ssiincludecaches` (
  `cacheId` int NOT NULL,
  `includeId` int NOT NULL,
  PRIMARY KEY (`cacheId`,`includeId`),
  KEY `fk_rvmcioazwfsluedeznomimztyewtkgdcablj` (`includeId`),
  CONSTRAINT `fk_rvmcioazwfsluedeznomimztyewtkgdcablj` FOREIGN KEY (`includeId`) REFERENCES `blitz_includes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tgfddygidhkutjbdfqiwqipqpgdielxclrko` FOREIGN KEY (`cacheId`) REFERENCES `blitz_caches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rispjmjfkejashlpersumuncbnsbyikaxyuw` (`groupId`),
  KEY `fk_mswppltmtdxlceeqytursrwlhdkfaimdyaxu` (`parentId`),
  CONSTRAINT `fk_iqbfgxohzlqxggzrwlgihllnpxhmbarmbnim` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mswppltmtdxlceeqytursrwlhdkfaimdyaxu` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vyfrzrjlvwvhttmlpzwfitwloorjqftqofrm` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dblqqrtreapgbwygspmftotqaazuttnumpfg` (`name`),
  KEY `idx_lvsgymmcwjuwpkfsbrokthtwahksyiktanrx` (`handle`),
  KEY `idx_awtepwpoyagulnjkyclgzjykcxqbqcmdelsp` (`structureId`),
  KEY `idx_urpsqnnazebvhomqamxomgumoctvrbpculan` (`fieldLayoutId`),
  KEY `idx_romqkioswsezxidtqiwqqmmcmlwcpetixujl` (`dateDeleted`),
  CONSTRAINT `fk_qulsrwyfidrjyulwitpodafnafippuyntsjr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yflyyuutuoetovseaxwqnacamjoblppoyues` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jtkgqpmdpeuzoaczmhusknchhwkrdxtqvkwi` (`groupId`,`siteId`),
  KEY `idx_ncltjbadfbplidivjmaudaxunrdllbkbfxrq` (`siteId`),
  CONSTRAINT `fk_csmjkvvprwxqkwagxhvoqltrzpzxgnxcinqh` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rqtojljwzswshurhdnniwbiqkjyxyebnhraq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_ugjbfdnqfnsdaawrerlpwlarbngfoiibplnm` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_nlickzzxrwsgtvmorkwgmhedpkuyxhqsyfjh` (`siteId`),
  KEY `fk_ivjpgomcazbvrtdhpojdutmifklyujmpabro` (`userId`),
  CONSTRAINT `fk_gpiopewmjilxixrzpbuhgwdfwztrxwwsxnbr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ivjpgomcazbvrtdhpojdutmifklyujmpabro` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_nlickzzxrwsgtvmorkwgmhedpkuyxhqsyfjh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_hozgwohwubrbgvqwhjslopxhnnfhczgkapfj` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_ypuxobjqvtoznrtkmucvlngvofkrannqhwen` (`siteId`),
  KEY `fk_blddpyfwcinwrjerlfbuzxurlntzgdwaksfb` (`fieldId`),
  KEY `fk_oludgvggihukpahkgdmvakbcxavuuabwjfyi` (`userId`),
  CONSTRAINT `fk_blddpyfwcinwrjerlfbuzxurlntzgdwaksfb` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oludgvggihukpahkgdmvakbcxavuuabwjfyi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ruzedgizmfwfvvvqarblosodgtnyqxdjuhwn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ypuxobjqvtoznrtkmucvlngvofkrannqhwen` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_gdogvyfnnwessijnqkhbpketbooornmvogoj` (`userId`),
  CONSTRAINT `fk_gdogvyfnnwessijnqkhbpketbooornmvogoj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_klzkvwvmohwwckrappqxyovqibbhkhlijtar` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_rukhpujwmbprnsillcvyqboznogliuvnlqgv` (`creatorId`,`provisional`),
  KEY `idx_glbsvgrswawripuinxuzgflrkvwdlwpnzdow` (`saved`),
  KEY `fk_tfzajfyxkheuxxuayfzsynrmknmjqbhcemkk` (`canonicalId`),
  CONSTRAINT `fk_dmupioqulhtvfyyjvomtdusvivbwezidcyjb` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tfzajfyxkheuxxuayfzsynrmknmjqbhcemkk` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_iclbmuyiluzjythtogpauhzhpxvccibxblvh` (`elementId`,`timestamp`,`userId`),
  KEY `fk_xjhfrdgbeqqryzcunkuxxadpzxeanermomdb` (`userId`),
  KEY `fk_iakffyavveyxvjeaduespwnslskgfonjitjz` (`siteId`),
  KEY `fk_ujztepexznyihxvmbxapbrxwjxognqwfzasj` (`draftId`),
  CONSTRAINT `fk_iakffyavveyxvjeaduespwnslskgfonjitjz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ujztepexznyihxvmbxapbrxwjxognqwfzasj` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xjhfrdgbeqqryzcunkuxxadpzxeanermomdb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xpfrevfprpqygrflfgzkazfbovyqecsvecyn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tiffoucgzzagsrwprisxwruriindngltodew` (`dateDeleted`),
  KEY `idx_bfwfmmgrobiywxinpzadbqlosmdvxqtxpfyw` (`fieldLayoutId`),
  KEY `idx_cgcpndngykrxqeohagtiarxybdaklolfsjkw` (`type`),
  KEY `idx_kpamvbokttjhbdiexaqsqkbggalifncmvpxu` (`enabled`),
  KEY `idx_esxvhllzzewhzqcobgeoqkralkdximrkotjk` (`canonicalId`),
  KEY `idx_lisnsttjeeadefsqddwaedmomuqvpexliywn` (`archived`,`dateCreated`),
  KEY `idx_ayfpdiihudgdpmezzfkximndipiozdeldkiv` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_aydryjtsggqwlqbbcwtfmlogsjkvwjbgssdf` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_gzybvvkeqxtqwvdmlkoauyahnyqvsvwpprmf` (`draftId`),
  KEY `fk_zpnqeiokvqjmbmgrjvijsgtetbdeawwvtwhk` (`revisionId`),
  CONSTRAINT `fk_dcykjyoynypgbfisjuijhsgmrkrldzsxpquw` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gzybvvkeqxtqwvdmlkoauyahnyqvsvwpprmf` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lkydylztlhibfhsbhypccffqwsvosnzezvpn` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zpnqeiokvqjmbmgrjvijsgtetbdeawwvtwhk` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_zhxbzmwizgoaohiuzjtoiftywvublieksgoz` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_owners` (
  `elementId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_faoakaddbyiokpuxqshwbjpujmlrmwicqemj` (`ownerId`),
  CONSTRAINT `fk_faoakaddbyiokpuxqshwbjpujmlrmwicqemj` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nbhydelxmiaqkhrkyqmskloejhwnbbttuzvf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_edttmhhndvhftdzseogtvfteppthlsgainzm` (`elementId`,`siteId`),
  KEY `idx_occftdvgzbakxshtjprqsayhyffiuccvqaau` (`siteId`),
  KEY `idx_jxfgchuocpezxwkspklcqctieyvuvyhkqdfs` (`title`,`siteId`),
  KEY `idx_mnxrctxmsklepnisapsieucicvyjoboggbcl` (`slug`,`siteId`),
  KEY `idx_yhyunvhkqnscrlpevgcwytfkuwniqcwfrumr` (`enabled`),
  KEY `idx_uyvgzroymdigyiwmqndcjfspyfaecthlilzz` (`uri`,`siteId`),
  CONSTRAINT `fk_cmakqmdoayohptrunyrzvajegvvzeauhaoaj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ttqyeeknmfmfkjahqqvlvqvoqogwrtrmjpfx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `primaryOwnerId` int DEFAULT NULL,
  `fieldId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ocgcreghghxsrcyhfpsvajpuwyhojaavcqzo` (`postDate`),
  KEY `idx_slbshbeelgcoaldcubldtjuxlqoaedwffyxk` (`expiryDate`),
  KEY `idx_czysphiduewglxckhzgnewwbcxblxmwadfeb` (`sectionId`),
  KEY `idx_unswbupsrdtnxifdinhwvfjjvtwubqxpywwi` (`typeId`),
  KEY `idx_gmmqiujcepjqmrywgaqsyqhhjzbrhfmrrlcb` (`primaryOwnerId`),
  KEY `idx_drmzmcwiseymimgxxwdiehrbsewlwtzxdyvw` (`fieldId`),
  KEY `fk_fnlpvofuccpjyofqujunnfldelxxbpgksuox` (`parentId`),
  CONSTRAINT `fk_fnlpvofuccpjyofqujunnfldelxxbpgksuox` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tamkxkjedboojspplqyavtreysbdntrvlvdq` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tqwpctdjbtnjeydtmlmegwswnwumtnfcfgeq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vparpcefgsrncdlhnnuyamawpluvvhividur` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wbqnrkmpmdhoedpouxabyuukdxgephngabws` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wtmovatgsmguvdzpkatepsnwdoupirwfxiaa` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_authors` (
  `entryId` int NOT NULL,
  `authorId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_apodlsewakjprslpoyckodeechjmvitifbho` (`authorId`),
  KEY `idx_pgsitqhutoatzjjjsokznqhtnwzjtoaasxzz` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_gnxefzilkegsmfhvanavubrztxdoxendfjfu` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lgtvxnslkyefzqzjjqhzjskxroitwajlppko` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT '1',
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kmtyxfutzdioefheidihpklqeaidbitbalvo` (`fieldLayoutId`),
  KEY `idx_ldxpgsudqvgejhdpkbopyiethmptqyddbvps` (`dateDeleted`),
  CONSTRAINT `fk_lazouufehsppdetlaxebzwuzzpyplgdjodar` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `config` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uexdcbldgsgbusxwubgtjuawpajaezkettek` (`dateDeleted`),
  KEY `idx_odgogkdaawcwsslptkcqmquhoytchabxggkt` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nbsfuuqzpuxzgweijyvdetagzswqtzepefcf` (`handle`,`context`),
  KEY `idx_oeciadotovljbulejajiwasaafrdwgpsapmk` (`context`),
  KEY `idx_xedmngpwijydvwoxodpsvraiiubsxhiwcwqn` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jwdjcnolthfpcudufohymaffigvurrarxjli` (`name`),
  KEY `idx_lmvwfumtmxilczpozdayvndbzfylmfwaebdg` (`handle`),
  KEY `idx_wxprnmukmfaeiuehaaducqgdwtktbsegrzdj` (`fieldLayoutId`),
  KEY `idx_iunjpzujnbiagllheyrwmiiclpkvayztuxro` (`sortOrder`),
  CONSTRAINT `fk_mixvkihqrqnbzydrcwffdmtdkwovgryzrmov` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nvsefrmfvunaiyymknnagabhxdhdyqqttnti` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` json DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eqpzcoivmmutmohrmieizrmcjvimpyzhqnql` (`accessToken`),
  UNIQUE KEY `idx_scwwqyohjmmwnjjjotdnjkgdxoaaflsvnyok` (`name`),
  KEY `fk_kcdzjriquknhqdxevglqpabuiacniiixwzsk` (`schemaId`),
  CONSTRAINT `fk_kcdzjriquknhqdxevglqpabuiacniiixwzsk` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rrlhwfreavyaqcftqdmbbnxrimnppzjaqgmq` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dmldeclnqevqwaytxtbbklhnllttylhojidh` (`name`),
  KEY `idx_qzblmytscwzwjbnfshjjfkfshytjnblgkgjb` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ooquoasxshjixawvwnhnvpavialhlejfqifm` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pudcdgweeylgrhuclsenpwvfyjhgtyvmiync` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_rorusxpxllzgjzkpbenceabqyojauwfrbhdq` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_cwjwldjrxpilpjwqowvoyxqdunpfuwcmqvzw` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recoverycodes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `recoveryCodes` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rsxvytxkpafzeoxwtrkytpuxlgxlikgezmit` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_ovbrnyzunyncixprmzvlolojhbygvcykjuoj` (`sourceId`),
  KEY `idx_gyrgjfriceyljdxgrclkdcexzyqizsvapqow` (`targetId`),
  KEY `idx_ddiemqodzpjrgspdptxnvfhghtmlemycmkit` (`sourceSiteId`),
  CONSTRAINT `fk_nnlaiisjbqckmnokyiznryvrvyhkcnwlovyx` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sjoesixskcggzxtjuuuftkelpfxwqensryjv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xmazimhwduurkkiojzbeovpnddamfcknhgvf` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kmzxuqzxzjoezzlrwfamvbmnvadigvdbaami` (`canonicalId`,`num`),
  KEY `fk_pxehhmlwwpywvqlckknvcgrvzmjwvgtkiobp` (`creatorId`),
  CONSTRAINT `fk_pxehhmlwwpywvqlckknvcgrvzmjwvgtkiobp` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wbokwdoofcdgjhtpmpihsilwqjdoinktfrsc` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_yqkpkbbjngsxhjjgruovkbnxpjeitllqjjbx` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `maxAuthors` smallint unsigned NOT NULL DEFAULT '1',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` json DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hrkqrnrosxnelmepykeqzfscqndknzztjhna` (`handle`),
  KEY `idx_qluakaxcgvzoymiiqjlarxmvqlalxpoohhhg` (`name`),
  KEY `idx_oeuyvburvzlfquufdorzpadualburruuimen` (`structureId`),
  KEY `idx_xgvjrdzceiatjdizxaeapmzuiyxvzlzmlcmd` (`dateDeleted`),
  CONSTRAINT `fk_iomnbdfmbbdepvlywcneloqrziuwmhoqehfq` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_qhbiuqtqbkzjusggqerxqdjfugcdrieusgvt` (`typeId`),
  CONSTRAINT `fk_qhbiuqtqbkzjusggqerxqdjfugcdrieusgvt` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wxjumnklxtsdyoreynzlhbavqjbfmwspxwdj` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zxbzdkywkoppgyufqrrchwueujrwdvybnzwu` (`sectionId`,`siteId`),
  KEY `idx_cpmwbbfiywkovtldjqqasrlrpxqlzccvpsnt` (`siteId`),
  CONSTRAINT `fk_kfeachvghbllnsxmtqisppgpwafsjapojlzq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uxvndjettlmizaxjhkmfcxchcdjmipkrhhdc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hnyxihhwxkftkpnqgilxkmmsmbexvpmawgoi` (`uid`),
  KEY `idx_jkdidqzqnalhhsomqkvoyjxsqmpgjbmngxym` (`token`),
  KEY `idx_iagxvwdyygzptmzfljhaorifzbnqvolmfuvx` (`dateUpdated`),
  KEY `idx_ozllgmhjyxzunpctbtywdeatniaiabgolhxh` (`userId`),
  CONSTRAINT `fk_jeikcietethrsdkvjbalnmfhswtsjvrlhbif` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fokpnmonjynvalvjdurwxrfnwmrczknqojoo` (`userId`,`message`),
  CONSTRAINT `fk_ayrsjtifkugnmmcgtficsuvxcvagnkcfkzsf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hwhoemlfafvajyxgehavasynwtfhnurwvpus` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xrqurmgosjhurarbjgnmbufxdefklazvxnss` (`dateDeleted`),
  KEY `idx_sngfsvjrvigueclyqihflcxvuzdqoorzanaw` (`handle`),
  KEY `idx_aiymutyeczowceovddkeozedaxkxamlsvjem` (`sortOrder`),
  KEY `fk_gqpzvrnzxbadzwtcrdhtotqivhmgtfaljimo` (`groupId`),
  CONSTRAINT `fk_gqpzvrnzxbadzwtcrdhtotqivhmgtfaljimo` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_clyzwovshwkglbfzfatrbgogaiaxprbarxjb` (`userId`),
  CONSTRAINT `fk_clyzwovshwkglbfzfatrbgogaiaxprbarxjb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rkljtpjghsluctbwbxyhjbqgkyegafwsdafv` (`structureId`,`elementId`),
  KEY `idx_nfcyygfobclgwrukpfmoylpghaplodexvqlx` (`root`),
  KEY `idx_ukgcnsyulqfhuxrbskvkwifgjvsivvkszzqt` (`lft`),
  KEY `idx_ygotnmkjziocfuoxnhvllgtwateqnrxfrvet` (`rgt`),
  KEY `idx_cprvmcnnxteauyckqtagqsxuhnqdqajbrutm` (`level`),
  KEY `idx_rxwqpczfcqcbhjmlbwogwqzbziybbrgwnjcj` (`elementId`),
  CONSTRAINT `fk_xsofexmhspgmuklfwvbcqdwdjcsvxewanlhg` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ptdldwnlkzzxycsqydaahrqzuenwjkcngjii` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yptqtlkeptuwfhgynecidkvabbyywsxnwmao` (`key`,`language`),
  KEY `idx_ntqnwqxugherwkjajtmszqhqgzjgeppzrnhd` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ztqpeqacgjgwavtvwevynkaiwytqyaknaghy` (`name`),
  KEY `idx_cgsfscltitynyxxlyvswfjsdyijvbejmzfyh` (`handle`),
  KEY `idx_ysppsduoxjjgfstbnwngbpeoqhtjsjebxyfy` (`dateDeleted`),
  KEY `fk_gmitpahovmpajwrzrwvlkhfzefjcorjnsgrz` (`fieldLayoutId`),
  CONSTRAINT `fk_gmitpahovmpajwrzrwvlkhfzefjcorjnsgrz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_posradykcyktinxjybfyhaufzaocvgcprvfo` (`groupId`),
  CONSTRAINT `fk_ghqfwtcgxhjihymaobndobpdntudrmrkecxv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jvzkjcmgflzpbghesnjsexwekuqhfouhwqsu` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_knickhamdwqfismzloutunklfgayfeatpcjv` (`token`),
  KEY `idx_utsjxcsiewznafzggkyyqdewvllplwbzqgbr` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_osqktmdocwrzgiekutktlhmxdugwdzlpihnu` (`handle`),
  KEY `idx_ksnwzzsmjjkaktdylijwxvuzndyipwxiclpx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vkfsymzyvnsbnlsmlaqcesblhiglipwunduu` (`groupId`,`userId`),
  KEY `idx_nyvfuxhuydbouhfnpfqpjaxjlxcbcpgjofsd` (`userId`),
  CONSTRAINT `fk_aqpdhazxmrwrusmvkazlbulqzxqxyfoerbym` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_okhhwdqjmmvgyruwigxpkhifiutvbyctnccp` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ganmpwyswyvdsjztjfjogsnaykzvrqtwgxcp` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dzbohcsyneblalwisoptorexnwwrhdhvranm` (`permissionId`,`groupId`),
  KEY `idx_mqjwljgaccpkuganybsjdgqlskluilloatax` (`groupId`),
  CONSTRAINT `fk_gjxdlnxpcddaqdfskzwiwgqurmetjkffmuva` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yctzazokhlpnlnvlnfjbpyfhqqilqqecyifx` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wmqdhqgdgvsrdjkohzojdbwurajykbibaont` (`permissionId`,`userId`),
  KEY `idx_feltigghzkmrywyvzywaznrzyybezrjfmbto` (`userId`),
  CONSTRAINT `fk_cfmbwiteowidufmstdmzufxqjdafcqcytgnf` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pbkcbibnvgiqhdykmoyloonrrbufdqmgqtut` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` json DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_cckcujhakbygqsjbyzzxpistucmvbtexlmwg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xvgeiddyzrqogrmutaoskhqklpcyvzkucket` (`active`),
  KEY `idx_tjzylnkrsisruhtsvgbdjcmtusprzyrvcqgq` (`locked`),
  KEY `idx_ltshhthxxncclmwwfyxhwpegtaxsqvrzbpiv` (`pending`),
  KEY `idx_kkdwkhbipphhhmzodiqfugyfkodtmfcsnfni` (`suspended`),
  KEY `idx_jziuyujumrecbfzdxabfpvcwgvfhekzqlyii` (`verificationCode`),
  KEY `idx_zblnspgmuluyihymqjybvfugmsjxqaadhmix` (`email`),
  KEY `idx_clyemskgoxuqfifidaslcnwqnbanccfnnxny` (`username`),
  KEY `fk_utjhymkxoenbncfpnqnhavhkxwtdhpbspfpf` (`photoId`),
  CONSTRAINT `fk_djhtegwznhyhaomhqmbvyxokmkuuwghkyczf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_utjhymkxoenbncfpnqnhavhkxwtdhpbspfpf` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xnctjcnvqldtnwyodiztiaxhshnqnvthnwrl` (`name`,`parentId`,`volumeId`),
  KEY `idx_kggwpxucvhalxvuiowqymaybanfoipztvrgg` (`parentId`),
  KEY `idx_nsabahycrplzeqjmvkedqnbvwfhzlyvynato` (`volumeId`),
  CONSTRAINT `fk_aampobcsdexaolwwqlbwqzveatopijzksbkd` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zysnnvheyybbvocdlxhiopwdqjeialvhtnvb` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hvfcxaaprxmbjutomzzvusooajwqacvjapiq` (`name`),
  KEY `idx_qgdbqqtbvgfgccipvbvcikblpskmqwmavfed` (`handle`),
  KEY `idx_ufutycaicdpczmtehtksprkwswecndtgbccd` (`fieldLayoutId`),
  KEY `idx_dmqgtqpxjqeejteksfodgalrpbzrsejzgvdk` (`dateDeleted`),
  CONSTRAINT `fk_wxrralmwrallryxsrknbfbegfemhohfgqgvg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `webauthn` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_yqiernbjzrbwthndivmcftuclrsseolwhtje` (`userId`),
  CONSTRAINT `fk_yqiernbjzrbwthndivmcftuclrsseolwhtje` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` json DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xhzgmmjzbnfbthorxgrxnnzivtqlldblgikw` (`userId`),
  CONSTRAINT `fk_sjrqwrqkbgztgtdyinqvuxvikrvibamhpvna` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-18 10:03:37
-- MySQL dump 10.13  Distrib 8.0.36, for Linux (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_caches`
--

LOCK TABLES `blitz_caches` WRITE;
/*!40000 ALTER TABLE `blitz_caches` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_caches` VALUES (17,1,'',NULL,'2025-01-18 09:52:25',NULL);
/*!40000 ALTER TABLE `blitz_caches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_cachetags`
--

LOCK TABLES `blitz_cachetags` WRITE;
/*!40000 ALTER TABLE `blitz_cachetags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_cachetags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_driverdata`
--

LOCK TABLES `blitz_driverdata` WRITE;
/*!40000 ALTER TABLE `blitz_driverdata` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_driverdata` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementcaches`
--

LOCK TABLES `blitz_elementcaches` WRITE;
/*!40000 ALTER TABLE `blitz_elementcaches` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_elementcaches` VALUES (17,1);
/*!40000 ALTER TABLE `blitz_elementcaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementexpirydates`
--

LOCK TABLES `blitz_elementexpirydates` WRITE;
/*!40000 ALTER TABLE `blitz_elementexpirydates` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementexpirydates` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementfieldcaches`
--

LOCK TABLES `blitz_elementfieldcaches` WRITE;
/*!40000 ALTER TABLE `blitz_elementfieldcaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementfieldcaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementqueries`
--

LOCK TABLES `blitz_elementqueries` WRITE;
/*!40000 ALTER TABLE `blitz_elementqueries` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementqueries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementqueryattributes`
--

LOCK TABLES `blitz_elementqueryattributes` WRITE;
/*!40000 ALTER TABLE `blitz_elementqueryattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementqueryattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementquerycaches`
--

LOCK TABLES `blitz_elementquerycaches` WRITE;
/*!40000 ALTER TABLE `blitz_elementquerycaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementquerycaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementqueryfields`
--

LOCK TABLES `blitz_elementqueryfields` WRITE;
/*!40000 ALTER TABLE `blitz_elementqueryfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementqueryfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_elementquerysources`
--

LOCK TABLES `blitz_elementquerysources` WRITE;
/*!40000 ALTER TABLE `blitz_elementquerysources` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_elementquerysources` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_hints`
--

LOCK TABLES `blitz_hints` WRITE;
/*!40000 ALTER TABLE `blitz_hints` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_hints` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_includes`
--

LOCK TABLES `blitz_includes` WRITE;
/*!40000 ALTER TABLE `blitz_includes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `blitz_includes` VALUES (1,1519155553,1,'craft-quick-edit/_settings.twig','[]'),(2,584431569,1,'craft-quick-edit/_settings.twig','{\"cpEditUrl\":\"https:\\/\\/cp-edit-showcase.ddev.site:8443\\/admin\\/entries\\/home\\/1-home\",\"canRender\":true}'),(3,3127008506,1,'craft-quick-edit/_settings.twig','{\"cpEditUrl\":\"https:\\/\\/cp-edit-showcase.ddev.site:8443\\/admin\\/entries\\/news\\/6-news-number-1\",\"canRender\":true}'),(4,2140899870,1,'craft-quick-edit/_settings.twig','{\"cpEditUrl\":\"https:\\/\\/cp-edit-showcase.ddev.site:8443\\/admin\\/entries\\/news\\/6-news-number-1\",\"canRender\":false}'),(5,3552560309,1,'craft-quick-edit/_settings.twig','{\"cpEditUrl\":\"https:\\/\\/cp-edit-showcase.ddev.site:8443\\/admin\\/entries\\/home\\/1-home\",\"canRender\":false}'),(6,280109485,1,'craft-quick-edit/_settings.twig',''),(7,3000766003,1,'craft-quick-edit/_edit.twig','{\"cpEditUrl\":\"https:\\/\\/cp-edit-showcase.ddev.site:8443\\/admin\\/entries\\/home\\/1-home\",\"canRender\":false}'),(8,4165214883,1,'craft-quick-edit/_edit.twig','{\"cpEditUrl\":\"https:\\/\\/cp-edit-showcase.ddev.site:8443\\/admin\\/entries\\/news\\/6-news-number-1\",\"canRender\":false}'),(9,1835610987,1,'craft-quick-edit/_edit.twig','{\"cpEditUrl\":\"https:\\/\\/cp-edit-showcase.ddev.site:8443\\/admin\\/entries\\/news\\/6-news-number-1\",\"canRender\":true}'),(10,719381007,1,'craft-quick-edit/_edit.twig','{\"cpEditUrl\":\"https:\\/\\/cp-edit-showcase.ddev.site:8443\\/admin\\/entries\\/home\\/1-home\",\"canRender\":true}'),(11,1220949182,1,'craft-quick-edit/_edit.twig','{\"cpEditUrl\":\"https:\\/\\/cp-edit-showcase.ddev.site:8443\\/admin\\/entries\\/news\\/6-news-number-1\",\"canEdit\":true}'),(12,956109470,1,'craft-quick-edit/_edit.twig','{\"cpEditUrl\":\"https:\\/\\/cp-edit-showcase.ddev.site:8443\\/admin\\/entries\\/home\\/1-home\",\"canEdit\":true}'),(13,902213649,1,'craft-quick-edit/_edit.twig','{\"cpEditUrl\":\"https:\\/\\/cp-edit-showcase.ddev.site:8443\\/admin\\/entries\\/home\\/1-home\",\"canEdit\":false}'),(14,249080831,1,'craft-quick-edit/_edit.twig','{\"cpEditUrl\":\"https:\\/\\/cp-edit-showcase.ddev.site:8443\\/admin\\/entries\\/news\\/6-news-number-1\",\"canEdit\":false}');
/*!40000 ALTER TABLE `blitz_includes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `blitz_ssiincludecaches`
--

LOCK TABLES `blitz_ssiincludecaches` WRITE;
/*!40000 ALTER TABLE `blitz_ssiincludecaches` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `blitz_ssiincludecaches` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (4,1,'lastPasswordChangeDate','2025-01-18 09:53:16',0,4),(4,1,'password','2025-01-18 09:53:16',0,4),(6,1,'postDate','2025-01-16 18:35:07',0,4),(6,1,'slug','2025-01-16 18:35:07',0,4),(6,1,'title','2025-01-16 18:35:07',0,4),(6,1,'uri','2025-01-16 18:35:07',0,4);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (1,4,1,NULL,'save','2025-01-16 18:34:38'),(1,4,1,NULL,'view','2025-01-16 18:34:37'),(4,4,1,NULL,'view','2025-01-18 09:52:59'),(6,4,1,NULL,'save','2025-01-16 18:35:07'),(6,4,1,NULL,'view','2025-01-18 10:03:20');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2025-01-16 18:34:26','2025-01-16 18:34:38',NULL,NULL,NULL,'33238319-0eec-42aa-9e38-2da2170bd96f'),(2,1,NULL,1,1,'craft\\elements\\Entry',1,0,'2025-01-16 18:34:26','2025-01-16 18:34:26',NULL,NULL,NULL,'29aac81d-bf50-4184-b567-d6073b16fd07'),(3,1,NULL,2,1,'craft\\elements\\Entry',1,0,'2025-01-16 18:34:27','2025-01-16 18:34:27',NULL,NULL,NULL,'bed9e2de-fd83-422b-bb1d-b9c62ebfe21e'),(4,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2025-01-16 18:34:27','2025-01-18 09:53:15',NULL,NULL,NULL,'271b1c2a-5e4e-43d9-be7f-bc9e2f2126b2'),(5,1,NULL,3,1,'craft\\elements\\Entry',1,0,'2025-01-16 18:34:38','2025-01-16 18:34:38',NULL,NULL,NULL,'d7e2e277-abc2-406d-9163-ea6205b46066'),(6,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2025-01-16 18:35:06','2025-01-16 18:35:07',NULL,NULL,NULL,'c7e48cf6-074d-4577-bcfa-8ea917db48fa'),(7,6,NULL,4,3,'craft\\elements\\Entry',1,0,'2025-01-16 18:35:07','2025-01-16 18:35:07',NULL,NULL,NULL,'853e308c-9663-426c-bf40-a968eb91246e');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,'Home','home','__home__',NULL,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','77e0b5cb-7bdb-422f-a9dc-98772dbca5c9'),(2,2,1,'Home','home','__home__',NULL,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','125b2b55-841e-485e-928a-713610d377d4'),(3,3,1,'Home','home','__home__',NULL,1,'2025-01-16 18:34:27','2025-01-16 18:34:27','586da625-0d33-4150-a932-a4b007dd4afa'),(4,4,1,NULL,NULL,NULL,NULL,1,'2025-01-16 18:34:27','2025-01-16 18:34:27','eda8eb8a-5e5d-4921-af10-2c157db66293'),(5,5,1,'Home','home','__home__',NULL,1,'2025-01-16 18:34:38','2025-01-16 18:34:38','9df0ffd5-943a-48f8-80fd-3ff213e45913'),(6,6,1,'news-number-1','news-number-1','news/news-number-1',NULL,1,'2025-01-16 18:35:06','2025-01-16 18:35:07','cc27d035-0dbc-4b08-9f8f-7a4b1be35933'),(7,7,1,'news-number-1','news-number-1','news/news-number-1',NULL,1,'2025-01-16 18:35:07','2025-01-16 18:35:07','7d171727-5b53-4df2-ac33-0832257c99af');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (1,1,NULL,NULL,NULL,1,'2025-01-16 18:34:00',NULL,NULL,NULL,'2025-01-16 18:34:26','2025-01-16 18:34:26'),(2,1,NULL,NULL,NULL,1,'2025-01-16 18:34:00',NULL,NULL,NULL,'2025-01-16 18:34:26','2025-01-16 18:34:26'),(3,1,NULL,NULL,NULL,1,'2025-01-16 18:34:00',NULL,NULL,NULL,'2025-01-16 18:34:27','2025-01-16 18:34:27'),(5,1,NULL,NULL,NULL,1,'2025-01-16 18:34:00',NULL,NULL,NULL,'2025-01-16 18:34:38','2025-01-16 18:34:38'),(6,3,NULL,NULL,NULL,3,'2025-01-16 18:35:00',NULL,NULL,NULL,'2025-01-16 18:35:06','2025-01-16 18:35:07'),(7,3,NULL,NULL,NULL,3,'2025-01-16 18:35:00',NULL,NULL,NULL,'2025-01-16 18:35:07','2025-01-16 18:35:07');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries_authors` VALUES (6,4,1),(7,4,1);
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,'Home','home',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-01-16 18:34:26','2025-01-16 18:34:26',NULL,'19d6b378-8346-4ed5-acc9-4f174a58e04a'),(2,2,'Faqs','faqs',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-01-16 18:34:26','2025-01-16 18:34:26',NULL,'0354643a-5af0-4930-87c0-ce0cfeb0cd1f'),(3,3,'News','news',NULL,NULL,1,'site',NULL,NULL,1,'site',NULL,1,'2025-01-16 18:34:26','2025-01-16 18:34:26',NULL,'efcd8f45-b324-4db8-ab75-e28b60d5325e');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"cdccfb59-1001-4691-b9ef-4ae22fcc27b7\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"8daff4d3-f603-4a61-b788-e6882eecd27a\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-01-14T16:50:55+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2025-01-16 18:34:26','2025-01-16 18:34:26',NULL,'2868304f-c138-4950-aefc-21d4a814f56d'),(2,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"faad9abd-fb61-42b3-a695-f52bcfb52e14\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"4eb89cab-dfdb-41d2-84dc-7d0f3e878979\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-01-14T16:52:01+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2025-01-16 18:34:26','2025-01-16 18:34:26',NULL,'5614f290-c2d1-4f14-b00a-e36916348ca0'),(3,'craft\\elements\\Entry','{\"tabs\": [{\"uid\": \"a30f0f4b-3887-4a9e-8b22-eb9bde3c7356\", \"name\": \"Content\", \"elements\": [{\"id\": null, \"max\": null, \"min\": null, \"tip\": null, \"uid\": \"cc01d89a-4ef2-4618-8050-6b815579facf\", \"name\": null, \"size\": null, \"step\": null, \"type\": \"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\", \"class\": null, \"label\": null, \"title\": null, \"width\": 100, \"warning\": null, \"disabled\": false, \"readonly\": false, \"dateAdded\": \"2025-01-14T16:51:13+00:00\", \"inputType\": null, \"requirable\": false, \"autocorrect\": true, \"orientation\": null, \"placeholder\": null, \"autocomplete\": false, \"instructions\": null, \"userCondition\": null, \"autocapitalize\": true, \"includeInCards\": false, \"providesThumbs\": false, \"labelAttributes\": [], \"elementCondition\": null, \"containerAttributes\": [], \"inputContainerAttributes\": []}], \"userCondition\": null, \"elementCondition\": null}]}','2025-01-16 18:34:26','2025-01-16 18:34:26',NULL,'6f755109-917c-4cdd-aa2b-3687d0167461');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'5.5.10','5.5.0.0',0,'gxguwqesiusp','3@xpbmqbcnxv','2025-01-16 18:34:26','2025-01-16 19:44:46','76824013-be2e-4952-b793-e4af35867d3a');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'plugin:blitz','Install','2025-01-16 18:34:26','2025-01-16 18:34:26','2025-01-16 18:34:26','097ae6c2-5b81-454e-8e1e-4dfa0caeab43'),(2,'plugin:blitz','m240226_120000_drop_route_variable_hints_and_column','2025-01-16 18:34:26','2025-01-16 18:34:26','2025-01-16 18:34:26','f0fb59ed-52a0-43b3-bd23-b9e225efa6a0'),(3,'plugin:blitz','m240310_120000_add_stack_trace','2025-01-16 18:34:26','2025-01-16 18:34:26','2025-01-16 18:34:26','314f461b-a8fd-446c-8c53-bd5bbd61903e'),(4,'plugin:blitz','m240719_120000_remove_legacy_settings','2025-01-16 18:34:26','2025-01-16 18:34:26','2025-01-16 18:34:26','0a7f8e94-e2a5-49f2-bc72-e89523731a90'),(5,'plugin:blitz','m240731_120000_add_datecached_column','2025-01-16 18:34:26','2025-01-16 18:34:26','2025-01-16 18:34:26','aabd62c8-c0b2-4ab4-8c6b-3e364c44ecc0'),(6,'plugin:blitz','m240820_120000_add_fieldinstanceuid_column','2025-01-16 18:34:26','2025-01-16 18:34:26','2025-01-16 18:34:26','df6f638b-a2a9-48d7-a418-8de6c85b8249'),(7,'plugin:blitz','m240826_120000_convert_cachecontrol_settings','2025-01-16 18:34:26','2025-01-16 18:34:26','2025-01-16 18:34:26','5312902e-6a2a-4664-bede-d3100f6f1f0a'),(8,'plugin:blitz','m240905_120000_convert_enabled_settings','2025-01-16 18:34:26','2025-01-16 18:34:26','2025-01-16 18:34:26','2d985186-fe88-4d14-a11a-f18b8a1eb9e7'),(9,'plugin:blitz','m241001_120000_add_ignored_column','2025-01-16 18:34:26','2025-01-16 18:34:26','2025-01-16 18:34:26','5dd3be1e-4f52-45c5-abc7-03c7d0967aee'),(10,'craft','Install','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','97f6376b-7579-47ee-8b53-cb0d5692791a'),(11,'craft','m221101_115859_create_entries_authors_table','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','a23c7037-bcbe-45c4-aada-9afcaea7c579'),(12,'craft','m221107_112121_add_max_authors_to_sections','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','1f040e96-69d5-4ccf-848b-565f13a2e9d9'),(13,'craft','m221205_082005_translatable_asset_alt_text','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','6781482a-732c-4b8e-987f-25c41f187bf4'),(14,'craft','m230314_110309_add_authenticator_table','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','c0bfe4e5-e3df-4136-acd2-b0962f80bb2d'),(15,'craft','m230314_111234_add_webauthn_table','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','086358d8-a052-486f-8f5b-f69592620ea4'),(16,'craft','m230503_120303_add_recoverycodes_table','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','abf5e8ff-bb8a-4296-994d-8c0b67c81d87'),(17,'craft','m230511_000000_field_layout_configs','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','ab2c7680-ac6c-4944-a19b-ee124c0c827f'),(18,'craft','m230511_215903_content_refactor','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','3762c188-8f44-417a-802e-cf3b68fd5b6b'),(19,'craft','m230524_000000_add_entry_type_show_slug_field','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','e27f7939-c1e5-410f-ac6f-e8669ad924ca'),(20,'craft','m230524_000001_entry_type_icons','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','d5bc558c-22bf-4264-a724-57b1c596889c'),(21,'craft','m230524_000002_entry_type_colors','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','4bee6800-48bb-4dfa-aa80-e2e96be7acf8'),(22,'craft','m230524_220029_global_entry_types','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','7497b2ea-8fcd-4da9-898a-d0cea70ad673'),(23,'craft','m230531_123004_add_entry_type_show_status_field','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','d2bcb20d-1e01-4020-a0b8-9d19b9049e96'),(24,'craft','m230607_102049_add_entrytype_slug_translation_columns','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','949c9289-46dc-4e01-8141-839cd0a55209'),(25,'craft','m230616_173810_kill_field_groups','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','ba1d05a2-899d-466b-a948-26e4e7db9b84'),(26,'craft','m230616_183820_remove_field_name_limit','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','143d26ee-7cc3-4dbe-a85a-06627f516a8b'),(27,'craft','m230617_070415_entrify_matrix_blocks','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','9557bd6c-687a-4ed8-948c-5543a1120c8d'),(28,'craft','m230710_162700_element_activity','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','23478950-84db-4196-9cad-2a100bf03d4a'),(29,'craft','m230820_162023_fix_cache_id_type','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','896cea54-f541-4118-886f-86b8024fc913'),(30,'craft','m230826_094050_fix_session_id_type','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','3c35e4bf-26df-4fc6-bae9-a2946dba76eb'),(31,'craft','m230904_190356_address_fields','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','ab42070b-27bc-43d2-b756-7a2732541d2b'),(32,'craft','m230928_144045_add_subpath_to_volumes','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','b9e4d7c3-8c83-4be9-8ce0-eca2fecc11e9'),(33,'craft','m231013_185640_changedfields_amend_primary_key','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','ee1e5231-ea8c-492c-83f3-a0274dbdcb61'),(34,'craft','m231213_030600_element_bulk_ops','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','1f9196ae-5239-4aa4-aff6-0e276b3627b6'),(35,'craft','m240129_150719_sites_language_amend_length','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','3b8ecdef-5e2f-4e9d-a4dd-31b61dca6473'),(36,'craft','m240206_035135_convert_json_columns','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','065fccae-dda6-42c8-969f-b0da0253fd55'),(37,'craft','m240207_182452_address_line_3','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','148e71da-93e4-45a5-b02a-4dbaa03a679e'),(38,'craft','m240302_212719_solo_preview_targets','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','bd92fe2d-3b71-4624-886d-9f5924e587fc'),(39,'craft','m240619_091352_add_auth_2fa_timestamp','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','61c9f7ba-8270-4a1e-ba16-03cae40859e7'),(40,'craft','m240723_214330_drop_bulkop_fk','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','4d01b368-3f2e-4ef1-b664-95e1252cf68d'),(41,'craft','m240731_053543_soft_delete_fields','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','469a1a40-6d96-40ce-aeec-40945224db99'),(42,'craft','m240805_154041_sso_identities','2025-01-16 18:34:27','2025-01-16 18:34:27','2025-01-16 18:34:27','5eceb18e-fbec-4f8a-9923-00103e4d8c25'),(43,'craft','m240926_202248_track_entries_deleted_with_section','2025-01-16 19:44:46','2025-01-16 19:44:46','2025-01-16 19:44:46','2ba92932-d33a-49ad-874c-31c84491d088');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'blitz','5.9.9','5.9.0','2025-01-16 18:34:26','2025-01-16 18:34:26','2025-01-16 18:34:26','300f849e-6d72-46ab-99f3-28fe5c2d71fb'),(2,'craft-quick-edit','0.0.1','1.0.0','2025-01-16 18:34:26','2025-01-16 18:34:26','2025-01-16 18:34:26','0fb7e884-326c-47c5-88d1-a56e26c92e0e');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1737056686'),('email.fromEmail','\"samuelreichor@gmail.com\"'),('email.fromName','\"cp-edit-showcase\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.color','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elementCondition','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.autocapitalize','true'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.autocomplete','false'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.autocorrect','true'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.class','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.dateAdded','\"2025-01-14T16:52:01+00:00\"'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.disabled','false'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.elementCondition','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.id','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.includeInCards','false'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.inputType','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.instructions','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.label','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.max','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.min','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.name','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.orientation','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.placeholder','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.providesThumbs','false'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.readonly','false'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.required','true'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.size','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.step','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.tip','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.title','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.uid','\"4eb89cab-dfdb-41d2-84dc-7d0f3e878979\"'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.userCondition','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.warning','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.elements.0.width','100'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.name','\"Content\"'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.uid','\"faad9abd-fb61-42b3-a695-f52bcfb52e14\"'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.fieldLayouts.5614f290-c2d1-4f14-b00a-e36916348ca0.tabs.0.userCondition','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.handle','\"faqs\"'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.hasTitleField','true'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.icon','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.name','\"Faqs\"'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.showSlugField','true'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.showStatusField','true'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.slugTranslationKeyFormat','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.slugTranslationMethod','\"site\"'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.titleFormat','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.titleTranslationKeyFormat','null'),('entryTypes.0354643a-5af0-4930-87c0-ce0cfeb0cd1f.titleTranslationMethod','\"site\"'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.color','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elementCondition','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.autocapitalize','true'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.autocomplete','false'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.autocorrect','true'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.class','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.dateAdded','\"2025-01-14T16:50:55+00:00\"'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.disabled','false'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.elementCondition','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.id','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.includeInCards','false'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.inputType','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.instructions','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.label','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.max','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.min','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.name','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.orientation','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.placeholder','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.providesThumbs','false'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.readonly','false'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.required','true'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.size','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.step','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.tip','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.title','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.uid','\"8daff4d3-f603-4a61-b788-e6882eecd27a\"'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.userCondition','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.warning','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.elements.0.width','100'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.name','\"Content\"'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.uid','\"cdccfb59-1001-4691-b9ef-4ae22fcc27b7\"'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.fieldLayouts.2868304f-c138-4950-aefc-21d4a814f56d.tabs.0.userCondition','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.handle','\"home\"'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.hasTitleField','true'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.icon','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.name','\"Home\"'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.showSlugField','true'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.showStatusField','true'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.slugTranslationKeyFormat','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.slugTranslationMethod','\"site\"'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.titleFormat','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.titleTranslationKeyFormat','null'),('entryTypes.19d6b378-8346-4ed5-acc9-4f174a58e04a.titleTranslationMethod','\"site\"'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.color','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elementCondition','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.autocapitalize','true'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.autocomplete','false'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.autocorrect','true'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.class','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.dateAdded','\"2025-01-14T16:51:13+00:00\"'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.disabled','false'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.elementCondition','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.id','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.includeInCards','false'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.inputType','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.instructions','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.label','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.max','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.min','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.name','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.orientation','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.placeholder','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.providesThumbs','false'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.readonly','false'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.required','true'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.size','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.step','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.tip','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.title','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.uid','\"cc01d89a-4ef2-4618-8050-6b815579facf\"'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.userCondition','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.warning','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.elements.0.width','100'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.name','\"Content\"'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.uid','\"a30f0f4b-3887-4a9e-8b22-eb9bde3c7356\"'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.fieldLayouts.6f755109-917c-4cdd-aa2b-3687d0167461.tabs.0.userCondition','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.handle','\"news\"'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.hasTitleField','true'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.icon','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.name','\"News\"'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.showSlugField','true'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.showStatusField','true'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.slugTranslationKeyFormat','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.slugTranslationMethod','\"site\"'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.titleFormat','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.titleTranslationKeyFormat','null'),('entryTypes.efcd8f45-b324-4db8-ab75-e28b60d5325e.titleTranslationMethod','\"site\"'),('meta.__names__.0354643a-5af0-4930-87c0-ce0cfeb0cd1f','\"Faqs\"'),('meta.__names__.0b856bfa-7241-474a-bbd8-18c2c03321b5','\"Home\"'),('meta.__names__.19d6b378-8346-4ed5-acc9-4f174a58e04a','\"Home\"'),('meta.__names__.32ad4f6d-3553-4c3d-8cb9-4868f0544cca','\"Faqs\"'),('meta.__names__.33dc3560-eb15-49fe-9ab6-772ccf4576c5','\"cp-edit-showcase\"'),('meta.__names__.5689cabb-f574-4961-99bc-83c95a194c5a','\"Editor\"'),('meta.__names__.e5647779-c8f7-4286-9e2a-0c5d533d6ad5','\"News\"'),('meta.__names__.efcd8f45-b324-4db8-ab75-e28b60d5325e','\"News\"'),('meta.__names__.f585159c-4950-4889-a28d-c7271dae58a5','\"cp-edit-showcase\"'),('plugins.blitz.edition','\"standard\"'),('plugins.blitz.enabled','true'),('plugins.blitz.licenseKey','\"Y9FVD29M9J3B5XK5U8IDO5O0\"'),('plugins.blitz.schemaVersion','\"5.9.0\"'),('plugins.blitz.settings.apiKey','\"\"'),('plugins.blitz.settings.cacheControlHeader','\"public, s-maxage=31536000, max-age=0\"'),('plugins.blitz.settings.cacheControlHeaderExpired','\"public, s-maxage=5, max-age=0\"'),('plugins.blitz.settings.cacheDuration','null'),('plugins.blitz.settings.cacheGeneratorSettings.__assoc__.0.0','\"concurrency\"'),('plugins.blitz.settings.cacheGeneratorSettings.__assoc__.0.1','\"3\"'),('plugins.blitz.settings.cacheGeneratorType','\"putyourlightson\\\\blitz\\\\drivers\\\\generators\\\\HttpGenerator\"'),('plugins.blitz.settings.cacheNonHtmlResponses','false'),('plugins.blitz.settings.cachePurgerType','\"putyourlightson\\\\blitz\\\\drivers\\\\purgers\\\\DummyPurger\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.0.0','\"folderPath\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.0.1','\"@webroot/cache/blitz\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.1.0','\"compressCachedValues\"'),('plugins.blitz.settings.cacheStorageSettings.__assoc__.1.1','\"\"'),('plugins.blitz.settings.cacheStorageType','\"putyourlightson\\\\blitz\\\\drivers\\\\storage\\\\FileStorage\"'),('plugins.blitz.settings.cachingEnabled','true'),('plugins.blitz.settings.debug','true'),('plugins.blitz.settings.defaultCacheControlHeader','\"no-store\"'),('plugins.blitz.settings.deployerType','\"putyourlightson\\\\blitz\\\\drivers\\\\deployers\\\\DummyDeployer\"'),('plugins.blitz.settings.detectSsiEnabled','true'),('plugins.blitz.settings.driverJobBatchSize','100'),('plugins.blitz.settings.driverJobPriority','100'),('plugins.blitz.settings.esiEnabled','false'),('plugins.blitz.settings.excludedQueryStringParams.0.__assoc__.0.0','\"enabled\"'),('plugins.blitz.settings.excludedQueryStringParams.0.__assoc__.0.1','\"1\"'),('plugins.blitz.settings.excludedQueryStringParams.0.__assoc__.1.0','\"queryStringParam\"'),('plugins.blitz.settings.excludedQueryStringParams.0.__assoc__.1.1','\"gclid\"'),('plugins.blitz.settings.excludedQueryStringParams.1.__assoc__.0.0','\"enabled\"'),('plugins.blitz.settings.excludedQueryStringParams.1.__assoc__.0.1','\"1\"'),('plugins.blitz.settings.excludedQueryStringParams.1.__assoc__.1.0','\"queryStringParam\"'),('plugins.blitz.settings.excludedQueryStringParams.1.__assoc__.1.1','\"fbclid\"'),('plugins.blitz.settings.generatePagesWithQueryStringParams','true'),('plugins.blitz.settings.hintsEnabled','true'),('plugins.blitz.settings.includedQueryStringParams.0.__assoc__.0.0','\"enabled\"'),('plugins.blitz.settings.includedQueryStringParams.0.__assoc__.0.1','\"1\"'),('plugins.blitz.settings.includedQueryStringParams.0.__assoc__.1.0','\"queryStringParam\"'),('plugins.blitz.settings.includedQueryStringParams.0.__assoc__.1.1','\".*\"'),('plugins.blitz.settings.includedUriPatterns.0.__assoc__.0.0','\"enabled\"'),('plugins.blitz.settings.includedUriPatterns.0.__assoc__.0.1','\"1\"'),('plugins.blitz.settings.includedUriPatterns.0.__assoc__.1.0','\"uriPattern\"'),('plugins.blitz.settings.includedUriPatterns.0.__assoc__.1.1','\"\"'),('plugins.blitz.settings.injectScriptEvent','\"DOMContentLoaded\"'),('plugins.blitz.settings.injectScriptPosition','3'),('plugins.blitz.settings.integrations.0','\"putyourlightson\\\\blitz\\\\drivers\\\\integrations\\\\CommerceIntegration\"'),('plugins.blitz.settings.integrations.1','\"putyourlightson\\\\blitz\\\\drivers\\\\integrations\\\\SeomaticIntegration\"'),('plugins.blitz.settings.maxRetryAttempts','10'),('plugins.blitz.settings.maxUriLength','255'),('plugins.blitz.settings.mutexTimeout','1'),('plugins.blitz.settings.onlyCacheLowercaseUris','false'),('plugins.blitz.settings.outputComments','true'),('plugins.blitz.settings.purgeAssetImagesWhenChanged','true'),('plugins.blitz.settings.queryStringCaching','0'),('plugins.blitz.settings.queueJobTtr','300'),('plugins.blitz.settings.refreshCacheAutomaticallyForGlobals','true'),('plugins.blitz.settings.refreshCacheEnabled','true'),('plugins.blitz.settings.refreshCacheJobPriority','10'),('plugins.blitz.settings.refreshCacheWhenElementMovedInStructure','true'),('plugins.blitz.settings.refreshCacheWhenElementSavedNotLive','false'),('plugins.blitz.settings.refreshCacheWhenElementSavedUnchanged','false'),('plugins.blitz.settings.refreshMode','3'),('plugins.blitz.settings.sendPoweredByHeader','true'),('plugins.blitz.settings.ssiEnabled','false'),('plugins.blitz.settings.ssiTagFormat','\"<!--#include virtual=\\\"{uri}\\\" -->\"'),('plugins.blitz.settings.trackElementQueries','true'),('plugins.blitz.settings.trackElements','true'),('plugins.craft-quick-edit.edition','\"standard\"'),('plugins.craft-quick-edit.enabled','true'),('plugins.craft-quick-edit.schemaVersion','\"1.0.0\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.defaultPlacement','\"end\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.enableVersioning','true'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.entryTypes.0','\"19d6b378-8346-4ed5-acc9-4f174a58e04a\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.handle','\"home\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.maxAuthors','1'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.name','\"Home\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.propagationMethod','\"all\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.siteSettings.f585159c-4950-4889-a28d-c7271dae58a5.enabledByDefault','true'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.siteSettings.f585159c-4950-4889-a28d-c7271dae58a5.hasUrls','true'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.siteSettings.f585159c-4950-4889-a28d-c7271dae58a5.template','\"home/_entry.twig\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.siteSettings.f585159c-4950-4889-a28d-c7271dae58a5.uriFormat','\"__home__\"'),('sections.0b856bfa-7241-474a-bbd8-18c2c03321b5.type','\"single\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.defaultPlacement','\"end\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.enableVersioning','true'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.entryTypes.0','\"0354643a-5af0-4930-87c0-ce0cfeb0cd1f\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.handle','\"faqs\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.maxAuthors','1'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.name','\"Faqs\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.propagationMethod','\"all\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.siteSettings.f585159c-4950-4889-a28d-c7271dae58a5.enabledByDefault','true'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.siteSettings.f585159c-4950-4889-a28d-c7271dae58a5.hasUrls','true'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.siteSettings.f585159c-4950-4889-a28d-c7271dae58a5.template','\"faqs/_entry.twig\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.siteSettings.f585159c-4950-4889-a28d-c7271dae58a5.uriFormat','\"faqs/{slug}\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.structure.maxLevels','null'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.structure.uid','\"1bfd1d38-4799-4c36-ae8c-be6d0b63f06f\"'),('sections.32ad4f6d-3553-4c3d-8cb9-4868f0544cca.type','\"structure\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.defaultPlacement','\"end\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.enableVersioning','true'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.entryTypes.0','\"efcd8f45-b324-4db8-ab75-e28b60d5325e\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.handle','\"news\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.maxAuthors','1'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.name','\"News\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.previewTargets.0.__assoc__.0.1','\"Primary entry page\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.propagationMethod','\"all\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.siteSettings.f585159c-4950-4889-a28d-c7271dae58a5.enabledByDefault','true'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.siteSettings.f585159c-4950-4889-a28d-c7271dae58a5.hasUrls','true'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.siteSettings.f585159c-4950-4889-a28d-c7271dae58a5.template','\"news/_entry.twig\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.siteSettings.f585159c-4950-4889-a28d-c7271dae58a5.uriFormat','\"news/{slug}\"'),('sections.e5647779-c8f7-4286-9e2a-0c5d533d6ad5.type','\"channel\"'),('siteGroups.33dc3560-eb15-49fe-9ab6-772ccf4576c5.name','\"cp-edit-showcase\"'),('sites.f585159c-4950-4889-a28d-c7271dae58a5.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.f585159c-4950-4889-a28d-c7271dae58a5.enabled','true'),('sites.f585159c-4950-4889-a28d-c7271dae58a5.handle','\"default\"'),('sites.f585159c-4950-4889-a28d-c7271dae58a5.hasUrls','true'),('sites.f585159c-4950-4889-a28d-c7271dae58a5.language','\"en-US\"'),('sites.f585159c-4950-4889-a28d-c7271dae58a5.name','\"cp-edit-showcase\"'),('sites.f585159c-4950-4889-a28d-c7271dae58a5.primary','true'),('sites.f585159c-4950-4889-a28d-c7271dae58a5.siteGroup','\"33dc3560-eb15-49fe-9ab6-772ccf4576c5\"'),('sites.f585159c-4950-4889-a28d-c7271dae58a5.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"cp-edit-showcase\"'),('system.schemaVersion','\"5.5.0.0\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.description','null'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.handle','\"editor\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.name','\"Editor\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.0','\"accesscp\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.1','\"administrateusers\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.10','\"deletepeerentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.11','\"deletepeerentrydrafts:32ad4f6d-3553-4c3d-8cb9-4868f0544cca\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.12','\"deletepeerentrydrafts:e5647779-c8f7-4286-9e2a-0c5d533d6ad5\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.13','\"deleteusers\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.14','\"editusers\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.15','\"impersonateusers\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.16','\"moderateusers\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.17','\"registerusers\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.18','\"saveentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.19','\"saveentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.2','\"assignusergroup:5689cabb-f574-4961-99bc-83c95a194c5a\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.20','\"savepeerentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.21','\"savepeerentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.22','\"savepeerentrydrafts:32ad4f6d-3553-4c3d-8cb9-4868f0544cca\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.23','\"savepeerentrydrafts:e5647779-c8f7-4286-9e2a-0c5d533d6ad5\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.24','\"viewentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.25','\"viewentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.26','\"viewpeerentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.27','\"viewpeerentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.28','\"viewpeerentrydrafts:32ad4f6d-3553-4c3d-8cb9-4868f0544cca\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.29','\"viewpeerentrydrafts:e5647779-c8f7-4286-9e2a-0c5d533d6ad5\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.3','\"assignusergroup:c55ca0a9-4bd6-409b-afd8-c1884dafecd0\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.4','\"assignuserpermissions\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.5','\"createentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.6','\"createentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.7','\"deleteentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.8','\"deleteentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5\"'),('users.groups.5689cabb-f574-4961-99bc-83c95a194c5a.permissions.9','\"deletepeerentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca\"'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.require2fa','false'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,1,NULL,1,NULL),(2,1,NULL,2,NULL),(3,1,4,3,''),(4,6,4,1,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'slug',0,1,' home '),(1,'title',0,1,' home '),(4,'email',0,1,' samuelreichor gmail com '),(4,'firstname',0,1,''),(4,'fullname',0,1,''),(4,'lastname',0,1,''),(4,'slug',0,1,''),(4,'username',0,1,' admin '),(6,'slug',0,1,' news number 1 '),(6,'title',0,1,' news number 1 ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-01-16 18:34:26','2025-01-16 18:34:26',NULL,'0b856bfa-7241-474a-bbd8-18c2c03321b5'),(2,1,'Faqs','faqs','structure',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-01-16 18:34:26','2025-01-16 18:34:26',NULL,'32ad4f6d-3553-4c3d-8cb9-4868f0544cca'),(3,NULL,'News','news','channel',1,1,'all','end','[{\"label\": \"Primary entry page\", \"refresh\": \"1\", \"urlFormat\": \"{url}\"}]','2025-01-16 18:34:26','2025-01-16 18:34:26',NULL,'e5647779-c8f7-4286-9e2a-0c5d533d6ad5');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_entrytypes` VALUES (1,1,1),(2,2,1),(3,3,1);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','home/_entry.twig',1,'2025-01-16 18:34:26','2025-01-16 18:34:26','100d2698-6377-41e6-b4f1-e61a874a5d02'),(2,2,1,1,'faqs/{slug}','faqs/_entry.twig',1,'2025-01-16 18:34:26','2025-01-16 18:34:26','8b350d93-0c57-4dd0-ad03-313ab47f9f57'),(3,3,1,1,'news/{slug}','news/_entry.twig',1,'2025-01-16 18:34:26','2025-01-16 18:34:26','46b41f35-fe52-4f35-a631-a1df01d5a90c');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'cp-edit-showcase','2025-01-16 18:34:26','2025-01-16 18:34:26',NULL,'33dc3560-eb15-49fe-9ab6-772ccf4576c5');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','cp-edit-showcase','default','en-US',1,'$PRIMARY_SITE_URL',1,'2025-01-16 18:34:26','2025-01-16 18:34:27',NULL,'f585159c-4950-4889-a28d-c7271dae58a5');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,NULL,'2025-01-16 18:34:26','2025-01-16 18:34:26',NULL,'1bfd1d38-4799-4c36-ae8c-be6d0b63f06f');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tokens` VALUES (1,'VKbly1S6ZENT-rPKxFaWhJg6iCARTlAc','blitz/generator/generate',NULL,NULL,'2025-01-17 18:34:29','2025-01-16 18:34:29','2025-01-16 18:34:29','4bce661a-8bb4-4298-8e06-e19811ac11f9'),(2,'SoiIskElXhPvmlmjiO_knD85l4QuP8RO','blitz/generator/generate',NULL,NULL,'2025-01-17 18:34:29','2025-01-16 18:34:29','2025-01-16 18:34:29','d71c86e3-8a34-45d2-aaa4-928f7be256ef'),(3,'G2ogN40baPYIVoPHaQMWrfALygCszC4f','blitz/generator/generate',NULL,NULL,'2025-01-17 18:35:07','2025-01-16 18:35:07','2025-01-16 18:35:07','e281a9de-6bc2-4c61-b2bb-a8877496b703'),(4,'dFn9SfR1p-lAqCCyvBOn-TyMNKY8Ml33','blitz/generator/generate',NULL,NULL,'2025-01-19 09:53:16','2025-01-18 09:53:16','2025-01-18 09:53:16','9a430a08-7f0a-4c0a-a3c3-df605fe28714');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `usergroups` VALUES (1,'Editor','editor',NULL,'2025-01-16 18:34:26','2025-01-16 18:34:26','5689cabb-f574-4961-99bc-83c95a194c5a');
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpermissions` VALUES (1,'accesscp','2025-01-16 18:34:26','2025-01-16 18:34:26','e2d5aeaf-e13a-4ec0-9516-1401dc675beb'),(2,'administrateusers','2025-01-16 18:34:26','2025-01-16 18:34:26','eb52b222-549f-4aca-adc5-60a66a63170c'),(3,'assignusergroup:5689cabb-f574-4961-99bc-83c95a194c5a','2025-01-16 18:34:26','2025-01-16 18:34:26','1eb9d3fa-c5b4-4852-9b74-cb54301e491d'),(4,'assignusergroup:c55ca0a9-4bd6-409b-afd8-c1884dafecd0','2025-01-16 18:34:26','2025-01-16 18:34:26','92af7437-f6b2-4819-a860-1107a40873aa'),(5,'assignuserpermissions','2025-01-16 18:34:26','2025-01-16 18:34:26','a2ca4f68-2f8c-4e37-afad-71ea011ac59c'),(6,'createentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca','2025-01-16 18:34:26','2025-01-16 18:34:26','eb94aa3b-dab3-4c03-b2a6-b63eb1755574'),(7,'createentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5','2025-01-16 18:34:26','2025-01-16 18:34:26','3a1fba4f-68db-421d-a8b9-1b2862e60b7e'),(8,'deleteentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca','2025-01-16 18:34:26','2025-01-16 18:34:26','83bfdd51-4059-481a-b6c3-526ea148b063'),(9,'deleteentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5','2025-01-16 18:34:26','2025-01-16 18:34:26','682dd858-0270-4c09-874d-0fce75ee3e38'),(10,'deletepeerentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca','2025-01-16 18:34:26','2025-01-16 18:34:26','1675757d-7f56-4855-8d75-82c93687a627'),(11,'deletepeerentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5','2025-01-16 18:34:26','2025-01-16 18:34:26','ab1fc11f-e1de-4bba-a97f-e7e671215197'),(12,'deletepeerentrydrafts:32ad4f6d-3553-4c3d-8cb9-4868f0544cca','2025-01-16 18:34:26','2025-01-16 18:34:26','70f7f2ef-ab05-4171-8282-b476e265fafb'),(13,'deletepeerentrydrafts:e5647779-c8f7-4286-9e2a-0c5d533d6ad5','2025-01-16 18:34:26','2025-01-16 18:34:26','7e227b6a-4721-46f6-8866-428fa6276bde'),(14,'deleteusers','2025-01-16 18:34:26','2025-01-16 18:34:26','66352a99-8156-4993-bf51-e65b59aebba6'),(15,'editusers','2025-01-16 18:34:26','2025-01-16 18:34:26','f193573d-496e-44f1-b71a-8e05541f8285'),(16,'impersonateusers','2025-01-16 18:34:26','2025-01-16 18:34:26','a72156c4-3df9-4112-a817-74b196cc61b9'),(17,'moderateusers','2025-01-16 18:34:26','2025-01-16 18:34:26','b5660bed-fb2e-4747-bab8-1d3ba1637999'),(18,'registerusers','2025-01-16 18:34:26','2025-01-16 18:34:26','7cebae74-88ec-44af-9908-b908c37f2acd'),(19,'saveentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca','2025-01-16 18:34:26','2025-01-16 18:34:26','c7c6991e-b924-4d6a-9159-6817e1724f38'),(20,'saveentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5','2025-01-16 18:34:26','2025-01-16 18:34:26','a786b65f-9203-45e8-8b7b-517b40807b1d'),(21,'savepeerentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca','2025-01-16 18:34:26','2025-01-16 18:34:26','851f1132-8b10-4159-9712-312e5311495c'),(22,'savepeerentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5','2025-01-16 18:34:26','2025-01-16 18:34:26','f9a62175-9530-4167-a0bc-b5a732338b8e'),(23,'savepeerentrydrafts:32ad4f6d-3553-4c3d-8cb9-4868f0544cca','2025-01-16 18:34:26','2025-01-16 18:34:26','7b25fa6e-a819-4b5a-9cfd-6be8b85c213a'),(24,'savepeerentrydrafts:e5647779-c8f7-4286-9e2a-0c5d533d6ad5','2025-01-16 18:34:26','2025-01-16 18:34:26','2f4a84b0-3734-4f3d-b5da-2d1500bdfd52'),(25,'viewentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca','2025-01-16 18:34:26','2025-01-16 18:34:26','1acec772-cf43-4942-91b9-d977457466cd'),(26,'viewentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5','2025-01-16 18:34:26','2025-01-16 18:34:26','7448e776-d898-4b07-82fd-ea247e29750a'),(27,'viewpeerentries:32ad4f6d-3553-4c3d-8cb9-4868f0544cca','2025-01-16 18:34:26','2025-01-16 18:34:26','db3f7c53-883e-43bf-9b24-f745c6627ae2'),(28,'viewpeerentries:e5647779-c8f7-4286-9e2a-0c5d533d6ad5','2025-01-16 18:34:26','2025-01-16 18:34:26','2e3ff4fc-33bb-4937-a870-a8b2b1b7f70a'),(29,'viewpeerentrydrafts:32ad4f6d-3553-4c3d-8cb9-4868f0544cca','2025-01-16 18:34:26','2025-01-16 18:34:26','652bbee5-d0cd-433a-a3a1-7c2f8d205f33'),(30,'viewpeerentrydrafts:e5647779-c8f7-4286-9e2a-0c5d533d6ad5','2025-01-16 18:34:26','2025-01-16 18:34:26','cf967cd7-4556-402c-ae6c-d45899f17fad');
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpermissions_usergroups` VALUES (31,1,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','dedbd4e0-602a-4329-9006-f79b83e0a98a'),(32,2,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','8fbd0ce8-feca-4dc4-8d5c-672945f84779'),(33,3,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','e1aaed00-46fb-4c71-95d0-97b5186eb7ac'),(34,4,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','ca296eb5-9805-4075-9041-8a4ea9823c83'),(35,5,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','78cd97f3-1995-49d7-82ca-8eeec3a36d1b'),(36,6,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','5035c8ac-a5cf-4c2c-9ac9-d2002154f1cb'),(37,7,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','9045db95-7091-44c7-85ea-60bfe1b5363b'),(38,8,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','bfa096ea-f370-4c1a-8b9c-48d6aadbabf9'),(39,9,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','9c64b40b-eb09-4ec0-96a7-50ac3639ff3d'),(40,10,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','94bba434-07ea-4e36-845c-3d2748f2fbff'),(41,11,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','f31050d6-8ef3-4e88-b7ec-f550b61689ee'),(42,12,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','e191a304-9814-4748-8b81-38f817ce6403'),(43,13,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','092029bc-c26b-419b-b5fe-458e1527746f'),(44,14,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','ea544abd-bbee-41d0-bf82-5986da3af525'),(45,15,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','e9c3d855-0f12-4e3c-9264-25a8edb88b6c'),(46,16,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','041add24-baf9-4db7-943f-35bed0a50d51'),(47,17,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','2f80cfcb-ef83-4ded-a2a3-3fbb1d55a95d'),(48,18,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','f5c2631c-3b97-4957-b95e-f7220201d255'),(49,19,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','f5694569-7428-42aa-a336-f0b3833d4145'),(50,20,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','bdaf0de7-244c-42f2-bac1-231c0ca37905'),(51,21,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','48677cbd-0586-4f72-98f2-cd83db204b4e'),(52,22,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','c7388574-c951-4ea0-84ca-3401739ee111'),(53,23,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','b1ac9c3a-37a6-445f-849d-0f26d09bf935'),(54,24,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','0d7d1189-ac90-4ae3-b3b2-fc3367a32ecb'),(55,25,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','dac02209-f9be-4a33-a5f8-0b38574eae41'),(56,26,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','05e8841e-ca49-4be1-a809-e4c5cd490b03'),(57,27,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','17497b32-03b1-41ac-920e-6b1a9c96724e'),(58,28,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','ed02a073-6897-4472-94b8-51dddc0a77e0'),(59,29,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','e5f9ac4a-b92a-4156-aca3-866df6706a71'),(60,30,1,'2025-01-16 18:34:26','2025-01-16 18:34:26','dd64246c-907d-41b1-8e04-e553ebf860c7');
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (4,'{\"language\": \"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (4,NULL,1,0,0,0,1,'admin',NULL,NULL,NULL,'samuelreichor@gmail.com','$2y$13$tdB3KrT6Y8zrgmeN4lj2J.JxsTFErJaWF0DyWq6XkuN8t3kNAO4eq','2025-01-18 09:57:23',NULL,NULL,NULL,'2025-01-18 09:53:24',NULL,1,NULL,NULL,NULL,0,'2025-01-18 09:53:16','2025-01-16 18:34:27','2025-01-18 09:57:23');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,4,'craft\\widgets\\RecentEntries',1,NULL,'{\"limit\": 10, \"siteId\": 1, \"section\": \"*\"}',1,'2025-01-16 18:34:28','2025-01-16 18:34:28','4c0585f5-88bf-46d9-b8e3-33ce76d39dd8'),(2,4,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2025-01-16 18:34:28','2025-01-16 18:34:28','a5c42241-0f0f-4f37-85ea-6fb20bce5078'),(3,4,'craft\\widgets\\Updates',3,NULL,'[]',1,'2025-01-16 18:34:28','2025-01-16 18:34:28','8bbb30e7-a602-4e76-8b62-e2c51d8e69f5'),(4,4,'craft\\widgets\\Feed',4,NULL,'{\"url\": \"https://craftcms.com/news.rss\", \"limit\": 5, \"title\": \"Craft News\"}',1,'2025-01-16 18:34:28','2025-01-16 18:34:28','33bf5ccf-b527-4ca6-b594-5e57e18dccd6');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-18 10:03:37
