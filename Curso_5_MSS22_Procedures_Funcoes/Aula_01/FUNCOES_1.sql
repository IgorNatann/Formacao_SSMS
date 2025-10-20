-- 🧾 1. Visao Geral
-- Proposito: mostrar diferentes maneiras de gerar numeros aleatorios em T-SQL, culminando em uma funcao parametrizavel.
-- Tecnologia: Microsoft SQL Server (T-SQL); aplicavel em SSMS, Azure Data Studio e VS Code com extensoes SQL.
-- Contexto: exercicio do Curso 5 (Formacao MSSQLSERVER) sobre funcoes e visoes auxiliares.

-- ⚙️ 2. Funcionalidades Principais
-- - Consulta simples usando RAND() para obter valor decimal aleatorio entre 0 e 1.
-- - Calculo de inteiro aleatorio em faixa fixa (100 a 500) via ROUND.
-- - VIEW VW_ALEATORIO que expõe o valor de RAND() para reuso em funcoes.
-- - Funcao dbo.NumeroAleatorio que gera inteiro aleatorio dentro de faixa arbitraria.
-- Fluxo: (1) demonstra RAND, (2) aplica transformacao linear, (3) cria view para encapsular RAND, (4) define funcao escalar, (5) executa funcao.

-- 🧱 3. Estrutura do Codigo
-- 1. SELECT RAND() -> baseline de numero aleatorio (0 <= x < 1).
-- 2. SELECT com ROUND -> exemplo de intervalo customizado.
-- 3. CREATE VIEW VW_ALEATORIO -> consulta persistente com RAND().
-- 4. SELECT * FROM VW_ALEATORIO -> teste da view.
-- 5. CREATE FUNCTION NumeroAleatorio -> funcao escalar com parametros minimo e maximo.
-- 6. SELECT dbo.NumeroAleatorio -> chamada demonstrativa.

-- 🔍 4. Detalhamento das Funcoes/Classes
-- Nome: NumeroAleatorio(@VAL_MIN INT, @VAL_MAX INT)
-- Proposito: retornar inteiro aleatorio dentro do intervalo inclusivo [@VAL_MIN, @VAL_MAX].
-- Parametros:
--   @VAL_MIN INT -> limite inferior desejado.
--   @VAL_MAX INT -> limite superior desejado.
-- Retorno: INT representando numero aleatorio arredondado para zero casas decimais.
-- Exemplo de uso:
-- ```sql
-- SELECT dbo.NumeroAleatorio(1, 10) AS NumeroSorteado;
-- ```
-- Resultado esperado: valor inteiro entre 1 e 10; os resultados variam a cada execucao.

-- 📦 5. Dependencias e Imports
-- - Função RAND(): gerador pseudo-aleatorio interno do SQL Server.
-- - VIEW VW_ALEATORIO: utilizada para captar um valor de RAND() visível em contexto permissoes; deve ser criada antes da funcao.
-- - Permissoes: CREATE VIEW e CREATE FUNCTION, alem de SELECT sobre a view.

-- ⚙️ 6. Configuracoes e Variaveis
-- - Variaveis internas na funcao:
--   @ALEATORIO INT -> recebe resultado inteiro final.
--   @VAL_ALEATORIO FLOAT -> armazena valor aleatorio obtido da view.
-- - Ajustes: altere @VAL_MIN/@VAL_MAX na chamada final para testar intervalos diferentes; considere usar RAND(seed) para reproducibilidade.

-- ▶️ 7. Como Executar
-- 1. Executar os SELECT iniciais para observar o comportamento de RAND e ROUND.
-- 2. Criar a view VW_ALEATORIO (se ja existir, dropar antes).
-- 3. Executar SELECT * FROM VW_ALEATORIO para validar o valor aleatorio atual.
-- 4. Criar a funcao dbo.NumeroAleatorio.
-- 5. Chamar a funcao com os parametros desejados.
-- Exemplo completo:
-- ```sql
-- DROP VIEW IF EXISTS VW_ALEATORIO;
-- GO
-- CREATE VIEW VW_ALEATORIO AS SELECT RAND() AS VAL_ALETORIO;
-- GO
-- DROP FUNCTION IF EXISTS dbo.NumeroAleatorio;
-- GO
-- CREATE FUNCTION dbo.NumeroAleatorio(@VAL_MIN INT, @VAL_MAX INT) RETURNS INT AS
-- BEGIN
--     DECLARE @VAL_ALEATORIO FLOAT, @ALEATORIO INT;
--     SELECT @VAL_ALEATORIO = VAL_ALETORIO FROM VW_ALEATORIO;
--     SET @ALEATORIO = ROUND(((@VAL_MAX - @VAL_MIN - 1) * @VAL_ALEATORIO + @VAL_MIN), 0);
--     RETURN @ALEATORIO;
-- END;
-- GO
-- SELECT dbo.NumeroAleatorio(1, 10);
-- ```

-- 🛠️ 8. Observacoes Tecnicas
-- - RAND() sem SEED gera mesmo valor dentro do mesmo batch; separar comandos com GO garante novos numeros.
-- - Utilizar VIEW para armazenar RAND() e acessa-lo em funcao contorna a restricao de chamar RAND() diretamente dentro de funcao escalar.
-- - Formula para intervalo: `ROUND(((max - min - 1) * rand + min), 0)` gera valores aproximados; ajuste para evitar excluir limites.
-- - Performance: operacoes sao leves; cuidado apenas com chamadas massivas da funcao em grandes datasets devido a funcoes escalares.

-- 📝 9. TODO/Melhorias Futuras
-- - Ajustar formula para incluir exatamente ambos os limites (ex.: usar `(@VAL_MAX - @VAL_MIN) * RAND()` + @VAL_MIN).
-- - Adicionar tratamento para casos onde @VAL_MIN >= @VAL_MAX (retornar erro ou valor padrao).
-- - Criar versao baseada em CRYPT_GEN_RANDOM para aplicacoes que exigem numeros menos previsiveis.
-- - Elaborar procedure que sorteia conjuntos unicos sem repeticao.

-- ================================================================
-- Demonstrações de geração de números aleatórios em SQL Server
-- ================================================================

-- 🔢 Valor aleatorio entre 0 e 1 utilizando RAND().
SELECT RAND();

-- 🎯 Numero aleatorio arredondado entre 100 e 500 via transformacao linear.
SELECT ROUND(((500 - 100 - 1) * RAND() + 100), 0);

-- 👁️ View que expõe um valor aleatorio para ser lido em funcoes.
CREATE VIEW VW_ALEATORIO AS
SELECT RAND() AS VAL_ALETORIO;

SELECT * FROM VW_ALEATORIO;

-- 🎲 Funcao que devolve inteiro aleatorio entre minimo e maximo informados.
CREATE FUNCTION dbo.NumeroAleatorio(@VAL_MIN INT, @VAL_MAX INT)
RETURNS INT
BEGIN
    DECLARE @ALEATORIO INT;
    DECLARE @VAL_ALEATORIO FLOAT;

    SELECT @VAL_ALEATORIO = VAL_ALETORIO
    FROM VW_ALEATORIO;

    SET @ALEATORIO = ROUND(((@VAL_MAX - @VAL_MIN - 1) * @VAL_ALEATORIO + @VAL_MIN), 0);

    RETURN @ALEATORIO;
END;

SELECT dbo.NumeroAleatorio(1, 1000);
