-- ================================================================
-- Curso 4 | Aula 02 | Atividade 06 | Atribuindo valores a variaveis
-- Objetivo: declarar variaveis T-SQL, atribuir valores com SET e exibir o
-- resultado usando PRINT para verificacao rapida.
-- ================================================================

-- Passo 1: declaracao das variaveis utilizadas no exemplo
DECLARE @MATRICULA VARCHAR(5);
DECLARE @NOME VARCHAR(100);
DECLARE @PERCENTUAL FLOAT;
DECLARE @DATA DATE;
DECLARE @FERIAS BIT;
DECLARE @BAIRRO VARCHAR(50);

-- Passo 2: atribuir valores usando SET
SET @MATRICULA = '00240';
SET @NOME = 'Igor N.';
SET @PERCENTUAL = 0.10;
SET @DATA = '1999-11-27';
SET @FERIAS = 1;            -- 1 = true (em ferias)
SET @BAIRRO = 'Pq. Pinheiros';

-- Passo 3: imprimir o conteudo das variaveis
PRINT @MATRICULA;
PRINT @NOME;
PRINT @PERCENTUAL;
PRINT @DATA;
PRINT @FERIAS;
PRINT @BAIRRO;
