-- ================================================================
-- Curso 3 | Aula 05 | Atividade 3 | Definindo campos com DEFAULT e IDENTITY
-- Objetivo: demonstrar como declarar colunas com valores padrao, usar IDENTITY
-- e testar insercoes com/sem informar todos os campos.
-- ================================================================

-- Passo 1: criar tabela com defaults parciais (apenas cidade e data)
CREATE TABLE TB_PADRAO (
    ID INT IDENTITY(1,1) NOT NULL,
    DESCRITOR VARCHAR(20) NULL,
    ENDERECO VARCHAR(20) NULL,
    CIDADE VARCHAR(20) DEFAULT 'Nao informado',
    DATA_CRIACAO DATE DEFAULT GETDATE()
);

-- Passo 2: inserir informando todos os campos (override dos DEFAULT)
INSERT INTO TB_PADRAO (DESCRITOR, ENDERECO, CIDADE, DATA_CRIACAO)
VALUES ('CLIENTE X', 'RUA PROJETADA A', 'SAO PAULO', '2018-04-30');

SELECT * FROM TB_PADRAO; -- verifica valores manualmente atribuidos

-- Passo 3: inserir apenas DESCRITOR para observar defaults aplicados
INSERT INTO TB_PADRAO (DESCRITOR)
VALUES ('CLIENTE Y');

SELECT * FROM TB_PADRAO; -- CIDADE e DATA_CRIACAO usam os defaults

INSERT INTO TB_PADRAO (DESCRITOR)
VALUES ('CLIENTE H');

SELECT * FROM TB_PADRAO;

-- Passo 4: criar segunda tabela com defaults em todas as colunas texto
CREATE TABLE TB_PADRAO_2 (
    ID INT IDENTITY(1,1) NOT NULL,
    DESCRITOR VARCHAR(20) NULL DEFAULT 'Nao informado',
    ENDERECO VARCHAR(20) NULL DEFAULT 'Nao informado',
    CIDADE VARCHAR(20) DEFAULT 'Nao informado',
    DATA_CRIACAO DATE DEFAULT GETDATE()
);

-- Passo 5: inserir apenas o descritor para checar demais valores gerados
INSERT INTO TB_PADRAO_2 (DESCRITOR)
VALUES ('CLIENTE Z');

SELECT * FROM TB_PADRAO_2;
