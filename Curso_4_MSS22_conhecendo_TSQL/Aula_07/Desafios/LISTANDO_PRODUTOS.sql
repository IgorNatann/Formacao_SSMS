-- 📋 1. Cabecalho
-- 🛒 | Listagem Sequencial de Produtos
-- Proposito: Reaplicar o padrao de iteracao apresentado na aula para imprimir codigo e nome de cada produto.
-- Tecnologia: T-SQL (SQL Server)
-- Contexto: Curso 4 - Aula 07 - Atividade 03 - Desafio de produtos

-- ⚡ 2. Funcionamento Rapido
-- O que faz: Percorre todos os produtos com um loop WHILE e imprime `codigo - nome` na aba de mensagens.
-- Como funciona:
-- 1. Declara variaveis para codigo, nome, total de produtos e indice.
-- 2. Calcula o total de registros em [TABELA DE PRODUTOS].
-- 3. Inicializa @I com 1 (primeiro produto).
-- 4. Subconsulta com ROW_NUMBER retorna o produto correspondente a cada posicao.
-- 5. PRINT exibe o par codigo/nome e incrementa o indice ate percorrer toda a tabela.
-- Entrada -> Saida: Sem entrada externa -> Saida textual ordenada por codigo do produto.

-- 🔧 3. Componentes Principais
-- Variaveis: @COD_PROD, @NOME_PROD, @NUM_PROD e @I armazenam dados e controle.
-- ROW_NUMBER(): cria um indice ordenado por `[CODIGO DO PRODUTO]` para acesso sequencial.
-- Loop WHILE + PRINT: garante iteracao completa e exibicao de cada item.

-- 📦 4. Dependencias
-- Tabela [TABELA DE PRODUTOS] com colunas `[CODIGO DO PRODUTO]` e `[NOME DO PRODUTO]`.
-- Permissao de leitura nessa tabela.

-- ▶️ 5. Como Usar
-- Pre-requisitos: Ambiente SQL Server com [TABELA DE PRODUTOS] populada.
-- Execucao: Rode o script completo e confira o resultado na aba de mensagens do SSMS/Azure Data Studio.
-- Exemplo: Utilize o output para validar dados ou exporte via captura da janela de mensagens.

-- 💡 6. Notas Tecnicas
-- Padroes aplicados: `ROW_NUMBER` garante ordenacao deterministica; o loop segue padrao didatico.
-- Performance: Abordagem O(n^2) por reexecutar a subconsulta a cada iteracao; para grandes volumes, prefira SELECT direto, cursor ou CTE.
-- Melhorias possiveis: Transformar em stored procedure parametrizada; substituir o loop por `SELECT CONCAT(...) FROM [TABELA DE PRODUTOS] ORDER BY ...`.

-- Script de referencia (clientes) preservado abaixo:
-- DECLARE @CPF VARCHAR(11);
-- DECLARE @NOME VARCHAR(100);
-- DECLARE @NUMERO_CLIENTES INT;
-- DECLARE @I INT;
-- SELECT @NUMERO_CLIENTES = COUNT(*) FROM [TABELA DE CLIENTES];
-- SET @I = 1;
-- WHILE @I <= @NUMERO_CLIENTES
-- BEGIN
--     SELECT @CPF = X.CPF, @NOME = X.NOME
--     FROM (SELECT ROW_NUMBER() OVER (ORDER BY CPF) AS RowNum, * FROM [TABELA DE CLIENTES]) X
--     WHERE X.RowNum = @I;
--     PRINT @CPF + ' - ' + @NOME;
--     SET @I = @I + 1;
-- END;

-- Aplicando o mesmo padrao para produtos:

DECLARE @COD_PROD VARCHAR(11);
DECLARE @NOME_PROD VARCHAR(100);
DECLARE @NUM_PROD INT;
DECLARE @I INT;

SELECT @NUM_PROD = COUNT(*)
FROM [TABELA DE PRODUTOS];

SET @I = 1;

WHILE @I <= @NUM_PROD
BEGIN
    SELECT @COD_PROD = X.[CODIGO DO PRODUTO],
           @NOME_PROD = X.[NOME DO PRODUTO]
    FROM (
        SELECT ROW_NUMBER() OVER (ORDER BY [CODIGO DO PRODUTO]) AS RowNum, *
        FROM [TABELA DE PRODUTOS]
    ) X
    WHERE X.RowNum = @I;

    PRINT @COD_PROD + ' - ' + @NOME_PROD;

    SET @I = @I + 1;
END;
