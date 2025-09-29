/*
Tendo em conta nossa tabela de produtos, execute uma consulta para obter o número de sabores distintos. Especifique o SQL que você executou para obter o resultado e a resposta propriamente dita.
*/

SELECT COUNT(DISTINCT SABOR) AS NUMERO_DE_SABORES_DISTINTOS
FROM TABELA_DE_PRODUTOS;

SELECT DISTINCT SABOR
FROM TABELA_DE_PRODUTOS;