-- =========================================
-- Aula 02 - Selecionando colunas especificas e ordenando resultados
-- Objetivo geral: praticar a escolha de campos e aplicar ORDER BY.
-- Conceitos principais: SELECT com lista de colunas, reordenacao de campos, ORDER BY padrao crescente.
-- =========================================

-- Bloco 1 | Escolher apenas nome e estado.
SELECT NOME, ESTADO
FROM TABELA_CLIENTES;

-- Bloco 2 | Alternar a ordem das colunas no resultado.
SELECT ESTADO, NOME
FROM TABELA_CLIENTES;

-- Bloco 3 | Ordenar o conjunto de clientes pelo nome.
SELECT NOME, ESTADO
FROM TABELA_CLIENTES
ORDER BY NOME;
