-- ================================================================
-- Curso 3 | Aula 05 | Atividade 06 | Trigger para manter TB_FATURAMENTO atualizado
-- Objetivo: criar uma trigger em TB_ITENS_VENDAS que recalcule o faturamento
-- sempre que ocorrer INSERT, UPDATE ou DELETE, eliminando o trabalho manual.
-- ================================================================

-- Passo 1: criar a trigger que reage a mudancas na tabela de itens
CREATE TRIGGER TG_ITENS_VENDIDOS
ON VENDAS_SUCOS.dbo.TB_ITENS_VENDAS
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Recarrega o resumo toda vez que itens mudarem
    DELETE FROM TB_FATURAMENTO;

    INSERT INTO TB_FATURAMENTO
    SELECT
        TV.DATA_VENDA,
        SUM(TIV.QUANTIDADE * TIV.PRECO) AS TOTAL_VENDA
    FROM TB_VENDAS AS TV
    INNER JOIN TB_ITENS_VENDAS AS TIV
        ON TV.NUMERO = TIV.NUMERO
    GROUP BY TV.DATA_VENDA;
END;
GO

-- Passo 2: validar o comportamento da trigger
SELECT * FROM TB_FATURAMENTO; -- estado inicial

INSERT INTO TB_VENDAS VALUES ('0105', '2018-05-16', 1471156710, 235, 0.18);
INSERT INTO TB_ITENS_VENDAS VALUES ('0105', '1000889', 150, 10);
SELECT * FROM TB_FATURAMENTO; -- trigger executa automaticamente

INSERT INTO TB_VENDAS VALUES ('0106', '2018-05-16', 1471156710, 235, 0.18);
INSERT INTO TB_ITENS_VENDAS VALUES ('0106', '1000889', 200, 10);
SELECT * FROM TB_FATURAMENTO;

-- Passo 3: testar atualizacao e exclusao para garantir cobertura total
UPDATE TB_ITENS_VENDAS
SET QUANTIDADE = 350
WHERE NUMERO = '0106';
SELECT * FROM TB_FATURAMENTO;

DELETE FROM TB_ITENS_VENDAS
WHERE NUMERO = '0106';
SELECT * FROM TB_FATURAMENTO;
