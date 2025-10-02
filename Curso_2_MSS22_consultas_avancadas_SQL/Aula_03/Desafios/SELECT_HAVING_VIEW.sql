/*
Documentação: Encapsulando agregação em view para reutilização
--------------------------------------------------------------
1. Consulta base com HAVING demonstra o critério de volume mínimo por produto.
2. Criamos a view `VENDA_TOTAL_POR_PRODUTO` para materializar a agregação e manter o filtro de 394000.
3. Consultas posteriores consomem a view, permitindo ordenações e filtros adicionais sem repetir a lógica.
*/

-- 1) Consulta original com HAVING para produtos com vendas totais acima de 394000.
SELECT INF.CODIGO_DO_PRODUTO,
       TP.NOME_DO_PRODUTO,
       SUM(INF.QUANTIDADE) AS QUANTIDADE
FROM ITENS_NOTAS_FISCAIS INF
    INNER JOIN TABELA_DE_PRODUTOS TP
        ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO
HAVING SUM(INF.QUANTIDADE) > 394000
ORDER BY SUM(INF.QUANTIDADE) DESC;

-- 2) View encapsula a agregação e o corte mínimo, permitindo reuso.
CREATE VIEW VENDA_TOTAL_POR_PRODUTO AS
    SELECT INF.CODIGO_DO_PRODUTO,
           TP.NOME_DO_PRODUTO,
           SUM(INF.QUANTIDADE) AS QUANTIDADE
    FROM ITENS_NOTAS_FISCAIS INF
        INNER JOIN TABELA_DE_PRODUTOS TP
            ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
    GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO
    HAVING SUM(INF.QUANTIDADE) > 394000;

-- 3) Consultas sobre a view evitam duplicação de lógica e aceitam filtros adicionais.
SELECT * FROM VENDA_TOTAL_POR_PRODUTO;

SELECT *
FROM VENDA_TOTAL_POR_PRODUTO
WHERE QUANTIDADE > 500;
