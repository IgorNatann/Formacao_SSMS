-- ================================================================
-- Desafio | Curso 3 | Aula 04 | Atividade 5 | Reforco de volume por compartilhamento de bairro
-- Objetivo: detectar clientes que dividem bairro com vendedores e aplicar
-- aumento de 30% em VOLUME_COMPRA usando UPDATE com JOIN.
-- ================================================================

-- Passo 1: identificar clientes que moram em bairros atendidos por vendedores
SELECT
    A.CPF,
    A.NOME,
    A.VOLUME_COMPRA,
    A.BAIRRO
FROM TB_CLIENTES AS A
INNER JOIN TB_VENDEDORES AS B
    ON A.BAIRRO = B.BAIRRO;

-- Passo 2: aplicar o reajuste de 30% no volume de compra desses clientes
UPDATE A
SET A.VOLUME_COMPRA = A.VOLUME_COMPRA * 1.30
FROM TB_CLIENTES AS A
INNER JOIN TB_VENDEDORES AS B
    ON A.BAIRRO = B.BAIRRO;

-- Passo 3: validar o resultado apos o UPDATE
SELECT
    A.CPF,
    A.NOME,
    A.VOLUME_COMPRA,
    A.BAIRRO
FROM TB_CLIENTES AS A
INNER JOIN TB_VENDEDORES AS B
    ON A.BAIRRO = B.BAIRRO;
