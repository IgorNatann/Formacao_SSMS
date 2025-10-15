/*
   ===============================================================
   DOCUMENTAÇÃO COMPLETA
   ===============================================================
   1. Visão Geral
      Propósito: Exemplo de utilização do comando BREAK em um loop WHILE no T-SQL para interromper a iteração após um número máximo de linhas.
      Tecnologias/Linguagens: T-SQL (Transact-SQL) executado em Microsoft SQL Server.
      Data de Criação: 14 de outubro de 2025

   2. Funcionalidades Principais
      - Definir e controlar um range de iterações com variáveis (@LIMITE_MINIMO, @LIMITE_MAXIMO).
      - Contar o número de linhas impressas com a variável @NUM_LINHAS_ESCRITAS.
      - Utilizar o comando BREAK para interromper a execução quando um limite é atingido (@NUM_LINHAS_MAX).
      - Imprimir mensagens específicas para início e término do processamento, incluindo a razão do break.

   3. Estrutura do Código
      - Declaração e inicialização de variáveis de controle.
      - Impressão da mensagem de início do processamento.
      - Loop WHILE que executa a lógica de incremento e verificação do contador de linhas.
      - Condicional IF para verificar e executar o BREAK quando o limite é atingido.
      - Impressão de mensagens de término do processamento.

   4. Configurações e Variáveis
      - @LIMITE_MINIMO (INT): Valor inicial para o loop (definido como 3).
      - @LIMITE_MAXIMO (INT): Valor final para o loop (definido como 30).
      - @NUM_LINHAS_MAX (INT): Número máximo de linhas a serem impressas antes da interrupção do loop (definido como 10).
      - @NUM_LINHAS_ESCRITAS (INT): Contador que acumula o número de linhas impressas durante a iteração.

   5. Como Executar
      Pré-requisitos:
         - Microsoft SQL Server instalado e configurado.
         - Ambiente de execução adequado (por exemplo, SQL Server Management Studio - SSMS).
      Passos:
         1. Abrir o arquivo BREAK.sql no ambiente T-SQL.
         2. Executar o script (pressionar F5 ou clicar em Executar).
         3. Observar a saída no console, que exibirá os números até que o limite de linhas seja atingido, ocasionando a interrupção com o comando BREAK.

   6. Observações Técnicas
      - Padrões de código: Utilização clara de comentários e organização lógica do script.
      - Tratamento de erros: Não implementado, pois o script é simples e ilustrativo.
      - Performance: Adequado para exemplos didáticos; loops em T-SQL podem ser substituídos por operações set-based em cenários reais.

   7. TODO/Melhorias Futuras
      - Adicionar validação dos inputs (valores de início e fim) para evitar erros.
      - Modularizar o script em um procedimento armazenado para reutilização.
   ===============================================================
*/

DECLARE @LIMITE_MINIMO INT;
DECLARE @LIMITE_MAXIMO INT;
DECLARE @NUM_LINHAS_MAX INT;
DECLARE @NUM_LINHAS_ESCRITAS INT;

SET @LIMITE_MINIMO = 3;
SET @LIMITE_MAXIMO = 30;
SET @NUM_LINHAS_MAX = 10;
SET @NUM_LINHAS_ESCRITAS = 0;

PRINT 'INICIO DO PROCESSAMENTO';

WHILE @LIMITE_MINIMO <= @LIMITE_MAXIMO
BEGIN
    PRINT @LIMITE_MINIMO;
    SET @NUM_LINHAS_ESCRITAS = @NUM_LINHAS_ESCRITAS + 1;
    IF @NUM_LINHAS_ESCRITAS = @NUM_LINHAS_MAX
    BEGIN
        PRINT 'FIM DO PROCESSAMENTO MOTIVO: BREAK';
        BREAK;
    END;
    SET @LIMITE_MINIMO = @LIMITE_MINIMO + 1;
END;
PRINT 'FIM DO PROCESSAMENTO';