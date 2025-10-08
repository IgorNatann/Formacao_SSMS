-- Agora que já passamos por alguns passos, resolva o problema do exercício anterior usando MERGE.

-- Repetindo o enunciado:

-- Podemos observar que os vendedores possuem bairros associados a eles. Vamos aumentar em 30% o volume de compra dos clientes que possuem, em seus endereços, bairros onde os vendedores possuam escritórios.

SELECT
    A.NOME,
    A.BAIRRO,
    A.VOLUME_COMPRA,
    B.NOME,
    B.BAIRRO
FROM TB_CLIENTES A
INNER JOIN TB_VENDEDORES B
ON A.BAIRRO = B.BAIRRO;

MERGE INTO TB_CLIENTES A
USING TB_VENDEDORES B
ON A.BAIRRO = B.BAIRRO
WHEN MATCHED THEN
UPDATE SET A.VOLUME_COMPRA = 
    A.VOLUME_COMPRA * 1.30;

SELECT
    A.NOME,
    A.BAIRRO,
    A.VOLUME_COMPRA,
    B.NOME,
    B.BAIRRO
FROM TB_CLIENTES A
INNER JOIN TB_VENDEDORES B
ON A.BAIRRO = B.BAIRRO;