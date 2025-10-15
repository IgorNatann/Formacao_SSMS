-- =============================================================
-- DOCUMENTAÇÃO COMPLETA
-- =============================================================
--
-- 1. Visão Geral
--    Propósito: Demonstração do uso do loop WHILE em T-SQL para iterar e imprimir números de 3 a 30.
--    Tecnologias/Linguagens: T-SQL (Transact-SQL) executado em Microsoft SQL Server.
--    Data de Criação: 14 de outubro de 2025
--
-- 2. Funcionalidades Principais
--    - Inicializar variáveis de controle (@LIMITE_MINIMO, @LIMITE_MAXIMO).
--    - Imprimir mensagem de início e fim do processamento.
--    - Executar um loop WHILE que imprime cada número do intervalo, incrementando o valor a cada iteração.
--
-- 3. Estrutura do Código
--    - Cabeçalho com documentação resumida do arquivo.
--    - Declaração e inicialização das variáveis (@LIMITE_MINIMO, @LIMITE_MAXIMO).
--    - Estrutura de repetição WHILE para controle do loop de iteração.
--    - Impressão de mensagens para sinalizar início e fim do processamento.
--
-- 6. Configurações e Variáveis
--    - Variáveis:
--          @LIMITE_MINIMO (INT): Define o valor inicial da iteração (inicializado com 3).
--          @LIMITE_MAXIMO (INT): Define o limite máximo da iteração (definido como 30).
--    - Observação: Certifique-se de que o ambiente de execução (SQL Server) suporte T-SQL.
--
-- 7. Como Executar
--    Pré-requisitos:
--          - Acesso a um servidor Microsoft SQL Server.
--          - Ambiente como SQL Server Management Studio (SSMS) ou similar.
--    Passos:
--          1. Abrir o arquivo WHILE.sql no ambiente SQL.
--          2. Executar o script pressionando F5 ou clicando em "Executar".
--    Exemplo: Ao executar o script, o console exibirá os números de 3 até 30, sequencialmente.
--
-- 8. Observações Técnicas
--    - Padrões de código: Uso consistente de comentários e formatação legível.
--    - Tratamento de erros: Não implementado; o script é simples e destinado para fins de aprendizado.
--    - Performance: Adequado para demonstração; em cenários reais, operações set-based podem ser mais eficientes que loops.
--
-- 9. TODO/Melhorias Futuras
--    - Implementar tratamento de erros para aumentar a robustez do script.
--    - Refatorar o código para encapsulá-lo em um procedimento armazenado, possibilitando reutilização.
--    - Permitir entrada dinâmica para os valores de @LIMITE_MINIMO e @LIMITE_MAXIMO.
-- =============================================================

DECLARE @LIMITE_MINIMO INT;
DECLARE @LIMITE_MAXIMO INT;
--DECLARE @CONTADOR INT;

PRINT 'INICIO DO PROCESSAMENTO';
SET @LIMITE_MINIMO = 3;
SET @LIMITE_MAXIMO = 30;

WHILE @LIMITE_MINIMO <= @LIMITE_MAXIMO
BEGIN
    PRINT @LIMITE_MINIMO;
    SET @LIMITE_MINIMO = @LIMITE_MINIMO + 1;
END;
PRINT 'FIM DO PROCESSAMENTO';