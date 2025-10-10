-- O T-SQL nos permite realizar a declaração de variáveis, o que foi possível colocar em prática através do desafio anterior.
-- Além disso, verificamos no vídeo anterior a possibilidade de atribuir valores às variáveis que criamos.
-- Pensando nisso, inicialize as variáveis do desafio anterior com os seguintes valores:

-- Nome: Cliente - Tipo: Caracteres com 10 posições - Valor: João
-- Nome: Idade - Tipo: Inteiro - Valor: 10
-- Nome: DataNascimento - Tipo: Data - Valor: 10/01/2007
-- Nome: Custo - Tipo: Número com casas decimais - Valor: 10,23

DECLARE @CLIENTE VARCHAR(10) = N'João';
DECLARE @IDADE INT = 10;
DECLARE @DATANASCIMENTO DATE = '2007-01-10';
DECLARE @CUSTO FLOAT = 10.23;
