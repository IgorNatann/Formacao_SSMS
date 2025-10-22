-- Objetivo geral: praticar a exclusao de funcoes escalares no SQL Server usando comandos DROP e verificacao previa de existencia.

-- Bloco 1: criacao da funcao EnderecoCompleto2 para simular um objeto que sera removido na sequencia.
CREATE FUNCTION EnderecoCompleto2
(@ENDERECO VARCHAR(100),
@BAIRRO VARCHAR(50),
@CIDADE VARCHAR(50),
@ESTADO VARCHAR(2),
@CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
    -- Declara uma variavel local que armazenara o endereco concatenado.
    DECLARE @ENDERECO_COMPLETO VARCHAR(250);
    -- Concatena os componentes do endereco com virgulas para gerar uma string padronizada.
    SET @ENDERECO_COMPLETO = @ENDERECO + ', ' + @BAIRRO + ', ' + @CIDADE + ', ' + @ESTADO + ', ' + @CEP;
    RETURN @ENDERECO_COMPLETO;
END;

-- Bloco 2: criacao da funcao EnderecoCompleto3 para demonstrar uma exclusao com validacao de existencia.
CREATE FUNCTION EnderecoCompleto3
(@ENDERECO VARCHAR(100),
@BAIRRO VARCHAR(50),
@CIDADE VARCHAR(50),
@ESTADO VARCHAR(2),
@CEP VARCHAR(20))
RETURNS VARCHAR(250)
AS
BEGIN
    -- Mantem a mesma logica de concatenacao para focar na remocao do objeto.
    DECLARE @ENDERECO_COMPLETO VARCHAR(250);
    SET @ENDERECO_COMPLETO = @ENDERECO + ', ' + @BAIRRO + ', ' + @CIDADE + ', ' + @ESTADO + ', ' + @CEP;
    RETURN @ENDERECO_COMPLETO;
END;

-- Exclusao direta: remove imediatamente a funcao EnderecoCompleto2 (gera erro se ela ja nao existir).
DROP FUNCTION [dbo].[EnderecoCompleto2];

-- Exclusao segura: verifica com OBJECT_ID se a funcao EnderecoCompleto3 existe antes de executar DROP.
IF OBJECT_ID('EnderecoCompleto3', 'FN') IS NOT NULL
    DROP FUNCTION [dbo].[EnderecoCompleto3];
