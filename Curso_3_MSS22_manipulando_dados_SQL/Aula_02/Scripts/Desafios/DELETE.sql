-- Exclua as notas fiscais (apenas o cabeçalho) cujos clientes tenham menos que 18 anos.
-- Dica: use consulta abaixo:

SELECT A.NUMERO FROM [TB_VENDAS] A
INNER JOIN [TB_CLIENTES] B ON A.[CPF] = B.[CPF] 
WHERE B.[IDADE] < 18

-- E use uma sintaxe parecida com a usada no UPDATE com FROM.

SELECT A.NUMERO FROM [TB_VENDAS] A
INNER JOIN [TB_CLIENTES] B ON A.[CPF] = B.[CPF] 
WHERE B.[IDADE] < 18;

SELECT * FROM TB_CLIENTES A
INNER JOIN TB_VENDAS B ON A.CPF = B.CPF
WHERE IDADE < 18;

DELETE A
FROM TB_VENDAS A
INNER JOIN [TB_CLIENTES] B ON A.[CPF] = B.[CPF] 
WHERE B.[IDADE] < 18;