-- Para cada cliente temos seus limites de crédito mensais. Liste somente o nome dos clientes e os classifique por:

-- Acima ou igual a 150.000 - Clientes grandes
-- Entre 150.000 e 110.000 - Clientes médios
-- Menores que 110.000 Clientes pequenos

SELECT
    NOME,
    (CASE
        WHEN LIMITE_DE_CREDITO >= 150000 THEN 'Cliente Grande'
        WHEN LIMITE_DE_CREDITO >= 110000 AND LIMITE_DE_CREDITO < 150000 THEN 'Cliente Médio'
        ELSE 'Cliente Pequeno' END) AS 'Porte Cliente'
FROM
    TABELA_DE_CLIENTES;
