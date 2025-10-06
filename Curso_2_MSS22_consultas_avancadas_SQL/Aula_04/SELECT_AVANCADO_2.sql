-- ================================================================
-- Aula 04 | Analise percentual de vendas por sabor
-- Objetivo: calcular quanto cada sabor representa do total vendido em 2015,
-- comparando a soma por sabor com a soma geral anual.
-- ================================================================

-- Consulta principal: ranking de sabores por volume e percentual relativo
-- VS (Vendas por Sabor) agrega o total anual de cada sabor; VA calcula o total geral.
-- A conversao para FLOAT evita truncamento inteiro na divisao e ROUND formata o percentual.
SELECT
    VS.SABOR,
    VS.ANO,
    VS.VENDA_ANO,
    ROUND((CONVERT(FLOAT, VS.VENDA_ANO) / CONVERT(FLOAT, VA.VENDA_TOTAL_ANO)) * 100, 2) AS PERCENTUAL
FROM (
    -- VS: soma das vendas por sabor no ano filtrado (2015)
    SELECT
        TP.SABOR,
        YEAR(NF.DATA_VENDA) AS ANO,
        SUM(INF.QUANTIDADE) AS VENDA_ANO
    FROM TABELA_DE_PRODUTOS AS TP
    INNER JOIN ITENS_NOTAS_FISCAIS AS INF
        ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
    INNER JOIN NOTAS_FISCAIS AS NF
        ON INF.NUMERO = NF.NUMERO
    WHERE YEAR(NF.DATA_VENDA) = 2015
    GROUP BY TP.SABOR, YEAR(NF.DATA_VENDA)
) AS VS
INNER JOIN (
    -- VA: total anual de vendas (independente do sabor)
    SELECT
        YEAR(NF.DATA_VENDA) AS ANO,
        SUM(INF.QUANTIDADE) AS VENDA_TOTAL_ANO
    FROM NOTAS_FISCAIS AS NF
    INNER JOIN ITENS_NOTAS_FISCAIS AS INF
        ON NF.NUMERO = INF.NUMERO
    WHERE YEAR(NF.DATA_VENDA) = 2015
    GROUP BY YEAR(NF.DATA_VENDA)
) AS VA
    ON VS.ANO = VA.ANO
ORDER BY VS.VENDA_ANO DESC;
