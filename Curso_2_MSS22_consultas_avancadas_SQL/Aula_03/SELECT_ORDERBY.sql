-- Aula 03 - SELECT com ORDER BY
-- Objetivo: ordenar resultados em diferentes criterios e direcoes.
-- Roteiro de estudo:
--   1. Observar a tabela sem ordenacao.
--   2. Ordenar por preco crescente e decrescente.
--   3. Ordenar por coluna textual.
--   4. Ordenar por mais de uma coluna.
--   5. Combinar TOP com ORDER BY.

-- 1) Consulta base sem ordenacao explicita (usa ordem natural do banco).
SELECT *
FROM TABELA_DE_PRODUTOS;

-- 2) Ordenacao crescente pelo preco de lista.
SELECT *
FROM TABELA_DE_PRODUTOS
ORDER BY PRECO_DE_LISTA ASC;

-- 3) Ordenacao decrescente com o mesmo criterio.
SELECT *
FROM TABELA_DE_PRODUTOS
ORDER BY PRECO_DE_LISTA DESC;

-- 4) Ordenacao alfabetica por nome do produto (ASC e padrao).
SELECT *
FROM TABELA_DE_PRODUTOS
ORDER BY NOME_DO_PRODUTO;

-- 5) Ordenacao composta: agrupa por embalagem e, dentro dela, por nome.
SELECT *
FROM TABELA_DE_PRODUTOS
ORDER BY EMBALAGEM,
         NOME_DO_PRODUTO;

-- 6) TOP com ORDER BY: retorna os cinco produtos mais caros.
SELECT TOP 5 *
FROM TABELA_DE_PRODUTOS
ORDER BY PRECO_DE_LISTA DESC;

-- Dicas:
--   * ASC (crescente) e DESC (decrescente) podem ser aplicados coluna a coluna.
--   * ORDER BY e avaliado apos SELECT, entao alias definidos no SELECT podem ser usados aqui.

