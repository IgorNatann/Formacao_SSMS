/*
Documentação: Subconsultas para médias por embalagem
----------------------------------------------------
1. Construímos uma visão agregada simples de preços médios por embalagem.
2. Aplicamos um filtro com HAVING para restringir agregações com média menor ou igual a 10.
3. Transformamos a lógica de agregação em uma subconsulta nomeada (tabela derivada) para reutilização.
4. A consulta externa filtra os resultados da subconsulta com WHERE, evidenciando a diferença entre WHERE e HAVING.
*/

-- 1) Base agregada: cada linha representa uma embalagem e seu preço médio.
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS
GROUP BY EMBALAGEM;

-- 2) Filtro pós-agregação: HAVING atua sobre o resultado do AVG.
SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
FROM TABELA_DE_PRODUTOS
GROUP BY EMBALAGEM
HAVING AVG(PRECO_DE_LISTA) <= 10;

-- 3) Subconsulta como tabela derivada (MEDIA_EMBALAGENS) pronta para ser reutilizada.
SELECT *
FROM (
    SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
    FROM TABELA_DE_PRODUTOS
    GROUP BY EMBALAGEM
) MEDIA_EMBALAGENS;

-- 4) Consulta externa filtrando a subconsulta com WHERE, dispensando HAVING nesta camada.
SELECT MEDIA_EMBALAGENS.EMBALAGEM, MEDIA_EMBALAGENS.PRECO_MEDIO
FROM (
    SELECT EMBALAGEM, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
    FROM TABELA_DE_PRODUTOS
    GROUP BY EMBALAGEM
) MEDIA_EMBALAGENS
WHERE MEDIA_EMBALAGENS.PRECO_MEDIO <= 10;
