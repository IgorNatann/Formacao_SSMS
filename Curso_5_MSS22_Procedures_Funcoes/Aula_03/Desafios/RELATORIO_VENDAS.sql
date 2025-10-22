-- Objetivo geral: criar uma stored procedure que consolida o faturamento por departamento (sabores citricos vs. nao citricos) dentro de um intervalo de datas.

-- Secao 1 - Definicao da procedure com parametros de periodo (data inicial e final).
CREATE PROCEDURE faturamentoDepartamento
    @dataInicial DATE,
    @dataFinal DATE
AS
BEGIN
    -- Tabela variavel que agrupa sabores em dois departamentos para facilitar o join posterior.
    DECLARE @DEPARTAMENTO TABLE (SABOR VARCHAR(20), DEPARTAMENTO VARCHAR(20));

    -- Populacao dos sabores classificados como nao citricos.
    INSERT INTO @DEPARTAMENTO
    SELECT DISTINCT SABOR, 'FRUTAS NAO CITRICAS' AS DEPARTAMENTO
    FROM [TABELA DE PRODUTOS]
    WHERE SABOR IN ('Acai', 'Cereja', 'Cereja/Maca', 'Maca', 'Manga', 'Maracuja', 'Melancia')

    UNION

    -- Populacao dos sabores classificados como citricos.
    SELECT DISTINCT SABOR, 'FRUTAS CITRICAS' AS DEPARTAMENTO
    FROM [TABELA DE PRODUTOS]
    WHERE SABOR IN ('Laranja', 'Uva', 'Limao', 'Morango', 'Morango/Limao', 'Lima/Limao');

    -- Secao 2 - Consulta que consolida o faturamento por departamento usando os parametros de data.
    SELECT
        DP.DEPARTAMENTO,
        SUM(INF.QUANTIDADE * INF.[PRECO]) AS FATURAMENTO
    FROM [TABELA DE PRODUTOS] TP
    INNER JOIN [ITENS NOTAS FISCAIS] INF
        ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
    INNER JOIN [NOTAS FISCAIS] NF
        ON NF.NUMERO = INF.NUMERO
    INNER JOIN @DEPARTAMENTO DP
        ON TP.SABOR = DP.SABOR
    WHERE NF.DATA >= @dataInicial
      AND NF.DATA <= @dataFinal
    GROUP BY DP.DEPARTAMENTO;
END;

-- Secao 3 - Execucao de exemplo para gerar o relatorio de faturamento na primeira quinzena de 2016.
EXEC faturamentoDepartamento '2016-01-01', '2016-01-15';

-- Resumo dos aprendizados:
-- 1) Tabelas variaveis ajudam a categorizar dados dinamicamente sem criar objetos permanentes.
-- 2) Unir tabelas de produtos, itens e notas permite calcular faturamento com QUANTIDADE * PRECO.
-- 3) Parametros de data tornam a procedure reutilizavel para diferentes periodos de analise.
