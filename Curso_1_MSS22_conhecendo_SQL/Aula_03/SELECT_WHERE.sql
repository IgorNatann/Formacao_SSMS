-- Aplicando Filtro WHERE.
SELECT
 [NOME] AS [NOME DO CLIENTE],
 [ESTADO] AS [UF],
 [PRIMEIRA_COMPRA]
FROM [TABELA_CLIENTES]
-- Filtrar apenas os clientes que realizaram a primeira compra.
WHERE [PRIMEIRA_COMPRA] = 1;



