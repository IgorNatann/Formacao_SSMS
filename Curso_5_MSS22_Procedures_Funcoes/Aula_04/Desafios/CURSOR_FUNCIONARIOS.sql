-- Objetivo geral: percorrer a lista de vendedores com um cursor para exibir nome e percentual de comissão, encerrando corretamente os recursos.

-- Secao 1 - Variaveis que recebem os campos retornados pela consulta do cursor.
DECLARE @NOME VARCHAR(200), @COMISSAO FLOAT;

-- Secao 2 - Declaracao do cursor que seleciona nome e comissao dos vendedores.
DECLARE CURSOR_LIST_FUNCIONARIOS CURSOR FOR
    SELECT [NOME], [PERCENTUAL COMISSAO]
    FROM [TABELA DE VENDEDORES];

-- Secao 3 - Abertura do cursor para disponibilizar o conjunto de resultados.
OPEN CURSOR_LIST_FUNCIONARIOS;

-- Secao 4 - Primeira leitura para carregar o primeiro vendedor nas variaveis.
FETCH NEXT FROM CURSOR_LIST_FUNCIONARIOS INTO @NOME, @COMISSAO;

-- Secao 5 - Loop de processamento: continua enquanto houver linhas a ler.
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Exibe o vendedor atual e seu percentual de comissao.
    PRINT @NOME;
    PRINT @COMISSAO;

    -- Avanca para o proximo registro antes de nova iteracao.
    FETCH NEXT FROM CURSOR_LIST_FUNCIONARIOS INTO @NOME, @COMISSAO;
END;

-- Secao 6 - Libera os recursos associados ao cursor.
CLOSE CURSOR_LIST_FUNCIONARIOS;
DEALLOCATE CURSOR_LIST_FUNCIONARIOS;


