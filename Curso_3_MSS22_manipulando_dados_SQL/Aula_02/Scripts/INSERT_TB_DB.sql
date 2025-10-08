-- ================================================================
-- Curso 3 | Aula 02 | Inserindo dados de SUCOS_FRUTAS em TB_PRODUTOS
-- Objetivo: comparar esquemas, alinhar colunas via SELECT projetado e
-- carregar os dados evitando duplicidades (exemplo com filtro de codigo).
-- ================================================================

-- Passo 1: conferir o destino (tabela local) e a origem (banco restaurado)
SELECT * FROM TABELA_DE_PRODUTOS;                      -- tabela local
SELECT * FROM SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS;     -- tabela origem

-- Passo 2: projetar colunas com alias para igualar nomes e ordem
SELECT
    CODIGO_DO_PRODUTO AS CODIGO,
    NOME_DO_PRODUTO   AS DESCRICAO,
    SABOR,
    TAMANHO,
    EMBALAGEM,
    PRECO_DE_LISTA    AS PRECO
FROM TABELA_DE_PRODUTOS; -- exemplo local

SELECT
    CODIGO_DO_PRODUTO AS CODIGO,
    NOME_DO_PRODUTO   AS DESCRITOR,
    SABOR,
    TAMANHO,
    EMBALAGEM,
    PRECO_DE_LISTA    AS PRECO_LISTA
FROM SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS; -- mesma estrutura da origem

-- Passo 3: inserir todos os produtos da origem na tabela destino
INSERT INTO TB_PRODUTOS
SELECT
    CODIGO_DO_PRODUTO AS CODIGO,
    NOME_DO_PRODUTO   AS DESCRITOR,
    SABOR,
    TAMANHO,
    EMBALAGEM,
    PRECO_DE_LISTA    AS PRECO_LISTA
FROM SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS;

-- Passo 4: conferir resultado apos carga
SELECT * FROM TB_PRODUTOS;

-- Passo 5: exemplo de carga seletiva evitando um codigo especifico
INSERT INTO TB_PRODUTOS
SELECT
    CODIGO_DO_PRODUTO AS CODIGO,
    NOME_DO_PRODUTO   AS DESCRITOR,
    SABOR,
    TAMANHO,
    EMBALAGEM,
    PRECO_DE_LISTA    AS PRECO_LISTA
FROM SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS
WHERE CODIGO_DO_PRODUTO <> '1040107';

SELECT * FROM TB_PRODUTOS; -- conferencia final
