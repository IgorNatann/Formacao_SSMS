-- ================================================================
-- Desafio | Curso 4 | Aula 04 | Atividade 08 | Usando SELECT dentro do IF
-- Objetivo: reescrever o update condicional comparando a idade da tabela com
-- a idade calculada usando um SELECT dentro da condicao IF.
-- ================================================================

-- Passo 1: declarar variaveis necessarias (CPF, data de nascimento, idade)
DECLARE @CPF VARCHAR(15);
DECLARE @DATA_NASCIMENTO DATE;
DECLARE @IDADE INT;

-- Passo 2: carregar dados do cliente e calcular idade atual
SET @CPF = '1471156710';
SELECT @DATA_NASCIMENTO = [DATA DE NASCIMENTO]
FROM [TABELA DE CLIENTES]
WHERE CPF = @CPF;

SET @IDADE = DATEDIFF(YEAR, @DATA_NASCIMENTO, GETDATE());

-- Passo 3: IF com SELECT contando registros onde idade diverge
IF (SELECT COUNT(*)
    FROM [TABELA DE CLIENTES]
    WHERE CPF = @CPF AND IDADE <> @IDADE) > 0
    UPDATE [TABELA DE CLIENTES]
    SET IDADE = @IDADE
    WHERE CPF = @CPF;
