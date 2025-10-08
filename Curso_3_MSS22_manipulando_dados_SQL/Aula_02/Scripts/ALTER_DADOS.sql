-- ================================================================
-- Curso 3 | Aula 02 | Atualizando dados em TB_PRODUTOS
-- Objetivo: praticar UPDATE com filtros especificos, ajustes percentuais e
-- alteracao de texto em lote usando REPLACE.
-- ================================================================

-- Passo 1: inspecionar a tabela antes das alteracoes
SELECT * FROM TB_PRODUTOS;

-- Passo 2: ajustar preco de um produto pontual
-- CODIGO alvo: 1040107
UPDATE TB_PRODUTOS
SET PRECO_LISTA = 5
WHERE CODIGO = '1040107';

SELECT * FROM TB_PRODUTOS WHERE CODIGO = '1040107';

-- Passo 3: aplicar acrescimo de 10% nos produtos sabor Manga
SELECT * FROM TB_PRODUTOS WHERE SABOR = 'Manga'; -- antes do ajuste

UPDATE TB_PRODUTOS
SET PRECO_LISTA = PRECO_LISTA * 1.10
WHERE SABOR = 'Manga';

SELECT * FROM TB_PRODUTOS WHERE SABOR = 'Manga'; -- apos o ajuste

-- Passo 4: atualizar descricao e tamanho de todos os itens 350 ml
SELECT DESCRITOR FROM TB_PRODUTOS WHERE TAMANHO = '350 ml';

SELECT
    DESCRITOR,
    REPLACE(DESCRITOR, '350 ml', '550 ml') AS NOVO_DESCRITOR
FROM TB_PRODUTOS
WHERE TAMANHO = '350 ml';

UPDATE TB_PRODUTOS
SET DESCRITOR = REPLACE(DESCRITOR, '350 ml', '550 ml'),
    TAMANHO   = '550 ml'
WHERE TAMANHO = '350 ml';

SELECT DESCRITOR, TAMANHO, EMBALAGEM
FROM TB_PRODUTOS
WHERE TAMANHO = '550 ml';
