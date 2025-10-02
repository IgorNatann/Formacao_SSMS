-- =========================================
-- Desafios Aula 03 - Consolidando filtros
-- Proposta: responder tres perguntas de negocio usando comparacoes numericas e condicionais.
-- Conceitos principais: operadores relacionais, AND/OR, ordenacoes para leitura do resultado.
-- =========================================

/*
1 - Liste os vendedores com comissao menor ou igual a 8%.
2 - Liste os produtos que custam menos de 6 reais e estao disponiveis em lata.
3 - Mostre os clientes que nao sao de Sao Paulo nem do Rio de Janeiro.
*/

-- Desafio 1 | Vendedores com comissao ate 8%.
SELECT MATRICULA, NOME_VENDEDOR, PERCENTUAL_COMISSAO
FROM TABELA_VENDEDORES
WHERE PERCENTUAL_COMISSAO <= 8
ORDER BY PERCENTUAL_COMISSAO;

-- Desafio 2 | Produtos baratos vendidos em lata.
SELECT NOME_PRODUTO, PRECO_LISTA, EMBALAGEM, SABOR
FROM TABELA_PRODUTOS
WHERE PRECO_LISTA < 6 AND EMBALAGEM = 'Lata'
ORDER BY PRECO_LISTA;

-- Desafio 3 | Clientes fora de SP e RJ.
SELECT NOME, ESTADO, BAIRRO
FROM TABELA_CLIENTES
WHERE ESTADO <> 'SP' AND ESTADO <> 'RJ'
ORDER BY ESTADO, BAIRRO;
