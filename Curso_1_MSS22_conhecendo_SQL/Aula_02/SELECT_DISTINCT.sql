-- =========================================
-- Aula 02 - Eliminando duplicidades com DISTINCT
-- Objetivo geral: entender quando usar DISTINCT para retornar listas unicas.
-- Conceitos principais: SELECT simples versus SELECT DISTINCT, impacto em agregacoes futuras.
-- =========================================

-- Bloco 1 | Consulta sem DISTINCT.
-- Util para contar quantas vezes cada sabor aparece na tabela em seu formato bruto.
SELECT SABOR
FROM TABELA_PRODUTOS;

-- Bloco 2 | Consulta com DISTINCT.
-- Quando precisamos de uma lista de opcoes sem repeticao, DISTINCT resolve sem precisar de GROUP BY.
SELECT DISTINCT SABOR
FROM TABELA_PRODUTOS;
