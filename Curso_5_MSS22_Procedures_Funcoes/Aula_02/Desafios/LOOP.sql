-- 🧭 1. Visao Geral
-- Proposito: listar todos os bairros distintos de uma cidade especifica usando loop T-SQL, simulando iteracao linha a linha.
-- Tecnologia: Microsoft SQL Server (T-SQL); exercicio do Curso 5, Aula 02.
-- Contexto: desafio que reforca declaracao de variaveis, tabelas em memoria e controle com WHILE.

-- ⚙️ 2. Funcionalidades Principais
-- - Conta quantos bairros distintos existem na cidade alvo.
-- - Percorre cada bairro via WHILE com OFFSET/FETCH para empilhar em tabela temporaria.
-- - Retorna lista ordenada de bairros ao final.
-- Fluxo: (1) configurar variaveis, (2) contar linhas, (3) loop WHILE com SELECT incremental, (4) exibir resultado.

-- 🧱 3. Estrutura do Codigo
-- 1. Declaracao de variaveis escalares e tabela @TABELA_BAIRROS.
-- 2. Atribuicao da cidade alvo e inicializacao do contador.
-- 3. Consulta de contagem de bairros distintos (subconsulta X).
-- 4. Loop WHILE que captura um bairro por vez e insere na tabela.
-- 5. SELECT final ordenado.

-- 🔍 4. Detalhamento das Funcoes/Classes
-- Este script nao define funcoes; o bloco principal equivale a procedimento inline:
-- Nome: loop_bairros_por_cidade
-- Proposito: gerar lista de bairros distintos para @CIDADE.
-- Parametros: @CIDADE VARCHAR(50) definido no script; ajustar para cidade desejada.
-- Retorno: resultset final do SELECT * FROM @TABELA_BAIRROS.
-- Exemplo de uso:
-- ```sql
-- -- Ajuste @CIDADE para 'Sao Paulo' e execute todo o bloco para listar os bairros da capital paulista.
-- ```

-- 📦 5. Dependencias e Imports
-- - Tabela [TABELA DE CLIENTES]: precisa conter colunas BAIRRO e CIDADE.
-- - Permissoes: SELECT nesta tabela.

-- ⚙️ 6. Configuracoes e Variaveis
-- - Variaveis escalares:
--   @BAIRRO VARCHAR(50) -> armazena o bairro atual no loop.
--   @CIDADE VARCHAR(50) -> define a cidade alvo (default 'Rio de Janeiro').
--   @LINHAS_BAIRRO INT -> total de bairros distintos calculados anteriormente.
--   @CONTADOR INT -> indice utilizado para navegar com OFFSET.
-- - Variavel tabela:
--   @TABELA_BAIRROS ([BAIRRO] VARCHAR(50)) -> acumula os bairros extraidos.
-- - Ajuste principal: alterar @CIDADE para a localidade desejada antes de executar.

-- ▶️ 7. Como Executar
-- 1. Abrir o script no SSMS, Azure Data Studio ou VS Code.
-- 2. Revisar/alterar o valor de @CIDADE conforme necessidade.
-- 3. Executar o script completo; o ultimo SELECT apresentara a lista de bairros.
-- 4. Opcional: adicionar PRINTs dentro do loop para acompanhar o progresso.

-- 🛠️ 8. Observacoes Tecnicas
-- - O loop usa OFFSET/FETCH, recurso do SQL Server 2012+, para buscar um bairro por iteracao.
-- - Abordagem set-based (um unico SELECT DISTINCT) seria mais simples; o loop serve para praticar controle de fluxo.
-- - Certifique-se de que @LINHAS_BAIRRO e @CONTADOR estao coerentes para evitar loop infinito.
-- - SELECT final usa ORDER BY BAIRRO para garantir ordenacao consistente apos insercoes.

-- 📝 9. TODO/Melhorias Futuras
-- - Transformar o bloco em stored procedure parametrizada.
-- - Substituir o loop por SELECT DISTINCT direto quando nao for necessario processamento iterativo.
-- - Armazenar resultado em tabela temporaria global para reuso em outras consultas.
-- - Incluir filtro adicional por estado (UF) caso haja cidades homonimas.

-- ================================================================
-- Desafio: listar bairros de uma cidade usando WHILE
-- ================================================================

DECLARE @BAIRRO VARCHAR(50), @CIDADE VARCHAR(50);
DECLARE @LINHAS_BAIRRO INT, @CONTADOR INT;
DECLARE @TABELA_BAIRROS TABLE ([BAIRRO] VARCHAR(50));

SET @CIDADE = 'Rio de Janeiro';
SET @CONTADOR = 0;

SELECT @LINHAS_BAIRRO = COUNT(*)
FROM (
    SELECT DISTINCT BAIRRO
    FROM [TABELA DE CLIENTES]
    WHERE CIDADE = @CIDADE
) X;

WHILE @CONTADOR < @LINHAS_BAIRRO
BEGIN
    -- Busca o bairro correspondente ao indice atual usando OFFSET/FETCH.
    SELECT DISTINCT @BAIRRO = BAIRRO
    FROM [TABELA DE CLIENTES]
    WHERE CIDADE = @CIDADE
    ORDER BY BAIRRO
    OFFSET @CONTADOR ROWS
    FETCH NEXT 1 ROWS ONLY;

    INSERT INTO @TABELA_BAIRROS (BAIRRO) VALUES (@BAIRRO);
    SET @CONTADOR = @CONTADOR + 1;
END;

SELECT *
FROM @TABELA_BAIRROS
ORDER BY BAIRRO;
