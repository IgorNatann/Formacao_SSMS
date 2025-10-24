-- Objetivo geral: selecionar aleatoriamente um cliente percorrendo a tabela com cursor ate a posicao sorteada.

-- Secao 1 - Variaveis auxiliares para controlar o sorteio e armazenar o CPF escolhido.
DECLARE @CLIENTE_ALEATORIO VARCHAR(12);
DECLARE @VAL_INICIAL INT;
DECLARE @VAL_FINAL INT;
DECLARE @ALEATORIO INT;
DECLARE @CONTADOR INT;

-- Inicializa limites e contador; @VAL_FINAL recebe a quantidade total de clientes.
SET @CONTADOR = 1;
SET @VAL_INICIAL = 1;
SELECT @VAL_FINAL = COUNT(*) FROM [TABELA DE CLIENTES];

-- Chama funcao escalar NumeroAleatorio para sortear a posicao entre VAL_INICIAL e VAL_FINAL.
SET @ALEATORIO = dbo.[NumeroAleatorio](@VAL_INICIAL, @VAL_FINAL);

-- Secao 2 - Declara e abre o cursor que percorre todos os CPFs na ordem da tabela.
DECLARE CURSOR1 CURSOR FOR
    SELECT CPF
    FROM [TABELA DE CLIENTES];

OPEN CURSOR1;

-- Primeiro fetch para posicionar no inicio da lista.
FETCH NEXT FROM CURSOR1 INTO @CLIENTE_ALEATORIO;

-- Secao 3 - Loop que avanca ate atingir a posicao sorteada.
WHILE @CONTADOR < @ALEATORIO
BEGIN
    FETCH NEXT FROM CURSOR1 INTO @CLIENTE_ALEATORIO;
    SET @CONTADOR = @CONTADOR + 1;
END;

-- Fecha e desaloca o cursor apos obter o cliente desejado.
CLOSE CURSOR1;
DEALLOCATE CURSOR1;

-- Secao 4 - Resultados: mostra o CPF selecionado e a posicao sorteada.
SELECT @CLIENTE_ALEATORIO AS CPF_SORTEADO, @ALEATORIO AS POSICAO_SORTEADA;

-- Consulta auxiliar (opcional) para revisar os clientes na ordem percorrida.
SELECT *
FROM [TABELA DE CLIENTES];

-- Resumo: o script usa cursor para percorrer iterativamente a tabela ate a linha sorteada por NumeroAleatorio, permitindo identificar o CPF correspondente ao sorteio.
