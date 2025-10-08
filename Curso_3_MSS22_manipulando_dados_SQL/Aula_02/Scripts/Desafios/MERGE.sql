-- ================================================================
-- Desafio | Curso 3 | Aula 04 | Atividade 07 | Aumentando volume com MERGE baseado no bairro
-- Objetivo: reutilizar o exercicio do UPDATE com JOIN e implementa-lo com MERGE,
-- aplicando 30% de acrescimo no volume de clientes que compartilham bairro com vendedores.
-- ================================================================

-- Passo 1: identificar clientes atendidos (mesmo bairro dos vendedores)
SELECT
    A.NOME          AS CLIENTE,
    A.BAIRRO        AS BAIRRO_CLIENTE,
    A.VOLUME_COMPRA AS VOLUME_ATUAL,
    B.NOME          AS VENDEDOR,
    B.BAIRRO        AS BAIRRO_VENDEDOR
FROM TB_CLIENTES AS A
INNER JOIN TB_VENDEDORES AS B
    ON A.BAIRRO = B.BAIRRO;

-- Passo 2: aplicar MERGE para aumentar o volume em 30% quando houver correspondencia
MERGE INTO TB_CLIENTES AS A
USING TB_VENDEDORES AS B
    ON A.BAIRRO = B.BAIRRO
WHEN MATCHED THEN
    UPDATE SET A.VOLUME_COMPRA = A.VOLUME_COMPRA * 1.30;

-- Passo 3: validar o resultado apos o ajuste
SELECT
    A.NOME          AS CLIENTE,
    A.BAIRRO        AS BAIRRO_CLIENTE,
    A.VOLUME_COMPRA AS VOLUME_ATUALIZADO,
    B.NOME          AS VENDEDOR,
    B.BAIRRO        AS BAIRRO_VENDEDOR
FROM TB_CLIENTES AS A
INNER JOIN TB_VENDEDORES AS B
    ON A.BAIRRO = B.BAIRRO;
