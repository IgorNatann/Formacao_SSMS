-- 🧾 1. Visao Geral
-- Proposito: criar uma funcao definida pelo usuario (UDF) que consolida o faturamento de notas fiscais por bairro.
-- Tecnologia: Microsoft SQL Server (T-SQL), utilizado no curso 5 da formacao MSSQLSERVER.
-- Contexto: desafio pratico de funcoes UDF para consultas de analytics.

-- ⚙️ 2. Funcionalidades Principais
-- - Demonstra consulta base que calcula o faturamento por bairro via joins.
-- - Implementa a funcao escalar dbo.FaturamentoPorBairro(@BAIRRO).
-- - Disponibiliza lista de bairros para validacao e exemplo de uso da funcao.
-- Fluxo: (1) SELECT de referencia, (2) criacao da UDF, (3) inspecao de bairros, (4) validacao da funcao.

-- 🧱 3. Estrutura do Codigo
-- 1. SELECT faturamento por bairro fixo ('Jardins') para conferência.
-- 2. CREATE FUNCTION dbo.FaturamentoPorBairro -> encapsula a logica.
-- 3. SELECT DISTINCT BAIRRO -> auxilia escolha de parametros.
-- 4. SELECT dbo.FaturamentoPorBairro('Bras') -> chamada de teste.

-- 🔍 4. Detalhamento das Funcoes/Classes
-- Nome: FaturamentoPorBairro(@BAIRRO VARCHAR(100))
-- Proposito: retornar o valor total comercializado para clientes de um bairro especifico.
-- Parametros:
--   @BAIRRO VARCHAR(100) -> bairro alvo (sensivel a acentuacao conforme dados source).
-- Retorno: DECIMAL(20,2) com o faturamento acumulado (quantidade * preco) das notas vinculadas a clientes residentes no bairro.
-- Exemplo de uso:
-- ```sql
-- SELECT dbo.FaturamentoPorBairro('Jardins') AS TotalFaturamento;
-- ```
-- Resultado esperado: soma de todos os itens de notas fiscais emitidas para clientes do bairro informado.

-- 📦 5. Dependencias e Imports
-- - Tabelas: [ITENS NOTAS FISCAIS] (inf), [NOTAS FISCAIS] (nf), [TABELA DE CLIENTES] (tc).
-- - Joins: INF.NUMERO = NF.NUMERO; TC.CPF = NF.CPF.
-- - Permissoes: SELECT nas tabelas e CREATE FUNCTION no schema dbo.

-- ⚙️ 6. Configuracoes e Variaveis
-- - Variavel interna: @FATURAMENTO DECIMAL(20,2) -> armazena resultado da soma e e retornada pela funcao.
-- - Parametro @BAIRRO deve existir em [TABELA DE CLIENTES]; utilize SELECT DISTINCT BAIRRO para evitar erros de digitacao.

-- ▶️ 7. Como Executar
-- 1. Executar o SELECT inicial para entender a logica de faturamento por bairro.
-- 2. Criar a funcao dbo.FaturamentoPorBairro.
-- 3. Consultar a lista de bairros com SELECT DISTINCT para escolher um parametro valido.
-- 4. Chamar a funcao passando o bairro desejado.
-- Exemplo completo em lote:
-- ```sql
-- DROP FUNCTION IF EXISTS dbo.FaturamentoPorBairro;
-- GO
-- CREATE FUNCTION dbo.FaturamentoPorBairro(@BAIRRO VARCHAR(100))
-- RETURNS DECIMAL(20,2)
-- AS
-- BEGIN
--     DECLARE @FATURAMENTO DECIMAL(20,2);
--     SELECT @FATURAMENTO = SUM(INF.QUANTIDADE * INF.[PRECO])
--     FROM [ITENS NOTAS FISCAIS] INF
--     INNER JOIN [NOTAS FISCAIS] NF ON INF.NUMERO = NF.NUMERO
--     INNER JOIN [TABELA DE CLIENTES] TC ON TC.CPF = NF.CPF
--     WHERE TC.BAIRRO = @BAIRRO;
--     RETURN @FATURAMENTO;
-- END;
-- GO
-- SELECT dbo.FaturamentoPorBairro('Jardins');
-- ```

-- 🛠️ 8. Observacoes Tecnicas
-- - A consulta utiliza inner joins e soma de produto (QUANTIDADE * PRECO) para compor o faturamento.
-- - A UDF retorna NULL quando nao ha registros para o bairro; trate com COALESCE no consumo se quiser zero.
-- - Atencao a acentuacao: nomes de bairro podem ter caracteres especiais; garanta collations adequados ou normalize entradas.
-- - Para performance, considere agregar por bairro com GROUP BY em vez de UDF quando precisar de varios bairros em uma unica consulta.

-- 📝 9. TODO/Melhorias Futuras
-- - Converter o retorno para DECIMAL(18,2) se preferir limite menor com mesma precisao.
-- - Permitir filtragem adicional (periodo, cidade) expandindo a funcao ou criando parametros.
-- - Criar view materializada ou tabela de resumo por bairro para relatorios frequentes.
-- - Adicionar validacao que retorna mensagem personalizada quando bairro nao existir.

-- ================================================================
-- Desafio: Faturamento total por bairro usando UDF
-- ================================================================

-- 🔎 Consulta referencia com bairro 'Jardins'.
SELECT SUM(INF.QUANTIDADE * INF.[PRECO]) AS FATURAMENTO
FROM [ITENS NOTAS FISCAIS] INF
    INNER JOIN [NOTAS FISCAIS] NF
    ON INF.NUMERO = NF.NUMERO
    INNER JOIN [TABELA DE CLIENTES] TC
    ON TC.CPF = NF.CPF
WHERE TC.BAIRRO = 'Jardins';

-- 🧮 Funcao que retorna o faturamento acumulado para um bairro informado.
CREATE FUNCTION dbo.FaturamentoPorBairro(@BAIRRO VARCHAR(100))
RETURNS DECIMAL(20,2)
BEGIN
    DECLARE @FATURAMENTO DECIMAL(20,2);

    SELECT @FATURAMENTO = SUM(INF.QUANTIDADE * INF.[PRECO])
    FROM [ITENS NOTAS FISCAIS] INF
        INNER JOIN [NOTAS FISCAIS] NF
        ON INF.NUMERO = NF.NUMERO
        INNER JOIN [TABELA DE CLIENTES] TC
        ON TC.CPF = NF.CPF
    WHERE TC.BAIRRO = @BAIRRO;

    RETURN @FATURAMENTO;
END;

-- 📍 Lista de bairros cadastrados para verificacao de parametros.
SELECT DISTINCT BAIRRO
FROM [TABELA DE CLIENTES];

-- Validação manual dos bairros (copiar para conferência):
-- Agua Santa
-- Barra da Tijuca
-- Bras
-- Cidade Nova
-- Humaita
-- Inhauma
-- Jardins
-- Lapa
-- Piedade
-- Santo Amaro
-- Tijuca

-- ✅ Exemplo de uso da funcao criada.
SELECT dbo.FaturamentoPorBairro('Bras') AS FaturamentoBairro;
