-- Exercício:

-- Podemos observar que os vendedores possuem bairros associados a eles. Vamos aumentar em 30% o volume de compra dos clientes que possuem, em seus endereços, bairros onde os vendedores possuam escritórios.

-- Dica: vamos usar um UPDATE com FROM, usando o seguinte INNER JOIN:

SELECT
    A.CPF,
    A.NOME,
    A.VOLUME_COMPRA
FROM
    TB_CLIENTES A
INNER JOIN
    TB_VENDEDORES B
ON A.[BAIRRO] = B.[BAIRRO]

UPDATE
    TB_CLIENTES
SET
    VOLUME_COMPRA = VOLUME_COMPRA * 1.30
FROM
    TB_CLIENTES A
INNER JOIN
    TB_VENDEDORES B
ON
    A.[BAIRRO] = B.[BAIRRO]

SELECT
    A.CPF,
    A.NOME,
    A.VOLUME_COMPRA
FROM
    TB_CLIENTES A
INNER JOIN
    TB_VENDEDORES B
ON A.[BAIRRO] = B.[BAIRRO] 