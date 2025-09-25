-- ERRO : Tentativa de inserir dados em um campo fora da ordem definida na criação da tabela.
INSERT INTO [TABELA_PRODUTOS]
VALUES
('5449310', 'Frescor do Verão - 350 ml - Limão', 'Lata', '350 ml', 2.45, 'Limão'),
('1078680', 'Frescor do Verão - 350 ml - Manga', 'Lata', '350 ml', 3.18, 'Manga');

-- CORRETO : Inserindo dados fora da ordem correta, é necessário setar os atributos no insert conforme ordem no insert.
INSERT INTO [TABELA_PRODUTOS]
([CODIGO_PRODUTO], [NOME_PRODUTO], [EMBALAGEM], [TAMANHO], [PRECO_LISTA], [SABOR])
VALUES
('5449310', 'Frescor do Verão - 350 ml - Limão', 'Lata', '350 ml', 2.45, 'Limão'),
('1078680', 'Frescor do Verão - 350 ml - Manga', 'Lata', '350 ml', 3.18, 'Manga');

SELECT * FROM TABELA_PRODUTOS;