/*
Guia de Bolso: INNER JOIN x LEFT JOIN
------------------------------------
Objetivo: Comparar o cruzamento entre TABELA_DE_CLIENTES (TC) e NOTAS_FISCAIS (NF) para identificar relacionamentos por CPF.
Definicoes rapidas:
- INNER JOIN: retorna somente linhas que encontram correspondencia nas duas tabelas (intersecao).
- LEFT JOIN: retorna todas as linhas da tabela da esquerda (TC) e dados correspondentes da direita (NF) quando existirem.
- DISTINCT: opcional para eliminar duplicidades geradas por relacionamentos 1:N.
Regras essenciais:
1. Sempre defina a condicao de relacionamento no `ON` (ex.: TC.CPF = NF.CPF).
2. Prefira alias em colunas/joins para clareza e manutencao.
3. Para localizar linhas "sem correspondencia" apos LEFT JOIN, filtre colunas da tabela direita com `IS NULL`.
Como usar este roteiro:
- Siga a numeracao para comparar o comportamento dos joins.
- Execute apenas os blocos necessarios para o diagnostico desejado.
- Adapte colunas selecionadas e filtros conforme o contexto do seu banco.
*/

-- [1] Diagnostico rapido: quantidade total de clientes cadastrados
SELECT COUNT(*) AS TOTAL_CLIENTES
FROM TABELA_DE_CLIENTES;

-- [2] Preparacao opcional: adiciona cliente sem nota para evidenciar diferenca entre INNER e LEFT JOIN
-- Remova ou adapte se o CPF ja existir na base.
INSERT INTO TABELA_DE_CLIENTES
(CPF, NOME, ENDERECO_1, ENDERECO_2,
BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, GENERO,
LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA)
VALUES
('23412632331', 'Juliana Silva', 'Rua Tramandai', ' ', 'Bangu', 'Rio de Janeiro', 'RJ', '23400000', '1989-02-04', 33, 'F', '180000', '24500', 0);

-- [3] INNER JOIN: lista apenas clientes que possuem nota fiscal associada
SELECT
    TC.CPF AS CPF_DO_CADASTRO,
    TC.NOME AS NOME_DO_CLIENTE,
    NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
INNER JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF;

-- [4] INNER JOIN + DISTINCT: elimina duplicidades quando um cliente possui varias notas
SELECT DISTINCT
    TC.CPF AS CPF_DO_CADASTRO,
    TC.NOME AS NOME_DO_CLIENTE,
    NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
INNER JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF;

-- [5] LEFT JOIN: retorna todos os clientes e notas quando existirem
SELECT
    TC.CPF AS CPF_DO_CADASTRO,
    TC.NOME AS NOME_DO_CLIENTE,
    NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
LEFT JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF;

-- [6] LEFT JOIN + DISTINCT: remove duplicidades mantendo clientes sem notas
SELECT DISTINCT
    TC.CPF AS CPF_DO_CADASTRO,
    TC.NOME AS NOME_DO_CLIENTE,
    NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
LEFT JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF;

-- [7] LEFT JOIN filtrando NULL: identifica clientes sem notas fiscais
SELECT DISTINCT
    TC.CPF AS CPF_DO_CADASTRO,
    TC.NOME AS NOME_DO_CLIENTE,
    NF.CPF AS CPF_DA_NOTA
FROM TABELA_DE_CLIENTES TC
LEFT JOIN NOTAS_FISCAIS NF ON TC.CPF = NF.CPF
WHERE NF.CPF IS NULL;
