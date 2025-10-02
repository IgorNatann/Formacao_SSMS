-- =========================================
-- Aula 02 - Reformulando colunas com alias
-- Objetivo geral: mostrar como renomear campos no resultado para entregar relatorios mais claros.
-- Conceitos principais: SELECT, alias com AS, boas praticas de nomenclatura.
-- =========================================

SELECT
    NOME AS [NOME DO CLIENTE],    -- Alias torna o cabecalho mais amigavel
    CPF,                          -- Mantem o identificador principal sem alias para destacar o formato original
    ESTADO AS [UF]
FROM TABELA_CLIENTES;
