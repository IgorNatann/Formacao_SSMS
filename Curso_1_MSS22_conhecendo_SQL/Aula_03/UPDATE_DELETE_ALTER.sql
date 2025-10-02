-- =========================================
-- Aula 03 - Atualizando e removendo dados
-- Objetivo geral: praticar UPDATE com condicoes, ajuste de multiplas colunas e DELETE seguro.
-- Conceitos principais: SET, filtros em UPDATE/DELETE, conferencias com SELECT intermediario.
-- =========================================

-- Bloco 1 | Dar desconto de 10% em produtos que usam embalagem Lata.
UPDATE TABELA_PRODUTOS
SET PRECO_LISTA = PRECO_LISTA * 0.90
WHERE EMBALAGEM = 'Lata';

-- Consulta rapida para conferir um produto especifico apos o desconto.
SELECT *
FROM TABELA_PRODUTOS
WHERE CODIGO_PRODUTO = '1088126';

-- Bloco 2 | Ajustar embalagem e preco de um produto especifico.
UPDATE TABELA_PRODUTOS
SET EMBALAGEM = 'Garrafa',
    PRECO_LISTA = 8.10
WHERE CODIGO_PRODUTO = '1088126';

-- Bloco 3 | Excluir um produto descontinuado.
DELETE FROM TABELA_PRODUTOS
WHERE CODIGO_PRODUTO = '1004327';
