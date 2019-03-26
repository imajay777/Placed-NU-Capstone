use jobportal;
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `companyId` int(11) NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) NOT NULL,
  `headquarters` varchar(255) NOT NULL,
  `companyUser` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `description` blob,
  `verificationCode` int(11) DEFAULT NULL,
  `verified` bit(1) DEFAULT NULL,
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `company` WRITE;
INSERT INTO `company` VALUES (1,'l','San Jose','linkedin','1234','We are LinkedIn',1234,''),(3,'surendra yadav','head','tusharecmc@gmail.com','1234',NULL,9632,'');
UNLOCK TABLES;

DROP TABLE IF EXISTS `interested`;
CREATE TABLE `interested` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `jobId` int(11) NOT NULL,
  `jobSeekerId` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK1g8pqo7qt66g6n1hmo3gkmefe` (`jobId`),
  KEY `FKdam92xaal9185wiya9xb0qlpy` (`jobSeekerId`),
  CONSTRAINT `FK1g8pqo7qt66g6n1hmo3gkmefe` FOREIGN KEY (`jobId`) REFERENCES `jobposting` (`jobId`),
  CONSTRAINT `FKdam92xaal9185wiya9xb0qlpy` FOREIGN KEY (`jobSeekerId`) REFERENCES `jobseeker` (`jobSeekerId`),
  CONSTRAINT `interested_ibfk_1` FOREIGN KEY (`jobSeekerId`) REFERENCES `jobseeker` (`jobSeekerId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `interested` WRITE;
INSERT INTO `interested` VALUES (2,1,1);
UNLOCK TABLES;

DROP TABLE IF EXISTS `jobapplication`;
CREATE TABLE `jobapplication` (
  `appId` int(11) NOT NULL AUTO_INCREMENT,
  `jobId` int(11) NOT NULL,
  `jobSeekerId` int(11) NOT NULL,
  `resume` tinyint(4) DEFAULT '0',
  `resumePath` blob,
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`appId`),
  KEY `FKjxcwb2fekoduom5q146d6sllh` (`jobId`),
  KEY `FK1urhfyvocp1ryhb1c18dcbh5m` (`jobSeekerId`),
  CONSTRAINT `FK1urhfyvocp1ryhb1c18dcbh5m` FOREIGN KEY (`jobSeekerId`) REFERENCES `jobseeker` (`jobSeekerId`),
  CONSTRAINT `FKjxcwb2fekoduom5q146d6sllh` FOREIGN KEY (`jobId`) REFERENCES `jobposting` (`jobId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `jobapplication` WRITE;
INSERT INTO `jobapplication` VALUES (1,1,1,1,'qwe',0);
UNLOCK TABLES;

DROP TABLE IF EXISTS `jobposting`;
CREATE TABLE `jobposting` (
`jobId` int(11) NOT NULL AUTO_INCREMENT,
  `companyId` int(11) NOT NULL,
  `state` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `description` blob,
  `responsibilities` blob,
  `location` varchar(255) NOT NULL,
  `salary` float DEFAULT '0',
  `keywords` blob,
  PRIMARY KEY (`jobId`),
  KEY `FK9s2a13di3vurgeiw7iwp1kwl` (`companyId`),
  CONSTRAINT `FK9s2a13di3vurgeiw7iwp1kwl` FOREIGN KEY (`companyId`) REFERENCES `company` (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `jobposting` WRITE;
INSERT INTO `jobposting` VALUES (1,1,1,'new','Updated','Do yourwork','Pune',1212140,'SE SE SE san Jose'),(2,1,0,'Test','66','234','San Jose',242,'Test 66 243 adfd'),(3,1,0,'Test','66','234','adfd',242,'Test 66 243 adfd');
UNLOCK TABLES;

DROP TABLE IF EXISTS `jobpostingsview`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
SET character_set_client = @saved_cs_client;

DROP TABLE IF EXISTS `jobseeker`;
CREATE TABLE `jobseeker` (
  `jobSeekerId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailId` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `workEx` int(11) DEFAULT '0',
  `highestEducation` int(11) DEFAULT '0',
  `skills` blob,
  `verified` tinyint(4) DEFAULT '0',
  `verificationCode` int(11) NOT NULL,
  PRIMARY KEY (`jobSeekerId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

LOCK TABLES `jobseeker` WRITE;
INSERT INTO `jobseeker` VALUES (1,'John','Doe','john.doe@jd.com','1234',1,2,'Java, C, C#, C++, MySQL',1,1234),(3,'surendra','yadav','tusharecmc@gmail.com','1234',0,0,NULL,0,5959);
UNLOCK TABLES;

