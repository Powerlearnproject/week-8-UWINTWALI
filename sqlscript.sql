-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: maternalhealthdb
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `followups`
--

DROP TABLE IF EXISTS `followups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followups` (
  `followup_id` int NOT NULL AUTO_INCREMENT,
  `prescription_id` int NOT NULL,
  `followup_date` date NOT NULL,
  `provider_id` int NOT NULL,
  `notes` text,
  `status` enum('Successful','Unsuccessful','Pending') NOT NULL,
  PRIMARY KEY (`followup_id`),
  KEY `prescription_id` (`prescription_id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `followups_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`prescription_id`),
  CONSTRAINT `followups_ibfk_2` FOREIGN KEY (`provider_id`) REFERENCES `healthcareproviders` (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followups`
--

LOCK TABLES `followups` WRITE;
/*!40000 ALTER TABLE `followups` DISABLE KEYS */;
INSERT INTO `followups` VALUES (1,1,'2024-08-09',1,'Patient has been adhering to the medication regimen.','Successful'),(7,1,'2024-08-09',1,'Patient adhered well to the vitamin regimen.','Successful'),(8,2,'2024-08-16',2,'Patient has reported some constipation. Advised to continue.','Pending'),(9,3,'2024-08-01',1,'No issues reported. Patient is feeling well.','Successful'),(10,4,'2024-08-08',3,'Patient completed folic acid course with no side effects.','Successful'),(11,5,'2024-08-17',2,'Follow-up scheduled. Waiting for patient response.','Pending'),(69,1,'2024-08-09',1,'Patient reported no side effects. Continues with daily intake of prenatal vitamins.','Successful'),(70,1,'2024-08-23',2,'Patient showing signs of improved energy levels. No adverse reactions.','Successful'),(71,2,'2024-09-02',2,'Patient complained of mild constipation. Advised to increase fluid intake.','Pending'),(72,2,'2024-09-16',3,'No further side effects reported. Hemoglobin levels improved.','Successful'),(73,3,'2024-07-29',1,'Patient adheres to folic acid intake. No side effects.','Successful'),(74,3,'2024-08-15',3,'Patient continues to take folic acid. No issues noted.','Pending'),(75,4,'2024-10-05',2,'Patient has slight nausea but continues medication. Blood pressure stable.','Successful'),(76,4,'2024-10-20',3,'Blood pressure normal. Patient adhering to medication schedule.','Pending'),(77,5,'2024-09-10',1,'Blood sugar levels improved. Patient experiencing mild bloating.','Successful'),(78,5,'2024-09-24',2,'Blood sugar stable. Dietary advice given to reduce bloating.','Pending'),(79,6,'2024-08-30',3,'No side effects reported. Patient finds the supplement easy to take.','Successful'),(80,6,'2024-09-13',1,'Patient continues with omega-3. No issues observed.','Pending'),(81,47,'2024-07-25',2,'Patient tolerates calcium well. Bone density measurements are satisfactory.','Successful'),(82,47,'2024-08-08',3,'Patient experiencing slight constipation. Advised to consume more fiber.','Pending'),(83,48,'2024-09-18',1,'Patient adheres to progesterone regimen. No side effects.','Successful'),(84,48,'2024-10-02',2,'No adverse reactions reported. Uterine health stable.','Pending'),(85,49,'2024-08-12',2,'Patient reports reduced nausea after taking medication.','Successful'),(86,49,'2024-08-26',1,'Follow-up pending. Patient advised to report any new symptoms.','Pending');
/*!40000 ALTER TABLE `followups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthcareproviders`
--

DROP TABLE IF EXISTS `healthcareproviders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthcareproviders` (
  `provider_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `specialization` varchar(100) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`provider_id`),
  UNIQUE KEY `contact_number` (`contact_number`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthcareproviders`
--

LOCK TABLES `healthcareproviders` WRITE;
/*!40000 ALTER TABLE `healthcareproviders` DISABLE KEYS */;
INSERT INTO `healthcareproviders` VALUES (1,'Dr. Emily Smith','Obstetrics & Gynecology','+250987654321','dr.smith@example.com','10 KG 7 Ave, Kacyiru, Kigali'),(2,'Dr. willy Smith','Obstetrics & Gynecology','2507934565027','dr.smith@example.com','15 KG 20 Ave, Remera, Kigali'),(3,'Dr. John Doe','Family Medicine','+2507934561297','dr.doe@example.com','24 KG 10 Ave, Gikondo, Kigali'),(4,'Nurse Jean Mugabo','Maternal Health','+2345678902','nurse.brown@example.com','12 KG 9 Ave, Nyarutarama, Kigali'),(5,'Dr. Michael Johnson','Family Medicine','0123456789','dr.johnson@example.com','789 Pine Road, Townsville'),(6,'Nurse Sarah Davis','Midwifery','0234567890','nurse.davis@example.com','321 Birch Street, Villageburg'),(7,'Dr. Linda Brown','Maternal-Fetal Medicine','0345678901','dr.brown@example.com','654 Cedar Lane, Hamletburg'),(8,'Dr. James Wilson','Pediatrics','0456789012','dr.wilson@example.com','987 Willow Drive, Districtville'),(9,'Dr. Anna Taylor','Endocrinology','0567890123','dr.taylor@example.com','135 Elm Street, Metropolis'),(10,'Nurse Laura Green','Public Health','0678901234','nurse.green@example.com','246 Maple Avenue, Capital City'),(11,'Dr. Robert Hall','Nutrition','0789012345','dr.hall@example.com','357 Oak Circle, Suburbia'),(12,'Dr. Patricia King','Gynecology','0890123456','dr.king@example.com','468 Cherry Lane, Uptown'),(13,'Nurse Nancy Lee','Home Health','0901234567','nurse.lee@example.com','579 Spruce Street, Downtown');
/*!40000 ALTER TABLE `healthcareproviders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `medication_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `dosage` varchar(50) NOT NULL,
  `side_effects` text,
  PRIMARY KEY (`medication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES (1,'Prenatal Vitamins','Supplements essential vitamins','1 tablet daily','Nausea, headache'),(2,'Iron Supplements','Prevents iron deficiency during pregnancy','2 tablets daily','Constipation, stomach upset'),(3,'Folic Acid','Supports fetal development','1 tablet daily','None'),(4,'Iron Tablets','Prevents and treats iron deficiency anemia during pregnancy.','1 tablet twice daily','Constipation, nausea'),(5,'Calcium Supplements','Supports the development of strong bones and teeth in the baby.','1 tablet daily','Stomach upset, kidney stones in rare cases'),(6,'Vitamin D3','Essential for calcium absorption and fetal bone development.','600 IU daily','Fatigue, dry mouth'),(7,'Omega-3 Fatty Acids','Promotes fetal brain and eye development.','1 softgel daily','Fishy aftertaste, upset stomach'),(8,'Magnesium Supplements','Helps with muscle relaxation and prevents premature contractions.','1 tablet daily','Diarrhea, stomach cramps'),(9,'Progesterone Supplements','Supports early pregnancy by maintaining the uterine lining.','200 mg daily','Dizziness, bloating'),(10,'Aspirin (Low Dose)','Prescribed to reduce the risk of preeclampsia in high-risk pregnancies.','81 mg daily','Nausea, bleeding risk'),(11,'Antacids','Used to relieve heartburn, a common pregnancy symptom.','1-2 tablets after meals','Constipation, diarrhea'),(12,'Labetalol','Used to manage high blood pressure in pregnancy.','100 mg twice daily','Dizziness, nausea, tiredness'),(13,'Metformin','Used to manage gestational diabetes by controlling blood sugar levels.','500 mg twice daily','Nausea, diarrhea, bloating'),(14,'Ondansetron','Prescribed to manage severe nausea and vomiting during pregnancy.','4 mg as needed','Headache, constipation'),(15,'Ranitidine','Used to treat acid reflux and heartburn during pregnancy.','150 mg twice daily','Headache, stomach pain'),(16,'Insulin','Used for managing blood sugar in pregnant women with diabetes.','As prescribed based on glucose levels','Low blood sugar, dizziness'),(17,'Prenatal Vitamins','Supplements essential vitamins and minerals to support pregnancy.','1 tablet daily','Nausea, headache'),(18,'Iron Tablets','Helps prevent iron deficiency anemia during pregnancy.','1 tablet daily with food','Constipation, stomach upset'),(19,'Folic Acid','Essential for fetal development and helps prevent neural tube defects.','1 tablet daily','Mild gastrointestinal issues'),(20,'Low-Dose Aspirin','Used to reduce the risk of pregnancy complications.','1 tablet daily','Stomach pain, heartburn'),(21,'Metformin','Helps manage blood sugar levels in women with gestational diabetes.','1 tablet twice daily','Nausea, diarrhea'),(22,'Omega-3 Fatty Acids','Supports fetal brain and eye development.','2 capsules daily','Fishy aftertaste, mild digestive issues'),(23,'Calcium Supplements','Helps ensure adequate calcium intake for fetal bone development.','1 tablet daily','Constipation, bloating'),(24,'Progesterone','Hormone therapy used to support pregnancy.','1 capsule daily','Drowsiness, breast tenderness'),(25,'Ondansetron','Used to prevent nausea and vomiting during pregnancy.','1 tablet as needed','Headache, dizziness'),(26,'Vitamin D','Essential for calcium absorption and fetal bone development.','1 tablet daily','None known');
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregnantwomen`
--

DROP TABLE IF EXISTS `pregnantwomen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregnantwomen` (
  `woman_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `registration_date` date NOT NULL,
  `expected_delivery_date` date NOT NULL,
  `last_visit_date` date DEFAULT NULL,
  PRIMARY KEY (`woman_id`),
  UNIQUE KEY `contact_number` (`contact_number`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregnantwomen`
--

LOCK TABLES `pregnantwomen` WRITE;
/*!40000 ALTER TABLE `pregnantwomen` DISABLE KEYS */;
INSERT INTO `pregnantwomen` VALUES (1,'Alliance Keza',28,'+250794567890','123 Maple Street','alliance.keza@example.com','2024-08-01','2025-04-15',NULL),(2,'Jane Mugisha',24,'+2507934567890','32 KG 14 St, Gikondo, Kigali','jane.mugisha@gmail.com','2024-08-01','2025-04-15','2024-08-15'),(3,'Mary Johnson',32,'+2507933097890','88 KG 12 Ave, Gisozi, Kigali','mary.johnson@example.com','2024-07-20','2025-03-10','2024-08-10'),(4,'Susan Smith',25,'+2507934567916','44 KN 5 Rd, Nyamirambo, Kigali','susan.smith@example.com','2024-08-05','2025-04-30',NULL),(5,'Jane Doe',28,'1234567890','123 Maple Street','jane.doe@example.com','2024-08-01','2025-04-15','2024-08-20'),(6,'Mary Johnson',30,'0987654321','456 Oak Avenue','mary.johnson@example.com','2024-09-15','2025-05-10',NULL),(7,'Susan Brown',26,'1122334455','789 Pine Road',NULL,'2024-07-20','2025-03-28','2024-08-05'),(8,'Alice Smith',29,'1012345670','123 Maple Street','alice.smith@example.com','2024-01-01','2024-09-15','2024-02-15'),(9,'Beth Johnson',31,'1023456781','456 Oak Avenue','beth.johnson@example.com','2024-01-03','2024-10-01','2024-02-17'),(10,'Cathy Davis',27,'1034567892','789 Pine Road',NULL,'2024-01-05','2024-08-20',NULL),(11,'Diana Brown',25,'1045678913','345 Cedar Street','diana.brown@example.com','2024-01-07','2024-09-25','2024-02-10'),(12,'Ellen Wilson',28,'1056789124','567 Birch Avenue',NULL,'2024-01-10','2024-09-10','2024-03-05'),(13,'Fiona Clark',32,'1067891235','789 Spruce Drive','fiona.clark@example.com','2024-01-12','2024-10-10','2024-02-12'),(14,'Grace Lewis',24,'1078912346','912 Elm Street','grace.lewis@example.com','2024-01-15','2024-11-15',NULL),(15,'Hannah Walker',33,'1089123457','234 Maple Avenue',NULL,'2024-01-18','2024-12-05','2024-03-18'),(16,'Irene Hall',29,'1091234568','567 Oak Road','irene.hall@example.com','2024-01-20','2024-09-25',NULL),(17,'Jackie Young',26,'1102345679','789 Pine Drive','jackie.young@example.com','2024-01-25','2024-08-30','2024-04-10'),(18,'Karen King',30,'1113456780','123 Cedar Avenue','karen.king@example.com','2024-02-01','2024-10-20','2024-03-20'),(19,'Lily Green',34,'1124567891','456 Birch Road',NULL,'2024-02-03','2024-11-10','2024-04-05'),(20,'Mia Adams',27,'1135678902','789 Elm Drive','mia.adams@example.com','2024-02-07','2024-10-15',NULL),(21,'Nina Bell',25,'1146789013','123 Maple Lane','nina.bell@example.com','2024-02-10','2024-09-30','2024-03-25'),(22,'Olivia Price',29,'1157890124','456 Oak Lane','olivia.price@example.com','2024-02-15','2024-12-05','2024-05-15'),(23,'Paula Perry',31,'1168912345','789 Pine Lane','paula.perry@example.com','2024-02-20','2024-11-15',NULL),(24,'Quinn Barnes',28,'1179123456','234 Cedar Street',NULL,'2024-02-23','2024-09-25','2024-04-20'),(25,'Rachel White',26,'1181234567','567 Birch Drive','rachel.white@example.com','2024-02-25','2024-08-20',NULL),(26,'Sarah Harris',32,'1192345678','789 Elm Avenue','sarah.harris@example.com','2024-03-01','2024-10-01','2024-04-18'),(27,'Tina Martin',29,'1203456789','123 Maple Drive','tina.martin@example.com','2024-03-05','2024-09-30','2024-05-10'),(28,'Uma Scott',24,'1214567890','456 Oak Avenue',NULL,'2024-03-10','2024-11-25','2024-04-25'),(29,'Vera Lee',34,'1225678901','789 Pine Street','vera.lee@example.com','2024-03-15','2024-11-10','2024-05-15'),(30,'Wendy Baker',27,'1236789012','234 Cedar Drive','wendy.baker@example.com','2024-03-20','2024-12-05',NULL),(31,'Yara Evans',26,'1247890123','567 Birch Street','yara.evans@example.com','2024-03-25','2024-08-20','2024-05-20'),(32,'Zoe Thomas',33,'1258912345','789 Elm Drive','zoe.thomas@example.com','2024-03-30','2024-09-25','2024-06-25'),(33,'Amy Harris',30,'1269123456','123 Maple Avenue','amy.harris@example.com','2024-04-01','2024-10-10','2024-05-05'),(34,'Becky Clark',29,'1271234567','456 Oak Drive','becky.clark@example.com','2024-04-05','2024-09-30',NULL),(35,'Chloe Nelson',25,'1282345678','789 Pine Lane',NULL,'2024-04-10','2024-11-05','2024-06-10'),(36,'Donna Turner',28,'1293456789','234 Cedar Lane','donna.turner@example.com','2024-04-15','2024-10-25','2024-06-15'),(37,'Eve Moore',32,'1304567890','567 Birch Lane','eve.moore@example.com','2024-04-20','2024-11-15','2024-06-20'),(38,'Faith Long',27,'1315678901','789 Elm Lane','faith.long@example.com','2024-04-25','2024-12-10','2024-06-25'),(39,'Gina Cooper',26,'1326789012','123 Maple Road',NULL,'2024-04-30','2024-09-30','2024-07-01'),(40,'Hope Foster',34,'1337890123','456 Oak Road','hope.foster@example.com','2024-05-01','2024-11-20','2024-07-05'),(41,'Ivy Ramirez',29,'1348912345','789 Pine Road',NULL,'2024-05-05','2024-10-15','2024-07-10'),(42,'Jill Brooks',31,'1359123456','234 Cedar Drive','jill.brooks@example.com','2024-05-10','2024-12-05','2024-07-15'),(43,'Kim Kelly',27,'1361234567','567 Birch Drive','kim.kelly@example.com','2024-05-15','2024-09-25','2024-07-20'),(44,'Laura Reed',25,'1372345678','789 Elm Avenue','laura.reed@example.com','2024-05-20','2024-11-10','2024-07-25'),(45,'Mona Griffin',28,'1383456789','123 Maple Lane',NULL,'2024-05-25','2024-10-01','2024-08-01'),(46,'Nora Stewart',30,'1394567890','456 Oak Avenue','nora.stewart@example.com','2024-05-30','2024-12-20','2024-08-05'),(47,'Olga Powell',26,'1405678901','789 Pine Drive',NULL,'2024-06-01','2024-11-10','2024-08-10'),(48,'Pia Parker',32,'1416789012','234 Cedar Street','pia.parker@example.com','2024-06-05','2024-12-05','2024-08-15'),(49,'Rachel Hughes',29,'1427890123','567 Birch Avenue',NULL,'2024-06-10','2024-09-30','2024-08-20'),(50,'Sophie Murphy',25,'1438912345','789 Elm Road','sophie.murphy@example.com','2024-06-15','2024-11-15','2024-08-25'),(51,'Tara Mitchell',30,'1449123456','123 Maple Drive','tara.mitchell@example.com','2024-06-20','2024-10-10','2024-09-01'),(52,'Uma Jordan',29,'1451234567','456 Oak Drive',NULL,'2024-06-25','2024-11-05','2024-09-05'),(53,'Vicky Reed',28,'1462345678','789 Pine Drive','vicky.reed@example.com','2024-06-30','2024-10-25','2024-09-10');
/*!40000 ALTER TABLE `pregnantwomen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `prescription_id` int NOT NULL AUTO_INCREMENT,
  `woman_id` int NOT NULL,
  `medication_id` int NOT NULL,
  `prescription_date` date NOT NULL,
  `dosage_instructions` varchar(255) NOT NULL,
  `follow_up_date` date NOT NULL,
  `status` enum('Pending','Completed','Overdue') NOT NULL,
  PRIMARY KEY (`prescription_id`),
  KEY `woman_id` (`woman_id`),
  KEY `medication_id` (`medication_id`),
  CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`woman_id`) REFERENCES `pregnantwomen` (`woman_id`),
  CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`medication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,1,1,'2024-08-02','Take 1 tablet daily','2024-08-09','Pending'),(2,1,1,'2024-08-02','Take 1 tablet daily','2024-08-09','Completed'),(3,1,2,'2024-08-02','Take 2 tablets daily','2024-08-16','Pending'),(4,2,1,'2024-07-25','Take 1 tablet daily','2024-08-01','Completed'),(5,2,3,'2024-07-25','Take 1 tablet daily','2024-08-08','Completed'),(6,3,2,'2024-08-10','Take 2 tablets daily','2024-08-17','Pending'),(47,1,1,'2024-08-02','Take 1 tablet daily','2024-08-09','Pending'),(48,1,2,'2024-09-01','Take 1 tablet daily with food','2024-09-08','Pending'),(49,2,3,'2024-07-15','Take 1 tablet daily','2024-07-22','Completed'),(50,3,4,'2024-09-10','Take 1 tablet daily','2024-09-17','Completed'),(51,4,5,'2024-09-12','Take 2 tablets daily, one in the morning and one in the evening','2024-09-19','Pending'),(52,5,6,'2024-08-25','Take 2 capsules daily','2024-09-01','Completed'),(53,6,7,'2024-09-05','Take 1 tablet daily','2024-09-12','Completed'),(54,7,8,'2024-09-15','Take 1 capsule daily','2024-09-22','Pending'),(55,8,9,'2024-08-28','Take 1 tablet as needed for nausea','2024-09-04','Completed'),(56,19,7,'2024-09-18','Take 1 tablet daily','2024-09-25','Pending');
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-28 17:45:41
