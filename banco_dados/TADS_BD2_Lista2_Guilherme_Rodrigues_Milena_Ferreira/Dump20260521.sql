-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbviews_sps_funcs
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluno` (
  `MatriculaAluno` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `CodPlano` int NOT NULL,
  PRIMARY KEY (`MatriculaAluno`),
  KEY `fk_ALUNO_PLANO1_idx` (`CodPlano`),
  CONSTRAINT `fk_ALUNO_PLANO1` FOREIGN KEY (`CodPlano`) REFERENCES `plano` (`CodPlano`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Lucas Andrade',1),(2,'Maria Lima',2),(3,'João Pedro',3),(4,'Fernanda Costa',4),(5,'Carlos Silva',5),(6,'Juliana Rocha',1),(7,'Tiago Fernandes',6),(8,'Ana Paula',7),(9,'Rafael Gomes',8),(10,'Patrícia Almeida',9),(11,'Bruno Soares',10),(12,'Larissa Dias',2),(13,'Eduardo Moraes',3),(14,'Gabriela Torres',6),(15,'Marcos Vinícius',4);
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade`
--

DROP TABLE IF EXISTS `cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade` (
  `CodCidade` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `UF` char(2) NOT NULL,
  PRIMARY KEY (`CodCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade`
--

LOCK TABLES `cidade` WRITE;
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` VALUES (1,'São Paulo','SP'),(2,'Rio de Janeiro','RJ'),(3,'Belo Horizonte','MG'),(4,'Salvador','BA'),(5,'Curitiba','PR'),(6,'Porto Alegre','RS'),(7,'Fortaleza','CE'),(8,'Brasília','DF'),(9,'Manaus','AM'),(10,'Recife','PE');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CodCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`CodCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Empresa Alpha'),(2,'Loja Beta'),(3,'Distribuidora Gama'),(4,'Comércio Delta'),(5,'Serviços Epsilon'),(6,'Rede Zeta'),(7,'Tech Ômega'),(8,'Supermercado Sigma'),(9,'Editora Theta'),(10,'Startup Lambda');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `CodDepartamento` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CodDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Financeiro'),(2,'Recursos Humanos'),(3,'Tecnologia da Informação'),(4,'Marketing'),(5,'Comercial'),(6,'Logística');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disciplina` (
  `CodDisciplina` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `CargaHoraria` int NOT NULL,
  PRIMARY KEY (`CodDisciplina`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` VALUES (1,'Banco de Dados',60),(2,'Estrutura de Dados',60),(3,'Programação',80),(4,'Matemática',40),(5,'Redes',60),(6,'Engenharia de Software',50),(7,'Sistemas Operacionais',60),(8,'Segurança da Informação',40),(9,'Algoritmos',60),(10,'Linguagem SQL',40);
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudante`
--

DROP TABLE IF EXISTS `estudante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudante` (
  `CodEstudante` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`CodEstudante`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudante`
--

LOCK TABLES `estudante` WRITE;
/*!40000 ALTER TABLE `estudante` DISABLE KEYS */;
INSERT INTO `estudante` VALUES (1,'Joana Prado'),(2,'Marcos Silva'),(3,'Letícia Gomes'),(4,'Daniel Rocha'),(5,'Camila Freitas'),(6,'Lucas Souza'),(7,'Bianca Lima'),(8,'Vinícius Torres'),(9,'Aline Costa'),(10,'Thiago Moreira');
/*!40000 ALTER TABLE `estudante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `CodFuncionario` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `CodDepartamentoPertence` int NOT NULL,
  PRIMARY KEY (`CodFuncionario`),
  KEY `fk_FUNCIONARIO_DEPARTAMENTO_idx` (`CodDepartamentoPertence`),
  CONSTRAINT `fk_FUNCIONARIO_DEPARTAMENTO` FOREIGN KEY (`CodDepartamentoPertence`) REFERENCES `departamento` (`CodDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Ana Costa',1),(2,'Bruno Lima',2),(3,'Carlos Silva',3),(4,'Daniela Rocha',3),(5,'Eduardo Torres',4),(6,'Fernanda Dias',5),(7,'Gustavo Almeida',1),(8,'Helena Martins',2),(9,'Igor Oliveira',6),(10,'Juliana Ramos',4),(11,'Kleber Souza',5),(12,'Laura Mendes',6);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_salario`
--

DROP TABLE IF EXISTS `historico_salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_salario` (
  `CodSalario` int NOT NULL AUTO_INCREMENT,
  `CodFuncionario` int NOT NULL,
  `ValorSalario` decimal(8,2) NOT NULL,
  `DataInicio` date NOT NULL,
  `DataFim` date DEFAULT NULL,
  PRIMARY KEY (`CodSalario`),
  KEY `fk_HISTORICO_SALARIO_FUNCIONARIO1_idx` (`CodFuncionario`),
  CONSTRAINT `fk_HISTORICO_SALARIO_FUNCIONARIO1` FOREIGN KEY (`CodFuncionario`) REFERENCES `funcionario` (`CodFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_salario`
--

LOCK TABLES `historico_salario` WRITE;
/*!40000 ALTER TABLE `historico_salario` DISABLE KEYS */;
INSERT INTO `historico_salario` VALUES (1,1,3000.00,'2021-01-01','2022-01-01'),(2,1,3500.00,'2022-01-02',NULL),(3,2,2800.00,'2021-06-01','2022-06-01'),(4,2,3200.00,'2022-06-02',NULL),(5,3,4000.00,'2022-03-01','2023-03-01'),(6,3,4500.00,'2023-03-02',NULL),(7,4,4100.00,'2023-01-01',NULL),(8,5,2900.00,'2022-09-01','2023-08-31'),(9,5,3100.00,'2023-09-01',NULL),(10,6,3300.00,'2021-01-01','2022-01-01'),(11,6,3600.00,'2022-01-02','2023-01-01'),(12,6,3900.00,'2023-01-02',NULL),(13,7,3100.00,'2023-02-01',NULL),(14,8,2800.00,'2022-04-01',NULL),(15,9,3000.00,'2022-06-01',NULL),(16,10,3300.00,'2021-08-01','2022-08-01'),(17,10,3600.00,'2022-08-02',NULL),(18,11,3100.00,'2023-01-01',NULL),(19,12,2900.00,'2022-02-01',NULL);
/*!40000 ALTER TABLE `historico_salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matricula`
--

DROP TABLE IF EXISTS `matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matricula` (
  `CodEstudante` int NOT NULL,
  `CodDisciplina` int NOT NULL,
  `Ano` int NOT NULL,
  `Semestre` int NOT NULL,
  `Nota` decimal(5,2) DEFAULT NULL,
  `Frequencia` int DEFAULT NULL,
  PRIMARY KEY (`CodEstudante`,`CodDisciplina`,`Ano`,`Semestre`),
  KEY `fk_ALUNO_has_DISCIPLINA_DISCIPLINA1_idx` (`CodDisciplina`),
  KEY `fk_ALUNO_has_DISCIPLINA_ALUNO1_idx` (`CodEstudante`),
  CONSTRAINT `fk_ALUNO_has_DISCIPLINA_ALUNO1` FOREIGN KEY (`CodEstudante`) REFERENCES `estudante` (`CodEstudante`),
  CONSTRAINT `fk_ALUNO_has_DISCIPLINA_DISCIPLINA1` FOREIGN KEY (`CodDisciplina`) REFERENCES `disciplina` (`CodDisciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matricula`
--

LOCK TABLES `matricula` WRITE;
/*!40000 ALTER TABLE `matricula` DISABLE KEYS */;
INSERT INTO `matricula` VALUES (1,1,2024,1,88.50,90),(1,2,2024,1,70.00,80),(2,2,2024,1,66.50,78),(2,3,2024,1,91.00,95),(3,3,2024,1,73.50,84),(3,4,2024,1,63.50,75),(4,5,2024,1,74.50,85),(5,6,2024,1,81.00,92),(6,7,2024,1,90.00,97),(7,8,2024,1,60.00,70),(8,9,2024,1,79.00,80),(9,10,2024,1,83.50,88),(10,1,2024,1,95.50,96);
/*!40000 ALTER TABLE `matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `CodPagamento` int NOT NULL AUTO_INCREMENT,
  `MatriculaAluno` int NOT NULL,
  `DataVencimento` date NOT NULL,
  `ValorPago` decimal(8,2) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `ValorPagar` decimal(8,2) NOT NULL,
  PRIMARY KEY (`CodPagamento`),
  KEY `fk_PAGAMENTO_ALUNO1_idx` (`MatriculaAluno`),
  CONSTRAINT `fk_PAGAMENTO_ALUNO1` FOREIGN KEY (`MatriculaAluno`) REFERENCES `aluno` (`MatriculaAluno`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES (1,1,'2025-04-01',89.90,'Pago',0.00),(2,2,'2025-04-03',129.90,'Pago',0.00),(3,3,'2025-04-02',159.90,'Pago',0.00),(4,4,'2025-04-01',299.90,'Pendente',0.00),(5,5,'2025-04-05',999.00,'Pago',0.00),(6,6,'2025-04-08',89.90,'Pago',0.00),(7,7,'2025-04-10',149.90,'Pago',0.00),(8,8,'2025-04-04',79.90,'Pendente',0.00),(9,9,'2025-04-07',59.90,'Pago',0.00),(10,10,'2025-04-06',179.90,'Pago',0.00),(11,11,'2025-04-11',399.90,'Pago',0.00),(12,12,'2025-04-03',129.90,'Pago',0.00),(13,13,'2025-04-01',159.90,'Pago',0.00),(14,14,'2025-04-09',149.90,'Pago',0.00),(15,15,'2025-04-06',299.90,'Pendente',0.00),(16,1,'2026-06-21',0.00,'Pendente',89.90),(17,1,'2026-07-21',0.00,'Pendente',89.90),(18,1,'2026-08-21',0.00,'Pendente',89.90);
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `CodPedido` int NOT NULL AUTO_INCREMENT,
  `CodCliente` int NOT NULL,
  `DataPedido` date NOT NULL,
  `DataEntrega` date DEFAULT NULL,
  `Status` varchar(10) NOT NULL,
  PRIMARY KEY (`CodPedido`),
  KEY `fk_PEDIDO_CLIENTE1_idx` (`CodCliente`),
  CONSTRAINT `fk_PEDIDO_CLIENTE1` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`CodCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,'2024-01-01','2024-01-05','Entregue'),(2,2,'2024-01-02','2024-01-06','Entregue'),(3,3,'2024-01-03','2024-01-10','Pendente'),(4,4,'2024-01-04',NULL,'Pendente'),(5,5,'2024-01-05','2024-01-08','Cancelado'),(6,6,'2024-01-06',NULL,'Pendente'),(7,7,'2024-01-07',NULL,'Pendente'),(8,8,'2024-01-08','2024-01-15','Entregue'),(9,9,'2024-01-09','2024-01-16','Pendente'),(10,10,'2024-01-10',NULL,'Pendente');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `CodPessoa` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `DataNascimento` date NOT NULL,
  `CodCidadeNasce` int NOT NULL,
  PRIMARY KEY (`CodPessoa`),
  KEY `fk_PESSOA_CIDADE1_idx` (`CodCidadeNasce`),
  CONSTRAINT `fk_PESSOA_CIDADE1` FOREIGN KEY (`CodCidadeNasce`) REFERENCES `cidade` (`CodCidade`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Pedro Silva','1990-03-15',1),(2,'Amanda Costa','1985-06-20',2),(3,'Bruno Pereira','2000-09-12',3),(4,'Juliana Rocha','1992-01-08',4),(5,'Rodrigo Lima','1988-11-23',5),(6,'Larissa Gomes','1995-07-10',6),(7,'André Nogueira','1999-04-05',7),(8,'Fernanda Souza','1993-12-30',8),(9,'Gustavo Torres','1987-10-14',9),(10,'Patrícia Dias','1991-08-18',10);
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plano`
--

DROP TABLE IF EXISTS `plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plano` (
  `CodPlano` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `ValorMensal` decimal(8,2) NOT NULL,
  PRIMARY KEY (`CodPlano`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plano`
--

LOCK TABLES `plano` WRITE;
/*!40000 ALTER TABLE `plano` DISABLE KEYS */;
INSERT INTO `plano` VALUES (1,'Plano Básico',89.90),(2,'Plano Intermediário',129.90),(3,'Plano Avançado',159.90),(4,'Plano Família',299.90),(5,'Plano Anual',999.00),(6,'Musculação + Cardio',149.90),(7,'Plano Estudante',79.90),(8,'Plano Weekend',59.90),(9,'Plano Plus',179.90),(10,'Plano Corporativo',399.90);
/*!40000 ALTER TABLE `plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbviews_sps_funcs'
--

--
-- Dumping routines for database 'dbviews_sps_funcs'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_Calcular_IMC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_Calcular_IMC`(p_peso DECIMAL(8,2), p_altura DECIMAL(8,2)) RETURNS decimal(8,2)
    DETERMINISTIC
BEGIN
    DECLARE v_imc DECIMAL(8,2);
    
    IF p_altura > 0 THEN
        SET v_imc = p_peso / (p_altura * p_altura);
    ELSE
        SET v_imc = 0;
    END IF;
    
    RETURN v_imc;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Classificar_IMC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Classificar_IMC`(IN p_peso DECIMAL(8,2), IN p_altura DECIMAL(8,2))
BEGIN
    DECLARE v_imc DECIMAL(8,2);
    DECLARE v_classificacao VARCHAR(30);
    
    SET v_imc = FN_Calcular_IMC(p_peso, p_altura);
    
    IF v_imc < 18.5 THEN
        SET v_classificacao = 'Baixo Peso';
    ELSEIF v_imc < 25.0 THEN
        SET v_classificacao = 'Peso Normal';
    ELSEIF v_imc < 30.0 THEN
        SET v_classificacao = 'Pré-obesidade';
    ELSEIF v_imc < 35.0 THEN
        SET v_classificacao = 'Obesidade Grau I';
    ELSEIF v_imc < 40.0 THEN
        SET v_classificacao = 'Obesidade Grau II';
    ELSE
        SET v_classificacao = 'Obesidade Grau III';
    END IF;
    
    SELECT v_imc AS IMC, v_classificacao AS Classificacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_Gerar_Mensalidades_Aluno` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Gerar_Mensalidades_Aluno`(IN p_MatriculaAluno INT, IN p_QtdParcelas INT)
BEGIN
    DECLARE v_ValorMensal DECIMAL(8,2);
    DECLARE v_Contador INT DEFAULT 1;
    DECLARE v_DataVencimento DATE;
    
    IF p_QtdParcelas >= 1 AND p_QtdParcelas <= 12 THEN
        
        SELECT p.ValorMensal INTO v_ValorMensal
        FROM aluno a
        INNER JOIN plano p ON a.CodPlano = p.CodPlano
        WHERE a.MatriculaAluno = p_MatriculaAluno;

        SET v_DataVencimento = CURDATE();
        
        WHILE v_Contador <= p_QtdParcelas DO
            INSERT INTO pagamento (
                MatriculaAluno, 
                DataVencimento, 
                ValorPago, 
                Status, 
                ValorPagar
            )
            VALUES (
                p_MatriculaAluno, 
                DATE_ADD(v_DataVencimento, INTERVAL v_Contador MONTH), 
                0.00, 
                'Pendente', 
                v_ValorMensal
            );
            
            SET v_Contador = v_Contador + 1;
        END WHILE;
        
        SELECT CONCAT(p_QtdParcelas, ' mensalidade(s) gerada(s) com sucesso!') AS Resultado;
        
    ELSE
        SELECT 'Erro: A quantidade de parcelas deve estar entre 1 e 12.' AS Resultado;
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-21 19:28:31
