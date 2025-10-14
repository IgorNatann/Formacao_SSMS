-- ================================================================
-- Curso 4 | Aula 04 | Atividade 07 | Controle de fluxo IF com limite de credito por bairro
-- Objetivo: verificar o total de limite ja concedido a um bairro e decidir se
-- ainda e possivel liberar mais credito.
-- ================================================================

-- Passo 1: conferir os dados da tabela de clientes
SELECT * FROM [TABELA DE CLIENTES];

-- Passo 2: agrupar por bairro para enxergar os totais atuais
SELECT BAIRRO,
       SUM([LIMITE DE CREDITO]) AS TOTAL_LIMITE_CREDITO
FROM [TABELA DE CLIENTES]
GROUP BY BAIRRO;

-- Passo 3: calcular o limite especifico de um bairro (referencia)
SELECT SUM([LIMITE DE CREDITO]) AS TOTAL_LIMITE_CREDITO
FROM [TABELA DE CLIENTES]
WHERE BAIRRO = 'Agua Santa';

-- Passo 4: definir limite maximo e o bairro alvo
DECLARE @LIMITE_MAXIMO FLOAT;
DECLARE @BAIRRO VARCHAR(20);

SET @LIMITE_MAXIMO = 150000;
SET @BAIRRO = 'Agua Santa';

-- Passo 5: usar IF para decidir se pode liberar mais credito
IF (SELECT SUM([LIMITE DE CREDITO])
    FROM [TABELA DE CLIENTES]
    WHERE BAIRRO = @BAIRRO) >= @LIMITE_MAXIMO
    PRINT 'Pode liberar mais credito para o bairro ' + @BAIRRO;
ELSE
    PRINT 'Nao pode liberar mais credito para o bairro ' + @BAIRRO;
