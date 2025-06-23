-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: healthcare_db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `doc_id` int NOT NULL,
  `doc_name` varchar(50) DEFAULT NULL,
  `phone_no` bigint DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Dr. Ravi Kumar',9988771122,'Cardiologist'),(2,'Dr. Anjali Menon',9876544433,'Dermatologist'),(3,'Dr. Suresh Gupta',9345612345,'Orthopedic'),(4,'Dr. Meena Iyer',9765432198,'Pediatrician'),(5,'Dr. Ajay Singh',9988776655,'Neurologist'),(6,'Dr. Lakshmi Rao',9456123789,'ENT Specialist'),(7,'Dr. Vishal Thakur',9654321789,'General Physician'),(8,'Dr. Reema Das',9345678901,'Gynecologist'),(9,'Dr. Nikhil Shah',9988665544,'Pulmonologist'),(10,'Dr. Swati Pandey',9123456701,'Psychiatrist');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encounter_records`
--

DROP TABLE IF EXISTS `encounter_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encounter_records` (
  `en_id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `doc_id` int DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`en_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encounter_records`
--

LOCK TABLES `encounter_records` WRITE;
/*!40000 ALTER TABLE `encounter_records` DISABLE KEYS */;
INSERT INTO `encounter_records` VALUES (1,1,1,'Outpatient','2023-01-10'),(2,2,2,'Outpatient','2023-02-15'),(3,3,3,'Emergency','2022-12-05'),(4,4,4,'Outpatient','2023-03-12'),(5,5,5,'Consultation','2023-04-18'),(6,6,6,'Outpatient','2023-05-22'),(7,7,7,'General Check','2023-06-10'),(8,8,8,'Outpatient','2023-07-08'),(9,9,9,'Emergency','2023-08-02'),(10,10,10,'Psych Consult','2023-09-25');
/*!40000 ALTER TABLE `encounter_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_history`
--

DROP TABLE IF EXISTS `medical_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_history` (
  `medh_id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `medication` varchar(255) DEFAULT NULL,
  `allergies` varchar(255) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `previous_treatment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`medh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_history`
--

LOCK TABLES `medical_history` WRITE;
/*!40000 ALTER TABLE `medical_history` DISABLE KEYS */;
INSERT INTO `medical_history` VALUES (1,1,'Aspirin','None','Hypertension','Lifestyle changes'),(2,2,'Cetirizine','Dust','Allergic Rhinitis','Antihistamines'),(3,3,'Metformin','None','Diabetes','Insulin therapy'),(4,4,'Amoxicillin','Penicillin','Throat infection','Home remedies'),(5,5,'Atorvastatin','None','High cholesterol','Diet control'),(6,6,'Ibuprofen','NSAIDs','Joint pain','Physiotherapy'),(7,7,'Paracetamol','None','Fever','Hydration'),(8,8,'Levothyroxine','None','Thyroid disorder','Tablet daily'),(9,9,'Salbutamol','Pollen','Asthma','Inhaler use'),(10,10,'Sertraline','None','Anxiety','Talk therapy');
/*!40000 ALTER TABLE `medical_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone_no` bigint DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Aarav Mehta','Male','1990-05-15',9876543210),(2,'Ishita Sharma','Female','1988-11-23',9123456789),(3,'Raj Verma','Male','1975-03-10',9988776655),(4,'Sneha Reddy','Female','1995-07-19',9012345678),(5,'Karan Patel','Male','1982-12-30',8765432109),(6,'Diya Nair','Female','1993-09-25',9112233445),(7,'Arjun Singh','Male','1980-01-05',9090909090),(8,'Priya Desai','Female','1991-04-08',9876512345),(9,'Rohan Joshi','Male','1985-06-12',9321654987),(10,'Neha Kapoor','Female','1997-02-20',9123459876);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescriptions`
--

DROP TABLE IF EXISTS `prescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescriptions` (
  `pre_id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `medication` varchar(255) DEFAULT NULL,
  `dosage` varchar(50) DEFAULT NULL,
  `dispensing_details` varchar(255) DEFAULT NULL,
  `doc_id` int DEFAULT NULL,
  PRIMARY KEY (`pre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescriptions`
--

LOCK TABLES `prescriptions` WRITE;
/*!40000 ALTER TABLE `prescriptions` DISABLE KEYS */;
INSERT INTO `prescriptions` VALUES (1,1,'Amlodipine','5mg','Once daily',1),(2,2,'Loratadine','10mg','At night',2),(3,3,'Glibenclamide','5mg','Twice daily',3),(4,4,'Azithromycin','500mg','Three days',4),(5,5,'Simvastatin','20mg','Bedtime',5),(6,6,'Naproxen','250mg','After meals',6),(7,7,'Calpol','500mg','As needed',7),(8,8,'Eltroxin','100mcg','Empty stomach',8),(9,9,'Asthalin','Inhaler','Before activity',9),(10,10,'Escitalopram','10mg','Daily morning',10);
/*!40000 ALTER TABLE `prescriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedures`
--

DROP TABLE IF EXISTS `procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedures` (
  `pro_id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `doc_id` int DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedures`
--

LOCK TABLES `procedures` WRITE;
/*!40000 ALTER TABLE `procedures` DISABLE KEYS */;
INSERT INTO `procedures` VALUES (1,1,'ECG','2023-01-10',1),(2,2,'Skin Biopsy','2023-02-15',2),(3,3,'Knee Surgery','2022-12-05',3),(4,4,'Tonsil Removal','2023-03-12',6),(5,5,'Brain MRI','2023-04-18',5),(6,6,'Ear Cleaning','2023-05-22',6),(7,7,'Annual Checkup','2023-06-10',7),(8,8,'Pelvic Ultrasound','2023-07-08',8),(9,9,'Chest X-ray','2023-08-02',9),(10,10,'Mental Health Evaluation','2023-09-25',10);
/*!40000 ALTER TABLE `procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_and_results`
--

DROP TABLE IF EXISTS `test_and_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_and_results` (
  `test_id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `doc_id` int DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_and_results`
--

LOCK TABLES `test_and_results` WRITE;
/*!40000 ALTER TABLE `test_and_results` DISABLE KEYS */;
INSERT INTO `test_and_results` VALUES (1,1,'Blood Pressure','2023-01-10','140/90',1),(2,2,'Allergy Test','2023-02-16','Positive',2),(3,3,'HbA1c','2022-12-10','7.5%',3),(4,4,'Throat Swab','2023-03-13','Bacterial',4),(5,5,'Lipid Profile','2023-04-19','High LDL',5),(6,6,'Joint X-ray','2023-05-23','Normal',6),(7,7,'CBC','2023-06-11','Within range',7),(8,8,'TSH','2023-07-09','Elevated',8),(9,9,'Spirometry','2023-08-03','Mild obstruction',9),(10,10,'Psych Eval','2023-09-26','Mild anxiety',10);
/*!40000 ALTER TABLE `test_and_results` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-06 17:14:27
