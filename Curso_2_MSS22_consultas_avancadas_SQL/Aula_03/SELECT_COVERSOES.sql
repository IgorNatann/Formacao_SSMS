-- ================================================================
-- Aula 03 | Conversoes e Formatacao de Dados no SQL Server
-- Objetivo: mostrar como converter datas e numeros para textos em formatos
-- especificos usando CONVERT, CAST e CONCAT em exemplos praticos.
-- ================================================================

-- Secao 1: convertendo a data/hora atual para texto
-- CONVERT com estilo 121 (ODBC canonical) gera "YYYY-MM-DD" com fracao.
SELECT CONVERT(VARCHAR(10), GETDATE(), 121) AS DATA_CURTA;
SELECT CONVERT(VARCHAR(25), GETDATE(), 121) AS DATA_COMPLETA;

-- Secao 2: revisando a tabela antes de aplicar conversoes
-- Visualize os dados crus para entender os tipos originais.
SELECT *
FROM TABELA_DE_CLIENTES;

-- Secao 3: formatando data de nascimento com estilo ISO 121
-- Traz a data com ano-mes-dia e tempo. Util para exportar padronizado.
SELECT
    DATA_DE_NASCIMENTO,
    CONVERT(VARCHAR(25), DATA_DE_NASCIMENTO, 121) AS DATA_FORMATADA
FROM TABELA_DE_CLIENTES;

-- Secao 4: exibindo datas em formato textual 106 ("DD Mon YYYY")
-- Estilo 106 gera abreviacoes de mes em ingles (ex.: 25 Oct 1990).
SELECT
    DATA_DE_NASCIMENTO,
    CONVERT(VARCHAR(25), DATA_DE_NASCIMENTO, 106) AS DATA_FORMATADA
FROM TABELA_DE_CLIENTES;

-- Secao 5: preparando precos para apresentacao textual
-- CONCAT combina texto literal com valores numericos; sem conversao o SQL
-- faz o cast implicito, mas o resultado depende do contexto.
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA
FROM TABELA_DE_PRODUTOS;

SELECT
    NOME_DO_PRODUTO,
    CONCAT('O preco de lista e: ', PRECO_DE_LISTA) AS PRECO_IMPLICITO
FROM TABELA_DE_PRODUTOS;

-- Secao 6: controlando o formato numerico com CAST explicito
-- CAST para VARCHAR evita variacoes indesejadas e permite definir tamanho.
SELECT
    NOME_DO_PRODUTO,
    CONCAT('O preco de lista e: ', CAST(PRECO_DE_LISTA AS VARCHAR(10))) AS PRECO_FORMATADO
FROM TABELA_DE_PRODUTOS;
