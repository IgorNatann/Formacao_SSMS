-- 1. Vamos voltar aos itens das notas fiscais. Os dois exercícios anteriores olharam as vendas do produto '1101035' . Mas nossa empresa vendeu mais produtos. Verifique as quantidades totais de vendas de cada produto e ordene do maior para o menor.

SELECT
    CODIGO_DO_PRODUTO,
    SUM(QUANTIDADE) AS QUANTIDADE
FROM
    ITENS_NOTAS_FISCAIS 
GROUP BY
    CODIGO_DO_PRODUTO 
ORDER BY
    SUM(QUANTIDADE) DESC;

-- 2. Vimos os produtos mais vendidos no exercício anterior. Agora, liste somente os produtos que venderam mais que 394000 unidades.


SELECT
    CODIGO_DO_PRODUTO,
    SUM(QUANTIDADE) AS QUANTIDADE
FROM
    ITENS_NOTAS_FISCAIS 
GROUP BY
    CODIGO_DO_PRODUTO 
HAVING
    SUM(QUANTIDADE) > 394000
ORDER BY
    SUM(QUANTIDADE) DESC;
