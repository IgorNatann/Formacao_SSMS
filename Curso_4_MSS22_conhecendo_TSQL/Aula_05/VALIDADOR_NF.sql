-- 📋 1. Cabecalho
-- 🧾 | Validador de Sequencia de Notas Fiscais
-- Proposito: identificar lacunas na numeracao de notas fiscais dentro de um intervalo definido.
-- Tecnologia: T-SQL (Microsoft SQL Server)
-- Contexto: Curso 4 · Aula 05 · Atividade 07

-- ⚡ 2. Funcionamento Rapido
-- O que faz: recria uma tabela auxiliar com cada numero do intervalo e marca se existe em [NOTAS FISCAIS].
-- Como funciona:
-- 1. Consulta limites atuais com MIN/MAX.
-- 2. Dropa e recria a tabela auxiliar [TABELA DE NUMEROS].
-- 3. Define variaveis de intervalo e contador.
-- 4. Loop WHILE percorre cada numero e insere o status correspondente.
-- 5. SELECT final exibe a consolidacao.
-- Entrada -> Saida: intervalo configurado -> tabela auxiliar com colunas NUMERO e STATUS.

-- 🔧 3. Componentes Principais
-- Consulta MIN/MAX: identifica menor e maior NUMERO ja registrados.
-- DDL condicional: dropa/cria [TABELA DE NUMEROS] com colunas NUMERO e STATUS.
-- Variaveis de controle: @NUMERO_INICIAL_SEQUENCIA, @NUMERO_FINAL_SEQUENCIA, @TESTE_NOTA_FISCAL.
-- Loop WHILE: percorre o intervalo, conta ocorrencias e grava status.
-- SELECT final: retorna o conteudo de [TABELA DE NUMEROS].

-- 📦 4. Dependencias
-- Tabela [NOTAS FISCAIS]: prove a coluna NUMERO que sera auditada.
-- Permissoes: leitura em [NOTAS FISCAIS] e DDL/DML para [TABELA DE NUMEROS].

-- ▶️ 5. Como Usar
-- Pre-requisitos: acesso a um SQL Server com as tabelas citadas e permissoes de leitura/escrita.
-- Execucao: ajuste as variaveis @NUMERO_INICIAL_SEQUENCIA e @NUMERO_FINAL_SEQUENCIA e execute o script completo.
-- Exemplo pratico: use MIN/MAX retornados para configurar o intervalo e revisar a saida para localizar lacunas.

-- 💡 6. Notas Tecnicas
-- Padroes aplicados: IF OBJECT_ID garante idempotencia; SET NOCOUNT ON reduz mensagens de contagem.
-- Performance: loop WHILE e O(n); para faixas grandes, considere CTE ou tabela de numeros.
-- Melhorias possiveis: transformar em stored procedure parametrizada; adicionar metadados de auditoria.


-- Passo 1: verificar menor e maior numero existentes em NOTAS FISCAIS
SELECT MIN(NUMERO) AS MENOR_NUMERO,
       MAX(NUMERO) AS MAIOR_NUMERO
FROM [NOTAS FISCAIS];

-- Passo 2: preparar tabela auxiliar (drop + create)
IF OBJECT_ID('TABELA DE NUMEROS', 'U') IS NOT NULL
    DROP TABLE [TABELA DE NUMEROS];
IF OBJECT_ID('TABELA DE NUMEROS', 'U') IS NULL
    CREATE TABLE [TABELA DE NUMEROS]
    (
        [NUMERO] INT,
        [STATUS] VARCHAR(20)
    );

-- Passo 3: declarar variaveis para percorrer a sequencia
DECLARE @NUMERO_INICIAL_SEQUENCIA INT,
        @NUMERO_FINAL_SEQUENCIA INT,
        @TESTE_NOTA_FISCAL INT;

SET @NUMERO_INICIAL_SEQUENCIA = 1;    -- inicie conforme necessidade
SET @NUMERO_FINAL_SEQUENCIA = 90000;  -- limite superior do intervalo

-- Passo 4: laço que verifica numero a numero e popula a tabela auxiliar
SET NOCOUNT ON;
WHILE @NUMERO_INICIAL_SEQUENCIA <= @NUMERO_FINAL_SEQUENCIA
BEGIN
    -- Conta quantas notas existem com o numero atual para definir o status correspondente.
    SELECT @TESTE_NOTA_FISCAL = COUNT(*)
    FROM [NOTAS FISCAIS]
    WHERE NUMERO = @NUMERO_INICIAL_SEQUENCIA;

    IF @TESTE_NOTA_FISCAL = 1
        INSERT INTO [TABELA DE NUMEROS] ([NUMERO], [STATUS])
        VALUES (@NUMERO_INICIAL_SEQUENCIA, 'E nota fiscal'); -- Registra nota encontrada.
    ELSE
        INSERT INTO [TABELA DE NUMEROS] ([NUMERO], [STATUS])
        VALUES (@NUMERO_INICIAL_SEQUENCIA, 'Nao e nota fiscal'); -- Registra lacuna identificada.

    SET @NUMERO_INICIAL_SEQUENCIA = @NUMERO_INICIAL_SEQUENCIA + 1;
END;

-- Passo 5: consultar a tabela auxiliar para revisar os resultados
SELECT *
FROM [TABELA DE NUMEROS];
