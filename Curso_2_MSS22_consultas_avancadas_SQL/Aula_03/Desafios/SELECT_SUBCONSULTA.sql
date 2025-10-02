/*
Documentação: Subconsulta para filtrar sabores por volume vendido
---------------------------------------------------------------
1. Construímos uma subconsulta que reúne códigos de produto com soma de quantidade superior a 394000.
2. A subconsulta utiliza INNER JOIN para trazer o nome do produto como apoio analítico e agrupa por código.
3. A consulta principal usa o resultado dessa subconsulta dentro de um filtro IN para listar sabores distintos.
*/

-- 1) Subconsulta: identifica produtos com vendas totais acima do corte definido.
SELECT INF.CODIGO_DO_PRODUTO
FROM ITENS_NOTAS_FISCAIS INF
    INNER JOIN TABELA_DE_PRODUTOS TP
        ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO
HAVING SUM(INF.QUANTIDADE) > 394000;

-- 2) Consulta principal: filtra sabores usando a subconsulta como fonte de códigos válidos.
SELECT DISTINCT SABOR
FROM TABELA_DE_PRODUTOS
WHERE CODIGO_DO_PRODUTO IN (
    SELECT INF.CODIGO_DO_PRODUTO
    FROM ITENS_NOTAS_FISCAIS INF
        INNER JOIN TABELA_DE_PRODUTOS TP
            ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
    GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO
    HAVING SUM(INF.QUANTIDADE) > 394000
);


