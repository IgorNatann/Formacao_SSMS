-- ================================================================
-- Curso 3 | Aula 05 | Atividade 3 | Explorando colunas IDENTITY
-- Objetivo: demonstrar criacao de tabela com IDENTITY, comportamento em
-- insercoes sucessivas e customizacao de semente/incremento.
-- ================================================================

-- Passo 1: criar tabela com IDENTITY iniciando em 1 e incrementando de 1 em 1
CREATE TABLE TAB_IDENTITY (
    ID INT IDENTITY(1,1) NOT NULL,
    DESCRITOR VARCHAR(20) NULL
);

-- Passo 2: inserir registros para observar o auto incremento da coluna ID
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE X');
SELECT * FROM TAB_IDENTITY; -- mostra ID=1 associado a CLIENTE X

INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE Y');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE Z');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE W');
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE A');

-- Passo 3: deletar e inserir novamente para evidenciar que o ID nao retrocede
DELETE FROM TAB_IDENTITY WHERE ID = 1;  -- remove o primeiro registro
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE B'); -- recebe novo ID sequencial

DELETE FROM TAB_IDENTITY WHERE ID = 6;  -- remove um ID intermediario
INSERT INTO TAB_IDENTITY (DESCRITOR) VALUES ('CLIENTE C'); -- gera proximo ID disponivel

-- Passo 4: criar segunda tabela com semente customizada (inicia em 100, passo 5)
CREATE TABLE TAB_IDENTITY2 (
    ID INT IDENTITY(100,5) NOT NULL,
    DESCRITOR VARCHAR(20) NULL
);

-- Passo 5: inserir para visualizar IDs 100, 105, ...
INSERT INTO TAB_IDENTITY2 (DESCRITOR) VALUES ('CLIENTE Y');
INSERT INTO TAB_IDENTITY2 (DESCRITOR) VALUES ('CLIENTE Z');
