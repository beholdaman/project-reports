-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: tecnical_call
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `ID` int NOT NULL,
  `NUMBER` varchar(10) NOT NULL,
  `DESCRIPTION` varchar(1024) NOT NULL,
  `EXP_DATE_START` date NOT NULL,
  `EXP_DATE_END` date NOT NULL,
  `EXP_HOURS` decimal(16,6) NOT NULL,
  `ACT_HOURS` decimal(16,6) NOT NULL,
  `ACT_HOURS_TASKS` decimal(16,6) NOT NULL,
  `CREATION_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `FK_PROJECT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PROJECT` (`FK_PROJECT`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`FK_PROJECT`) REFERENCES `projects` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'P220001','Tree-House building','2022-03-07','2022-03-25',120.000000,3.000000,188.500000,'2026-10-12 23:28:23',NULL),(2,'P220002','Designing','2022-03-07','2022-03-10',32.000000,16.000000,59.750000,'2026-10-12 23:28:23',1),(3,'P220003','Designing - Draft','2022-03-07','2022-03-08',16.000000,47.250000,0.000000,'2026-10-12 23:28:23',2),(4,'P220004','Designing - Final','2022-03-09','2022-03-09',8.000000,4.500000,0.000000,'2026-10-12 23:28:23',2),(5,'P220005','Designing - B.O.M','2022-03-10','2022-03-10',8.000000,8.000000,0.000000,'2026-10-12 23:28:23',2),(6,'P220006','Purchase','2022-03-11','2022-03-11',8.000000,4.000000,0.000000,'2026-10-12 23:28:23',1),(7,'P220007','Building','2022-03-14','2022-03-23',64.000000,0.000000,108.750000,'2026-10-12 23:28:23',1),(8,'P220008','Building - Preparation','2022-03-14','2022-03-15',16.000000,32.000000,0.000000,'2026-10-12 23:28:23',7),(9,'P220009','Building - Foundation','2022-03-16','2022-03-22',40.000000,0.000000,64.750000,'2026-10-12 23:28:23',7),(10,'P220010','Building - Ladder','2022-03-16','2022-03-16',8.000000,1.500000,0.000000,'2026-10-12 23:28:23',9),(11,'P220011','Building - Walls','2022-03-17','2022-03-18',16.000000,45.250000,0.000000,'2026-10-12 23:28:23',9),(12,'P220012','Building - Roof','2022-03-21','2022-03-22',16.000000,18.000000,0.000000,'2026-10-12 23:28:23',9),(13,'P220013','Building - Interiors','2022-03-23','2022-03-23',8.000000,12.000000,0.000000,'2026-10-12 23:28:23',7),(14,'P220014','Closing','2022-03-24','2022-03-25',16.000000,0.000000,0.000000,'2026-10-12 23:28:23',1),(15,'P220015','Ferragosto','2022-08-10','2022-08-12',24.000000,0.000000,51.750000,'2026-10-12 23:28:25',NULL),(16,'P220016','Ferragosto - Location','2022-08-10','2022-08-10',8.000000,11.750000,0.000000,'2026-10-12 23:28:25',15),(17,'P220017','Ferragosto - Guests/Roles','2022-08-11','2022-08-11',8.000000,36.000000,0.000000,'2026-10-12 23:28:25',15),(18,'P220018','Ferragosto - Groceries','2022-08-12','2022-08-12',8.000000,4.000000,0.000000,'2026-10-12 23:28:25',15),(19,'P220019','NEW UI','2022-11-01','2022-11-22',128.000000,11.750000,399.250000,'2026-10-12 23:28:26',NULL),(20,'P220020','NEW UI - Functions','2022-11-01','2022-11-01',8.000000,36.000000,0.000000,'2026-10-12 23:28:26',19),(21,'P220021','NEW UI - Design','2022-11-02','2022-11-04',24.000000,36.000000,0.000000,'2026-10-12 23:28:26',19),(22,'P220022','NEW UI - Approval','2022-11-07','2022-11-07',8.000000,36.000000,0.000000,'2026-10-12 23:28:26',19),(23,'P220023','NEW UI - Development','2022-11-08','2022-11-11',32.000000,39.250000,0.000000,'2026-10-12 23:28:26',19),(24,'P220024','NEW UI - Alpha Testing','2022-11-14','2022-11-16',24.000000,36.000000,72.000000,'2026-10-12 23:28:26',19),(25,'P220025','NEW UI - Gather UX Info','2022-11-15','2022-11-15',8.000000,36.000000,0.000000,'2026-10-12 23:28:26',24),(26,'P220026','NEW UI - Alpha bug fix','2022-11-16','2022-11-16',8.000000,36.000000,0.000000,'2026-10-12 23:28:26',24),(27,'P220027','NEW UI - Beta Testing','2022-11-17','2022-11-21',24.000000,36.000000,72.000000,'2026-10-12 23:28:26',19),(28,'P220028','NEW UI - Gather UX Info','2022-11-18','2022-11-18',8.000000,36.000000,0.000000,'2026-10-12 23:28:26',27),(29,'P220029','NEW UI - Bug fix','2022-11-21','2022-11-21',8.000000,36.000000,0.000000,'2026-10-12 23:28:26',27),(30,'P220030','NEW UI - Release','2022-11-22','2022-11-22',8.000000,36.000000,0.000000,'2026-10-12 23:28:26',19);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DATE` date NOT NULL,
  `HOUR_START` time NOT NULL,
  `HOUR_END` time NOT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `FK_USER` int NOT NULL,
  `FK_PROJECT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USER` (`FK_USER`),
  KEY `FK_PROJECT` (`FK_PROJECT`),
  CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`FK_USER`) REFERENCES `users` (`ID`),
  CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`FK_PROJECT`) REFERENCES `projects` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `hour_check` CHECK ((`hour_start` < `hour_end`))
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (36,'2022-03-07','09:15:00','12:30:00',NULL,23,3),(37,'2022-03-07','14:00:00','18:00:00',NULL,25,3),(38,'2022-03-08','10:00:00','12:30:00',NULL,4,4),(39,'2022-03-08','16:00:00','18:00:00',NULL,15,4),(40,'2022-03-09','09:00:00','17:00:00',NULL,22,5),(41,'2022-03-10','14:00:00','18:00:00',NULL,20,6),(42,'2022-03-14','09:00:00','13:00:00',NULL,6,8),(43,'2022-03-14','14:00:00','18:00:00',NULL,18,8),(44,'2022-03-14','09:00:00','13:00:00',NULL,11,8),(45,'2022-03-14','14:00:00','18:00:00',NULL,17,8),(46,'2022-03-15','09:00:00','13:00:00',NULL,17,8),(47,'2022-03-15','14:00:00','18:00:00',NULL,19,8),(48,'2022-03-15','09:00:00','13:00:00',NULL,22,8),(49,'2022-03-15','14:00:00','18:00:00',NULL,24,8),(50,'2022-03-16','11:30:00','13:00:00',NULL,11,10),(51,'2022-03-16','14:00:00','18:00:00',NULL,2,11),(52,'2022-03-16','09:00:00','13:00:00',NULL,4,11),(53,'2022-03-16','14:00:00','18:00:00',NULL,18,11),(54,'2022-03-17','09:00:00','13:00:00',NULL,17,11),(55,'2022-03-17','14:00:00','18:00:00',NULL,19,11),(56,'2022-03-17','09:00:00','13:00:00',NULL,7,11),(57,'2022-03-18','14:00:00','17:30:00',NULL,21,11),(58,'2022-03-18','14:00:00','16:15:00',NULL,10,11),(59,'2022-03-18','15:00:00','18:00:00',NULL,25,11),(60,'2022-03-18','15:45:00','18:30:00',NULL,22,11),(61,'2022-03-18','09:00:00','14:00:00',NULL,14,11),(62,'2022-03-21','14:00:00','18:45:00',NULL,14,11),(63,'2022-03-22','14:00:00','18:00:00',NULL,7,12),(64,'2022-03-22','09:00:00','13:00:00',NULL,23,12),(65,'2022-03-22','14:00:00','18:00:00',NULL,14,12),(66,'2022-03-23','09:00:00','13:00:00',NULL,14,12),(67,'2022-03-24','16:00:00','18:00:00',NULL,7,12),(68,'2022-03-25','09:00:00','13:00:00',NULL,14,13),(69,'2022-03-28','09:00:00','13:00:00',NULL,5,13),(70,'2022-03-29','09:00:00','13:00:00',NULL,15,13),(71,'2022-08-08','09:15:00','12:30:00',NULL,24,16),(72,'2022-08-09','14:00:00','18:00:00',NULL,15,16),(73,'2022-08-10','10:00:00','12:30:00',NULL,20,16),(74,'2022-08-11','16:00:00','18:00:00',NULL,8,16),(75,'2022-08-10','09:00:00','17:00:00',NULL,25,17),(76,'2022-08-11','14:00:00','18:00:00',NULL,10,17),(77,'2022-08-11','09:00:00','13:00:00',NULL,11,17),(78,'2022-08-11','14:00:00','18:00:00',NULL,19,17),(79,'2022-08-12','09:00:00','13:00:00',NULL,15,17),(80,'2022-08-12','14:00:00','18:00:00',NULL,15,17),(81,'2022-08-12','09:00:00','13:00:00',NULL,7,17),(82,'2022-08-12','14:00:00','18:00:00',NULL,22,17),(83,'2022-08-12','14:00:00','18:00:00',NULL,15,18),(84,'2022-11-08','09:15:00','12:30:00',NULL,13,19),(85,'2022-11-09','14:00:00','18:00:00',NULL,19,19),(86,'2022-11-10','10:00:00','12:30:00',NULL,20,19),(87,'2022-11-11','16:00:00','18:00:00',NULL,15,19),(88,'2022-11-01','09:00:00','17:00:00',NULL,10,20),(89,'2022-11-01','14:00:00','18:00:00',NULL,20,20),(90,'2022-11-01','09:00:00','13:00:00',NULL,23,20),(91,'2022-11-01','14:00:00','18:00:00',NULL,20,20),(92,'2022-11-01','09:00:00','13:00:00',NULL,1,20),(93,'2022-11-01','14:00:00','18:00:00',NULL,9,20),(94,'2022-11-01','09:00:00','13:00:00',NULL,11,20),(95,'2022-11-01','14:00:00','18:00:00',NULL,6,20),(96,'2022-11-02','09:00:00','17:00:00',NULL,14,21),(97,'2022-11-02','14:00:00','18:00:00',NULL,6,21),(98,'2022-11-02','09:00:00','13:00:00',NULL,7,21),(99,'2022-11-02','14:00:00','18:00:00',NULL,6,21),(100,'2022-11-02','09:00:00','13:00:00',NULL,12,21),(101,'2022-11-02','14:00:00','18:00:00',NULL,24,21),(102,'2022-11-02','09:00:00','13:00:00',NULL,7,21),(103,'2022-11-02','14:00:00','18:00:00',NULL,25,21),(104,'2022-11-03','09:00:00','17:00:00',NULL,16,22),(105,'2022-11-03','14:00:00','18:00:00',NULL,12,22),(106,'2022-11-03','09:00:00','13:00:00',NULL,6,22),(107,'2022-11-03','14:00:00','18:00:00',NULL,6,22),(108,'2022-11-03','09:00:00','13:00:00',NULL,12,22),(109,'2022-11-03','14:00:00','18:00:00',NULL,9,22),(110,'2022-11-03','09:00:00','13:00:00',NULL,9,22),(111,'2022-11-03','14:00:00','18:00:00',NULL,20,22),(112,'2022-11-04','09:00:00','17:00:00',NULL,22,23),(113,'2022-11-04','14:00:00','18:00:00',NULL,5,23),(114,'2022-11-04','09:00:00','13:00:00',NULL,15,23),(115,'2022-11-04','14:00:00','18:00:00',NULL,19,23),(116,'2022-11-04','09:00:00','13:00:00',NULL,17,23),(117,'2022-11-04','14:00:00','18:00:00',NULL,11,23),(118,'2022-11-04','09:00:00','13:00:00',NULL,25,23),(119,'2022-11-04','14:00:00','18:00:00',NULL,5,23),(120,'2022-11-07','09:00:00','17:00:00',NULL,14,24),(121,'2022-11-07','14:00:00','18:00:00',NULL,7,24),(122,'2022-11-07','09:00:00','13:00:00',NULL,21,24),(123,'2022-11-07','14:00:00','18:00:00',NULL,9,24),(124,'2022-11-07','09:00:00','13:00:00',NULL,2,24),(125,'2022-11-07','14:00:00','18:00:00',NULL,22,24),(126,'2022-11-07','09:00:00','13:00:00',NULL,22,24),(127,'2022-11-07','14:00:00','18:00:00',NULL,2,24),(128,'2022-11-08','09:00:00','17:00:00',NULL,6,25),(129,'2022-11-08','14:00:00','18:00:00',NULL,8,25),(130,'2022-11-08','09:00:00','13:00:00',NULL,4,25),(131,'2022-11-08','14:00:00','18:00:00',NULL,14,25),(132,'2022-11-08','09:00:00','13:00:00',NULL,11,25),(133,'2022-11-08','14:00:00','18:00:00',NULL,10,25),(134,'2022-11-08','09:00:00','13:00:00',NULL,18,25),(135,'2022-11-08','14:00:00','18:00:00',NULL,17,25),(136,'2022-11-09','09:00:00','17:00:00',NULL,8,26),(137,'2022-11-09','14:00:00','18:00:00',NULL,17,26),(138,'2022-11-09','09:00:00','13:00:00',NULL,12,26),(139,'2022-11-09','14:00:00','18:00:00',NULL,24,26),(140,'2022-11-09','09:00:00','13:00:00',NULL,5,26),(141,'2022-11-09','14:00:00','18:00:00',NULL,19,26),(142,'2022-11-09','09:00:00','13:00:00',NULL,5,26),(143,'2022-11-09','14:00:00','18:00:00',NULL,24,26),(144,'2022-11-10','09:00:00','17:00:00',NULL,24,27),(145,'2022-11-10','14:00:00','18:00:00',NULL,25,27),(146,'2022-11-10','09:00:00','13:00:00',NULL,19,27),(147,'2022-11-10','14:00:00','18:00:00',NULL,5,27),(148,'2022-11-10','09:00:00','13:00:00',NULL,24,27),(149,'2022-11-10','14:00:00','18:00:00',NULL,2,27),(150,'2022-11-10','09:00:00','13:00:00',NULL,21,27),(151,'2022-11-10','14:00:00','18:00:00',NULL,10,27),(152,'2022-11-11','09:00:00','17:00:00',NULL,15,28),(153,'2022-11-11','14:00:00','18:00:00',NULL,12,28),(154,'2022-11-11','09:00:00','13:00:00',NULL,10,28),(155,'2022-11-11','14:00:00','18:00:00',NULL,21,28),(156,'2022-11-11','09:00:00','13:00:00',NULL,23,28),(157,'2022-11-11','14:00:00','18:00:00',NULL,22,28),(158,'2022-11-11','09:00:00','13:00:00',NULL,2,28),(159,'2022-11-11','14:00:00','18:00:00',NULL,22,28),(160,'2022-11-12','09:00:00','17:00:00',NULL,19,29),(161,'2022-11-12','14:00:00','18:00:00',NULL,6,29),(162,'2022-11-12','09:00:00','13:00:00',NULL,5,29),(163,'2022-11-12','14:00:00','18:00:00',NULL,5,29),(164,'2022-11-12','09:00:00','13:00:00',NULL,6,29),(165,'2022-11-12','14:00:00','18:00:00',NULL,25,29),(166,'2022-11-12','09:00:00','13:00:00',NULL,2,29),(167,'2022-11-12','14:00:00','18:00:00',NULL,16,29),(168,'2022-11-12','09:00:00','17:00:00',NULL,3,30),(169,'2022-11-12','14:00:00','18:00:00',NULL,9,30),(170,'2022-11-12','09:00:00','13:00:00',NULL,8,30),(171,'2022-11-12','14:00:00','18:00:00',NULL,16,30),(172,'2022-11-12','09:00:00','13:00:00',NULL,9,30),(173,'2022-11-12','14:00:00','18:00:00',NULL,7,30),(174,'2022-11-12','09:00:00','13:00:00',NULL,7,30),(175,'2022-11-12','14:00:00','18:00:00',NULL,18,30),(176,'2025-12-25','12:00:00','15:00:00',NULL,2,1),(177,'2022-03-07','09:15:00','12:30:00',NULL,3,23),(180,'2022-03-07','00:00:00','15:00:00',NULL,23,3),(181,'2025-12-25','00:00:00','12:30:00',NULL,23,3),(182,'2023-10-24','00:00:00','12:30:00',NULL,23,3),(183,'2023-10-24','00:00:00','16:00:00',NULL,2,2);
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `deny_report_overlap` BEFORE INSERT ON `reports` FOR EACH ROW BEGIN

    DECLARE n_overlaps INT;


    SET n_overlaps = 0;

    SELECT COUNT(*) INTO n_overlaps
    FROM reports
    WHERE date = NEW.date AND
          fk_project = NEW.fk_project AND
          fk_user = NEW.fk_user AND
          (NEW.hour_start >= hour_start OR NEW.hour_end <= hour_end);

    IF n_overlaps > 0 THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Report with overlapping hours present in database';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_actual_hours` AFTER INSERT ON `reports` FOR EACH ROW BEGIN 

        DECLARE n_hours DECIMAL(16,6);
        

       
        SET n_hours = HOUR(SUBTIME(NEW.hour_end, NEW.hour_start)) + 
            ( MINUTE(SUBTIME(NEW.hour_end, NEW.hour_start))/60 );
        

        UPDATE projects SET act_hours = act_hours + n_hours
            WHERE id = NEW.fk_project;

        with RECURSIVE name_tree as (
            select id, description, fk_project, act_hours_tasks
            from projects
            where id = NEW.fk_project 
            union all
            select projects.id,  projects.description, projects.fk_project, projects.act_hours_tasks
            from projects join name_tree
                on name_tree.fk_project = projects.id  
        )
        UPDATE projects JOIN name_tree ON projects.id = name_tree.id 
            SET projects.act_hours_tasks = projects.act_hours_tasks + n_hours
            WHERE name_tree.id <> NEW.fk_project;


    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `deny_report_overlap_on_update` BEFORE UPDATE ON `reports` FOR EACH ROW BEGIN

    DECLARE n_overlaps INT;


    SET n_overlaps = 0;

    SELECT COUNT(*) INTO n_overlaps
    FROM reports
    WHERE date = NEW.date AND
          fk_project = NEW.fk_project AND
          fk_user = NEW.fk_user AND
          (NEW.hour_start >= hour_start OR NEW.hour_end <= hour_end);

    IF n_overlaps > 0 THEN 
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Report with overlapping hours present in database';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_actual_hours` AFTER UPDATE ON `reports` FOR EACH ROW BEGIN 

        DECLARE old_hours DECIMAL(16,6);
        DECLARE new_hours DECIMAL(16,6);

        
        SET old_hours = HOUR(SUBTIME(OLD.hour_end, OLD.hour_start)) + 
            ( MINUTE(SUBTIME(OLD.hour_end, OLD.hour_start))/60 );
        SET new_hours = HOUR(SUBTIME(NEW.hour_end, NEW.hour_start)) + 
            ( MINUTE(SUBTIME(NEW.hour_end, NEW.hour_start))/60 );
        

        UPDATE projects SET act_hours = act_hours - old_hours + new_hours
            WHERE id = OLD.fk_project;

        with RECURSIVE name_tree as (
            select id, description, fk_project, act_hours_tasks
            from projects
            where id = OLD.fk_project 
            union all
            select projects.id,  projects.description, projects.fk_project, projects.act_hours_tasks
            from projects join name_tree
                on name_tree.fk_project = projects.id  
        )
        UPDATE projects JOIN name_tree ON projects.id = name_tree.id 
            SET projects.act_hours_tasks = projects.act_hours_tasks - old_hours + new_hours
            WHERE name_tree.id <> OLD.fk_project;


    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delete_actual_hours` AFTER DELETE ON `reports` FOR EACH ROW BEGIN 

        DECLARE n_hours DECIMAL(16,6);
        

       
        SET n_hours = HOUR(SUBTIME(OLD.hour_end, OLD.hour_start)) + 
            ( MINUTE(SUBTIME(OLD.hour_end, OLD.hour_start))/60 );
        

        UPDATE projects SET act_hours = act_hours - n_hours
            WHERE id = OLD.fk_project;

        with RECURSIVE name_tree as (
            select id, description, fk_project, act_hours_tasks
            from projects
            where id = OLD.fk_project 
            union all
            select projects.id,  projects.description, projects.fk_project, projects.act_hours_tasks
            from projects join name_tree
                on name_tree.fk_project = projects.id  
        )
        UPDATE projects JOIN name_tree ON projects.id = name_tree.id 
            SET projects.act_hours_tasks = projects.act_hours_tasks - n_hours
            WHERE name_tree.id <> OLD.fk_project;


    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `ID` int NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `SURNAME` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mario','Rossi'),(2,'Luigi','Bianchi'),(3,'Stefano','Verdi'),(4,'Giovanni','Rossi'),(5,'Luca','Bianchi'),(6,'Goffredo','Boni'),(7,'Ottavio','Russo'),(8,'Faustino','Romano'),(9,'Rico','Romani'),(10,'Angioletto','Toscani'),(11,'Orfeo','Baroffio'),(12,'Francesco','Folliero'),(13,'Bertrando','Esposito'),(14,'Anastasio','Costa'),(15,'Fiore','Siciliano'),(16,'Luca','De luca'),(17,'Riccardo','Milani'),(18,'Federica','Monti'),(19,'Aurora','Russo'),(20,'Amelia','Grassi'),(21,'Enea','Rinaldi'),(22,'Leonardo','Mariani'),(23,'Federica','Basso'),(24,'Cloe','Coppola'),(25,'Amelia','Grasso');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tecnical_call'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-13 13:24:49
