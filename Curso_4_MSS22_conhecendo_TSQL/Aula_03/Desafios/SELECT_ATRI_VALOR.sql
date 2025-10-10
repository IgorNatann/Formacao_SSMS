-- No vídeo anterior, realizamos a atribuição de valores às variáveis através do comando SELECT, onde cada variável recebe o valor do seu respectivo campo na tabela.

-- A seguir, podemos conferir o comando realizado para atribuir esses valores:

-- SELECT @NOME = NOME, @DATA_NASCIMENTO = [DATA DE NASCIMENTO], @IDADE = IDADE FROM [TABELA DE CLIENTES] WHERE CPF = @CPF;

-- Levando em consideração o que fizemos até aqui, como podemos criar uma variável chamada NUMNOTAS e atribuir a ela o número de notas fiscais do dia 01/01/2017?

-- Para verificarmos o resultado, mostre na saída do script o valor da variável.

DECLARE @NUMNOTAS INT;
SET @NUMNOTAS = (SELECT COUNT(*) FROM [NOTAS FISCAIS] WHERE [DATA] = '2017-01-01');
PRINT @NUMNOTAS;