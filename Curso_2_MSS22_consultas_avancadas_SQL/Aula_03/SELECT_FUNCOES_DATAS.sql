-- ================================================================
-- Aula 03 | Funcoes com Datas no SQL Server
-- Objetivo: explorar funcoes nativas para obter a data atual, adicionar ou
-- subtrair periodos, calcular diferencas e extrair partes especificas.
-- ================================================================

-- Secao 1: obtendo a data e hora atuais do servidor
-- GETDATE retorna um valor DATETIME com a data/hora do ambiente de execucao.
SELECT GETDATE() AS DATA_ATUAL;

-- Secao 2: somando dias a partir de uma data base
-- DATEADD permite adicionar (ou subtrair) intervalos. Exemplo: 10 dias apos hoje.
SELECT
    GETDATE() AS DATA_HOJE,
    DATEADD(DAY, 10, GETDATE()) AS DATA_DAQUI_10_DIAS;

-- Secao 3: subtraindo dias de uma data
-- Com DATEADD e valor negativo, retrocedemos 48 dias a partir de hoje.
SELECT DATEADD(DAY, -48, GETDATE()) AS DATA_48_DIAS_ATRAS;

-- Secao 4: calculando diferencas de tempo com DATEDIFF
-- DATEDIFF mede a quantidade de unidades (dias, horas, meses) entre duas datas.
SELECT DATEDIFF(DAY, '2022-01-01', GETDATE()) AS DIAS_DESDE_INICIO_ANO;
SELECT DATEDIFF(HOUR, '2022-01-01', GETDATE()) AS HORAS_DESDE_INICIO_ANO;
SELECT DATEDIFF(MONTH, '2022-01-01', GETDATE()) AS MESES_DESDE_INICIO_ANO;

-- Secao 5: extraindo componentes especificos de uma data
-- DATEPART retorna o valor numerico de uma parte (dia, mes, ano) da data.
SELECT DATEPART(DAY, GETDATE()) AS DIA_DE_HOJE;
SELECT DATEPART(MONTH, GETDATE()) AS MES_DE_HOJE;
SELECT DATEPART(YEAR, GETDATE()) AS ANO_ATUAL;

-- Secao 6: validando datas construidas manualmente
-- ISDATE retorna 1 quando a expressao resulta em uma data valida.
-- DATETIMEFROMPARTS monta uma data a partir dos componentes informados.
SELECT ISDATE(DATETIMEFROMPARTS(2022, 02, 28, 00, 00, 00, 00)) AS DATA_VALIDADA;
