-- ================================================================
-- Curso 3 | Aula 05 | Atividade 4 | Sincronizando precos via UPDATE com JOIN
-- Objetivo: comparar tabelas (interna x SUCOS_FRUTAS), reajustar a origem e
-- alinhar os precos locais com uma unica instrucao UPDATE ... FROM.
-- ================================================================

-- Passo 1: conferir os precos atuais das tabelas local e externa
SELECT * FROM TB_PRODUTOS ORDER BY CODIGO;

SELECT * FROM SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS
ORDER BY CODIGO_DO_PRODUTO;

-- Passo 2: aplicar reajuste de 20% na tabela externa (referencia)
UPDATE SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS
SET PRECO_DE_LISTA = PRECO_DE_LISTA * 1.20;

-- Passo 3: comparar os valores apos o reajuste, antes de sincronizar
SELECT
    A.DESCRITOR        AS PRODUTO_TB_INTERNO,
    A.PRECO_LISTA      AS PRECO_TB_INTERNO,
    B.NOME_DO_PRODUTO  AS PRODUTO_TB_EXTERNO,
    B.PRECO_DE_LISTA   AS PRECO_TB_EXTERNO
FROM TB_PRODUTOS AS A
INNER JOIN SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS AS B
    ON A.CODIGO = B.CODIGO_DO_PRODUTO;

-- Passo 4: sincronizar o preco local com o preco reajustado da origem
UPDATE A
SET A.PRECO_LISTA = B.PRECO_DE_LISTA
FROM TB_PRODUTOS AS A
INNER JOIN SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS AS B
    ON A.CODIGO = B.CODIGO_DO_PRODUTO;

-- Passo 5: confirmar se os precos ficaram alinhados entre as tabelas
SELECT
    A.DESCRITOR        AS PRODUTO_TB_INTERNO,
    A.PRECO_LISTA      AS PRECO_TB_INTERNO,
    B.NOME_DO_PRODUTO  AS PRODUTO_TB_EXTERNO,
    B.PRECO_DE_LISTA   AS PRECO_TB_EXTERNO
FROM TB_PRODUTOS AS A
INNER JOIN SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS AS B
    ON A.CODIGO = B.CODIGO_DO_PRODUTO;
