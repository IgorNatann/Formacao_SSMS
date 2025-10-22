-- Objetivo geral: construir uma stored procedure parametrizada para consultar notas fiscais por CPF e intervalo de datas.

-- Seção 1 - Definicao da stored procedure com parametros e valores padrão.
CREATE PROCEDURE BuscaNotasCliente
@CPF AS VARCHAR(12) = '19290992743',
@DATA_INICIAL AS DATETIME = '20160101',
@DATA_FINAL AS DATETIME = '20161231'
AS
BEGIN
   -- A consulta utiliza os parametros para filtrar notas fiscais por CPF e periodo.
   SELECT *
   FROM [NOTAS FISCAIS]
   WHERE CPF = @CPF
   AND DATA >= @DATA_INICIAL
   AND DATA <= @DATA_FINAL;
END;

-- Seção 2 - Execucoes demonstrando diferentes formas de passar parametros.
-- Usa todos os valores padrão definidos na procedure.
EXEC BuscaNotasCliente;

-- Informa apenas o CPF; datas continuam com os valores padrão.
EXEC BuscaNotasCliente
@CPF = '2600586709';

-- Passa CPF e data inicial por posição; data final assume o padrão.
EXEC BuscaNotasCliente
'2600586709', '20160501';

-- Passa os três parametros nomeados, substituindo os padrões por um novo intervalo.
EXEC BuscaNotasCliente
@CPF = '2600586709',
@DATA_INICIAL = '20160501',
@DATA_FINAL = '20160630';
