-- ================================================================
-- Desafio | Curso 4 | Aula 04 | Atividade 07 | IF condicionando UPDATE de idade
-- Objetivo: somente atualizar a idade do cliente caso o valor calculado
-- diverja do armazenado na tabela, evitando updates desnecessarios.
-- ================================================================

-- Passo 1: declarar variaveis para armazenar dados do cliente
DECLARE @CPF VARCHAR(15);
DECLARE @DATA_NASCIMENTO DATE;
DECLARE @IDADE_TABELA INT;
DECLARE @IDADE INT;

-- Passo 2: carregar dados da tabela e calcular idade atual
SET @CPF = '1471156710';
SELECT @DATA_NASCIMENTO = [DATA DE NASCIMENTO],
       @IDADE_TABELA = IDADE
FROM [TABELA DE CLIENTES]
WHERE CPF = @CPF;

SET @IDADE = DATEDIFF(YEAR, @DATA_NASCIMENTO, GETDATE());

-- Passo 3: atualizar somente quando houver diferenca
IF @IDADE_TABELA <> @IDADE
    UPDATE [TABELA DE CLIENTES]
    SET IDADE = @IDADE
    WHERE CPF = @CPF;
ELSE
    PRINT 'IDADE JA ESTA ATUALIZADA';
