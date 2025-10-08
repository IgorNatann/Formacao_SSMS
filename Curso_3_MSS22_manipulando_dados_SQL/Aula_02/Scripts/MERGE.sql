-- ================================================================
-- Curso 3 | Aula 04 | Atividade 06 | Sincronizando precos com MERGE
-- Objetivo: comparar UPDATE tradicional com MERGE para alinhar precos da
-- tabela interna a partir da base SUCOS_FRUTAS.
-- ================================================================

-- Passo 1: reajustar a tabela externa (referencia) para provocar diferenca
UPDATE SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS
SET PRECO_DE_LISTA = PRECO_DE_LISTA * 1.20;

-- Passo 2: visualizar como ficaram os precos apos o reajuste
SELECT
    A.DESCRITOR        AS PRODUTO_TB_INTERNO,
    A.PRECO_LISTA      AS PRECO_TB_INTERNO,
    B.NOME_DO_PRODUTO  AS PRODUTO_TB_EXTERNO,
    B.PRECO_DE_LISTA   AS PRECO_TB_EXTERNO
FROM TB_PRODUTOS AS A
INNER JOIN SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS AS B
    ON A.CODIGO = B.CODIGO_DO_PRODUTO;

-- Passo 3: exemplo de sincronizacao usando UPDATE com JOIN (abordagem classica)
UPDATE A
SET A.PRECO_LISTA = B.PRECO_DE_LISTA
FROM TB_PRODUTOS AS A
INNER JOIN SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS AS B
    ON A.CODIGO = B.CODIGO_DO_PRODUTO;

-- Passo 4: exemplo equivalente utilizando MERGE (WHEN MATCHED -> UPDATE)
MERGE INTO TB_PRODUTOS AS A
USING SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS AS B
    ON A.CODIGO = B.CODIGO_DO_PRODUTO
WHEN MATCHED THEN
    UPDATE SET A.PRECO_LISTA = B.PRECO_DE_LISTA;

-- Passo 5: conferir se os precos estao sincronizados apos o MERGE
SELECT
    A.DESCRITOR        AS PRODUTO_TB_INTERNO,
    A.PRECO_LISTA      AS PRECO_TB_INTERNO,
    B.NOME_DO_PRODUTO  AS PRODUTO_TB_EXTERNO,
    B.PRECO_DE_LISTA   AS PRECO_TB_EXTERNO
FROM TB_PRODUTOS AS A
INNER JOIN SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS AS B
    ON A.CODIGO = B.CODIGO_DO_PRODUTO;
