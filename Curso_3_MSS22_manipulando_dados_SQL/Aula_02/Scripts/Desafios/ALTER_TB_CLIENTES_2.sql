-- ================================================================
-- Desafio | Curso 3 Aula 04 | Reajustando volume de compra por estado
-- Objetivo: aplicar um aumento de 20% em VOLUME_COMPRA para clientes do RJ,
-- validando antes e depois da operacao.
-- ================================================================

-- Passo 1: consultar os clientes do Rio de Janeiro antes da alteracao
SELECT *
FROM TB_CLIENTES
WHERE ESTADO = 'RJ';

-- Passo 2: atualizar o volume de compra em 20%
UPDATE TB_CLIENTES
SET VOLUME_COMPRA = VOLUME_COMPRA * 1.20
WHERE ESTADO = 'RJ';

-- Passo 3: confirmar se o ajuste foi aplicado corretamente
SELECT *
FROM TB_CLIENTES
WHERE ESTADO = 'RJ';
