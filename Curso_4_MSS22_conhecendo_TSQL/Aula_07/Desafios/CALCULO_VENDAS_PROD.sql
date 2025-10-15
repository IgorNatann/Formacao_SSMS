-- 📋 1. Cabecalho
-- 💰 | Calculo de Vendas por Produto
-- Proposito: Iterar por todos os produtos e calcular o faturamento mensal com base nas notas fiscais.
-- Tecnologia: T-SQL (SQL Server)
-- Contexto: Curso 4 - Aula 07 - Desafio de vendas por produto

-- ⚡ 2. Funcionamento Rapido
-- O que faz: Para cada produto, calcula `SUM(quantidade * preco)` filtrando por mes e ano e imprime o total.
-- Como funciona:
-- 1. Declara variaveis para identificar produto, periodo e acumulador de vendas.
-- 2. Define o intervalo alvo (`@MES`, `@ANO`) e recupera a quantidade de produtos.
-- 3. Loop WHILE percorre os produtos em ordem de codigo via ROW_NUMBER.
-- 4. INNER JOIN entre notas e itens soma a receita do produto no periodo indicado.
-- 5. PRINT exibe o total formatado para cada produto.
-- Entrada -> Saida: Mes/Ano configurados -> Saida textual com vendas por produto no periodo.

-- 🔧 3. Componentes Principais
-- Variaveis: @CODIGO, @NOME identificam cada produto; @TOTAL_VENDAS guarda a soma; @MES/@ANO limitam o periodo.
-- ROW_NUMBER(): seleciona o produto correspondente a cada iteracao do loop.
-- Consulta agregada: `SUM(quantidade * preco)` sobre `[NOTAS FISCAIS]` e `[ITENS NOTAS FISCAIS]`.
-- Loop WHILE + PRINT: percorre toda a lista de produtos emitindo o relatorio textual.

-- 📦 4. Dependencias
-- Tabelas `[TABELA DE PRODUTOS]`, `[NOTAS FISCAIS]` e `[ITENS NOTAS FISCAIS]` com colunas utilizadas (`[CODIGO DO PRODUTO]`, `[NOME DO PRODUTO]`, `QUANTIDADE`, `[PRECO]`, `DATA`, `NUMERO`).
-- Permissao de leitura em todas as tabelas mencionadas.
-- Ajuste manual de `@MES` e `@ANO` para o periodo desejado.

-- ▶️ 5. Como Usar
-- Pre-requisitos: Ambiente SQL Server com as tabelas populadas e relacionamentos consistentes.
-- Execucao: Configure `@MES` e `@ANO`, execute o script completo e confira a aba de mensagens para o resumo por produto.
-- Exemplo: Modifique o mes/ano para comparar desempenho mensal ou anual dos produtos.

-- 💡 6. Notas Tecnicas
-- Padroes aplicados: Uso de ROW_NUMBER garante ordenacao deterministica de produtos; agregacao com SUM cobre todos os itens do periodo.
-- Performance: Loop com subconsulta gera custo O(n^2); para grandes bases, prefira SELECT com GROUP BY unico ou CTE.
-- Melhorias possiveis: Transformar em stored procedure parametrizada; armazenar resultados em tabela temporaria em vez de apenas imprimir; substituir ROW_NUMBER por cursor ou `FOR XML PATH` conforme necessidade.

-- Script base do enunciado preservado abaixo para referencia:
-- SELECT SUM([ITENS NOTAS FISCAIS].QUANTIDADE * [ITENS NOTAS FISCAIS].[PRECO]) 
-- FROM [NOTAS FISCAIS]
-- INNER JOIN [ITENS NOTAS FISCAIS] 
-- ON [NOTAS FISCAIS].NUMERO = [ITENS NOTAS FISCAIS].NUMERO
-- WHERE  [ITENS NOTAS FISCAIS].[CODIGO DO PRODUTO] = @CODIGO
-- AND YEAR([NOTAS FISCAIS].DATA) = @ANO AND MONTH([NOTAS FISCAIS].DATA) = @MES;

-- Vamos continuar a criar novo SCRIPT baseado nas vendas por produtos.

DECLARE @CODIGO VARCHAR(10);
DECLARE @NOME VARCHAR(50);
DECLARE @NUMERO_PRODUTOS INT;
DECLARE @I INT;
DECLARE @MES INT, @ANO INT;
DECLARE @TOTAL_VENDAS FLOAT;

SET @MES = 1;
SET @ANO = 2015;

SELECT @NUMERO_PRODUTOS = COUNT(*)
FROM [TABELA DE PRODUTOS];

SET @I = 1;

WHILE @I <= @NUMERO_PRODUTOS
BEGIN
    SELECT @CODIGO = X.[CODIGO DO PRODUTO],
           @NOME = X.[NOME DO PRODUTO]
    FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY [CODIGO DO PRODUTO]) AS RowNum, *
        FROM [TABELA DE PRODUTOS]
    ) X
    WHERE X.RowNum = @I;

    SELECT @TOTAL_VENDAS = SUM([ITENS NOTAS FISCAIS].QUANTIDADE * [ITENS NOTAS FISCAIS].[PREÇO])
    FROM [NOTAS FISCAIS]
    INNER JOIN [ITENS NOTAS FISCAIS]
        ON [NOTAS FISCAIS].NUMERO = [ITENS NOTAS FISCAIS].NUMERO
    WHERE [ITENS NOTAS FISCAIS].[CODIGO DO PRODUTO] = @CODIGO
      AND YEAR([NOTAS FISCAIS].DATA) = @ANO
      AND MONTH([NOTAS FISCAIS].DATA) = @MES;

    PRINT 'Vendas para ' + @CODIGO + ' - ' + @NOME
        + ' no mes ' + CONVERT(VARCHAR(2), @MES)
        + ' e ano ' + CONVERT(VARCHAR(4), @ANO)
        + ' foi de ' + CONVERT(VARCHAR(20), @TOTAL_VENDAS);

    SET @I = @I + 1;
END;
