-- Objetivo geral: demonstrar o ciclo completo de um cursor em T-SQL para percorrer, linha a linha, registros da tabela de clientes.

-- Seção 1 - Variável que receberá cada nome recuperado pelo cursor.
DECLARE @NOME VARCHAR(200);

-- Seção 2 - Declaração do cursor: limita a busca aos quatro primeiros nomes da tabela de clientes.
DECLARE CURSOR1 CURSOR FOR
    SELECT TOP 4 NOME
    FROM [TABELA DE CLIENTES];

-- Seção 3 - Abertura do cursor para tornar o conjunto navegável.
OPEN CURSOR1;

-- Seção 4 - Primeira leitura para inicializar o laço com o primeiro registro.
FETCH NEXT FROM CURSOR1 INTO @NOME;

-- Seção 5 - Loop que continua enquanto houver linhas (@@FETCH_STATUS = 0).
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Processamento desejado: exibe o nome atual no console do SQL Server.
    PRINT @NOME;

    -- Lê a próxima linha e atualiza o estado do cursor.
    FETCH NEXT FROM CURSOR1 INTO @NOME;
END;

-- Resumo dos aprendizados:
-- 1) Cursors permitem percorrer resultados sequencialmente quando lógica iterativa é inevitável.
-- 2) É essencial abrir o cursor, fazer um fetch inicial e atualizar os dados dentro do loop.
-- 3) Sempre monitore @@FETCH_STATUS para saber quando interromper o processamento.
