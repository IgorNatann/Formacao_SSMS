USE SUCOS_VENDAS;

-- INSERT UNICA LINHA.
INSERT INTO [TABELA_PRODUTOS] VALUES
('1040107', 'Light - 350 ml - Melância', 'Lata', '350 ml', 'Melância', 4.99);

SELECT * FROM TABELA_PRODUTOS;

-- INSERT MULTIPLAS LINHAS.
INSERT INTO [TABELA_PRODUTOS] VALUES
('10837797', 'Clean - 2 Litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.01),
('1000889', 'Sabor da Montanha 700 ml Uva', 'Garrafa', '700 ml', 'Uva', 6.31),
('1004327', 'Videira do Campo 1,5 Litros Melancia', 'PET', '1,5 Litros', 'Melancia', 19.51),
('1088126', 'Linha Citrus 1 Litro Limão', 'PET', '1 Litro', 'Limão', 7.00);

SELECT * FROM TABELA_PRODUTOS;

INSERT INTO [TABELA_CLIENTES] VALUES
('00384393431', 'João da Silva', 'Rua Projetada A', 'Número 233', 'Copacabana', 'RJ', '20000000', '1965-03-21', 57, 'M', 20000000, 3000.30, 1),
('00384393555', 'Maria Clara', 'Rua Projetada A', 'Número 233', 'Copacabana', 'RJ', '20000000', '1975-03-21',47, 'F', 200000, 3000.30, 0);

SELECT * FROM TABELA_CLIENTES;