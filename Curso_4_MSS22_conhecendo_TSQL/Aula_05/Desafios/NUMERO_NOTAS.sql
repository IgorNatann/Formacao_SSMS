/*
   ===============================================================
   DOCUMENTAÇÃO COMPLETA
   ===============================================================
   1. Visão Geral
      Propósito: Script para contar o número de notas fiscais em um intervalo de datas, exibindo a data e a quantidade de notas para cada dia.
      Tecnologias/Linguagens: T-SQL, executado em Microsoft SQL Server.
      Data de Criação: 14 de outubro de 2025

   2. Funcionalidades Principais
      - Contar o número de registros na tabela [NOTAS FISCAIS] para cada data do intervalo.
      - Imprimir a data e o número de notas fiscais em formato legível.
      - Incrementar a data automaticamente utilizando a função DATEADD.

   3. Estrutura do Código
      - Declaração e definição das variáveis @DATAINICIAL, @DATAFINAL e @NUMERO_NOTAS.
      - Loop WHILE que percorre o intervalo de datas, executando a contagem e exibindo os resultados.

   4. Configurações e Variáveis
      - @DATAINICIAL (DATE): Data de início para a contagem (definida como '2017-01-01').
      - @DATAFINAL (DATE): Data final do intervalo (definida como '2017-01-10').
      - @NUMERO_NOTAS (INT): Variável para armazenar a contagem de notas fiscais para cada data.

   5. Como Executar
      Pré-requisitos:
         - Microsoft SQL Server instalado e configurado.
         - A tabela [NOTAS FISCAIS] contendo dados de notas fiscais.
      Passos:
         1. Abrir o script em um ambiente de execução T-SQL (por exemplo, SQL Server Management Studio - SSMS).
         2. Executar o script (pressionar F5 ou clicar em "Executar").
         3. Verificar a saída no console, que exibirá a data e o número de notas fiscais correspondentes.

   7. Observações Técnicas
      - Padrões de código: Utilização clara de comentários e organização do loop WHILE para facilitar o entendimento.
      - Tratamento de erros: Não implementado; o script assume que os dados e o ambiente estão corretos.
      - Performance: Adequado para intervalos pequenos; para grandes volumes de dados, recomenda-se uso de operações set-based.

   8. TODO/Melhorias Futuras
      - Adicionar tratamento de erros e validação das datas de entrada.
      - Refatorar o script para modularização e reutilização em outros contextos, se necessário.
   ===============================================================
*/


-- Sabendo que a função abaixo soma um dia a uma data:

SELECT DATEADD(DAY, 1, @DATA)

-- Como podemos fazer um script que, a partir do dia 01/01/2017, conte o número de notas fiscais até o dia 10/01/2017 e, além disso, imprima a data e o número de notas fiscais?

-- Dicas:

-- Declare variáveis do tipo DATE: DATAINICIAL e DATAFINAL;
-- Faça um loop testando se a data inicial é menor que a data final;
-- Imprima a data e o número de notas na saída do Management Studio. Não esqueça de converter as variáveis para VARCHAR;
-- Acrescente um dia à data.

DECLARE @DATAINICIAL DATE;
DECLARE @DATAFINAL DATE;
DECLARE @NUMERO_NOTAS INT;

SET @DATAINICIAL = '2017-01-01';
SET @DATAFINAL = '2017-01-10';

WHILE @DATAINICIAL <= @DATAFINAL
BEGIN
    SELECT @NUMERO_NOTAS = COUNT(*) FROM [NOTAS FISCAIS]
        WHERE [DATA] = @DATAINICIAL
    PRINT CONVERT(VARCHAR(10), @DATAINICIAL) + ' ==>'
        + CONVERT(VARCHAR(10), @NUMERO_NOTAS) + ' NOTAS FISCAIS';
    SELECT @DATAINICIAL = DATEADD(DAY, 1, @DATAINICIAL)
END;

