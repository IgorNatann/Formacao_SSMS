-- ================================================================
-- Aula 03 | Funcoes Numericas no SQL Server
-- Objetivo: apresentar funcoes para arredondar, truncar, elevar numeros,
-- calcular exponenciais, raizes e absolutos em exemplos simples.
-- ================================================================

-- Secao 1: arredondando valores com ROUND
-- ROUND recebe o numero e a quantidade de casas decimais desejadas.
SELECT ROUND(3.433, 2) AS VALOR_ARREDONDADO;

-- Secao 2: comparando arredondamentos com diferentes entradas
-- Aqui vemos como a metade para cima (3.437) e para baixo (3.433) resultam.
SELECT
    ROUND(3.437, 2) AS ARREDONDADO_PARA_CIMA,
    ROUND(3.433, 2) AS ARREDONDADO_PARA_BAIXO;

-- Secao 3: arredondamento para cima com CEILING
-- CEILING devolve o menor inteiro maior ou igual ao valor informado.
SELECT CEILING(3.433) AS MENOR_INTEIRO_SUPERIOR;

-- Secao 4: arredondamento para baixo com FLOOR
-- FLOOR devolve o maior inteiro menor ou igual ao valor informado.
SELECT FLOOR(3.433) AS MAIOR_INTEIRO_INFERIOR;

-- Secao 5: calculando potencias com POWER
-- POWER eleva o primeiro numero ao expoente informado no segundo argumento.
SELECT POWER(12, 2) AS DOZE_AO_QUADRADO;

-- Secao 6: exponencial natural com EXP
-- EXP calcula e elevado ao valor informado; util em modelos logaritmicos.
SELECT EXP(3) AS E_ELEVADO_A_3;

-- Secao 7: raiz quadrada com SQRT
-- SQRT retorna a raiz quadrada positiva do numero.
SELECT SQRT(300) AS RAIZ_QUADRADA_DE_300;

-- Secao 8: valor absoluto com ABS
-- ABS transforma qualquer numero em sua magnitude positiva.
SELECT ABS(10) AS ABS_POSITIVO,
       ABS(-10) AS ABS_NEGATIVO;
