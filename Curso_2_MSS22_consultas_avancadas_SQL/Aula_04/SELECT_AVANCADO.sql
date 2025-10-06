-- ================================================================
-- Aula 04 | Construindo consultas avancadas passo a passo
-- Objetivo: partir da exploracao de notas fiscais ate chegar em um painel
-- comparando volume contratado e volume vendido por mes/ano por cliente.
-- ================================================================

-- Etapa 1: explorar as vendas com seus itens
-- Join basico mostra CPF, data da venda e quantidade de cada item vendido.
SELECT
    NF.CPF,
    NF.DATA_VENDA,
    INF.QUANTIDADE
FROM NOTAS_FISCAIS AS NF
INNER JOIN ITENS_NOTAS_FISCAIS AS INF
    ON NF.NUMERO = INF.NUMERO;

-- Etapa 2: preparar o recorte temporal por mes
-- CONVERT transforma DATA_VENDA em "YYYY-MM" (estilo 120) para agrupar depois.
SELECT
    NF.CPF,
    CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO,
    INF.QUANTIDADE
FROM NOTAS_FISCAIS AS NF
INNER JOIN ITENS_NOTAS_FISCAIS AS INF
    ON NF.NUMERO = INF.NUMERO;

-- Etapa 3: tentativa de soma sem agrupar
-- Demonstra como o SQL exige GROUP BY quando ha agregacao, servindo de alerta.
SELECT
    NF.CPF,
    CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO,
    SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL
FROM NOTAS_FISCAIS AS NF
INNER JOIN ITENS_NOTAS_FISCAIS AS INF
    ON NF.NUMERO = INF.NUMERO;

-- Etapa 4: soma consolidada com GROUP BY correto
-- Agora a agregacao funciona, entregando quantidade total por CPF e mes.
SELECT
    NF.CPF,
    CONVERT(VARCHAR(7), NF.DATA_VENDA, 120) AS MES_ANO,
    SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL
FROM NOTAS_FISCAIS AS NF
INNER JOIN ITENS_NOTAS_FISCAIS AS INF
    ON NF.NUMERO = INF.NUMERO
GROUP BY
    NF.CPF,
    CONVERT(VARCHAR(7), NF.DATA_VENDA, 120);

-- Etapa 5: lembrar da necessidade de cruzar com os limites do cliente
-- Esboco proposital que antecipa o proximo join com TABELA_DE_CLIENTES.
-- SELECT ... FROM TABELA_DE_CLIENTES ...

-- Etapa 6: resultado final validando limites
-- Subconsulta (TV) agrega vendas por mes. O CASE compara com VOLUME_DE_COMPRA
-- e rotula a linha como valida ou invalida conforme o excedente.
SELECT
    TC.CPF,
    TC.NOME,
    TC.VOLUME_DE_COMPRA,
    TV.MES_ANO,
    TV.QUANTIDADE_TOTAL,
    CASE
        WHEN TC.VOLUME_DE_COMPRA >= TV.QUANTIDADE_TOTAL THEN 'VENDAS VALIDAS'
        ELSE 'VENDAS INVALIDAS'
    END AS RESULTADO
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
WHERE TV.MES_ANO = '2015-01';
