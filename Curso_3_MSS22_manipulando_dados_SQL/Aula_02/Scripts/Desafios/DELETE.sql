-- ================================================================
-- Desafio | Curso 3 | Aula 04 | Atividade 09 | Excluindo cabecalhos de vendas com clientes menores
-- Objetivo: localizar notas fiscais ligadas a clientes com idade < 18
-- e remover somente o cabecalho em TB_VENDAS usando DELETE com JOIN.
-- ================================================================

-- Passo 1: identificar os numeros das notas associadas a clientes menores
SELECT A.NUMERO
FROM TB_VENDAS AS A
INNER JOIN TB_CLIENTES AS B
    ON A.CPF = B.CPF
WHERE B.IDADE < 18;

-- Passo 2: conferir os dados completos antes de excluir
SELECT *
FROM TB_CLIENTES AS A
INNER JOIN TB_VENDAS AS B
    ON A.CPF = B.CPF
WHERE A.IDADE < 18;

-- Passo 3: excluir apenas o cabecalho das notas com clientes menores
DELETE A
FROM TB_VENDAS AS A
INNER JOIN TB_CLIENTES AS B
    ON A.CPF = B.CPF
WHERE B.IDADE < 18;

-- Passo 4: validar que nao restaram registros das notas removidas
SELECT *
FROM TB_VENDAS AS A
INNER JOIN TB_CLIENTES AS B
    ON A.CPF = B.CPF
WHERE B.IDADE < 18;
