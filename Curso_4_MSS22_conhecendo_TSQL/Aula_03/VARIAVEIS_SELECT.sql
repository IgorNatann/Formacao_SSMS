-- ================================================================
-- Curso 4 | Aula 03 | Atividade 01 | Inserindo dados via variaveis e SELECT
-- Objetivo: carregar variaveis, verificar a tabela de vendedores e inserir um
-- novo registro usando os valores parametrizados.
-- ================================================================

-- Passo 1: declarar variaveis que representam os campos do vendedor
DECLARE @MATRICULA VARCHAR(5);
DECLARE @NOME VARCHAR(100);
DECLARE @PERCENTUAL FLOAT;
DECLARE @DATA DATE;
DECLARE @FERIAS BIT;
DECLARE @BAIRRO VARCHAR(50);

-- Passo 2: consultar o estado atual da tabela de vendedores
SELECT * FROM [TABELA DE VENDEDORES];

-- Passo 3: atribuir valores as variaveis
SET @MATRICULA = '00240';
SET @NOME = 'Igor N.';
SET @PERCENTUAL = 0.10;
SET @DATA = '1999-11-27';
SET @FERIAS = 1;            -- 1 indica que esta de ferias
SET @BAIRRO = 'Pq. Pinheiros';

-- Passo 4: inserir novo vendedor utilizando as variaveis
INSERT INTO [TABELA DE VENDEDORES]
    (MATRICULA, NOME, [PERCENTUAL COMISSAO], [DATA ADMISSAO], [DE FERIAS], BAIRRO)
VALUES
    (@MATRICULA, @NOME, @PERCENTUAL, @DATA, @FERIAS, @BAIRRO);

-- Passo 5: consultar novamente para confirmar a insercao
SELECT * FROM [TABELA DE VENDEDORES];
