-- ================================================================
-- Desafio 1 | Aula 03 Funcoes de Strings
-- Objetivo: extrair o primeiro nome de cada cliente utilizando funcoes
-- de texto do SQL Server, em especial CHARINDEX e SUBSTRING.
-- ================================================================

-- Passo 1: revisar os dados da tabela de clientes
-- Importante entender a estrutura antes de aplicar funcoes de texto.
SELECT
    *
FROM
    TABELA_DE_CLIENTES;

-- Passo 2: localizar a primeira ocorrencia de espaco em cada nome
-- CHARINDEX retorna a posicao do caractere buscado; aqui encontramos
-- onde o sobrenome comeca para usar esse numero como limite de corte.
SELECT
    NOME,
    CHARINDEX(' ', NOME, 1) AS POSICAO_ESPACO
FROM
    TABELA_DE_CLIENTES;

-- Passo 3: extrair apenas o primeiro nome
-- SUBSTRING pega parte da string iniciando na posicao informada. Ao somar
-- um espaco a NOME garantimos que mesmo nomes sem sobrenome tenham retorno.
SELECT
    SUBSTRING(NOME, 1, CHARINDEX(' ', NOME + ' ') - 1) AS PRIMEIRO_NOME
FROM
    TABELA_DE_CLIENTES;
