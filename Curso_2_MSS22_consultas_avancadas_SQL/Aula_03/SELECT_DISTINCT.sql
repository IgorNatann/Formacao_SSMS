-- Aula 03 - SELECT DISTINCT
-- Objetivo: reforcar o uso de DISTINCT para eliminar duplicidades em consultas SQL.
-- Estrutura do estudo:
--   1. Revisao do SELECT basico retornando todas as colunas.
--   2. Projecao de uma unica coluna para observar valores repetidos.
--   3. Uso de DISTINCT para remover duplicidades.
--   4. Combinacao de DISTINCT com clausulas de filtragem.
--   5. DISTINCT aplicado a mais de uma coluna.

-- 1) Revisao: lista todos os produtos e suas colunas.
SELECT *
FROM TABELA_DE_PRODUTOS;

-- 2) Projecao simples: exibe apenas a coluna EMBALAGEM, possivelmente com repeticoes.
SELECT EMBALAGEM
FROM TABELA_DE_PRODUTOS;

-- 3) DISTINCT basico: retorna os tipos de embalagem sem duplicidades.
SELECT DISTINCT EMBALAGEM
FROM TABELA_DE_PRODUTOS;

-- 4) DISTINCT com filtro: mostra embalagens unicas apenas para o sabor Maca.
SELECT DISTINCT EMBALAGEM
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Maca';

-- 5) DISTINCT com multiplas colunas: combinacoes unicas de embalagem e sabor.
SELECT DISTINCT EMBALAGEM, SABOR
FROM TABELA_DE_PRODUTOS;
