--Testando Restrição de Chave Primária.
-- O valor da chave primária não pode se repetir, ou seja, não pode haver dois registros com o mesmo valor na coluna que é chave primária.

INSERT INTO [TABELA_PRODUTOS] VALUES (
'1040107',
'Light 350 ml - Melancia',
'Lata',
'350 ml',
'Melancia',
4.56
);

--Teste de inserção com valor NULL na chave primária.
-- O valor da chave primária não pode ser NULL, ou seja, não pode haver registros sem valor na coluna que é chave primária.

INSERT INTO [TABELA_PRODUTOS] VALUES (
NULL,
'Light 350 ml - Melancia',
'Lata',
'350 ml',
'Melancia',
4.56
);

