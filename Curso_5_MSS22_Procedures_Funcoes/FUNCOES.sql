-- 🧾 1. Visao Geral
-- Proposito: demonstrar como encapsular o calculo de faturamento de notas fiscais em uma funcao escalar reutilizavel no SQL Server.
-- Tecnologia: Microsoft SQL Server (T-SQL); compatível com SSMS, Azure Data Studio e extensões SQL no VS Code.
-- Contexto: Curso 5 | Aula 01 | atividade 04 da (Formacao MSSQLSERVER) focada em procedures e funcoes.

-- ⚙️ 2. Funcionalidades Principais
-- - Calcula o valor total vendido de uma nota fiscal especifica (consulta ad-hoc).
-- - Implementa a funcao dbo.FaturamentoNota para centralizar esse calculo.
-- - Utiliza a funcao em uma consulta final mostrando o faturamento por numero de nota.
-- Fluxo: (1) consulta exemplo para conferencia, (2) criacao da funcao, (3) uso da funcao em SELECT.

-- 🧱 3. Estrutura do Codigo
-- 1. SELECT inicial (benchmark manual) para a nota 100.
-- 2. Bloco CREATE FUNCTION FaturamentoNota com declaracao de variavel e retorno.
-- 3. SELECT final aplicando a funcao em todas as notas registradas.

-- 🔍 4. Detalhamento das Funcoes/Classes
-- Nome: FaturamentoNota(@NUMERO INT)
-- Proposito: calcular o faturamento total (soma de quantidade x preco unitario) de uma nota fiscal.
-- Parametros:
--   @NUMERO INT -> numero da nota fiscal a ser avaliada.
-- Retorno: FLOAT contendo o total vendido para a nota informada; retorna NULL se nao houver itens correspondentes.
-- Exemplo de uso:
-- ```sql
-- SELECT dbo.FaturamentoNota(100) AS TotalDaNota;
-- ```
-- Resultado esperado: valor numerico com o total da nota 100, equivalente a somar QUANTIDADE * PRECO em [ITENS NOTAS FISCAIS].

-- 📦 5. Dependencias e Imports
-- - Tabela dbo.[ITENS NOTAS FISCAIS]: origem de QUANTIDADE e [PRECO]; o nome original pode conter acentuacao (PREÇO).
-- - Tabela [NOTAS FISCAIS]: utilizada para listar numeros de notas no uso da funcao.
-- - Permissoes: necessario SELECT nas tabelas acima e CREATE FUNCTION no schema dbo.

-- ⚙️ 6. Configuracoes e Variaveis
-- - Variaveis de ambiente: nenhuma obrigatoria; use a mesma conexao do banco do curso.
-- - Variaveis internas (na funcao):
--   @FATURAMENTO FLOAT -> acumula o total calculado pela soma; retorna o valor final ao fim do bloco.
-- - Ajuste tipico: substitua o parametro @NUMERO na consulta ad-hoc ou no SELECT final conforme a nota que deseja auditar.

-- ▶️ 7. Como Executar
-- 1. Abrir o arquivo no SSMS, Azure Data Studio ou VS Code com Continue/Codex.
-- 2. Executar a consulta inicial para validar o total de uma nota especifica.
-- 3. Executar o bloco CREATE FUNCTION (certifique-se de usar um GO antes/após, se estiver em lote maior).
-- 4. Executar o SELECT final para verificar o faturamento de todas as notas.
-- Exemplo em SSMS:
-- ```sql
-- -- Passo 1: validar nota isolada
-- SELECT dbo.FaturamentoNota(100);
-- -- Passo 2: listar todos os faturamentos
-- SELECT NUMERO, dbo.FaturamentoNota(NUMERO) AS Faturamento FROM [NOTAS FISCAIS];
-- ```

-- 🛠️ 8. Observacoes Tecnicas
-- - Padrao T-SQL: funcao escalar deve conter RETURN unico; foi usado FLOAT para simplificar, mas DECIMAL(18,2) pode evitar arredondamentos indesejados.
-- - Tratamento de erros: nao aplicado; considere validar existencia da nota antes da soma ou tratar NULL no consumo.
-- - Performance: funcoes escalares podem afetar consultas grandes; avaliar substituir por CROSS APPLY em cenarios de alto volume.
-- - Compatibilidade: em SQL Server, multiplas consultas no mesmo script podem requerer `GO` para separar batches antes de CREATE FUNCTION.

-- 📝 9. TODO/Melhorias Futuras
-- - Alterar o retorno da funcao para DECIMAL(18,2) garantindo precisao financeira.
-- - Adicionar tratamento para notas inexistentes retornando 0 em vez de NULL.
-- - Criar funcoes adicionais para quantidade total ou margem por nota.
-- - Implementar testes com dados ficticios para validar arredondamentos.

-- ================================================================
-- Script demonstrativo de faturamento por nota fiscal
-- ================================================================

-- 🔎 Benchmark manual: calcula o total da nota 100 diretamente para conferência.
SELECT SUM(QUANTIDADE * [PRECO]) AS TOTAL_VENDIDO
FROM dbo.[ITENS NOTAS FISCAIS]
WHERE NUMERO = 100;

-- 🧮 Funcao escalar que retorna o faturamento para qualquer numero informado.
CREATE FUNCTION dbo.FaturamentoNota(@NUMERO AS INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @FATURAMENTO FLOAT;

    SELECT @FATURAMENTO = SUM(QUANTIDADE * [PREÇO])
    FROM dbo.[ITENS NOTAS FISCAIS]
    WHERE NUMERO = @NUMERO;

    RETURN @FATURAMENTO;
END;

-- 📊 Uso da funcao para listar o faturamento de todas as notas registradas.
SELECT NUMERO,
       dbo.FaturamentoNota(NUMERO) AS Faturamento
FROM [NOTAS FISCAIS];
