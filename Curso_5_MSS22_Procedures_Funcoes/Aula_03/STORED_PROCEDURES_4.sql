-- Objetivo geral: limpar o ambiente removendo procedures criadas nas aulas anteriores antes de nova execucao/implantacao.

-- Secao 1 - Remove a procedure que calcula faturamento e quantidade, caso exista.
IF OBJECT_ID('retornaValoresFaturamentoQuantidade', 'P') IS NOT NULL
    DROP PROCEDURE retornaValoresFaturamentoQuantidade;

-- Secao 2 - Remove a procedure de busca de notas fiscais parametrizada, evitando conflitos em recriacoes.
IF OBJECT_ID('BuscaNotasCliente', 'P') IS NOT NULL 
    DROP PROCEDURE BuscaNotasCliente;

-- Secao 3 - Remove a procedure de calculo de idade de clientes; atencao ao nome exato utilizado na criacao.
IF OBJECT_ID('CALCULA_IDADE_CLIENTES', 'P') IS NOT NULL
    DROP PROCEDURE CALCULA_IDADE_CLIENTES;

-- Resumo: OBJECT_ID com tipo 'P' verifica a existencia de stored procedures antes de executar DROP, prevenindo erros quando ja foram removidas.
