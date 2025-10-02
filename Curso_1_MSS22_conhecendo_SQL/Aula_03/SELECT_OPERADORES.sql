-- =========================================
-- Aula 03 - Comparando valores com operadores
-- Objetivo geral: praticar operadores =, >, <= e comparar texto.
-- Conceitos principais: WHERE com numericos, ordenacao por preco, comparacao alfabetica de strings.
-- =========================================

-- Bloco 1 | Produtos com preco exato.
SELECT *
FROM TABELA_PRODUTOS
WHERE PRECO_LISTA = 7.00;

-- Bloco 2 | Produtos com preco acima de 7 reais.
SELECT *
FROM TABELA_PRODUTOS
WHERE PRECO_LISTA > 7.00
ORDER BY PRECO_LISTA;

-- Bloco 3 | Produtos com preco ate 7 reais.
SELECT *
FROM TABELA_PRODUTOS
WHERE PRECO_LISTA <= 7.00
ORDER BY PRECO_LISTA;

-- Bloco 4 | Comparando texto alfabeticamente.
SELECT *
FROM TABELA_PRODUTOS
WHERE EMBALAGEM > 'Lata';
