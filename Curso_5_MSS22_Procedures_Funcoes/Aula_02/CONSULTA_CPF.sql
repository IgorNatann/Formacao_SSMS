-- 🧾 1. Visao Geral
-- Proposito: expor os registros de notas fiscais vinculadas a um CPF específico usando uma Table-Valued Function (TVF).
-- Tecnologia: Microsoft SQL Server (T-SQL), conteúdo da Aula 02 do Curso 5.
-- Contexto: exemplo didático de função inline que facilita consultas parametrizadas por CPF.

-- ⚙️ 2. Funcionalidades Principais
-- - Cria a função dbo.ListaNotasClientes que retorna todas as notas de um CPF.
-- - Demonstra chamada da função com um CPF de exemplo.
-- Fluxo: (1) definir função inline, (2) executar SELECT utilizando a função.

-- 🧱 3. Estrutura do Código
-- 1. CREATE FUNCTION ... RETURNS TABLE AS RETURN SELECT ... -> definição da TVF.
-- 2. SELECT final para testar a função com CPF específico.

-- 🔍 4. Detalhamento das Funcoes/Classes
-- Nome: ListaNotasClientes(@CPF VARCHAR(11))
-- Proposito: retornar todas as colunas de [NOTAS FISCAIS] associadas ao CPF informado.
-- Parametros:
--   @CPF VARCHAR(11) -> identificador do cliente (formato sem máscara).
-- Retorno: tabela inline com os registros que correspondem ao CPF.
-- Exemplo de uso:
-- ```sql
-- SELECT NUMERO, DATA_EMISSAO
-- FROM dbo.ListaNotasClientes('1471156710');
-- ```
-- Resultado esperado: todas as notas e campos adicionais, permitindo filtros subsequentes (ex.: por período).

-- 📦 5. Dependencias e Imports
-- - Tabela [NOTAS FISCAIS]: a função lê todos os campos diretamente desta tabela.
-- - Permissões: CREATE FUNCTION no schema dbo e SELECT na tabela em questão.

-- ⚙️ 6. Configuracoes e Variaveis
-- - Parâmetro principal: @CPF deve conter 11 dígitos conforme modelo de dados do curso.
-- - Não há variáveis internas; a função é inline (retorna SELECT diretamente).

-- ▶️ 7. Como Executar
-- 1. Criar a função com o comando fornecido (use GO antes/depois em scripts maiores).
-- 2. Invocar a função em um SELECT, fornecendo o CPF desejado.
-- 3. Opcional: combinar com filtros adicionais ou JOINs para cruzar outras tabelas.

-- 🛠️ 8. Observacoes Tecnicas
-- - TVF inline permite uso direto em FROM/INNER JOIN, preservando capacidade de otimização do SQL Server.
-- - Retorna todos os campos; adapte o SELECT interno se quiser limitar colunas.
-- - Considerar validar ou normalizar formato do CPF antes da chamada, caso os dados incluam máscara.

-- 📝 9. TODO/Melhorias Futuras
-- - Adicionar parâmetros opcionais (intervalo de datas, status) para refinar resultados.
-- - Criar índice em [NOTAS FISCAIS].CPF caso consultas por CPF sejam frequentes.
-- - Expor versão que retorna apenas colunas relevantes (ex.: número, data, valor).
-- - Incluir tratamento para CPFs inexistentes, retornando mensagem padronizada via OUTER APPLY em consultas maiores.

-- ================================================================
-- Função: listar notas fiscais por CPF
-- ================================================================

CREATE FUNCTION dbo.ListaNotasClientes (@CPF VARCHAR(11))
RETURNS TABLE
AS
RETURN
    SELECT *
    FROM [NOTAS FISCAIS]
    WHERE CPF = @CPF;

SELECT *
FROM dbo.ListaNotasClientes('1471156710');
