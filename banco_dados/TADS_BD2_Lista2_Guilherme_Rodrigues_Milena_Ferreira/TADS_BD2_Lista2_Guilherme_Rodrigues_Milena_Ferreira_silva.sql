-- 1) (3,0 pts) Elabore uma função chamada FN_Calcular_IMC(...) que calcule o Índice de Massa Corporal de um paciente. A fórmula para o cálculo do IMC é:
-- IMC = peso/altura x altura

DELIMITER $$

CREATE FUNCTION FN_Calcular_IMC(p_peso DECIMAL(8,2), p_altura DECIMAL(8,2)) 
RETURNS DECIMAL(8,2)
DETERMINISTIC
BEGIN
    DECLARE v_imc DECIMAL(8,2);
    
    IF p_altura > 0 THEN
        SET v_imc = p_peso / (p_altura * p_altura);
    ELSE
        SET v_imc = 0;
    END IF;
    
    RETURN v_imc;
END$$

DELIMITER ;


-- 2) (4,0 pts) Desenvolva um procedimento chamado SP_Classificar_IMC(...) que exiba a Classificação do IMC de uma pessoa.  A tabela de classificação é exibida abaixo. Importante: reutilize nesse procedimento a função criada anteriormente.

DELIMITER $$

CREATE PROCEDURE SP_Classificar_IMC(IN p_peso DECIMAL(8,2), IN p_altura DECIMAL(8,2))
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
END$$

DELIMITER ;



-- 3) (5,0 pts) Desenvolva um procedimento chamado SP_Gerar_Mensalidades_Aluno(...) que faça a geração automática das mensalidades a serem pagas por um aluno, conforme o plano escolhido na academia. Para reduzir a  implementação, considere a forma de pagamento, sendo de 1 parcela (a vista) até 12 parcelas.

-- OBS: inclua na tabela Pagamento o atributo: Nome: 'ValorPagar', tipo Decimal(8,2), obrigatório: Not Null.

ALTER TABLE pagamento 
ADD COLUMN ValorPagar DECIMAL(8,2) NOT NULL;

DELIMITER $$

CREATE PROCEDURE SP_Gerar_Mensalidades_Aluno(IN p_MatriculaAluno INT, IN p_QtdParcelas INT)
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

END$$

DELIMITER ;