-- ================================================================
-- Desafio 1 | Aula 03 Funcoes Numericas
-- Objetivo: calcular o imposto total pago em 2016, arredondando para baixo
-- com FLOOR a partir dos dados de NOTAS_FISCAIS e ITENS_NOTAS_FISCAIS.
-- ================================================================

-- Passo 1: somar o imposto por nota considerando quantidade e preco
-- Multiplicamos QUANTIDADE * PRECO para obter o valor bruto do item, depois
-- aplicamos a porcentagem de IMPOSTO e arredondamos com FLOOR.
SELECT
    FLOOR(SUM(itens.QUANTIDADE * itens.PRECO * notas.IMPOSTO)) AS IMPOSTO_PAGO_2016
FROM NOTAS_FISCAIS AS notas
JOIN ITENS_NOTAS_FISCAIS AS itens
    ON itens.NUMERO = notas.NUMERO
WHERE YEAR(notas.DATA_VENDA) = 2016;

-- Passo 2: validar por agrupamento anual
-- Alternativa que agrupa pelo ano e retorna o mesmo total, util para comparar
-- diferentes periodos se removermos o filtro por 2016.
SELECT
    YEAR(notas.DATA_VENDA) AS ANO,
    FLOOR(SUM(notas.IMPOSTO * (itens.QUANTIDADE * itens.PRECO))) AS IMPOSTO_ARREDONDADO
FROM NOTAS_FISCAIS AS notas
INNER JOIN ITENS_NOTAS_FISCAIS AS itens
    ON notas.NUMERO = itens.NUMERO
WHERE YEAR(notas.DATA_VENDA) = 2016
GROUP BY YEAR(notas.DATA_VENDA);
