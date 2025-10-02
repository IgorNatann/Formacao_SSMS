/*
Guia de Bolso: Tipos de Joins
--------------------------------
Objetivo: Demonstrar diferentes variacoes de funcoes de join entre as tabelas TABELA_DE_CLIENTES (TC) e NOTAS_FISCAIS (NF).
Pre-requisitos: Certifique-se de que as tabelas de apoio existam e que os CPFs mantenham integridade entre cadastro e notas.
Leitura rapida: Cada bloco traz uma orientacao curta para replicar ou adaptar em cenarios reais.
*/

-- INNER JOIN: Clientes que possuem notas fiscais registradas (linhas que batem nas duas tabelas)
SELECT
    TC.CPF AS CPF_DO_CADASTRO,
    TC.NOME AS NOME_DO_CLIENTE,
    NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
INNER JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF;

-- INNER JOIN + DISTINCT: Remove duplicidades quando um cliente possui varias notas fiscais
SELECT DISTINCT
    TC.CPF AS CPF_DO_CADASTRO,
    TC.NOME AS NOME_DO_CLIENTE,
    NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
INNER JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF;

-- Diagnostico rapido: Quantidade total de clientes na base de origem
SELECT COUNT(*) FROM TABELA_DE_CLIENTES;

-- Exemplo de preparacao: Insercao de cliente para testar diferencas entre INNER e LEFT JOIN
INSERT INTO TABELA_DE_CLIENTES
(CPF, NOME, ENDERECO_1, ENDERECO_2,
BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO,
LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA)
VALUES
('23412632331', 'Juliana Silva', 'Rua Tramandai', ' ', 'Bangu', 'Rio de Janeiro', 'RJ', '23400000', '1989-02-04', 33, 'F', '180000', '24500', 0);

-- LEFT JOIN: Todos os clientes com informacoes de notas quando existirem (mantem quem nao possui nota)
SELECT DISTINCT
    TC.CPF AS CPF_DO_CADASTRO,
    TC.NOME AS NOME_DO_CLIENTE,
    NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
LEFT JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF;

-- LEFT JOIN + filtro de NULL: Identifica clientes sem notas fiscais associadas
SELECT DISTINCT
    TC.CPF AS CPF_DO_CADASTRO,
    TC.NOME AS NOME_DO_CLIENTE,
    NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
LEFT JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF
WHERE NF.CPF IS NULL;
