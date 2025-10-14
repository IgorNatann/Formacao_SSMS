-- ================================================================
-- Curso 4 | Aula 02 | Atividade 2 | Variaveis em T-SQL
-- Objetivo: mostrar diferentes maneiras de declarar variaveis com tipos
-- variados e organizacao das instrucoes em blocos.
-- ================================================================

-- Passo 1: declaracoes individuais (uma por linha)
DECLARE @MATRICULA VARCHAR(5);
DECLARE @NOME VARCHAR(100);
DECLARE @PERCENTUAL FLOAT;
DECLARE @DATA DATE;
DECLARE @FERIAS BIT;
DECLARE @BAIRRO VARCHAR(50);

-- Passo 2: todas as variaveis na mesma instrucao
DECLARE @MATRICULA VARCHAR(5), @NOME VARCHAR(100), @PERCENTUAL FLOAT, @DATA DATE, @FERIAS BIT, @BAIRRO VARCHAR(50);

-- Passo 3: declaracao multi-linha para facilitar leitura
DECLARE @MATRICULA VARCHAR(5),
        @NOME VARCHAR(100),
        @PERCENTUAL FLOAT,
        @DATA DATE,
        @FERIAS BIT,
        @BAIRRO VARCHAR(50);

-- Passo 4: bloco dividido (algumas variaveis juntas, outras separadas)
DECLARE @MATRICULA VARCHAR(5),
        @NOME VARCHAR(100),
        @PERCENTUAL FLOAT;
DECLARE @DATA DATE,
        @FERIAS BIT,
        @BAIRRO VARCHAR(50);
