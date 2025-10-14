-- ================================================================
-- Curso 4 | Aula 04 | Controle de fluxo com IF
-- Objetivo: verificar existencia de tabela antes de dropar/criar usando
-- IF e OBJECT_ID, evitando erros de objeto inexistente.
-- ================================================================

-- Passo 1: dropar a tabela somente se ela ja existir
IF OBJECT_ID('TB_TESTE', 'U') IS NOT NULL
    DROP TABLE TB_TESTE;

-- Passo 2: criar a tabela apenas se ela ainda nao existir
IF OBJECT_ID('TB_TESTE', 'U') IS NULL
    CREATE TABLE TB_TESTE (ID VARCHAR(10));
