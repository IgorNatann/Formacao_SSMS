-- ================================================================
-- Curso 3 | Aula 04 | Atividade 08 | Limpando TB_PRODUTOS com comandos DELETE
-- Objetivo: inserir dados de exemplo, praticar excluindo itens pontuais e
-- remover registros que nao existem na tabela de referencia SUCOS_FRUTAS.
-- ================================================================

-- Passo 1: inserir produtos ficticios "Sabor dos Alpes" para exercitar DELETE
INSERT INTO TB_PRODUTOS (CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA)
VALUES
    ('1001001','Sabor dos Alpes 700 ml - Manga',      'Manga',      '700 ml','Garrafa',7.50),
    ('1001000','Sabor dos Alpes 700 ml - Melao',       'Melao',       '700 ml','Garrafa',7.50),
    ('1001002','Sabor dos Alpes 700 ml - Graviola',   'Graviola',   '700 ml','Garrafa',7.50),
    ('1001003','Sabor dos Alpes 700 ml - Tangerina',  'Tangerina',  '700 ml','Garrafa',7.50),
    ('1001004','Sabor dos Alpes 700 ml - Abacate',    'Abacate',    '700 ml','Garrafa',7.50),
    ('1001005','Sabor dos Alpes 700 ml - Acai',       'Acai',       '700 ml','Garrafa',7.50),
    ('1001006','Sabor dos Alpes 1 Litro - Manga',     'Manga',      '1 Litro','Garrafa',7.50),
    ('1001007','Sabor dos Alpes 1 Litro - Melao',      'Melao',       '1 Litro','Garrafa',7.50),
    ('1001008','Sabor dos Alpes 1 Litro - Graviola',  'Graviola',   '1 Litro','Garrafa',7.50),
    ('1001009','Sabor dos Alpes 1 Litro - Tangerina', 'Tangerina',  '1 Litro','Garrafa',7.50),
    ('1001010','Sabor dos Alpes 1 Litro - Abacate',   'Abacate',    '1 Litro','Garrafa',7.50),
    ('1001011','Sabor dos Alpes 1 Litro - Acai',      'Acai',       '1 Litro','Garrafa',7.50);

-- Passo 2: visualizar os itens inseridos para confer�ncia
SELECT *
FROM TB_PRODUTOS
WHERE SUBSTRING(DESCRITOR, 1, 15) = 'Sabor dos Alpes';

-- Passo 3: remover um produto especifico pelo CODIGO
DELETE FROM TB_PRODUTOS
WHERE CODIGO = '1001000';

-- Passo 4: listar apenas os itens de 1 litro restantes
SELECT *
FROM TB_PRODUTOS
WHERE SUBSTRING(DESCRITOR, 1, 15) = 'Sabor dos Alpes'
  AND TAMANHO = '1 Litro';

-- Passo 5: excluir todos os "Sabor dos Alpes" de 1 litro de uma vez
DELETE FROM TB_PRODUTOS
WHERE SUBSTRING(DESCRITOR, 1, 15) = 'Sabor dos Alpes'
  AND TAMANHO = '1 Litro';

-- Passo 6: comparar contagem com a base oficial de produtos
SELECT COUNT(*) FROM TB_PRODUTOS;
SELECT COUNT(*) FROM SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS;

-- Passo 7: localizar produtos locais sem correspondencia na base SUCOS_FRUTAS
SELECT *
FROM TB_PRODUTOS
WHERE CODIGO NOT IN (
    SELECT CODIGO_DO_PRODUTO
    FROM SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS
);

-- Passo 8: remover os cadastros que nao existem na tabela de referencia
DELETE FROM TB_PRODUTOS
WHERE CODIGO NOT IN (
    SELECT CODIGO_DO_PRODUTO
    FROM SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS
);

-- Passo 9: checar se nao restaram itens inconsistentes
SELECT *
FROM TB_PRODUTOS
WHERE CODIGO NOT IN (
    SELECT CODIGO_DO_PRODUTO
    FROM SUCOS_FRUTAS.dbo.TABELA_DE_PRODUTOS
);
