-- ================================================================
-- Curso 4 | Aula 03 | Atividade 03 | Carregando variaveis a partir de SELECT
-- Objetivo: buscar dados de um cliente usando CPF e armazenar o resultado em
-- variaveis para uso posterior (exibicao, validacoes etc.).
-- ================================================================

-- Passo 1: declarar variaveis que receberao os valores
DECLARE @CPF VARCHAR(50);
DECLARE @NOME VARCHAR(50);
DECLARE @DATA_NASCIMENTO VARCHAR(50);
DECLARE @IDADE INT;

-- Passo 2: definir qual CPF sera consultado
SET @CPF = '1471156710';

-- Passo 3: carregar variaveis com um unico SELECT
SELECT
    @NOME = NOME,
    @DATA_NASCIMENTO = [DATA DE NASCIMENTO],
    @IDADE = IDADE
FROM [TABELA DE CLIENTES]
WHERE CPF = @CPF;

-- Passo 4: exibir os valores carregados (validacao rapida)
PRINT @NOME;
PRINT @DATA_NASCIMENTO;
PRINT @IDADE;
