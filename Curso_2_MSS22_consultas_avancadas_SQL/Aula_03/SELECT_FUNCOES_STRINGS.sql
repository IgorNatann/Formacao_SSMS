-- ================================================================
-- Aula 03 | Funcoes de Strings no SQL Server
-- Objetivo geral: demonstrar funcoes e tecnicas de manipulacao de texto
-- aplicadas as tabelas TABELA_DE_CLIENTES e TABELA_DE_PRODUTOS.
-- ================================================================

-- Secao 1: conferindo a tabela antes de transformar textos
-- Dica: visualize toda a tabela para conhecer as colunas disponiveis.
SELECT * FROM TABELA_DE_CLIENTES;

-- Secao 2: padronizando caixa de texto
-- LOWER converte os caracteres para minusculas, ideal para normalizar nomes.
SELECT
    NOME,
    LOWER(NOME) AS NOME_MINUSCULO
FROM TABELA_DE_CLIENTES;

-- Secao 3: comparando versoes minusculas e maiusculas
-- UPPER gera a forma em maiusculas; aqui retornamos ambas para comparacao.
SELECT
    NOME,
    LOWER(NOME) AS NOME_MINUSCULO,
    UPPER(NOME) AS NOME_MAIUSCULO
FROM TABELA_DE_CLIENTES;

-- Secao 4: concatenando campos com CONCAT
-- CONCAT ignora valores NULL e facilita unir partes de endereco em um unico texto.
SELECT
    NOME,
    CONCAT(ENDERECO_1, ' ', BAIRRO, ' ', CIDADE, ' ', ESTADO) AS ENDERECO_COMPLETO
FROM TABELA_DE_CLIENTES;

-- Secao 5: concatenando com o operador +
-- O simbolo + tambem concatena strings no SQL Server; adicionamos espacos manualmente e um espaco final para evitar juntura de palavras.
SELECT
    NOME,
    ENDERECO_1 + ' ' + BAIRRO + ' ' + CIDADE + ' ' + ESTADO + ' ' AS ENDERECO_COMPLETO
FROM TABELA_DE_CLIENTES;

-- Secao 6: extraindo porcoes do texto
-- LEFT retorna os N caracteres iniciais; util para siglas ou prefixos.
SELECT
    NOME_DO_PRODUTO,
    LEFT(NOME_DO_PRODUTO, 3) AS PRIMEIROS_TRES_CARACTERES
FROM 
    TABELA_DE_PRODUTOS;

-- Secao 7: substituindo partes de uma string
-- REPLACE substitui qualquer ocorrencia de "Litros" por "L" para abreviar o texto.
SELECT
    TAMANHO,
    REPLACE(TAMANHO, 'Litros', 'L') AS TAMANHO_MODIFICADO
FROM
    TABELA_DE_PRODUTOS;

-- Secao 8: multiplos REPLACE em cadeia
-- Encadeamos REPLACE para cobrir singular e plural ("Litro" e "Litros").
SELECT
    TAMANHO,
    REPLACE(REPLACE(TAMANHO, 'Litros', 'L'), 'Litro', 'L') AS TAMANHO_MODIFICADO
FROM
    TABELA_DE_PRODUTOS;
