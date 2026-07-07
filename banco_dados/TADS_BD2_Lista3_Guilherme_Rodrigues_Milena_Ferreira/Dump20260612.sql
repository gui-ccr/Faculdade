CREATE DATABASE  IF NOT EXISTS `dbcredifacil` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbcredifacil`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbcredifacil
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CodCliente` int NOT NULL AUTO_INCREMENT,
  `NomeCliente` varchar(50) NOT NULL,
  `CPFCliente` char(11) NOT NULL,
  `ValorRenda` decimal(10,2) NOT NULL,
  `CodEmpresaConveniada` int NOT NULL,
  PRIMARY KEY (`CodCliente`),
  KEY `fk_Cliente_EmpresasConveniadas1_idx` (`CodEmpresaConveniada`),
  CONSTRAINT `fk_Cliente_EmpresasConveniadas1` FOREIGN KEY (`CodEmpresaConveniada`) REFERENCES `empresaconveniada` (`CodEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Ana Beatriz Silva','12345678901',16000.00,1),(2,'Carlos Eduardo Souza','98765432109',4200.50,2),(3,'Fernanda Lima Costa','45678912300',25100.75,2),(4,'João Pedro Almeida','32165498700',12800.00,4),(5,'Mariana Santos Pereira','78912345600',6300.40,5),(6,'Rafael Oliveira Mendes','65498732100',5400.00,6),(7,'Patrícia Gomes Azevedo','15975348600',3900.25,5),(8,'Bruno Henrique Castro','85296374100',4600.00,8),(9,'Larissa Fernandes Rocha','74125896300',25800.80,10),(10,'Lucas Gabriel Martins','36985214700',33200.00,10);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_AU_ALTERACAO_RENDA` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
	
	INSERT INTO historicooperacao (DescricaoAcao, DataHoraAcao)
	VALUES (CONCAT('Renda do cliente (código: ', NEW.CodCliente, ' nome: ', NEW.NomeCliente, ') foi alterada de R$ ', OLD.ValorRenda, ' para R$ ', NEW.ValorRenda, ' !!'), NOW());    
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empresaconveniada`
--

DROP TABLE IF EXISTS `empresaconveniada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresaconveniada` (
  `CodEmpresa` int NOT NULL AUTO_INCREMENT,
  `NomeEmpresa` varchar(50) NOT NULL,
  `CNPJEmpresa` char(14) NOT NULL,
  `EmailEmpresa` varchar(50) NOT NULL,
  PRIMARY KEY (`CodEmpresa`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresaconveniada`
--

LOCK TABLES `empresaconveniada` WRITE;
/*!40000 ALTER TABLE `empresaconveniada` DISABLE KEYS */;
INSERT INTO `empresaconveniada` VALUES (1,'Crédito Na Hora Soluções Financeiras','12345678000190','contato@credifacil.com'),(2,'Banco Rápido Empréstimos','98765432000150','atendimento@bancorapido.com'),(4,'Mais Crédito','32165498000160','faleconosco@maiscredito.com'),(5,'Alpha Empréstimos','78912345000170','contato@alphaemprestimos.com'),(6,'ConfiaCred Financeira','65498731000140','clientes@confiacred.com'),(7,'TopCred Soluções Financeiras','15975348000130','info@topcred.com'),(8,'Pronto Crédito Fácil','85296374000120','contato@prontocredito.com'),(9,'BemCred Financeira','74125896000110','suporte@bemcred.com'),(10,'Avança Crédito Consignado','36985214000100','atendimento@avancacredito.com');
/*!40000 ALTER TABLE `empresaconveniada` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_BD_ELIMINA_TELEFONE_EMPRESA` BEFORE DELETE ON `empresaconveniada` FOR EACH ROW BEGIN

    -- Deleta todos os telefones associados à empresa ANTES que ela suma
    DELETE FROM empresatelefone 
    WHERE CodEmpresa = OLD.CodEmpresa;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_AD_ELIMINA_TELEFONE_EMPRESA` AFTER DELETE ON `empresaconveniada` FOR EACH ROW BEGIN

-- Deleta todos os telefones associados à empresa que acabou de ser excluída
    DELETE FROM empresatelefone 
    WHERE CodEmpresa = OLD.CodEmpresa;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empresatelefone`
--

DROP TABLE IF EXISTS `empresatelefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresatelefone` (
  `CodEmpresa` int NOT NULL,
  `NumeroTelefone` varchar(11) NOT NULL,
  PRIMARY KEY (`CodEmpresa`,`NumeroTelefone`),
  KEY `fk_EmpresasTelefones_EmpresasConveniadas_idx` (`CodEmpresa`),
  CONSTRAINT `fk_EmpresasTelefones_EmpresasConveniadas` FOREIGN KEY (`CodEmpresa`) REFERENCES `empresaconveniada` (`CodEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresatelefone`
--

LOCK TABLES `empresatelefone` WRITE;
/*!40000 ALTER TABLE `empresatelefone` DISABLE KEYS */;
INSERT INTO `empresatelefone` VALUES (1,'11987654321'),(1,'3134567890'),(1,'33911111111'),(1,'33911112222'),(2,'11912345678'),(4,'62987651234'),(5,'32988887777'),(6,'11977778888'),(6,'3233334444'),(7,'3387452365'),(8,'33955554444'),(9,'1432221111'),(9,'33944443333'),(10,'14933332222');
/*!40000 ALTER TABLE `empresatelefone` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_BI_LIMITE_TELEFONE` BEFORE INSERT ON `empresatelefone` FOR EACH ROW BEGIN
    DECLARE total_telefones INT;

    SELECT COUNT(*) INTO total_telefones 
    FROM empresatelefone 
    WHERE CodEmpresa = NEW.CodEmpresa; 

    IF total_telefones >= 4 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Limite de 4 telefones por empresa conveniada atingido!!!';
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimo` (
  `CodEmprestimo` int NOT NULL AUTO_INCREMENT,
  `CodCliente` int NOT NULL,
  `ValorSolicitado` decimal(10,2) NOT NULL,
  `TaxaJuros` decimal(5,2) NOT NULL,
  `ValorFinalEmprestimo` decimal(10,2) NOT NULL,
  `DataEmprestimo` date NOT NULL,
  `QtdeParcelas` int NOT NULL,
  `StatusEmprestimo` enum('SOLICITADO','APROVADO','CANCELADO','QUITADO') NOT NULL COMMENT 'ENUM(''APROVADO'', ''CANCELADO'', ''QUITADO'')',
  PRIMARY KEY (`CodEmprestimo`),
  KEY `fk_Emprestimo_Cliente1_idx` (`CodCliente`),
  CONSTRAINT `fk_Emprestimo_Cliente1` FOREIGN KEY (`CodCliente`) REFERENCES `cliente` (`CodCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (1,1,50000.00,9.50,54750.00,'2024-06-05',36,'APROVADO'),(2,1,35000.00,10.70,38745.00,'2025-06-05',24,'CANCELADO'),(3,1,5000.00,9.20,5460.00,'2025-06-12',8,'CANCELADO'),(4,1,10000.00,5.00,10500.00,'2026-06-24',12,'APROVADO'),(5,1,10000.00,20.00,12000.00,'2026-06-07',12,'APROVADO');
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_AI_APROVACAO_EMPRESTIMO` AFTER INSERT ON `emprestimo` FOR EACH ROW BEGIN
	
    DECLARE v_nome_cliente VARCHAR(50);

	SELECT NomeCliente INTO v_nome_cliente 
    FROM cliente 
    WHERE CodCliente = NEW.CodCliente;

	IF NEW.StatusEmprestimo = 'APROVADO' THEN
	INSERT INTO historicooperacao (DescricaoAcao, DataHoraAcao)
    VALUES (CONCAT('Novo empréstimo aprovado (código: ', NEW.CodEmprestimo, ') para o cliente (codigo: ', NEW.CodCliente, ') - nome: ', v_nome_cliente, ') com sucesso !!'), NOW());
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_AI_GERAR_PARCELAS` AFTER INSERT ON `emprestimo` FOR EACH ROW BEGIN

    -- Aciona a procedure enviando as colunas exatas mapeadas do seu dump
    CALL SP_GERAR_PARCELAS(NEW.CodEmprestimo, NEW.ValorFinalEmprestimo, NEW.QtdeParcelas);

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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_AU_CANCELAR_PARCELAS` AFTER UPDATE ON `emprestimo` FOR EACH ROW BEGIN

    -- Verifica se o status antigo NÃO era cancelado e o NOVO status passou a ser 'CANCELADO'
    IF (OLD.StatusEmprestimo <> 'CANCELADO' OR OLD.StatusEmprestimo IS NULL) AND NEW.StatusEmprestimo = 'CANCELADO' THEN
        
        -- Limpa as parcelas vinculadas a este empréstimo específico
        DELETE FROM parcelaemprestimo 
        WHERE CodEmprestimo = NEW.CodEmprestimo;
        
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `historicooperacao`
--

DROP TABLE IF EXISTS `historicooperacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historicooperacao` (
  `CodHistoricoOperacao` int NOT NULL AUTO_INCREMENT,
  `DescricaoAcao` varchar(300) NOT NULL,
  `DataHoraAcao` datetime NOT NULL,
  PRIMARY KEY (`CodHistoricoOperacao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historicooperacao`
--

LOCK TABLES `historicooperacao` WRITE;
/*!40000 ALTER TABLE `historicooperacao` DISABLE KEYS */;
INSERT INTO `historicooperacao` VALUES (1,'Renda do cliente (código: 1 nome: Ana Beatriz Silva) foi alterada de R$ 13500.00 para R$ 16000.00 !!','2026-06-04 12:58:49'),(2,'Novo empréstimo aprovado (código: 4) para o cliente (codigo: 1) - nome: Ana Beatriz Silva) com sucesso !!','2026-06-04 13:10:49'),(3,'Novo empréstimo aprovado (código: 5) para o cliente (codigo: 1) - nome: Ana Beatriz Silva) com sucesso !!','2026-06-07 22:14:53');
/*!40000 ALTER TABLE `historicooperacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcelaemprestimo`
--

DROP TABLE IF EXISTS `parcelaemprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcelaemprestimo` (
  `CodParcela` int NOT NULL AUTO_INCREMENT,
  `CodEmprestimo` int NOT NULL,
  `NumeroParcela` int NOT NULL,
  `ValorAPagar` decimal(10,2) NOT NULL,
  `DataVencimento` date NOT NULL,
  `ValorPago` decimal(10,2) DEFAULT NULL,
  `DataPagamento` date DEFAULT NULL,
  `StatusParcela` enum('PENDENTE','PAGA','ATRASADA') NOT NULL COMMENT 'ENUM(''PENDENTE'', ''PAGA'', ''ATRASADA'')',
  PRIMARY KEY (`CodParcela`),
  KEY `fk_table1_Emprestimo1_idx` (`CodEmprestimo`),
  CONSTRAINT `fk_table1_Emprestimo1` FOREIGN KEY (`CodEmprestimo`) REFERENCES `emprestimo` (`CodEmprestimo`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcelaemprestimo`
--

LOCK TABLES `parcelaemprestimo` WRITE;
/*!40000 ALTER TABLE `parcelaemprestimo` DISABLE KEYS */;
INSERT INTO `parcelaemprestimo` VALUES (38,1,1,1520.83,'2025-06-12',NULL,NULL,'PENDENTE'),(39,1,2,1520.83,'2025-07-12',NULL,NULL,'PENDENTE'),(40,1,3,1520.83,'2025-08-12',NULL,NULL,'PENDENTE'),(41,1,4,1520.83,'2025-09-12',NULL,NULL,'PENDENTE'),(42,1,5,1520.83,'2025-10-12',NULL,NULL,'PENDENTE'),(43,1,6,1520.83,'2025-11-12',NULL,NULL,'PENDENTE'),(44,1,7,1520.83,'2025-12-12',NULL,NULL,'PENDENTE'),(45,1,8,1520.83,'2026-01-12',NULL,NULL,'PENDENTE'),(46,1,9,1520.83,'2026-02-12',NULL,NULL,'PENDENTE'),(47,1,10,1520.83,'2026-03-12',NULL,NULL,'PENDENTE'),(48,1,11,1520.83,'2026-04-12',NULL,NULL,'PENDENTE'),(49,1,12,1520.83,'2026-05-12',NULL,NULL,'PENDENTE'),(50,1,13,1520.83,'2026-06-12',NULL,NULL,'PENDENTE'),(51,1,14,1520.83,'2026-07-12',NULL,NULL,'PENDENTE'),(52,1,15,1520.83,'2026-08-12',NULL,NULL,'PENDENTE'),(53,1,16,1520.83,'2026-09-12',NULL,NULL,'PENDENTE'),(54,1,17,1520.83,'2026-10-12',NULL,NULL,'PENDENTE'),(55,1,18,1520.83,'2026-11-12',NULL,NULL,'PENDENTE'),(56,1,19,1520.83,'2026-12-12',NULL,NULL,'PENDENTE'),(57,1,20,1520.83,'2027-01-12',NULL,NULL,'PENDENTE'),(58,1,21,1520.83,'2027-02-12',NULL,NULL,'PENDENTE'),(59,1,22,1520.83,'2027-03-12',NULL,NULL,'PENDENTE'),(60,1,23,1520.83,'2027-04-12',NULL,NULL,'PENDENTE'),(61,1,24,1520.83,'2027-05-12',NULL,NULL,'PENDENTE'),(62,1,25,1520.83,'2027-06-12',NULL,NULL,'PENDENTE'),(63,1,26,1520.83,'2027-07-12',NULL,NULL,'PENDENTE'),(64,1,27,1520.83,'2027-08-12',NULL,NULL,'PENDENTE'),(65,1,28,1520.83,'2027-09-12',NULL,NULL,'PENDENTE'),(66,1,29,1520.83,'2027-10-12',NULL,NULL,'PENDENTE'),(67,1,30,1520.83,'2027-11-12',NULL,NULL,'PENDENTE'),(68,1,31,1520.83,'2027-12-12',NULL,NULL,'PENDENTE'),(69,1,32,1520.83,'2028-01-12',NULL,NULL,'PENDENTE'),(70,1,33,1520.83,'2028-02-12',NULL,NULL,'PENDENTE'),(71,1,34,1520.83,'2028-03-12',NULL,NULL,'PENDENTE'),(72,1,35,1520.83,'2028-04-12',NULL,NULL,'PENDENTE'),(73,1,36,1520.83,'2028-05-12',NULL,NULL,'PENDENTE'),(98,3,1,682.50,'2025-01-12',682.50,'2025-01-12','PAGA'),(99,3,2,682.50,'2025-02-12',682.50,'2025-02-12','PAGA'),(100,3,3,682.50,'2025-03-12',NULL,NULL,'PENDENTE'),(101,3,4,682.50,'2025-04-12',NULL,NULL,'PENDENTE'),(102,3,5,682.50,'2025-05-12',NULL,NULL,'PENDENTE'),(103,3,6,682.50,'2025-06-12',682.50,'2025-06-12','PAGA'),(104,3,7,682.50,'2025-07-12',NULL,NULL,'PENDENTE'),(105,3,8,682.50,'2025-08-12',NULL,NULL,'PENDENTE'),(106,5,1,1000.00,'2026-07-07',NULL,NULL,'PENDENTE'),(107,5,2,1000.00,'2026-08-06',NULL,NULL,'PENDENTE'),(108,5,3,1000.00,'2026-09-05',NULL,NULL,'PENDENTE'),(109,5,4,1000.00,'2026-10-05',NULL,NULL,'PENDENTE'),(110,5,5,1000.00,'2026-11-04',NULL,NULL,'PENDENTE'),(111,5,6,1000.00,'2026-12-04',NULL,NULL,'PENDENTE'),(112,5,7,1000.00,'2027-01-03',NULL,NULL,'PENDENTE'),(113,5,8,1000.00,'2027-02-02',NULL,NULL,'PENDENTE'),(114,5,9,1000.00,'2027-03-04',NULL,NULL,'PENDENTE'),(115,5,10,1000.00,'2027-04-03',NULL,NULL,'PENDENTE'),(116,5,11,1000.00,'2027-05-03',NULL,NULL,'PENDENTE'),(117,5,12,1000.00,'2027-06-02',NULL,NULL,'PENDENTE');
/*!40000 ALTER TABLE `parcelaemprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbcredifacil'
--

--
-- Dumping routines for database 'dbcredifacil'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_GERAR_PARCELAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GERAR_PARCELAS`(
    IN p_CodEmprestimo INT, 
    IN p_ValorTotal DECIMAL(10,2), 
    IN p_QtdeParcelas INT
)
BEGIN
    DECLARE v_Contador INT DEFAULT 1;
    DECLARE v_ValorParcela DECIMAL(10,2);
    DECLARE v_DataVencimento DATE;

    -- Calcula o valor exato de cada parcela
    SET v_ValorParcela = p_ValorTotal / p_QtdeParcelas;

    -- Laço para inserir as parcelas na tabela real: parcelaemprestimo
    WHILE v_Contador <= p_QtdeParcelas DO
        
        -- Define o vencimento de 30 em 30 dias
        SET v_DataVencimento = DATE_ADD(CURDATE(), INTERVAL (v_Contador * 30) DAY);
        
        -- Insere respeitando as colunas originais do seu banco de dados
        INSERT INTO parcelaemprestimo (CodEmprestimo, NumeroParcela, ValorAPagar, DataVencimento, StatusParcela)
        VALUES (p_CodEmprestimo, v_Contador, v_ValorParcela, v_DataVencimento, 'PENDENTE');
        
        SET v_Contador = v_Contador + 1;
    END WHILE;

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

-- Dump completed on 2026-06-12 18:48:44
