-- ================================================================
-- Desafio | Curso 4 | Aula 03 | Atividade 04 | Atribuindo contagem a uma variavel com SELECT
-- Objetivo: criar a variavel NUMNOTAS e armazenar o total de notas emitidas
-- em 01/01/2017, exibindo o resultado ao final.
-- ================================================================

-- Passo 1: declarar a variavel que recebera o total de notas (inteiro)
DECLARE @NUMNOTAS INT;

-- Passo 2: atribuir o valor usando SELECT (conta notas na data informada)
SET @NUMNOTAS = (
    SELECT COUNT(*)
    FROM [NOTAS FISCAIS]
    WHERE [DATA] = '2017-01-01'
);

-- Passo 3: exibir o valor para validar
PRINT @NUMNOTAS;
