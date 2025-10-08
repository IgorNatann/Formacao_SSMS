-- ================================================================
-- Desafio | Curso 3 Aula 02 | Atualizando dados do cliente por CPF
-- Objetivo: identificar o registro alvo, aplicar o UPDATE pontual e validar
-- as alteracoes realizadas.
-- ================================================================

-- Passo 1: consultar o cliente antes de alterar
SELECT * FROM TB_CLIENTES WHERE CPF = '19290992743';

-- Passo 2: atualizar endereco, bairro, cidade, estado e CEP
UPDATE TB_CLIENTES
SET ENDERECO = 'R. Jorge Emilio 23',
    BAIRRO   = 'Santo Amaro',
    CIDADE   = 'Sao Paulo',
    ESTADO   = 'SP',
    CEP      = '8833223'
WHERE CPF = '19290992743';

-- Passo 3: validar se as informacoes foram persistidas corretamente
SELECT * FROM TB_CLIENTES WHERE CPF = '19290992743';
