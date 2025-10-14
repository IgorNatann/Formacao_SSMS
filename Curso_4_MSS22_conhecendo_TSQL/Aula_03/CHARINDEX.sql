-- ================================================================
-- Curso 4 | Aula 03 | Atividade 05 | Usando CHARINDEX para localizar espacos em nomes
-- Objetivo: demonstrar como encontrar a posicao do primeiro espaco, extrair o
-- primeiro nome com SUBSTRING e reaproveitar o resultado ao carregar variaveis.
-- ================================================================

-- Passo 1: localizar a posicao do primeiro espaco em cada nome
SELECT
    NOME,
    CHARINDEX(' ', NOME) AS POSICAO_ESPACO
FROM [TABELA DE CLIENTES];

-- Passo 2: combinar CHARINDEX com SUBSTRING para extrair o primeiro nome
SELECT
    NOME,
    CHARINDEX(' ', NOME) AS POSICAO_ESPACO,
    SUBSTRING(NOME, 1, CHARINDEX(' ', NOME) - 1) AS PRIMEIRO_NOME
FROM [TABELA DE CLIENTES];

-- Passo 3: carregar um cliente especifico em variaveis e montar mensagem
DECLARE @CPF VARCHAR(50);
DECLARE @NOME VARCHAR(100);
DECLARE @DATA_NASC DATE;
DECLARE @IDADE INT;

SET @CPF = '19290992743';

SELECT
    @NOME = NOME,
    @DATA_NASC = [DATA DE NASCIMENTO],
    @IDADE = IDADE
FROM [TABELA DE CLIENTES]
WHERE CPF = @CPF;

PRINT 'O primeiro nome do cliente e: ' + SUBSTRING(@NOME, 1, CHARINDEX(' ', @NOME) - 1)
      + ', cliente completo: ' + @NOME
      + ', CPF: ' + @CPF;
PRINT @DATA_NASC;
PRINT @IDADE;

-- Passo 4: consulta final para revisar os dados da tabela
SELECT * FROM [TABELA DE CLIENTES];
