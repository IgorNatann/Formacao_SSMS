-- Estudamos que podemos simular um FOR usando WHILE.
-- Normalmente, o FOR está associado a uma variável INTEIRA que varia de um valor pequeno para um valor grande, de forma crescente.
-- Mas temos também FOR decrescente, cujos valores variam de um valor alto para um valor pequeno.
-- Vamos representar este FOR decrescente desta maneira:

FOR I = 10 TO 1 STEP -1
   PRINT I

-- Tendo esse cenário, como representar este FOR através do WHILE usando T-SQL?
DECLARE @I INT;

SET @I = 0;

WHILE @I < 10
BEGIN
    PRINT @I
    SET @I = @I + 1;
END;