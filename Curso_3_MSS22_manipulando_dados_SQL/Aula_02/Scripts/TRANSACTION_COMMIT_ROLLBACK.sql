-- ================================================================
-- Curso 3 | Aula 04 | Atividade 12 | Demonstracao de transacoes (BEGIN TRAN, COMMIT, ROLLBACK)
-- Objetivo: mostrar como agrupar alteracoes em blocos atomicos e confirmar ou
-- desfazer mudancas em TB_VENDEDORES com seguranca.
-- ================================================================

-- Conceitos rapidos:
-- BEGIN TRAN inicia a transacao; o SQL Server comeca a registrar o bloco.
-- COMMIT grava as alteracoes e libera locks.
-- ROLLBACK desfaz tudo desde o BEGIN TRAN, restaurando o estado inicial.
-- Sempre finalize a transacao (COMMIT/ROLLBACK) para evitar sessao travada.

-- Passo 1: visualizar o estado atual da tabela antes de qualquer transacao
SELECT * FROM TB_VENDEDORES;

-- Passo 2: exemplo com confirmacao (COMMIT)
BEGIN TRANSACTION;
    SELECT * FROM TB_VENDEDORES;            -- leitura dentro da transacao
    UPDATE TB_VENDEDORES
    SET COMISSAO = 0.11;                    -- altera todas as comissoes
COMMIT;                                      -- confirma as mudancas

-- Passo 3: exemplo com desfazer (ROLLBACK)
BEGIN TRANSACTION;
    SELECT * FROM TB_VENDEDORES;            -- conferencia antes de alterar
    UPDATE TB_VENDEDORES
    SET COMISSAO = 0.10;                    -- mudanca temporaria
ROLLBACK;                                    -- desfaz as alteracoes

-- Passo 4: checar o estado final (mantem valor do COMMIT, ignora o ROLLBACK)
SELECT * FROM TB_VENDEDORES;
