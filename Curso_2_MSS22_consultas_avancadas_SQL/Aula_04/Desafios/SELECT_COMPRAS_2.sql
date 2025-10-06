-- Durante a aula sobre vendas por sabor trabalhamos alguns assuntos e entre eles havia a presença de um relatório.

-- Agora, a ideia é focar neste relatório novamente, porém que você modifique o relatório tendo como objetivo ver o ranking das vendas por tamanho.

SELECT
    VS.TAMANHO,
    VS.ANO,
    VS.VENDA_ANO,
    ROUND((CONVERT(FLOAT, VS.VENDA_ANO) / CONVERT(FLOAT, VA.VENDA_TOTAL_ANO)) * 100, 2) AS PERCENTUAL
FROM (
    -- VS: soma das vendas por sabor no ano filtrado (2015)
    SELECT
        TP.TAMANHO,
        YEAR(NF.DATA_VENDA) AS ANO,
        SUM(INF.QUANTIDADE) AS VENDA_ANO
    FROM TABELA_DE_PRODUTOS AS TP
    INNER JOIN ITENS_NOTAS_FISCAIS AS INF
        ON TP.CODIGO_DO_PRODUTO = INF.CODIGO_DO_PRODUTO
    INNER JOIN NOTAS_FISCAIS AS NF
        ON INF.NUMERO = NF.NUMERO
    WHERE YEAR(NF.DATA_VENDA) = 2015
    GROUP BY TP.TAMANHO, YEAR(NF.DATA_VENDA)
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
