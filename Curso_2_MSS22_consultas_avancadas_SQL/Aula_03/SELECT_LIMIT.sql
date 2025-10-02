-- Aula 03 - LIMIT / TOP
-- Objetivo: limitar quantidade de linhas retornadas com TOP e combinar com outros comandos.
-- Roteiro de estudo:
--   1. Revisar todos os registros para ter referencia.
--   2. Aplicar TOP simples.
--   3. Combinar TOP com DISTINCT e WHERE.

-- 1) Referencia completa da tabela de produtos.
SELECT *
FROM TABELA_DE_PRODUTOS;

-- 2) TOP 10: retorna apenas os dez primeiros registros.
SELECT TOP 10 *
FROM TABELA_DE_PRODUTOS;

-- 3) TOP com DISTINCT e filtro: ate dez linhas unicas apenas com sabor Maca.
SELECT DISTINCT TOP 10 *
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Maca';

-- Observacoes:
--   * Em SQL Server, TOP pode receber percentual (TOP 10 PERCENT) e ORDER BY para controlar a selecao.
--   * A clausula DISTINCT remove duplicidades antes de aplicar o TOP.
