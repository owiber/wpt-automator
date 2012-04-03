# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# (MySQL 5.1.40)
# Database: wpt
# Generation Time: 2012-04-03 15:04:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table TestResults
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TestResults`;

CREATE TABLE `TestResults` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `TestID` varchar(255) NOT NULL DEFAULT '',
  `Location` varchar(255) DEFAULT NULL,
  `Label` varchar(255) DEFAULT NULL,
  `Mode` varchar(255) DEFAULT NULL,
  `Browser` varchar(255) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `URL` varchar(2000) DEFAULT NULL,
  `DocTime` int(11) DEFAULT NULL,
  `DocRequests` int(11) DEFAULT NULL,
  `DocBytes` int(11) DEFAULT NULL,
  `FullyLoaded` int(11) DEFAULT NULL,
  `FullRequests` int(11) DEFAULT NULL,
  `FullBytes` int(11) DEFAULT NULL,
  `CachedDocTime` int(11) DEFAULT NULL,
  `CachedDocRequests` int(11) DEFAULT NULL,
  `CachedDocBytes` int(11) DEFAULT NULL,
  `CachedFullyLoaded` int(11) DEFAULT NULL,
  `CachedFullRequests` int(11) DEFAULT NULL,
  `CachedFullBytes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TestID_UNIQUE` (`TestID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
