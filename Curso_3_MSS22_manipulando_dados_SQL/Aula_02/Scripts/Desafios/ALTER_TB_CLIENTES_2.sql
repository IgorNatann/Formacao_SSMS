-- Agora que já desenvolvemos vários tópicos, que tal praticarmos alterando o volume de compra em 20%, dos clientes do estado do Rio de Janeiro?

SELECT
    *
FROM
    TB_CLIENTES
WHERE
    ESTADO = 'RJ';

UPDATE
    TB_CLIENTES
SET
    VOLUME_COMPRA = VOLUME_COMPRA * 1.20
WHERE ESTADO = 'RJ';

SELECT
    *
FROM
    TB_CLIENTES
WHERE
    ESTADO = 'RJ';