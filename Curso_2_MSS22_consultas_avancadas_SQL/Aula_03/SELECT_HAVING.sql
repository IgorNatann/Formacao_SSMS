-- Aula 03 - WHERE x HAVING
-- Objetivo: mostrar a diferenca entre filtros aplicados antes e depois do GROUP BY.
-- Roteiro de estudo:
--   1. Observar os dados brutos.
--   2. Agrupar e somar valores por estado.
--   3. Entender por que funcoes de agregacao nao funcionam no WHERE.
--   4. Aplicar HAVING para filtrar agregacoes.
--   5. Repetir agregacoes em outra tabela e combinar WHERE com HAVING.

-- 1) Visao geral dos clientes, sem filtros.
SELECT *
FROM TABELA_DE_CLIENTES;

-- 2) Soma do limite de credito por estado.
SELECT ESTADO,
       SUM(LIMITE_DE_CREDITO) AS CREDITO
FROM TABELA_DE_CLIENTES
GROUP BY ESTADO;

-- 3) Exemplo de erro: SUM no WHERE e avaliado antes da agregacao.
--    Deixe o bloco comentado para consulta, pois o comando nao executa.
-- SELECT ESTADO,
--        SUM(LIMITE_DE_CREDITO) AS CREDITO
-- FROM TABELA_DE_CLIENTES
-- WHERE SUM(LIMITE_DE_CREDITO) >= 900000
-- GROUP BY ESTADO;

-- 4) Mesmo objetivo anterior, agora com HAVING apos o GROUP BY.
SELECT ESTADO,
       SUM(LIMITE_DE_CREDITO) AS CREDITO
FROM TABELA_DE_CLIENTES
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;

-- 5) Faixa de precos por embalagem (MAX e MIN) sem filtros extras.
SELECT EMBALAGEM,
       MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO,
       MIN(PRECO_DE_LISTA) AS PRECO_MINIMO
FROM TABELA_DE_PRODUTOS
GROUP BY EMBALAGEM;

-- 6) Filtro antes da agregacao: considera apenas produtos com preco >= 10.
SELECT EMBALAGEM,
       MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO,
       MIN(PRECO_DE_LISTA) AS PRECO_MINIMO
FROM TABELA_DE_PRODUTOS
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM;

-- 7) WHERE + HAVING: primeiro filtra produtos baratos, depois remove grupos sem produtos caros.
SELECT EMBALAGEM,
       MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO,
       MIN(PRECO_DE_LISTA) AS PRECO_MINIMO
FROM TABELA_DE_PRODUTOS
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM
HAVING MAX(PRECO_DE_LISTA) >= 20;

-- Sequencia de avaliacao do SQL Server: FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY.
-- Regras principais:
--   * Use WHERE para filtrar linhas individuais antes das agregacoes.
--   * Use HAVING para filtrar grupos apos o GROUP BY ou funcoes de agregacao.
