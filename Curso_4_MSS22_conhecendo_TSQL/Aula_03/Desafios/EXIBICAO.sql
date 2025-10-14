-- ================================================================
-- Desafio | Curso 4 | Aula 03 | Atividade 06 | Exibindo dados formatados com PRINT
-- Objetivo: carregar informacoes de um cliente, calcular idade com DATEDIFF e
-- montar uma mensagem formatada usando CONCAT.
-- ================================================================

-- Passo 1: declarar variaveis que armazenam CPF, data de nascimento e idade
DECLARE @CPF VARCHAR(15);
DECLARE @DATA_NASCIMENTO DATE;
DECLARE @IDADE INT;

-- Passo 2: definir o CPF alvo e buscar a data de nascimento na tabela de clientes
SET @CPF = '1471156710';
SELECT @DATA_NASCIMENTO = [DATA DE NASCIMENTO]
FROM [TABELA DE CLIENTES]
WHERE CPF = @CPF;

-- Passo 3: calcular a idade em anos com base na data atual
SET @IDADE = DATEDIFF(YEAR, @DATA_NASCIMENTO, GETDATE());

-- Passo 4: exibir mensagem formatada com CONCAT (evita cast manual)
PRINT CONCAT('O cliente de CPF ', @CPF,
             ' nasceu em ', @DATA_NASCIMENTO,
             ' e tem ', @IDADE,
             ' anos.');

-- Passo 5: consulta opcional para validar os dados utilizados
SELECT *
FROM [TABELA DE CLIENTES]
WHERE CPF = @CPF;
