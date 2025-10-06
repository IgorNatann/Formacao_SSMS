-- ================================================================
-- Desafio 1 | Aula 03 Conversoes e Formatacao
-- Objetivo: montar frases personalizadas com o nome do cliente, o valor total
-- comprado e o ano da compra, formatando o numero como texto com duas casas.
-- ================================================================

-- Passo unico: gerar frase completa sobre as compras de 2016
-- STR converte o valor numerico em string com duas casas, TRIM remove espacos
-- extras, CONCAT organiza o texto final. O grupo soma QUANTIDADE * PRECO por cliente.
SELECT
    TC.NOME,
    CONCAT(
        'O cliente ', TC.NOME,
        ' comprou R$ ', TRIM(STR(SUM(IT.QUANTIDADE * IT.PRECO), 10, 2)),
        ' no ano de ', YEAR(NF.DATA_VENDA), '.'
    ) AS VALOR
FROM NOTAS_FISCAIS AS NF
INNER JOIN ITENS_NOTAS_FISCAIS AS IT
    ON NF.NUMERO = IT.NUMERO
INNER JOIN TABELA_DE_CLIENTES AS TC
    ON NF.CPF = TC.CPF
WHERE YEAR(NF.DATA_VENDA) = 2016
GROUP BY TC.NOME, YEAR(NF.DATA_VENDA);
