-- 📋 1. Cabecalho
-- 🗃️ | Exemplos de Tabelas Temporarias (Local e Global)
-- Proposito: Demonstrar criacao, carga e consulta em tabelas temporarias locais (#) e globais (##).
-- Tecnologia: T-SQL (SQL Server)
-- Contexto: Curso 4 - Aula 06 | Atividade 05 | - Tabelas Temporarias

-- ⚡ 2. Funcionamento Rapido
-- O que faz: Cria #TABELA01, manipula registros locais e interage com a tabela temporaria global ##TABELA02.
-- Como funciona:
-- 1. Cria #TABELA01 com colunas ID e NOME.
-- 2. Insere um registro inicial na tabela local.
-- 3. Consulta a tabela local via SELECT.
-- 4. Tenta adicionar um segundo registro (requer sintaxe VALUES para funcionar).
-- 5. Consulta e insere dados na tabela global ##TABELA02.
-- Entrada -> Saida: Valores de ID/NOME -> Resultados exibidos em SELECTs sobre tabelas temporarias.

-- 🔧 3. Componentes Principais
-- #TABELA01: tabela temporaria local, visivel apenas na sessao corrente.
-- ##TABELA02: tabela temporaria global, compartilhada entre sessoes ate ser dropada.
-- Comandos INSERT/SELECT: exemplificam manipulacao basica de dados temporarios.

-- 📦 4. Dependencias
-- Instancia SQL Server com permissao para criar objetos em tempdb.
-- Sessao que ja tenha criado ##TABELA02 (ou execucao previa do script TABELA_TEMPORARIA_2).

-- ▶️ 5. Como Usar
-- Pre-requisitos: Conexao ativa ao SQL Server; execute antes o script que cria ##TABELA02 para evitar erro de objeto inexistente.
-- Execucao: Rode o script completo para observar o comportamento das tabelas temporarias.
-- Exemplo pratico: Abra duas sessoes e verifique que #TABELA01 existe apenas na atual, enquanto ##TABELA02 aparece em ambas.

-- 💡 6. Notas Tecnicas
-- Padroes aplicados: Convencoes # / ## evidenciam escopo local versus global.
-- Performance: Operacoes simples em tempdb; impacto minimo.
-- Melhorias possiveis: Ajustar `INSERT INTO #TABELA01 ('2','KATIA');` para `INSERT INTO #TABELA01 VALUES ('2','KATIA');` e adicionar DROP para ##TABELA02 ao final.

CREATE TABLE #TABELA01 (ID VARCHAR(10), NOME VARCHAR(30));

INSERT INTO #TABELA01 VALUES ('1', 'JOAO');

SELECT * FROM #TABELA01;

INSERT INTO #TABELA01 ('2', 'KATIA');

SELECT * FROM #TABELA01;

SELECT * FROM ##TABELA02;

INSERT INTO ##TABELA02 VALUES('3', 'JORGE');
