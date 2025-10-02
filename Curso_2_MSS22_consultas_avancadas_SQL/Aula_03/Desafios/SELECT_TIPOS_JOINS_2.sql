-- =============================================
-- Guia rapido de JOINs entre TABELA_DE_CLIENTES e TABELA_DE_VENDEDORES
-- Objetivo: revisar como cada tipo de JOIN relaciona clientes e vendedores a partir do bairro.
-- Estrutura:
--   1) Contagens isoladas para conhecer o volume de registros de cada tabela.
--   2) INNER JOIN para retornar somente bairros compartilhados.
--   3) RIGHT JOIN para encontrar vendedores sem correspondencia de clientes.
--   4) LEFT JOIN para encontrar clientes sem correspondencia de vendedores.
--   5) FULL JOIN para consolidar todos os registros e identificar gaps em ambos os lados.
-- =============================================

-- 1.1) Quantidade total de clientes cadastrados
SELECT COUNT(*) FROM TABELA_DE_CLIENTES;

-- 1.2) Quantidade total de vendedores cadastrados
SELECT COUNT(*) FROM TABELA_DE_VENDEDORES;

-- 2) INNER JOIN: apenas pares cliente-vendedor presentes no mesmo bairro
SELECT DISTINCT
    TV.NOME AS VENDEDOR,
    TV.BAIRRO AS VENDEDOR_BAIRRO,
    TC.NOME AS CLIENTE,
    TC.BAIRRO AS CLIENTE_BAIRRO
FROM
    TABELA_DE_CLIENTES TC
INNER JOIN
    TABELA_DE_VENDEDORES TV
ON TC.BAIRRO = TV.BAIRRO;

-- 3) RIGHT JOIN: vendedores sem clientes no mesmo bairro (filtra linhas nulas do lado cliente)
SELECT DISTINCT
    TV.NOME AS NOME_DO_VENDEDOR,
    TV.BAIRRO AS BAIRRO_DO_VENDEDOR,
    TC.BAIRRO AS BAIRRO_DO_CLIENTE,
    TC.NOME AS NOME_DO_CLIENTE
FROM TABELA_DE_CLIENTES TC
RIGHT JOIN TABELA_DE_VENDEDORES TV
ON TC.BAIRRO = TV.BAIRRO
WHERE TC.NOME IS NULL;

-- 4) LEFT JOIN: clientes sem vendedores no mesmo bairro (filtra linhas nulas do lado vendedor)
SELECT DISTINCT
    TV.NOME AS NOME_DO_VENDEDOR,
    TV.BAIRRO AS BAIRRO_DO_VENDEDOR,
    TC.BAIRRO AS BAIRRO_DO_CLIENTE,
    TC.NOME AS NOME_DO_CLIENTE
FROM TABELA_DE_CLIENTES TC
LEFT JOIN TABELA_DE_VENDEDORES TV
ON TC.BAIRRO = TV.BAIRRO
WHERE TV.NOME IS NULL;

-- 5) FULL JOIN: panorama completo com todos os bairros e possiveis lacunas
SELECT DISTINCT
    TV.NOME AS NOME_DO_VENDEDOR,
    TV.BAIRRO AS BAIRRO_DO_VENDEDOR,
    TC.BAIRRO AS BAIRRO_DO_CLIENTE,
    TC.NOME AS NOME_DO_CLIENTE
FROM TABELA_DE_CLIENTES TC
FULL JOIN TABELA_DE_VENDEDORES TV
ON TC.BAIRRO = TV.BAIRRO;
