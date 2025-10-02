-- =========================================
-- Aula 03 - Trabalhando com filtros de data
-- Objetivo geral: comparar filtros diretos por data e por componentes (ano, mes, dia).
-- Conceitos principais: WHERE com datas, funcao YEAR, ordenacao por data.
-- =========================================

-- Bloco 1 | Filtro direto usando comparacao de datas.
-- Lista clientes nascidos a partir de 1996 (maiores que 1995-12-31).
SELECT NOME AS [NOME DO CLIENTE],
       DATA_NASCIMENTO AS [DATA DE NASCIMENTO]
FROM TABELA_CLIENTES
WHERE DATA_NASCIMENTO > '1995-12-31'
ORDER BY DATA_NASCIMENTO;

-- Bloco 2 | Filtro extraindo apenas o ano para a mesma logica.
-- YEAR ajuda quando queremos comparar somente componente especifico da data.
SELECT NOME AS [NOME DO CLIENTE],
       DATA_NASCIMENTO AS [DATA DE NASCIMENTO]
FROM TABELA_CLIENTES
WHERE YEAR(DATA_NASCIMENTO) > 1995   -- Substitua por MONTH ou DAY para outros recortes
ORDER BY DATA_NASCIMENTO;
