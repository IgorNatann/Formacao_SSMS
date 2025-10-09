-- TRANSACTION, COMMIT, ROLLBACK
-- TRANSACTION (BEGIN TRAN) inicia um bloco logico para executar comandos como uma unica unidade atomica.
-- Durante a transacao, o SQL Server registra cada passo no log, permitindo confirmar ou desfazer as mudancas.
-- COMMIT confirma a transacao, grava definitivamente os dados e libera os recursos bloqueados.
-- ROLLBACK desfaz todas as mudancas desde o BEGIN TRAN, retornando os dados ao estado anterior.
-- Finalizar sempre com COMMIT ou ROLLBACK evita que a sessao permaneca com locks abertos e garante consistencia.
-- Fluxo basico recomendado:
-- BEGIN TRAN;
--     -- suas instrucoes DML aqui (INSERT, UPDATE, DELETE)
--     -- validar regras de negocio e consistencia
-- IF @@ERROR = 0
--     COMMIT;
-- ELSE
--     ROLLBACK;

SELECT * FROM TB_VENDEDORES;

BEGIN TRANSACTION

SELECT * FROM TB_VENDEDORES;

UPDATE TB_VENDEDORES SET COMISSAO = 0.11;

COMMIT;


BEGIN TRANSACTION

SELECT * FROM TB_VENDEDORES;

UPDATE TB_VENDEDORES SET COMISSAO = 0.10;

ROLLBACK;

SELECT * FROM TB_VENDEDORES;