-- 📋 1. Cabecalho
-- 📑 | Relatorio de Vendas por Cliente
-- Proposito: Percorrer todos os clientes e calcular o faturamento mensal individual utilizando notas fiscais.
-- Tecnologia: T-SQL (SQL Server)
-- Contexto: Curso 4 - Aula 07 - Script principal de relatorio

-- ⚡ 2. Funcionamento Rapido
-- O que faz: Soma `quantidade * preco` para cada cliente no mes/ano configurados e imprime um resumo por linha.
-- Como funciona:
-- 1. Declara variaveis de identificacao (CPF/NOME), periodo, total de clientes e acumulador de vendas.
-- 2. Define o mes/ano alvo e contabiliza quantos clientes serao processados.
-- 3. Loop WHILE percorre os clientes em ordem de CPF usando ROW_NUMBER.
-- 4. Junta notas e itens para somar o faturamento do cliente no periodo.
-- 5. PRINT apresenta o resultado formatado por cliente e avanca para o proximo registro.
-- Entrada -> Saida: Mes e ano configurados -> Saida textual com vendas por cliente no periodo.

-- 🔧 3. Componentes Principais
-- Variaveis: @CPF, @NOME, @TOTAL_VENDAS, @MES, @ANO, @NUMERO_CLIENTES, @I.
-- Subconsulta com ROW_NUMBER: Garante iteracao ordenada sobre [TABELA DE CLIENTES].
-- INNER JOIN [NOTAS FISCAIS] e [ITENS NOTAS FISCAIS]: Calcula o total por cliente.
-- PRINT com TRIM/STR: Formata o relatorio monetario para cada cliente.

-- 📦 4. Dependencias
-- Tabelas `[TABELA DE CLIENTES]`, `[NOTAS FISCAIS]` e `[ITENS NOTAS FISCAIS]` com colunas CPF, NOME, NUMERO, DATA, QUANTIDADE e `[PRECO]`.
-- Permissoes de leitura sobre todas as tabelas.
-- Ajuste manual de `@MES` e `@ANO` para definir o filtro temporal.

-- ▶️ 5. Como Usar
-- Pre-requisitos: Base populada com clientes, notas e itens; conexao ao SQL Server.
-- Execucao: Configure `@MES` e `@ANO`, execute o script integralmente e observe os resultados na aba de mensagens.
-- Exemplo: Altere o mes para comparar o faturamento de diferentes periodos ou exporte o output para planilha.

-- 💡 6. Notas Tecnicas
-- Padroes aplicados: `ROW_NUMBER` para ordenacao deterministica; `TRIM/STR` padronizam o formato monetario.
-- Performance: Loop com subconsulta gera custo O(n^2); para grandes volumes, considere SELECT com GROUP BY ou CTE.
-- Melhorias possiveis: Persistir resultados em tabela temporaria; transformar em stored procedure parametrizada; usar FORMAT para saida monetaria conforme cultura.

DECLARE @CPF VARCHAR(11);
DECLARE @NOME VARCHAR(100);
DECLARE @NUMERO_CLIENTES INT;
DECLARE @I INT;
DECLARE @MES INT, @ANO INT;
DECLARE @TOTAL_VENDAS FLOAT;

DECLARE @TABELA_FINAL TABLE (CPF VARCHAR(11), NOME VARCHAR(100), MES INT, ANO INT, VALOR_TOTAL FLOAT);

SET @MES = 2;
SET @ANO = 2015;

SELECT @NUMERO_CLIENTES = COUNT(*)
FROM [TABELA DE CLIENTES];

SET @I = 1;

WHILE @I <= @NUMERO_CLIENTES
BEGIN
    SELECT @CPF = X.CPF,
           @NOME = X.NOME
    FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY CPF) AS RowNum, *
        FROM [TABELA DE CLIENTES]
    ) X
    WHERE X.RowNum = @I;

    SELECT @TOTAL_VENDAS = SUM(ITF.QUANTIDADE * ITF.[PREÇO])
    FROM [NOTAS FISCAIS] NF
    INNER JOIN [ITENS NOTAS FISCAIS] ITF
        ON NF.NUMERO = ITF.NUMERO
    WHERE NF.CPF = @CPF
      AND YEAR(NF.DATA) = @ANO
      AND MONTH(NF.DATA) = @MES;

    INSERT INTO @TABELA_FINAL 
    VALUES (@CPF, @NOME, @MES, @ANO, @TOTAL_VENDAS);

    PRINT 'Vendas para: ' + CONVERT(VARCHAR(11), @CPF)
        + ' - ' + @NOME
        + ' no mes ' + CONVERT(VARCHAR(2), @MES)
        + ' e ano ' + CONVERT(VARCHAR(4), @ANO)
        + ' foi de R$: ' + TRIM(STR(@TOTAL_VENDAS, 15, 2));

    SET @I = @I + 1;
END;

SELECT * FROM @TABELA_FINAL;


