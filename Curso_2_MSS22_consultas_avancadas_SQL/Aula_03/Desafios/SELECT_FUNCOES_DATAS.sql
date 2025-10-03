-- ================================================================
-- Desafio 1 | Aula 03 Funcoes de Datas
-- Objetivo: exibir o nome do cliente acompanhado da data de nascimento
-- escrita por extenso (dia, mes, ano e dia da semana) usando DATENAME.
-- ================================================================

-- Passo unico: montar a data por extenso para cada cliente
-- DATENAME retorna o nome textual de cada parte da data. A funcao CONCAT
-- junta as partes com conectivos para formar uma frase completa.
SELECT
    NOME,
    CONCAT(
        DATENAME(DAY, DATA_DE_NASCIMENTO), ' de ',
        DATENAME(MONTH, DATA_DE_NASCIMENTO), ' de ',
        DATENAME(YEAR, DATA_DE_NASCIMENTO),
        ' (', DATENAME(WEEKDAY, DATA_DE_NASCIMENTO), ')'
    ) AS DATA_NASCIMENTO_EXTENSO
FROM TABELA_DE_CLIENTES;
