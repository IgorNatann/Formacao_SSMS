/*
Desafios - Aula 03
1 - Liste os vendedores que possuem comissão menor ou igual a 8%.

2 - Liste os produtos que custam menos de 6 reais e estão disponíveis em lata.

3 - Mostre todos os clientes que não são de São Paulo nem do Rio de Janeiro.
*/

--1 - Liste os vendedores que possuem comissão menor ou igual a 8%.
SELECT
 [MATRICULA], [NOME_VENDEDOR], [PERCENTUAL_COMISSAO]
FROM
 [TABELA_VENDEDORES]
WHERE
 [PERCENTUAL_COMISSAO] <= 8
ORDER BY
 [PERCENTUAL_COMISSAO];

-- 2 - Liste os produtos que custam menos de 6 reais e estão disponíveis em lata.
SELECT
    [NOME_PRODUTO], [PRECO_LISTA], [EMBALAGEM], [SABOR]
FROM
    [TABELA_PRODUTOS]
WHERE
    [PRECO_LISTA] < 6 AND [EMBALAGEM] = 'Lata'
ORDER BY
    [PRECO_LISTA];

-- 3 - Mostre todos os clientes que não são de São Paulo nem do Rio de Janeiro.
SELECT
    [NOME], [ESTADO], [BAIRRO]
FROM 
    [TABELA_CLIENTES]
WHERE
    [ESTADO] <> 'SP' AND [ESTADO] <> 'RJ'
ORDER BY
    [ESTADO], [BAIRRO];