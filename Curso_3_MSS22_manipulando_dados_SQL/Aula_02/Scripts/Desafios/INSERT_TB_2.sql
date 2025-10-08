-- ================================================================
-- Desafio | Curso 3 Aula 02 | Carregando TB_CLIENTES a partir de SUCOS_FRUTAS
-- Objetivo: importar clientes da base restaurada, mapeando colunas e evitando
-- duplicar os registros ja inseridos no exercicio anterior.
-- ================================================================

-- Passo 1: conferir situacao atual da tabela destino
SELECT * FROM TB_CLIENTES; -- ja contem 3 clientes adicionados antes

-- Passo 2: visualizar a origem para saber quais colunas converter
SELECT * FROM SUCOS_FRUTAS.dbo.TABELA_DE_CLIENTES;

-- Passo 3: projetar colunas com alias alinhados ao schema de TB_CLIENTES
SELECT
    CPF,
    NOME,
    ENDERECO_1          AS ENDERECO,
    BAIRRO,
    CIDADE,
    ESTADO,
    CEP,
    DATA_DE_NASCIMENTO  AS DATA_NASCIMENTO,
    IDADE,
    GENERO,
    LIMITE_DE_CREDITO   AS LIMITE_CREDITO,
    VOLUME_DE_COMPRA    AS VOLUME_COMPRA,
    PRIMEIRA_COMPRA
FROM SUCOS_FRUTAS.dbo.TABELA_DE_CLIENTES;

-- Passo 4: inserir todos os clientes que ainda nao foram migrados
INSERT INTO TB_CLIENTES
SELECT
    CPF,
    NOME,
    ENDERECO_1          AS ENDERECO,
    BAIRRO,
    CIDADE,
    ESTADO,
    CEP,
    DATA_DE_NASCIMENTO  AS DATA_NASCIMENTO,
    IDADE,
    GENERO,
    LIMITE_DE_CREDITO   AS LIMITE_CREDITO,
    VOLUME_DE_COMPRA    AS VOLUME_COMPRA,
    PRIMEIRA_COMPRA
FROM SUCOS_FRUTAS.dbo.TABELA_DE_CLIENTES
WHERE CPF NOT IN ('19290992743', '2600586709', '1471156710'); -- evita duplicar os 3 clientes ja criados

-- Passo 5: conferir o resultado final da migracao
SELECT * FROM TB_CLIENTES;
