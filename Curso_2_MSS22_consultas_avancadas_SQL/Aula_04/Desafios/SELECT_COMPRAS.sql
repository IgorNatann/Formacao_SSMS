-- ================================================================
-- Desafio | Aula 04 Compras x Limite
-- Objetivo: listar clientes com vendas acima do limite contratado, calcular
-- o percentual de excesso e formatar o resultado em etapas progressivas.
-- ================================================================

-- Passo 1: identificar clientes com vendas invalidas no mes alvo
-- Filtra apenas 2015-01 e limita aos casos em que QUANTIDADE_TOTAL ultrapassa o volume contratado.
SELECT
    TC.CPF,
    TC.NOME,
    TC.VOLUME_DE_COMPRA,
    TV.MES_ANO,
    TV.QUANTIDADE_TOTAL,
    CASE WHEN TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL THEN 'VENDAS VALIDAS'
         ELSE 'VENDAS INVALIDAS' END AS RESULTADO
FROM TABELA_DE_CLIENTES AS TC
INNER JOIN (
    SELECT
        NF.CPF,
        CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO,
        SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL
    FROM NOTAS_FISCAIS AS NF
    INNER JOIN ITENS_NOTAS_FISCAIS AS INF
        ON NF.NUMERO = INF.NUMERO
    GROUP BY NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)
) AS TV
    ON TV.CPF = TC.CPF
WHERE TV.MES_ANO = '2015-01'
  AND (TC.VOLUME_DE_COMPRA - TV.QUANTIDADE_TOTAL) < 0;

-- Passo 2: calcular percentual excedente sem arredondamento
-- Percentual = 1 - (limite / vendido). Multiplicamos por 100 para obter porcentagem.
SELECT
    TC.CPF,
    TC.NOME,
    TC.VOLUME_DE_COMPRA,
    TV.MES_ANO,
    TV.QUANTIDADE_TOTAL,
    CASE WHEN TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL THEN 'VENDAS VALIDAS'
         ELSE 'VENDAS INVALIDAS' END AS RESULTADO,
    (1 - (TC.VOLUME_DE_COMPRA / TV.QUANTIDADE_TOTAL)) * 100 AS PERCENTUAL
FROM TABELA_DE_CLIENTES AS TC
INNER JOIN (
    SELECT
        NF.CPF,
        CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO,
        SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL
    FROM NOTAS_FISCAIS AS NF
    INNER JOIN ITENS_NOTAS_FISCAIS AS INF
        ON NF.NUMERO = INF.NUMERO
    GROUP BY NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)
) AS TV
    ON TV.CPF = TC.CPF
WHERE TV.MES_ANO = '2015-01'
  AND (TC.VOLUME_DE_COMPRA - TV.QUANTIDADE_TOTAL) < 0;

-- Passo 3: percentual arredondado com duas casas decimais
-- ROUND polida o numero final deixando a apresentacao pronta para relatorios.
-- Removemos o filtro de mes para analisar todos os periodos automaticamente.
SELECT
    TC.CPF,
    TC.NOME,
    TC.VOLUME_DE_COMPRA,
    TV.MES_ANO,
    TV.QUANTIDADE_TOTAL,
    CASE WHEN TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL THEN 'VENDAS VALIDAS'
         ELSE 'VENDAS INVALIDAS' END AS RESULTADO,
    ROUND((1 - (TC.VOLUME_DE_COMPRA / TV.QUANTIDADE_TOTAL)) * 100, 2) AS PERCENTUAL
FROM TABELA_DE_CLIENTES AS TC
INNER JOIN (
    SELECT
        NF.CPF,
        CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO,
        SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL
    FROM NOTAS_FISCAIS AS NF
    INNER JOIN ITENS_NOTAS_FISCAIS AS INF
        ON NF.NUMERO = INF.NUMERO
    GROUP BY NF.CPF, CONVERT(VARCHAR(7), NF.DATA_VENDA, 120)
) AS TV
    ON TV.CPF = TC.CPF
WHERE (TC.VOLUME_DE_COMPRA - TV.QUANTIDADE_TOTAL) < 0;
