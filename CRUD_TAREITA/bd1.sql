-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: kdramas_nuevo_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `kdramas`
--

DROP TABLE IF EXISTS `kdramas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kdramas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `anio` int NOT NULL,
  `genero` varchar(100) NOT NULL,
  `episodios` int NOT NULL,
  `transmision` varchar(255) NOT NULL,
  `protagonistas` text NOT NULL,
  `sinopsis` text NOT NULL,
  `calificacion` decimal(3,1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kdramas`
--

LOCK TABLES `kdramas` WRITE;
/*!40000 ALTER TABLE `kdramas` DISABLE KEYS */;
INSERT INTO `kdramas` VALUES (1,'MI armario secreto',2023,'romance :D',12,'netflix','Hong Yoon Hwa, Kim Jung Suk','Seúl, 1987. Yeong-ro es una estudiante universitaria en una época turbulenta. Un día, un hombre ensangrentado se mete de repente en el dormitorio femenino de su universidad, y ella decide ayudarlo.',8.0),(2,'la maleta',2020,'crimen',12,'HBO','Kim Jisoo. Eun Yoeng-ro., Yoo In-na. Kang Cheong-ya., Jang Seung-jo. Lee Kang-moo.','Lim Ju-kyung es una chica de secundaria que ha sufrido terribles críticas toda su vida por su falta de belleza física. Un día, cansada de soportar tanta humillación decide poner fin a su vida, pero un extraño le brinda ayuda inesperada. El cambio de imagen de Ju kyung resulta un total éxito.',9.5),(3,'Cunado nadie nos ve',2017,'romance',12,'disney+','Lee Joon-gi y Moon Chae-won','Un hombre esconde su retorcido pasado tras la apariencia del marido perfecto de una detective hasta que su esposa empieza a investigar una serie de asesinatos',9.2),(4,'mi romance secreto',1990,'melondrama',23,'doramas','Lee Joon-gi y Moon Chae-won','Lim Ju-kyung es una chica de secundaria que ha sufrido terribles críticas toda su vida por su falta de belleza física. Un día, cansada de soportar tanta humillación decide poner fin a su vida, pero un extraño le brinda ayuda inesperada. El cambio de imagen de Ju kyung resulta un total éxito.',10.0),(5,'Ella era bionita',2019,'oficina',23,'doramas','Lee Joon-gi y Moon Chae-won','Lim Ju-kyung es una chica de secundaria que ha sufrido terribles críticas toda su vida por su falta de belleza física. Un día, cansada de soportar tanta humillación decide poner fin a su vida, pero un extraño le brinda ayuda inesperada. El cambio de imagen de Ju kyung resulta un total éxito.',7.0),(6,'cuando un extraño llama',2015,'romance',34,'netflix','Lee Joon-gi y Moon Chae-won','Un hombre esconde su retorcido pasado tras la apariencia del marido perfecto de una detective hasta que su esposa empieza a investigar una serie de asesinatos',10.0),(7,'el amor es como el cha cha cha',2020,'Crimen',16,'Netflix','Lee Joon-gi y Moon Chae-won','Una dentista de la gran ciudad abre una clínica en un pequeño pueblo costero, donde conoce a un manitas encantador que resulta ser su polo opuesto en todos los sentidos. Una dulce historia romántica en un pequeño pueblo.',10.0),(8,'Snowdrop',2019,'Crimen',16,'Disney +','Kim Jisoo. Eun Yoeng-ro., Yoo In-na. Kang Cheong-ya., Jang Seung-jo. Lee Kang-moo.','Seúl, 1987. Yeong-ro es una estudiante universitaria en una época turbulenta. Un día, un hombre ensangrentado se mete de repente en el dormitorio femenino de su universidad, y ella decide ayudarlo.',8.7),(9,'la flor del mal',2025,'Acción',12,'Netflix','Lee Joon-gi y Moon Chae-won','Un hombre esconde su retorcido pasado tras la apariencia del marido perfecto de una detective hasta que su esposa empieza a investigar una serie de asesinatos',10.0),(20,'HOLEEEEE',2023,'romance :D',1,'DORAMAS','NO C','DE UNA CHICA QUE SE CAE',9.0);
/*!40000 ALTER TABLE `kdramas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'KarolHolmes','herrera.macedo.karolmarilu@gmail.com','$2b$10$L8ibd9HR6lFOfHbhY3LggOrQdSAmO6OrtIyR8RzrBftBYbyb33cde'),(2,'Rorris','yoyis19emanuel@gmail.com','$2b$10$bYeMB0OiTSYI2yOi6zLfU.ddMkYFxpSk6LvB69fmMUz14Y4bWoh.u'),(3,'&lt;script&gt;alert(\'XSS\');&lt;/script&gt;','mkrmusica@gmail.com','$2b$10$PpLVmTZ0oyNsatqbO/mT1OkFZy8Iu/JknJZP8m0NeCT6Ajd61.iTu'),(4,'dgdfgdfgg','yoyis-emanuel@hotmail.com','$2b$10$16E8LuZZhyJYk4hcdTXptO/RKpp8MvFMKXHoQHA.KoFGf75plW5JC');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-29 23:18:58
