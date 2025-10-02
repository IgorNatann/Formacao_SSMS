-- =========================================
-- Aula 03 - Combinando filtros com OR e AND
-- Objetivo geral: mostrar como combinar condicoes para extrair subconjuntos especificos.
-- Conceitos principais: clausulas WHERE com OR e AND, ordenacao.
-- =========================================

-- Bloco 1 | Clientes em bairros Copacabana ou Tijuca.
SELECT NOME, BAIRRO
FROM TABELA_CLIENTES
WHERE BAIRRO = 'Copacabana' OR BAIRRO = 'Tijuca'
ORDER BY BAIRRO;

-- Bloco 2 | Clientes de Sao Paulo que ja fizeram a primeira compra.
SELECT NOME, ESTADO, PRIMEIRA_COMPRA
FROM TABELA_CLIENTES
WHERE PRIMEIRA_COMPRA = 1 AND ESTADO = 'SP'
ORDER BY NOME;
