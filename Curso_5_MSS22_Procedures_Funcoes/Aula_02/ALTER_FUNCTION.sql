-- Objetivo geral: demonstrar como criar, alterar e reutilizar uma função escalar que formata o endereço completo de clientes.

-- Bloco 1: criação inicial da função escalar EnderecoCompleto que concatena campos de endereço separados por vírgulas.
CREATE FUNCTION EnderecoCompleto
(@ENDERECO VARCHAR(100),
@BAIRRO VARCHAR(50),
@CIDADE VARCHAR(50),
@ESTADO VARCHAR(2),
@CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
    -- Declara variável local para armazenar o resultado da concatenação.
    DECLARE @ENDERECO_COMPLETO VARCHAR(250);
    -- Concatena os componentes do endereço formando uma string padronizada.
    SET @ENDERECO_COMPLETO = @ENDERECO + ', ' + @BAIRRO + ', ' + @CIDADE + ', ' + @ESTADO + ', ' + @CEP;
    RETURN @ENDERECO_COMPLETO;
END;

-- Consulta de teste: combina o CPF ao endereço formatado gerado pela função.
SELECT CPF, [dbo].[EnderecoCompleto]([ENDERECO 1], BAIRRO, CIDADE, ESTADO, CEP) AS ENDERECO_COMPLETO
FROM [TABELA DE CLIENTES];

-- Bloco 2: alteração da função para ajustar a formatação do endereço e incluir a indicação do CEP.
ALTER FUNCTION EnderecoCompleto
(@ENDERECO VARCHAR(100),
@BAIRRO VARCHAR(50),
@CIDADE VARCHAR(50),
@ESTADO VARCHAR(2),
@CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
    -- Reaproveita a mesma variável local, reforçando a necessidade de declarar o tipo de retorno.
    DECLARE @ENDERECO_COMPLETO VARCHAR(250);
    -- Apresenta outra estratégia de concatenação, usando espaços e destacando o CEP no final.
    SET @ENDERECO_COMPLETO = @ENDERECO + ' ' + @BAIRRO + ' ' + @CIDADE + ' ' + @ESTADO + ', CEP: ' + @CEP;
    RETURN @ENDERECO_COMPLETO;
END;

-- Consulta de validação: verifica como a alteração impacta o formato exibido aos usuários.
SELECT CPF, [dbo].[EnderecoCompleto]([ENDERECO 1], BAIRRO, CIDADE, ESTADO, CEP) AS ENDERECO_COMPLETO
FROM [TABELA DE CLIENTES];
