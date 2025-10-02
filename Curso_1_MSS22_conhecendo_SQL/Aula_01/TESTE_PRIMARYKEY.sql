-- =========================================
-- Aula 01 - Testando a restricao de chave primaria
-- Objetivo geral: observar os erros quando tentamos violar unicidade e obrigatoriedade da chave.
-- Conceitos principais: PRIMARY KEY, controle de duplicidade, valores NULL em colunas chave.
-- =========================================

-- Bloco 1 | Tentativa de inserir um codigo de produto ja existente.
-- Resultado esperado: erro de chave primaria informando que o valor duplicado nao pode ser inserido.
INSERT INTO TABELA_PRODUTOS
VALUES (
    '1040107',           -- Codigo ja criado no arquivo INSERT_INTO.sql
    'Light 350 ml - Melancia',
    'Lata',
    '350 ml',
    'Melancia',
    4.56
);

-- Bloco 2 | Tentativa de inserir um valor NULL na chave primaria.
-- Resultado esperado: erro dizendo que a coluna nao permite valores nulos por ser chave primaria.
INSERT INTO TABELA_PRODUTOS
VALUES (
    NULL,
    'Light 350 ml - Melancia',
    'Lata',
    '350 ml',
    'Melancia',
    4.56
);

SELECT * FROM TABELA_PRODUTOS;     -- Utilize para confirmar que nenhum registro novo foi inserido
