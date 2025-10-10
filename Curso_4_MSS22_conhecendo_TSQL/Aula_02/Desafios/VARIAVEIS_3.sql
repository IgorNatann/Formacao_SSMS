-- Ate aqui, verificamos a possibilidade de criar variaveis e atribuir valores a elas atraves dos desafios anteriores.
-- Alem disso, o T-SQL nos permite exibir esses valores adicionados as variaveis.
-- Utilizando o script elaborado no desafio anterior, como podemos exibir o valor das variaveis criadas?

DECLARE @CLIENTE VARCHAR(10) = N'Joao';
DECLARE @IDADE INT = 10;
DECLARE @DATANASCIMENTO DATE = '2007-01-10';
DECLARE @CUSTO FLOAT = 10.23;

-- 1. Opção através do SELECT.
SELECT
    @CLIENTE AS Cliente,
    @IDADE AS Idade,
    @DATANASCIMENTO AS DataNascimento,
    @CUSTO AS Custo;

-- 2. Opção através do PRINT
PRINT @CLIENTE;
PRINT @IDADE;
PRINT @DATANASCIMENTO;
PRINT @CUSTO;