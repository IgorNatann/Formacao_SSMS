/*
===============================================================
DOCUMENTAÇÃO COMPLETA - SEQUEBCIA_FIBONACCI.sql
===============================================================
1. Visão Geral
   Propósito: Este script calcula e exibe a sequência de Fibonacci até uma posição determinada.
   Tecnologias/Linguagens: T-SQL (Transact-SQL) executado em Microsoft SQL Server.
   Data de Criação: 14 de outubro de 2025

2. Funcionalidades Principais
   - Inicializa os valores iniciais da sequência (0 e 1).
   - Calcula iterativamente a sequência de Fibonacci utilizando um loop WHILE.
   - Imprime cada posição da sequência com seu valor correspondente.

3. Estrutura do Código
   - Declaração das variáveis necessárias para o cálculo da sequência.
   - Inicialização dos valores base: @NUMERO_ANTERIOR2 e @NUMERO_ANTERIOR1.
   - Loop WHILE que realiza a iteração para calcular cada novo valor da sequência.

4. Detalhamento das Variáveis
   - @NUMERO_ANTERIOR2 (INT): Guarda o valor de duas posições antes na sequência (inicialmente 0).
   - @NUMERO_ANTERIOR1 (INT): Guarda o valor da posição anterior (inicialmente 1).
   - @NUMERO_ATUAL (INT): Armazena o valor atual calculado da sequência.
   - @SEQUENCIA (INT): Define até qual posição da sequência será calculada (ex: 44).
   - @CONTADOR_SEQUENCIA (INT): Contador utilizado para controlar as iterações do loop.

5. Como Executar
   - Abra o script em um ambiente T-SQL, como o SQL Server Management Studio (SSMS).
   - Execute o script (por exemplo, pressionando F5).
   - Verifique a saída no console, que exibirá cada posição com o respectivo valor da sequência de Fibonacci.

6. Observações Técnicas
   - O script utiliza funções nativas do T-SQL, como TRIM e STR, para formatar a saída de texto.
   - Adequado para propósitos educativos e para demonstração de lógica de iteração usando loops.
===============================================================
*/

DECLARE @NUMERO_ANTERIOR2 INT;
DECLARE @NUMERO_ANTERIOR1 INT;
DECLARE @NUMERO_ATUAL INT;
DECLARE @SEQUENCIA INT;
DECLARE @CONTADOR_SEQUENCIA INT;

SET @SEQUENCIA = 44;
SET @CONTADOR_SEQUENCIA = 3;

SET @NUMERO_ANTERIOR2 = 0;
SET @NUMERO_ANTERIOR1 = 1;
PRINT 'POSIÇÃO 1 --> 0';
PRINT 'POSIÇÃO 2 --> 1';
WHILE @CONTADOR_SEQUENCIA <= @SEQUENCIA
BEGIN
   SET @NUMERO_ATUAL = @NUMERO_ANTERIOR2 + @NUMERO_ANTERIOR1;
   PRINT 'POSIÇÃO ' + TRIM(STR(@CONTADOR_SEQUENCIA,10,0)) + ' --> ' + TRIM(STR(@NUMERO_ATUAL, 10,0));
   SET  @NUMERO_ANTERIOR2 = @NUMERO_ANTERIOR1;
   SET @NUMERO_ANTERIOR1 = @NUMERO_ATUAL;
   SET @CONTADOR_SEQUENCIA = @CONTADOR_SEQUENCIA + 1;
END;