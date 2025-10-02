-- ============================================================================
-- GUIA DE REFERÊNCIA: SELECT com HAVING
-- ============================================================================
-- Tópico: Diferença entre WHERE e HAVING em consultas com agregação
-- Objetivo: Demonstrar quando e como usar filtros antes e depois do GROUP BY
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. CONSULTA BÁSICA - Visualizar todos os registros
-- ----------------------------------------------------------------------------
-- Retorna todos os clientes da tabela sem aplicar filtros ou agrupamentos
SELECT
    *
FROM
    [TABELA_DE_CLIENTES];

-- ----------------------------------------------------------------------------
-- 2. AGRUPAMENTO SIMPLES - Soma de crédito por estado
-- ----------------------------------------------------------------------------
-- Agrupa clientes por estado e calcula o limite de crédito total de cada um
-- GROUP BY: Agrupa registros que têm o mesmo valor na coluna ESTADO
-- SUM: Função de agregação que soma os valores do limite de crédito
SELECT
    ESTADO,
    SUM(LIMITE_DE_CREDITO) AS CREDITO 
FROM
    TABELA_DE_CLIENTES
GROUP BY
    ESTADO;

-- ----------------------------------------------------------------------------
-- 3. ❌ ERRO COMUM - Tentativa de usar agregação no WHERE
-- ----------------------------------------------------------------------------
-- IMPORTANTE: Este código NÃO funciona e gerará erro!
-- MOTIVO: WHERE é executado ANTES do GROUP BY, então as funções de agregação
-- ainda não foram calculadas neste momento
-- REGRA: WHERE filtra registros individuais, não pode usar SUM, AVG, MAX, etc.
SELECT 
    ESTADO,
    SUM(LIMITE_DE_CREDITO) AS CREDITO 
FROM
    TABELA_DE_CLIENTES 
WHERE
    SUM(LIMITE_DE_CREDITO) >= 900000  -- ❌ ERRO: Não é possível usar agregação aqui
GROUP BY
    ESTADO;

-- ----------------------------------------------------------------------------
-- 4. ✅ SOLUÇÃO CORRETA - Usando HAVING para filtrar agregações
-- ----------------------------------------------------------------------------
-- HAVING: Cláusula que filtra resultados APÓS o agrupamento
-- É aplicado DEPOIS que o GROUP BY e as funções de agregação são processados
-- Retorna apenas estados onde a soma total do crédito é >= 900.000
SELECT
    ESTADO,
    SUM(LIMITE_DE_CREDITO) AS CREDITO 
FROM
    TABELA_DE_CLIENTES
GROUP BY
    ESTADO 
HAVING
    SUM(LIMITE_DE_CREDITO) >= 900000;

-- ----------------------------------------------------------------------------
-- 5. AGREGAÇÕES MÚLTIPLAS - Máximo e Mínimo por grupo
-- ----------------------------------------------------------------------------
-- Agrupa produtos por tipo de embalagem
-- MAX: Retorna o maior preço de lista dentro de cada grupo
-- MIN: Retorna o menor preço de lista dentro de cada grupo
-- Útil para análise de faixa de preços por categoria
SELECT
    EMBALAGEM,
    MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO,
    MIN(PRECO_DE_LISTA) AS PRECO_MINIMO
FROM
    TABELA_DE_PRODUTOS
GROUP BY
    EMBALAGEM;

-- ----------------------------------------------------------------------------
-- 6. FILTRANDO ANTES DO AGRUPAMENTO - WHERE com dados individuais
-- ----------------------------------------------------------------------------
-- WHERE PRECO_DE_LISTA >= 10: Filtra produtos ANTES de agrupar
-- Apenas produtos com preço >= 10 são considerados no agrupamento
-- Depois calcula MAX e MIN apenas desses produtos filtrados
SELECT
    EMBALAGEM,
    MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO,
    MIN(PRECO_DE_LISTA) AS PRECO_MINIMO
FROM
    TABELA_DE_PRODUTOS
WHERE
    PRECO_DE_LISTA >= 10  -- Filtro ANTES da agregação
GROUP BY
    EMBALAGEM;

-- ----------------------------------------------------------------------------
-- 7. COMBINANDO WHERE E HAVING - Filtros em dois níveis
-- ----------------------------------------------------------------------------
-- ORDEM DE EXECUÇÃO:
-- 1º) WHERE: Filtra produtos individuais (preço >= 10)
-- 2º) GROUP BY: Agrupa os produtos filtrados por embalagem
-- 3º) Calcula MAX e MIN para cada grupo
-- 4º) HAVING: Filtra os grupos (mantém apenas embalagens com preço máximo >= 20)
--
-- RESUMO: Filtra produtos baratos e depois elimina embalagens que não têm produtos caros
SELECT
    EMBALAGEM,
    MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO,
    MIN(PRECO_DE_LISTA) AS PRECO_MINIMO
FROM
    TABELA_DE_PRODUTOS
WHERE
    PRECO_DE_LISTA >= 10      -- Filtro de REGISTROS individuais
GROUP BY
    EMBALAGEM
HAVING
    MAX(PRECO_DE_LISTA) >= 20; -- Filtro de GRUPOS após agregação

-- ============================================================================
-- RESUMO E BOAS PRÁTICAS
-- ============================================================================
--
-- 📌 QUANDO USAR WHERE:
-- - Para filtrar registros individuais ANTES do agrupamento
-- - Trabalha com colunas normais (não agregadas)
-- - Melhora performance ao reduzir dados antes da agregação
-- - Exemplo: WHERE preco > 100, WHERE categoria = 'A'
--
-- 📌 QUANDO USAR HAVING:
-- - Para filtrar grupos DEPOIS do agrupamento
-- - Trabalha com funções de agregação (SUM, AVG, COUNT, MAX, MIN)
-- - Aplicado após GROUP BY processar os dados
-- - Exemplo: HAVING SUM(valor) > 1000, HAVING COUNT(*) > 5
--
-- 📌 ORDEM DE EXECUÇÃO SQL:
-- FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY
--
-- 📌 PODE COMBINAR AMBOS:
-- WHERE filtra antes → GROUP BY agrupa → HAVING filtra depois
-- Isso permite controle fino sobre quais dados incluir e quais grupos manter
--
-- ============================================================================
