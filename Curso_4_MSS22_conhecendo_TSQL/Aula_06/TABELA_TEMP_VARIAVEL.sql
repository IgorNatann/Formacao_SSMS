-- 📋 1. Cabecalho
-- 🗂️ | Comparativo de Tabela Variavel e Temporaria
-- Proposito: Gerar a mesma sequencia de numeros em uma tabela variavel e em uma tabela temporaria para validar lacunas de notas fiscais.
-- Tecnologia: T-SQL (SQL Server)
-- Contexto: Curso 4 - Aula 06 | Atividade 05 | - Uso combinado de estruturas temporarias

-- ⚡ 2. Funcionamento Rapido
-- O que faz: Preenche uma tabela variavel e uma tabela temporaria (#) com o status de cada numero dentro de um intervalo.
-- Como funciona:
-- 1. Declara variaveis de controle e a estrutura da tabela variavel.
-- 2. Cria a tabela temporaria #TABELA_DE_NUMEROS.
-- 3. Itera do numero inicial ao final contando registros em [NOTAS FISCAIS].
-- 4. Inserir o numero e o respectivo status em ambas as estruturas.
-- 5. Exibe o conteudo final de cada tabela para comparacao.
-- Entrada -> Saida: Intervalo definido por variaveis -> Resultsets das tabelas @TABELA_DE_NUMEROS e #TABELA_DE_NUMEROS.

-- 🔧 3. Componentes Principais
-- Variaveis de intervalo: @NUMERO_INICIAL_SEQUENCIA, @NUMERO_FINAL_SEQUENCIA controlam o loop.
-- Contador auxiliar: @TESTE_NOTA_FISCAL recebe o total de notas por numero.
-- Tabela variavel @TABELA_DE_NUMEROS: mantem os dados na sessao atual sem criar objeto em tempdb.
-- Tabela temporaria #TABELA_DE_NUMEROS: replica a mesma carga em tempdb para demonstrar alternativa persistente.
-- Loop WHILE: percorre o intervalo, consulta [NOTAS FISCAIS] e grava o status correspondente.

-- 📦 4. Dependencias
-- Tabela [NOTAS FISCAIS] com coluna NUMERO acessivel para contagem.
-- Permissoes de leitura em [NOTAS FISCAIS] e de escrita para criar tabela temporaria.
-- Ajuste manual das variaveis de intervalo conforme necessidade.

-- ▶️ 5. Como Usar
-- Pre-requisitos: Conexao a um SQL Server que contenha [NOTAS FISCAIS].
-- Execucao: Ajuste @NUMERO_INICIAL_SEQUENCIA e @NUMERO_FINAL_SEQUENCIA e execute o script completo na mesma sessao.
-- Observacao: Utilize os SELECTs finais para comparar os resultados da tabela variavel e da tabela temporaria.

-- 💡 6. Notas Tecnicas
-- Padroes aplicados: Estruturas temporarias demonstram escopos distintos (variavel versus #).
-- Performance: Loop WHILE e O(n); considere geradores de numeros para intervalos maiores.
-- Melhorias possiveis: Transformar em stored procedure parametrizada; substituir o loop por CTE de numeros; incluir DROP para #TABELA_DE_NUMEROS quando nao for mais necessario.

DECLARE @NUMERO_INICIAL_SEQUENCIA INT, @NUMERO_FINAL_SEQUENCIA INT;
DECLARE @TESTE_NOTA_FISCAL INT;
DECLARE @TABELA_DE_NUMEROS TABLE ([NUMERO] INT, [STATUS] VARCHAR(20));
CREATE TABLE #TABELA_DE_NUMEROS ([NUMERO] INT, [STATUS] VARCHAR(20));

SET @NUMERO_INICIAL_SEQUENCIA = 1;
SET @NUMERO_FINAL_SEQUENCIA = 1000;

WHILE @NUMERO_INICIAL_SEQUENCIA <= @NUMERO_FINAL_SEQUENCIA
BEGIN
    SELECT @TESTE_NOTA_FISCAL = COUNT(*)
    FROM [NOTAS FISCAIS]
    WHERE NUMERO = @NUMERO_INICIAL_SEQUENCIA;

    IF @TESTE_NOTA_FISCAL = 1
    BEGIN
        INSERT INTO @TABELA_DE_NUMEROS ([NUMERO], [STATUS])
        VALUES (@NUMERO_INICIAL_SEQUENCIA, 'E nota fiscal');

        INSERT INTO #TABELA_DE_NUMEROS ([NUMERO], [STATUS])
        VALUES (@NUMERO_INICIAL_SEQUENCIA, 'E nota fiscal');
    END
    ELSE
    BEGIN
        INSERT INTO @TABELA_DE_NUMEROS ([NUMERO], [STATUS])
        VALUES (@NUMERO_INICIAL_SEQUENCIA, 'Nao e nota fiscal');

        INSERT INTO #TABELA_DE_NUMEROS ([NUMERO], [STATUS])
        VALUES (@NUMERO_INICIAL_SEQUENCIA, 'Nao e nota fiscal');
    END;

    SET @NUMERO_INICIAL_SEQUENCIA = @NUMERO_INICIAL_SEQUENCIA + 1;
END;

SELECT * FROM @TABELA_DE_NUMEROS;
SELECT * FROM #TABELA_DE_NUMEROS;
