-- ================================================================
-- Curso 3 | Aula 02 | Script de Insercao de Produtos
-- Objetivo: praticar INSERT na tabela TB_PRODUTOS destacando boas praticas,
-- validacoes e problemas comuns (ex.: violacao de PK).
-- ================================================================

-- Sintaxe generica do INSERT para consulta rapida
-- INSERT INTO <nome da tabela> (<campos separados por virgula>)
-- VALUES (<valores correspondentes aos campos>);

-- Insercao 1: novo produto sabor Melancia
-- Demostra o padrao de colunas usado na turma (codigo, descritor, sabor, tamanho etc.).
INSERT INTO TB_PRODUTOS (
    CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA
) VALUES (
    '1040107', 'Light - 350 ml - Melancia', 'Melancia', '350 ml', 'Lata', 4.56
);

-- Conferencia: visualiza todos os produtos apos a primeira insercao
SELECT * FROM TB_PRODUTOS;

-- Insercao 2: sabor Graviola mantendo o mesmo formato
INSERT INTO TB_PRODUTOS (
    CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA
) VALUES (
    '1040108', 'Light - 350 ml - Graviola', 'Graviola', '350 ml', 'Lata', 4.00
);

-- Insercao 3: sabor Acai
INSERT INTO TB_PRODUTOS (
    CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA
) VALUES (
    '1040109', 'Light - 350 ml - Acai', 'Acai', '350 ml', 'Lata', 5.60
);

-- Exemplo de erro: tentativa de inserir o mesmo codigo (PK duplicada)
-- Este comando dispara erro devido a restricao PRIMARY KEY sobre CODIGO.
-- INSERT INTO TB_PRODUTOS (
--     CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA
-- ) VALUES (
--     '1040109', 'Light - 350 ml - Acai', 'Acai', '350 ml', 'Lata', 5.60
-- );

-- Insercao 4: sabor Jaca com preco diferente
INSERT INTO TB_PRODUTOS (
    CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA
) VALUES (
    '1040110', 'Light - 350 ml - Jaca', 'Jaca', '350 ml', 'Lata', 3.50
);

-- Insercoes 5 e 6: multiplos registros em um unico INSERT
-- Demonstra como otimizar insercoes em lote usando valores separados por virgula.
INSERT INTO TB_PRODUTOS (
    CODIGO, DESCRITOR, SABOR, TAMANHO, EMBALAGEM, PRECO_LISTA
) VALUES
    ('1040111', 'Light - 350 ml - Manga', 'Manga', '350 ml', 'Lata', 3.20),
    ('1040112', 'Light - 350 ml - Maca',  'Maca',  '350 ml', 'Lata', 4.20);


SELECT * FROM TB_PRODUTOS;