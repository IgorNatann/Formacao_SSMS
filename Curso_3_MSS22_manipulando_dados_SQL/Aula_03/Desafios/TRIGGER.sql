-- ================================================================
-- Desafio | Curso 3 Aula 03 | Trigger para manter idade atualizada
-- Objetivo: usar DATEDIFF para recalcular IDADE sempre que TB_CLIENTES sofrer
-- INSERT, UPDATE ou DELETE, evitando idades desatualizadas.
-- ================================================================

-- Passo 1: consulta de referencia que calcula idade dinamicamente
SELECT CPF, IDADE, DATA_NASCIMENTO,
       DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) AS IDADE_CALCULADA
FROM TB_CLIENTES;

-- Passo 2: criar trigger que ajusta IDADE apos qualquer mudanca na tabela
CREATE TRIGGER TG_CLIENTES_IDADE
ON VENDAS_SUCOS.dbo.TB_CLIENTES
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE TB_CLIENTES
    SET IDADE = DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE());
END;
GO

-- Passo 3: SELECT de validacao antes do UPDATE (baseline)
SELECT CPF, IDADE
FROM TB_CLIENTES;

-- Passo 4: executar acao de teste (gatilha a trigger)
UPDATE TB_CLIENTES
SET ESTADO = 'Sao Paulo'
WHERE ESTADO = 'Rio de Janeiro';

-- Passo 5: validar que as idades foram recalculadas automaticamente
SELECT CPF, IDADE
FROM TB_CLIENTES;
