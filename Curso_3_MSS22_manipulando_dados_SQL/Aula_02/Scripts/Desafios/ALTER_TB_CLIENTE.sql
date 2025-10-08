-- Exercicio

-- Modifique o endereço do cliente 19290992743 para R. Jorge Emilio 23, em Santo Amaro, São Paulo, SP, CEP 8833223.

SELECT * FROM TB_CLIENTES WHERE CPF = '19290992743';

UPDATE TB_CLIENTES SET ENDERECO = 'R. Jorge Emilio 23', BAIRRO = 'Santo Amaro', CIDADE = 'Sao Paulo', ESTADO = 'SP', CEP = '8833223' WHERE CPF = '19290992743';

SELECT * FROM TB_CLIENTES WHERE CPF = '19290992743';