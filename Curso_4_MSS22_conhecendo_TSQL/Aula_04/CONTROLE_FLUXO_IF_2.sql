-- ================================================================
-- Curso 4 | Aula 04 | Atividade 05 | Controle de fluxo IF aplicado a dias da semana
-- Objetivo: trabalhar com GETDATE, DATENAME e DATEADD para identificar se a
-- data resultante cai em final de semana ou dia util.
-- ================================================================

-- Passo 1: explorar funcoes de data para referencia
SELECT GETDATE();
SELECT DATENAME(WEEKDAY, GETDATE()) AS DIA_SEMANA;
SELECT GETDATE() AS DIA_DE_HOJE,
       DATEADD(DAY, 5, GETDATE()) AS DATA_MAIS_5_DIAS;
SELECT DATENAME(WEEKDAY, DATEADD(DAY, 5, GETDATE())) AS DIA_SEMANA_MAIS_5;

-- Passo 2: declarar variaveis que controlam o numero de dias e o nome do dia
DECLARE @DIA_SEMANA VARCHAR(20);
DECLARE @NUMERO_DIAS INT;

-- Passo 3: definir o deslocamento e calcular o dia correspondente
SET @NUMERO_DIAS = 4;
SET @DIA_SEMANA = DATENAME(WEEKDAY, DATEADD(DAY, @NUMERO_DIAS, GETDATE()));

PRINT @DIA_SEMANA; -- mostra o dia encontrado

-- Passo 4: usar IF para classificar como final de semana ou dia util
IF @DIA_SEMANA IN ('Domingo', 'Sabado')
    PRINT 'FINAL DE SEMANA';
ELSE
    PRINT 'DIA DE SEMANA';
