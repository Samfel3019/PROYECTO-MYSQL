DROP DATABASE IF EXISTS sena;

CREATE DATABASE sena;

USE sena;

DROP TABLE IF EXISTS `Carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carrera` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carrera`
--

LOCK TABLES `Carrera` WRITE;
/*!40000 ALTER TABLE `Carrera` DISABLE KEYS */;
INSERT INTO `Carrera` VALUES (1,'Desarrollo de Software'),(2,'Electrónica'),(3,'Mecánica Automotriz'),(4,'Seguridad y Salud Ocupacional'),(5,'Soldadura');
/*!40000 ALTER TABLE `Carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Curso`
--

DROP TABLE IF EXISTS `Curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curso`
--

LOCK TABLES `Curso` WRITE;
/*!40000 ALTER TABLE `Curso` DISABLE KEYS */;
INSERT INTO `Curso` VALUES (1,'Matemáticas Básicas'),(2,'Algebra Computacional'),(3,'Programación Básica'),(4,'Inglés'),(5,'Electrónica Básica'),(6,'Motor de Cuatro Tiempos'),(7,'Enfermedades Laborales'),(8,'Higiene Postural en el Trabajo'),(9,'Ergonomía'),(10,'Legislación Laboral en Colombia'),(11,'Materiales de Soldadura'),(12,'Métodos de Soldadura'),(13,'Fusión de Metales'),(14,'Buceo 1'),(15,'Buceo 2'),(16,'Riesgo Eléctrico'),(17,'Bases de Datos Relacionales'),(18,'Bases de Datos NO Relacionales'),(19,'Electrónica Digital'),(20,'Microprocesadores');
/*!40000 ALTER TABLE `Curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CursoRuta`
--

DROP TABLE IF EXISTS `CursoRuta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CursoRuta` (
  `id_ruta` int NOT NULL,
  `id_curso` int NOT NULL,
  `duracion` double NOT NULL,
  KEY `cursoRuta_id_ruta_fk` (`id_ruta`),
  KEY `cursoRuta_id_curso_fk` (`id_curso`),
  CONSTRAINT `cursoRuta_id_curso_fk` FOREIGN KEY (`id_curso`) REFERENCES `Curso` (`id`),
  CONSTRAINT `cursoRuta_id_ruta_fk` FOREIGN KEY (`id_ruta`) REFERENCES `Ruta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CursoRuta`
--

LOCK TABLES `CursoRuta` WRITE;
/*!40000 ALTER TABLE `CursoRuta` DISABLE KEYS */;
INSERT INTO `CourseRoute` VALUES (1,1,2.5),(1,2,3),(1,3,2),(1,4,4),(1,17,3.5),(1,18,2.5),(2,1,3),(2,3,4),(2,4,5),(2,2,4.5),(8,4,5),(8,6,2),(10,11,3),(10,16,5),(11,13,6),(11,11,4),(3,3,5),(3,4,6),(3,17,4),(4,5,2.5),(4,19,5.5),(4,20,8),(5,5,2),(5,19,5),(5,20,10);
/*!40000 ALTER TABLE `CourseRoute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CursoMaestro`
--

DROP TABLE IF EXISTS `CursoMaestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CursoMaestro` (
  `id_maestro` int NOT NULL,
  `id_curso` int NOT NULL,
  `id` varchar(5) NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `cursomaestro_id_maestro_fk` (`id_maestro`),
  KEY `cursomaestro_id_curso_fk` (`id_curso`),
  CONSTRAINT `cursomaestro_id_course_fk` FOREIGN KEY (`id_curso`) REFERENCES `Curso` (`id`),
  CONSTRAINT `cursomaestro_id_trainer_fk` FOREIGN KEY (`id_maestro`) REFERENCES `Maestro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CursoMaestro`
--

LOCK TABLES `CursoMaestro` WRITE;
/*!40000 ALTER TABLE `CourseTrainer` DISABLE KEYS */;
INSERT INTO `CursoMaestro` VALUES (1,2,'AC-1'),(2,18,'DBN-1'),(2,17,'DBR-1'),(7,5,'EB-1'),(6,19,'ED-1'),(3,13,'FM-1'),(5,4,'I-1'),(4,1,'MB-1'),(7,20,'MP-1'),(3,11,'MS-1'),(3,3,'PB-1');
/*!40000 ALTER TABLE `CourseTrainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GroupAprendiz`
--

DROP TABLE IF EXISTS `GrupoAprendiz`;

CREATE TABLE `GrupoAprendiz` (
  `id_grupo` varchar(5) NOT NULL,
  `id_Aprendiz` int NOT NULL,
  KEY `id_grupo` (`id_grupo`),
  KEY `id_Aprendiz` (`id_Aprendiz`),
  CONSTRAINT `GrupoAprendiz_ibfk_1` FOREIGN KEY (`id_grupo`) REFERENCES `CursoMaestro` (`id`),
  CONSTRAINT `GrupoAprendiz_ibfk_2` FOREIGN KEY (`id_aprendiz`) REFERENCES `aprendiz` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GroupAprendiz`
--

LOCK TABLES `GrupoAprendiz` WRITE;
/*!40000 ALTER TABLE `GrupoAprendiz` DISABLE KEYS */;
INSERT INTO `GrupoAprendiz` VALUES ('DBR-1',1),('AC-1',1),('PB-1',1),('DBN-1',1),('MB-1',2),('AC-1',2),('PB-1',2),('I-1',2),('MB-1',3),('AC-1',3),('PB-1',3),('I-1',4),('MB-1',4),('AC-1',4),('PB-1',5),('I-1',5),('DBR-1',5),('EB-1',6),('ED-1',6),('MP-1',6),('EB-1',7),('ED-1',7),('MP-1',7),('EB-1',8),('ED-1',8),('EB-1',9),('ED-1',9),('MP-1',9),('MS-1',10),('FM-1',10),('MS-1',11);
/*!40000 ALTER TABLE `GrupoAprendiz` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `Route`
--

DROP TABLE IF EXISTS `Ruta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ruta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `id_carrera` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ruta_id_carrera_fk` (`id_carrera`),
  CONSTRAINT `ruta_id_carrera_fk` FOREIGN KEY (`id_carrera`) REFERENCES `Carrera` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Route`
--

--
-- Table structure for table `Matricula`
--

DROP TABLE IF EXISTS `Matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Matricula` (
  `id_Aprendiz` int NOT NULL,
  `id_ruta` int NOT NULL,
  `state` enum('Activo','Terminado','Cancelado') DEFAULT NULL,
  KEY `Matricula_id_ruta_fk` (`id_ruta`),
  KEY `Matricula_id_aprendiz_pk` (`id_aprendiz`),
  CONSTRAINT `Matricula_id_ruta_fk` FOREIGN KEY (`id_ruta`) REFERENCES `Ruta` (`id`),
  CONSTRAINT `Matricula_id_aprendiz_pk` FOREIGN KEY (`id_aprendiz`) REFERENCES `Aprendiz` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matricula`
--

LOCK TABLES `Matricula` WRITE;
/*!40000 ALTER TABLE `Matricula` DISABLE KEYS */;
INSERT INTO `Matricula` VALUES (1,1,'Activo'),(2,1,'Activo'),(3,2,'Cancelado'),(4,2,'Activo'),(5,3,'Activo'),(6,4,'Terminado'),(7,4,'Terminado'),(8,5,'Terminado'),(9,5,'Cancelado'),(10,11,'Terminado'),(11,10,'Terminado');
/*!40000 ALTER TABLE `Matricula` ENABLE KEYS */;
UNLOCK TABLES;



LOCK TABLES `Ruta` WRITE;
/*!40000 ALTER TABLE `Route` DISABLE KEYS */;
INSERT INTO `Ruta` VALUES (1,'Sistemas de Información Empresariales',1),(2,'Videojuegos',1),(3,'Machine Learning',1),(4,'Microcontroladores',2),(5,'Robótica',2),(6,'Dispositivos Bio-médicos',2),(7,'Motores Hibridos',3),(8,'Vehículos de Uso Agrícola',3),(9,'Sistemas de Gestión en Seguridad Ocupacional',4),(10,'Soldadura Autógena Industrial',5),(11,'Soldadura Eléctrica Industrial',5),(12,'Soldadura Submarina',5);
/*!40000 ALTER TABLE `Route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Especialidad`
--

DROP TABLE IF EXISTS `Especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Especialidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Especialidad`
--

LOCK TABLES `Especialidad` WRITE;
/*!40000 ALTER TABLE `Especialidad` DISABLE KEYS */;
INSERT INTO `Especialidad` VALUES (1,'Sistemas'),(2,'Salud Ocupacional'),(3,'Soldadura'),(4,'Mecánica'),(5,'Inglés'),(6,'Electrónica');
/*!40000 ALTER TABLE `Especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Aprendiz`
--

DROP TABLE IF EXISTS `Aprendiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Aprendiz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aprendiz`
--

LOCK TABLES `Aprendiz` WRITE;
/*!40000 ALTER TABLE `Aprendiz` DISABLE KEYS */;
INSERT INTO `Aprendiz` VALUES (1,'Carlos Saúl','Gómez',20),(2,'Leyla María','Delgado Vargas',21),(3,'Juan José','Cardona',22),(4,'Sergio Augusto','Contreras Navas',23),(5,'Ana María','Velázquez Parra',24),(6,'Gustavo','Noriega Alzate',25),(7,'Pedro Nell','Gómez Díaz',26),(8,'Jairo Augusto','Castro Camargo',27),(9,'Henry','Soler Vega',28),(10,'Antonio','Cañate Cortés',26),(11,'Daniel','Simmancas Junior',21);
/*!40000 ALTER TABLE `Aprendiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trainer`
--

DROP TABLE IF EXISTS `Maestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Maestro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `id_Especialidad` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `maestro_id_especialidad_fk` (`id_especialidad`),
  CONSTRAINT `maestro_id_especialidad_fk` FOREIGN KEY (`id_especialidad`) REFERENCES `Especialidad` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trainer`
--

LOCK TABLES `Maestro` WRITE;
/*!40000 ALTER TABLE `Trainer` DISABLE KEYS */;
INSERT INTO `Maestro` VALUES (1,'Ricardo Vicente Jaimes',1),(2,'Marinela Narvaez',2),(3,'Agustín Parra Granados',3),(4,'Nelson Raúl Buitrago',4),(5,'Roy Hernando Llamas',5),(6,'María Jimena Monsalve',6),(7,'Juan Carlos Cobos',6),(8,'Pedro Nell Santomaría',1),(9,'Andrea González',1),(10,'Marisela Sevilla',2);
/*!40000 ALTER TABLE `Trainer` ENABLE KEYS */;
UNLOCK TABLES;


