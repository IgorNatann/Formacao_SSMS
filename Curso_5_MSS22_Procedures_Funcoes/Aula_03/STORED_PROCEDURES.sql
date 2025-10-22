-- Objetivo geral: demonstrar como calcular e atualizar a idade de clientes, culminando na criacao de uma stored procedure reutilizavel.

-- Seção 1 - Consulta base: retorna dados relevantes para acompanhar o estado atual da tabela de clientes.
SELECT CPF, NOME, [DATA DE NASCIMENTO], IDADE
FROM [TABELA DE CLIENTES];

-- Seção 2 - Calculando idade dinamicamente com DATEDIFF; ilustra uma alternativa sem alterar dados.
SELECT DATEDIFF(YEAR, '2000-01-01', GETDATE()) AS IDADE
FROM [TABELA DE CLIENTES];

-- Seção 3 - Comparando idade armazenada e idade calculada em tempo real para identificar divergencias.
SELECT CPF, NOME, [DATA DE NASCIMENTO], IDADE, DATEDIFF(YEAR, [DATA DE NASCIMENTO], GETDATE()) AS IDADE_REAL
FROM [TABELA DE CLIENTES];

-- Seção 4 - Atualizacao direta: grava na coluna IDADE o valor calculado com base na data de nascimento.
UPDATE [TABELA DE CLIENTES]
SET IDADE = DATEDIFF(YEAR, [DATA DE NASCIMENTO], GETDATE());

-- Seção 5 - Stored procedure: encapsula a logica de atualizacao para execucoes futuras e automatizacao.
CREATE PROCEDURE CALCULA_IDADE_CLIENTES
AS
BEGIN
    -- Atualiza todas as linhas utilizando GETDATE para obter a data do servidor.
    UPDATE [TABELA DE CLIENTES]
    SET IDADE = DATEDIFF(YEAR, [DATA DE NASCIMENTO], GETDATE());
END;

-- Seção 6 - Insercao de registro de teste para validar a stored procedure.
INSERT INTO [TABELA DE CLIENTES]
(CPF, NOME, [ENDERECO 1], BAIRRO, CIDADE, ESTADO, CEP, [DATA DE NASCIMENTO], IDADE, SEXO, [LIMITE DE CREDITO], [VOLUME DE COMPRA], [PRIMEIRA COMPRA])
VALUES
('123123123', 'JOAO MACHADO', 'RUA PROJETADA A', 'MADUREIRA', 'Rio de Janeiro', 'RJ', '20000', '2000-01-01', 10, 'M', 12000, 12000, 1);

-- Seção 7 - Consulta para verificar o registro inserido antes de rodar a procedure.
SELECT * FROM [TABELA DE CLIENTES]
WHERE CPF = '123123123';

-- Seção 8 - Execucao da stored procedure: aplica o recalculo de idade para todos os clientes.
EXEC [dbo].CALCULA_IDADE_CLIENTES;

-- Consulta complementar sugerida:
-- SELECT CPF, IDADE FROM [TABELA DE CLIENTES] WHERE CPF = '123123123';
