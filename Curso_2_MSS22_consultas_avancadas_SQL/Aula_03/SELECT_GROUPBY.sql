-- Aula 03 - SELECT com GROUP BY
-- Objetivo: praticar agregacoes e entender a relacao com os dados agrupados.
-- Roteiro de estudo:
--   1. Revisar os dados crus da tabela para entender as colunas.
--   2. Aplicar ordenacao para visualizar repeticoes.
--   3. Calcular somas, medias e contagens por grupo.
--   4. Repetir o processo em outra tabela com filtro adicional.
-- Observacao: toda coluna presente no SELECT sem funcao de agregacao precisa aparecer no GROUP BY.

-- 1) Vista completa: captura todos os clientes sem agrupamento.
SELECT *
FROM TABELA_DE_CLIENTES;

-- 2) Projecao simples: destaca cidade e idade para avaliar dados repetidos.
SELECT CIDADE,
       IDADE
FROM TABELA_DE_CLIENTES;

-- 3) Ordenacao: facilita enxergar como as idades se repetem em cada cidade.
SELECT CIDADE,
       IDADE
FROM TABELA_DE_CLIENTES
ORDER BY CIDADE,
         IDADE;

-- 4) Soma por cidade: exemplo classico de agregacao com SUM.
SELECT CIDADE,
       SUM(IDADE) AS SOMA_IDADE,
       SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE_CREDITO
FROM TABELA_DE_CLIENTES
GROUP BY CIDADE;

-- 5) Media por cidade: inclui AVG para comparar distribuicoes de idade.
SELECT CIDADE,
       AVG(IDADE) AS MEDIA_IDADE,
       SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE_CREDITO
FROM TABELA_DE_CLIENTES
GROUP BY CIDADE;

-- 6) Contagem por cidade: usa COUNT(*) para saber o volume de clientes.
SELECT CIDADE,
       COUNT(*) AS TOTAL_CLIENTES
FROM TABELA_DE_CLIENTES
GROUP BY CIDADE;

-- 7) Contagem por embalagem: troca a tabela para observar outro contexto.
SELECT EMBALAGEM,
       COUNT(*) AS TOTAL_PRODUTOS
FROM TABELA_DE_PRODUTOS
GROUP BY EMBALAGEM;

-- 8) Contagem filtrada: aplica WHERE antes do agrupamento para focar em um sabor.
SELECT EMBALAGEM,
       COUNT(*) AS TOTAL_PRODUTOS
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Laranja'
GROUP BY EMBALAGEM;

-- Funcoes de agregacao mais usadas:
--   SUM  -> soma dos valores.
--   AVG  -> media aritmetica.
--   MIN  -> menor valor do grupo.
--   MAX  -> maior valor do grupo.
--   COUNT-> quantidade de registros.
