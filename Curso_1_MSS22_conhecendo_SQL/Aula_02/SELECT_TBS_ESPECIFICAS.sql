-- Listar Campos específicos da tabela TABELA_CLIENTES.
SELECT [NOME], [ESTADO] FROM [TABELA_CLIENTES];

SELECT [ESTADO], [NOME] FROM [TABELA_CLIENTES];

-- Aplicando o 'ORDER BY' Para ordernar de forma crescente pelo campo NOME.
SELECT [NOME], [ESTADO] FROM [TABELA_CLIENTES]
ORDER BY [NOME];