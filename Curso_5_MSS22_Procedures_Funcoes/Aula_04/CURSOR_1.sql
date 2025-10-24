-- Objetivo geral: combinar cursor com formatação de endereço para imprimir nome e endereço completo de cada cliente.

-- Seção 1 - Variáveis que armazenam temporariamente o nome e o endereço montado.
DECLARE @NOME VARCHAR(200);
DECLARE @ENDERECO VARCHAR(MAX);

-- Seção 2 - Cursor que recupera todos os clientes montando o endereço concatenado.
DECLARE CURSOR_CLI_END CURSOR FOR
    SELECT NOME,
           ([ENDERECO 1] + ' ' + BAIRRO + ' ' + CIDADE + ' ' + ESTADO + ' CEP: ' + CEP) AS ENDCOMPLETO
    FROM [TABELA DE CLIENTES];

-- Seção 3 - Abertura do cursor para iniciar a navegação.
OPEN CURSOR_CLI_END;

-- Seção 4 - Primeiro FETCH para carregar o primeiro nome/endereço nas variáveis.
FETCH NEXT FROM CURSOR_CLI_END INTO @NOME, @ENDERECO;

-- Seção 5 - Loop que percorre todos os registros disponíveis.
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Exibe o nome seguido do endereço completo formatado.
    PRINT @NOME + ', Endereco: ' + @ENDERECO;

    -- Avança para o próximo cliente antes da próxima iteração.
    FETCH NEXT FROM CURSOR_CLI_END INTO @NOME, @ENDERECO;
END;

-- Seção 6 - Fecha e desaloca o cursor para liberar recursos.
CLOSE CURSOR_CLI_END;
DEALLOCATE CURSOR_CLI_END;

-- Resumo: o cursor lê cada cliente, formata o endereço em tempo real e garante liberação adequada dos recursos após o processamento.
