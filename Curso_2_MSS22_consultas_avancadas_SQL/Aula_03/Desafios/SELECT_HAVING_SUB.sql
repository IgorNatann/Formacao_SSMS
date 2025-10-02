/*
Documentação: Reescrevendo HAVING com subconsulta derivada
--------------------------------------------------------
1. Consulta original usa HAVING para manter apenas produtos com vendas acima de 394000.
2. Subconsulta derivada encapsula a mesma agregação e expõe um alias de coluna legível.
3. Consulta principal reaplica o filtro na camada externa com WHERE, demonstrando equivalência lógica.
*/

-- 1) Abordagem clássica com HAVING após a agregação.
SELECT
    INF.CODIGO_DO_PRODUTO,
    TP.NOME_DO_PRODUTO,
    SUM(INF.QUANTIDADE) AS QUANTIDADE
FROM ITENS_NOTAS_FISCAIS INF
    INNER JOIN TABELA_DE_PRODUTOS TP
        ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO
HAVING SUM(INF.QUANTIDADE) > 394000
ORDER BY SUM(INF.QUANTIDADE) DESC;

-- 2) Versão com subconsulta derivada recebendo alias `SC` e coluna `QUANTIDADE_TOTAL`.
SELECT SC.CODIGO_DO_PRODUTO, SC.NOME_DO_PRODUTO, SC.QUANTIDADE_TOTAL
FROM (
    SELECT INF.CODIGO_DO_PRODUTO,
           TP.NOME_DO_PRODUTO,
           SUM(INF.QUANTIDADE) AS QUANTIDADE_TOTAL
    FROM ITENS_NOTAS_FISCAIS INF
        INNER JOIN TABELA_DE_PRODUTOS TP
            ON INF.CODIGO_DO_PRODUTO = TP.CODIGO_DO_PRODUTO
    GROUP BY INF.CODIGO_DO_PRODUTO, TP.NOME_DO_PRODUTO
) SC
WHERE SC.QUANTIDADE_TOTAL > 394000
ORDER BY SC.QUANTIDADE_TOTAL DESC;
