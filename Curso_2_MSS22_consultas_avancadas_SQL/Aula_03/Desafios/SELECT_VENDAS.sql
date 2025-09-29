-- Qual foi a maior venda do produto "Linha Refrescante - 1 Litro - Morango/Limao" em quantidade?

SELECT CODIGO_DO_PRODUTO
FROM TABELA_DE_PRODUTOS
WHERE NOME_DO_PRODUTO = 'Linha Refrescante - 1 Litro - Morango/Limao';
-- COD: 1101035

SELECT *
FROM ITENS_NOTAS_FISCAIS 
WHERE CODIGO_DO_PRODUTO = '1101035'
ORDER BY QUANTIDADE DESC;
