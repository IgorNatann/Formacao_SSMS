-- Objetivo geral: aprender a utilizar parametros de saida (OUTPUT) em stored procedures para retornar quantidade de notas e faturamento agregado por cliente e ano.

-- Secao 1 - Definicao da stored procedure com parametros de entrada e saida.
CREATE PROCEDURE retornaValoresFaturamentoQuantidade
@CPF AS VARCHAR(12),
@ANO AS INT,
@NUM_NOTAS AS INT OUTPUT,
@FATURAMENTO AS FLOAT OUTPUT
AS
BEGIN
    -- Calcula quantas notas fiscais existem para o CPF no ano informado.
    SELECT @NUM_NOTAS = COUNT(*)
    FROM [NOTAS FISCAIS]
    WHERE CPF = @CPF
    AND YEAR([DATA]) = @ANO;

    -- Calcula o faturamento somando quantidade x preco de cada item vendido.
    SELECT @FATURAMENTO = SUM(INF.QUANTIDADE * INF.[PRECO])
    FROM [ITENS NOTAS FISCAIS] INF
    INNER JOIN [NOTAS FISCAIS] NF
        ON INF.NUMERO = NF.NUMERO
    WHERE NF.CPF = @CPF
    AND YEAR(NF.[DATA]) = @ANO;

    -- Retorno diagnostico para conferir os valores antes de sair da procedure.
    SELECT @NUM_NOTAS AS NUM_NOTAS_CALCULADAS, @FATURAMENTO AS FATURAMENTO_CALCULADO;
END;

-- Secao 2 - Preparacao das variaveis locais que receberao os valores calculados.
DECLARE @NUM_NOTAS INT;
DECLARE @FATURAMENTO FLOAT;

-- Inicializa as variaveis para facilitar a comparacao antes e depois da procedure.
SET @NUM_NOTAS = 0;
SET @FATURAMENTO = 0;

-- Consulta de verificacao do estado inicial (espera 0 e 0.0).
SELECT @NUM_NOTAS AS NUM_NOTAS_INICIAL, @FATURAMENTO AS FATURAMENTO_INICIAL;

-- Secao 3 - Execucao da procedure com parametros nomeados e captura de OUTPUT.
EXEC retornaValoresFaturamentoQuantidade
    @CPF = '19290992743',
    @ANO = 2017,
    @NUM_NOTAS = @NUM_NOTAS OUTPUT,
    @FATURAMENTO = @FATURAMENTO OUTPUT;

-- Consulta pos-execucao para evidenciar os valores retornados pela procedure.
SELECT @NUM_NOTAS AS NUM_NOTAS_FINAL, @FATURAMENTO AS FATURAMENTO_FINAL;

-- Resumo dos aprendizados:
-- 1) Parametros OUTPUT permitem retornar multiplos resultados sem recorrer a tabelas temporarias.
-- 2) Funcoes de data (YEAR) filtram periodos especificos em consultas agregadas.
-- 3) Declarar e inicializar variaveis facilita validar os efeitos da procedure.
