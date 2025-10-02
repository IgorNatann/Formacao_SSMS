-- Aula 03 - EXPRESSOES CASE
-- Objetivo: classificar registros de acordo com regras condicionais.
-- Roteiro de estudo:
--   1. Revisar os dados que serao classificados.
--   2. Criar uma coluna derivada com CASE.
--   3. Ordenar usando a classificacao calculada.
--   4. Destacar que CASE pode ser usado sem outras colunas no SELECT.
--   5. Demonstrar o erro comum ao agrupar por alias.
--   6. Mostrar a forma correta de agrupar reutilizando a expressao CASE.

-- 1) Base: lista produtos sabor Manga e seus precos.
SELECT NOME_DO_PRODUTO,
       PRECO_DE_LISTA
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga';

-- 2) Classificacao por faixa de preco usando CASE.
SELECT NOME_DO_PRODUTO,
       PRECO_DE_LISTA,
       CASE
           WHEN PRECO_DE_LISTA > 12 THEN 'PRODUTO CARO'
           WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
           ELSE 'PRODUTO BARATO'
       END AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga';

-- 3) Ordenacao pela categoria calculada.
SELECT NOME_DO_PRODUTO,
       PRECO_DE_LISTA,
       CASE
           WHEN PRECO_DE_LISTA > 12 THEN 'PRODUTO CARO'
           WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
           ELSE 'PRODUTO BARATO'
       END AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga'
ORDER BY CLASSIFICACAO;

-- 4) CASE isolado: possivel usar apenas a classificacao como resultado.
SELECT CASE
           WHEN PRECO_DE_LISTA > 12 THEN 'PRODUTO CARO'
           WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
           ELSE 'PRODUTO BARATO'
       END AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS;

-- 5) Exemplo de erro: nao e permitido agrupar usando apenas o alias CLASSIFICACAO.
-- SELECT CASE
--            WHEN PRECO_DE_LISTA > 12 THEN 'PRODUTO CARO'
--            WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
--            ELSE 'PRODUTO BARATO'
--        END AS CLASSIFICACAO,
--        COUNT(*) AS NUMERO_DE_PRODUTOS
-- FROM TABELA_DE_PRODUTOS
-- GROUP BY CLASSIFICACAO;

-- 6) Forma correta: repetir a expressao CASE no GROUP BY.
SELECT CASE
           WHEN PRECO_DE_LISTA > 12 THEN 'PRODUTO CARO'
           WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
           ELSE 'PRODUTO BARATO'
       END AS CLASSIFICACAO,
       COUNT(*) AS NUMERO_DE_PRODUTOS
FROM TABELA_DE_PRODUTOS
GROUP BY CASE
             WHEN PRECO_DE_LISTA > 12 THEN 'PRODUTO CARO'
             WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
             ELSE 'PRODUTO BARATO'
         END;

-- Dica: em SQL Server 2012+ voce pode usar CROSS APPLY ou subconsulta para evitar repetir o CASE.
