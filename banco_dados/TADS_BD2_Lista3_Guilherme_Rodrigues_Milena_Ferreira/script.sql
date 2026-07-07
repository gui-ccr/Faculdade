
-- TRIGGER 1: Limitar o número de telefones por Empresa Conveniada.
DELIMITER $$
CREATE TRIGGER TRG_BI_LIMITE_TELEFONE
BEFORE INSERT ON empresatelefone
FOR EACH ROW
BEGIN
    DECLARE total_telefones INT;

    SELECT COUNT(*) INTO total_telefones 
    FROM empresatelefone 
    WHERE CodEmpresa = NEW.CodEmpresa; 

    IF total_telefones >= 4 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Limite de 4 telefones por empresa conveniada atingido!!!';
    END IF;

END $$
DELIMITER ;

-- TRIGGER 2: Registrar o histórico de operações quando a renda do cliente é alterada
DELIMITER $$
CREATE TRIGGER TRG_AU_ALTERACAO_RENDA AFTER UPDATE ON cliente
FOR EACH ROW
BEGIN
	
	INSERT INTO historicooperacao (DescricaoAcao, DataHoraAcao)
	VALUES (CONCAT('Renda do cliente (código: ', NEW.CodCliente, ' nome: ', NEW.NomeCliente, ') foi alterada de R$ ', OLD.ValorRenda, ' para R$ ', NEW.ValorRenda, ' !!'), NOW());    
    
END $$
DELIMITER ;

-- TRIGGER 3: Auditoria ao inserir um novo empréstimo (aprovado) na tabela
DELIMITER $$
CREATE TRIGGER TRG_AI_APROVACAO_EMPRESTIMO AFTER INSERT ON emprestimo
FOR EACH ROW
BEGIN
	
    DECLARE v_nome_cliente VARCHAR(50);

	SELECT NomeCliente INTO v_nome_cliente 
    FROM cliente 
    WHERE CodCliente = NEW.CodCliente;

	IF NEW.StatusEmprestimo = 'APROVADO' THEN
	INSERT INTO historicooperacao (DescricaoAcao, DataHoraAcao)
    VALUES (CONCAT('Novo empréstimo aprovado (código: ', NEW.CodEmprestimo, ') para o cliente (codigo: ', NEW.CodCliente, ') - nome: ', v_nome_cliente, ') com sucesso !!'), NOW());
	END IF;
    
END $$
DELIMITER ;

DELIMITER $$
-- TRIGGER 4: Eliminar os telefones vinculados de uma empresa conveniada excluída
CREATE TRIGGER TRG_AD_ELIMINA_TELEFONE_EMPRESA AFTER DELETE ON empresaconveniada FOR EACH ROW
BEGIN
    
    DELETE FROM empresatelefone 
    WHERE CodEmpresaConveniada = OLD.CodEmpresa;

END $$
DELIMITER ;

-- TRIGGER 5: Gerar automaticamente as parcelas de um empréstimo via Procedure
DELIMITER $$
CREATE PROCEDURE SP_GERAR_PARCELAS(
    IN p_CodEmprestimo INT, 
    IN p_ValorTotal DECIMAL(10,2), 
    IN p_QtdeParcelas INT
)
BEGIN
    DECLARE v_Contador INT DEFAULT 1;
    DECLARE v_ValorParcela DECIMAL(10,2);
    DECLARE v_DataVencimento DATE;

    SET v_ValorParcela = p_ValorTotal / p_QtdeParcelas;

    WHILE v_Contador <= p_QtdeParcelas DO
        SET v_DataVencimento = DATE_ADD(CURDATE(), INTERVAL v_Contador MONTH);
        
        INSERT INTO parcelaemprestimo (CodEmprestimo, NumeroParcela, ValorAPagar, DataVencimento, StatusParcela)
        VALUES (p_CodEmprestimo, v_Contador, v_ValorParcela, v_DataVencimento, 'PENDENTE');
        
        SET v_Contador = v_Contador + 1;
    END WHILE;
END $$

CREATE TRIGGER TRG_AI_GERAR_PARCELAS_HISTORICO AFTER INSERT ON emprestimo FOR EACH ROW
BEGIN
    DECLARE v_nome_cliente VARCHAR(50);
    SELECT NomeCliente INTO v_nome_cliente FROM cliente WHERE CodCliente = NEW.CodCliente;

    -- Chama a procedure para gerar as parcelas
    CALL SP_GERAR_PARCELAS(NEW.CodEmprestimo, NEW.ValorFinalEmprestimo, NEW.QtdeParcelas);

    INSERT INTO historicooperacao (DescricaoAcao, DataHoraAcao)
    VALUES (CONCAT('O empréstimo (código: ', NEW.CodEmprestimo, ') do cliente (código: ', NEW.CodCliente, ' nome: ', v_nome_cliente, ') foi aprovado e suas parcelas geradas.'), NOW());
END $$
DELIMITER ;

-- TRIGGER 6: Eliminar as parcelas de um empréstimo cancelado
DELIMITER $$
CREATE TRIGGER TRG_AU_CANCELAR_PARCELAS AFTER UPDATE ON emprestimo FOR EACH ROW
BEGIN
    -- Verifica se o status antigo NÃO era cancelado e o NOVO status passou a ser 'CANCELADO'
    IF (OLD.StatusEmprestimo <> 'CANCELADO' OR OLD.StatusEmprestimo IS NULL) AND NEW.StatusEmprestimo = 'CANCELADO' THEN
        
        -- Limpa as parcelas vinculadas a este empréstimo específico
        DELETE FROM parcelaemprestimo 
        WHERE CodEmprestimo = NEW.CodEmprestimo;
        
    END IF;

END $$
DELIMITER ;


