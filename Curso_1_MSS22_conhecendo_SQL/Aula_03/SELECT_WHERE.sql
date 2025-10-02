-- =========================================
-- Aula 03 - Filtro basico com WHERE
-- Objetivo geral: selecionar clientes que ja realizaram a primeira compra.
-- Conceitos principais: alias para nomes de colunas, comparacao com valor numerico.
-- =========================================

SELECT
    NOME AS [NOME DO CLIENTE],
    ESTADO AS UF,
    PRIMEIRA_COMPRA
FROM TABELA_CLIENTES
WHERE PRIMEIRA_COMPRA = 1;     -- Filtra apenas clientes que ja realizaram a primeira compra
