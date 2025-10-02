-- =========================================
-- Desafio Aula 02 - Alias para identificador de vendedor
-- Objetivo: reforcar a leitura de colunas renomeadas ao montar relatorios para areas de negocio.
-- Conceitos principais: alias com AS, selecao de colunas de uma unica tabela.
-- =========================================

SELECT
    MATRICULA AS IDENTIFICADOR,
    NOME_VENDEDOR AS [NOME DO VENDEDOR]
FROM TABELA_VENDEDORES;
