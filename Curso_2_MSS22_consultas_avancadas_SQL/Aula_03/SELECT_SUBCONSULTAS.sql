-- ------------------------------------------------------------------
-- Documentacao: Uso de Subconsultas (Subqueries) em SQL Server
-- ------------------------------------------------------------------
-- Uma subconsulta e um comando SELECT aninhado dentro de outra instrucao SQL.
-- Ela gera um conjunto intermediario que a consulta externa utiliza para filtrar itens,
-- efetuar comparacoes ou compor colunas derivadas. Subconsultas podem ser:
--   * Nao correlacionadas: executadas uma unica vez, independentes da consulta externa.
--   * Correlacionadas: reavaliadas para cada linha da consulta externa.
-- Neste arquivo demonstramos uma subconsulta nao correlacionada aplicada em um filtro.
-- ------------------------------------------------------------------

-- Passo 1: Descobrindo os bairros atendidos pelos vendedores.
-- O DISTINCT elimina duplicidades, produzindo o conjunto de bairros unico.
SELECT DISTINCT BAIRRO
FROM TABELA_DE_VENDEDORES;

-- Passo 2: Consulta com filtro estatico, usando lista literal.
-- Util para fins didaticos, mas exige manutencao manual sempre que o conjunto mudar.
SELECT *
FROM TABELA_DE_CLIENTES
WHERE BAIRRO IN ('Cobacabana', 'Jardins', 'Santo Amaro', 'Tijuca');

-- Passo 3: Consulta com subconsulta no filtro.
-- A subconsulta reutiliza o resultado do Passo 1 e mantem o criterio sempre atualizado.
SELECT *
FROM TABELA_DE_CLIENTES
WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES);
