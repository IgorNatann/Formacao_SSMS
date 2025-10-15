-- 📋 1. Cabecalho
-- 🔁 | Loop WHILE de 1 a 100
-- Proposito: Demonstrar a equivalencia do comando FOR utilizando WHILE em T-SQL.
-- Tecnologia: T-SQL (SQL Server)
-- Contexto: Curso 4 - Aula 06 - Estruturas de repeticao

-- ⚡ 2. Funcionamento Rapido
-- O que faz: Percorre os numeros de 1 a 100 imprimindo cada valor.
-- Como funciona:
-- 1. Declara variavel inteira @I.
-- 2. Inicializa @I com o valor 1.
-- 3. Executa loop WHILE enquanto @I <= 100.
-- 4. Imprime o valor atual de @I.
-- 5. Incrementa @I em 1 ao final de cada iteracao.
-- Entrada -> Saida: Sem entrada externa -> Saida textual com numeros de 1 a 100.

-- 🔧 3. Componentes Principais
-- Variavel de contagem: @I armazena o valor corrente.
-- Loop WHILE: controla a repeticao e substitui a estrutura FOR.
-- Comando PRINT: exibe cada numero no buffer de mensagens.

-- 📦 4. Dependencias
-- Ambiente SQL Server com permissao de execucao de scripts T-SQL.

-- ▶️ 5. Como Usar
-- Pre-requisitos: Acesso a uma janela de consulta no SQL Server.
-- Execucao: Execute o script completo para visualizar os numeros impressos na aba de mensagens.

-- 💡 6. Notas Tecnicas
-- Padroes aplicados: Incremento explicito garante controle sequencial.
-- Performance: O(n) com n = 100; custo desprezivel para demonstracao.
-- Melhorias possiveis: Adaptar para limites parametrizaveis ou para uso em stored procedure.

-- FOR I = 1 TO 100
-- -- <COMANDOS>
-- NEXT I

DECLARE @I INT;

SET @I = 1;

WHILE @I <= 100
BEGIN
   PRINT @I
   SET @I = @I + 1;
END;

