-- 📋 1. Cabecalho
-- 🌐 | Tabela Temporaria Global de Notas
-- Proposito: Criar e popular uma tabela temporaria global compartilhada entre sessoes.
-- Tecnologia: T-SQL (SQL Server)
-- Contexto: Curso 4 - Aula 06 - Tabelas Temporarias

-- ⚡ 2. Funcionamento Rapido
-- O que faz: Cria ##TABELA02, insere registros de exemplo e exibe o conteudo atual.
-- Como funciona:
-- 1. Declara a tabela global ##TABELA02 com ID e NOME.
-- 2. Insere registros de teste (primeiro com sintaxe correta, segundo requer ajuste).
-- 3. Executa SELECT final para listar os dados armazenados.
-- Entrada -> Saida: Valores ID/NOME fornecidos -> Resultset da tabela temporaria global.

-- 🔧 3. Componentes Principais
-- ##TABELA02: tabela temporaria global em tempdb, visivel a todas as sessoes ativas.
-- Comandos INSERT: alimentam a tabela com registros de exemplo.
-- SELECT final: valida o conteudo atual da tabela global.

-- 📦 4. Dependencias
-- Servidor SQL com permissao para criar tabelas temporarias globais.
-- Sessao deve garantir que nenhuma tabela ##TABELA02 existente conflite com a criacao.

-- ▶️ 5. Como Usar
-- Pre-requisitos: Sessao conectada ao SQL Server; recomenda-se dropar ##TABELA02 caso ja exista.
-- Execucao: Rodar o script para criar e carregar a tabela temporaria global.
-- Exemplo pratico: Abra outra sessao e execute `SELECT * FROM ##TABELA02` para demonstrar o compartilhamento.

-- 💡 6. Notas Tecnicas
-- Padroes aplicados: Prefixo ## evidencia escopo global.
-- Performance: Operacao leve em tempdb; adequada para execucoes de apoio ou testes.
-- Melhorias possiveis: Corrigir `INSERT INTO ##TABELA02 ('2','KATIA');` para usar `VALUES` e adicionar DROP ao final para liberar recursos.

CREATE TABLE ##TABELA02 (ID VARCHAR(10), NOME VARCHAR(30));

INSERT INTO ##TABELA02 VALUES ('1', 'JOAO');
INSERT INTO ##TABELA02 ('2', 'KATIA');

SELECT * FROM ##TABELA02;
