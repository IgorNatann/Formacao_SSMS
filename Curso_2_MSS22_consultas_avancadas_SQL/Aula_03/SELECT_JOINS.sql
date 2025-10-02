-- Aula 03 - SELECT com INNER JOIN
-- Objetivo: compreender quando usar JOIN para combinar tabelas relacionadas.
-- Roteiro de estudo:
--   1. Revisar dados de cada tabela isoladamente.
--   2. Ver os limites de uma contagem sem relacionar tabelas.
--   3. Introduzir o INNER JOIN e discutir ambiguidade de colunas.
--   4. Qualificar colunas para tornar o codigo explicito.
--   5. Adotar alias para ganhar legibilidade.
--   6. Inverter a ordem das tabelas mostrando que o resultado permanece igual.

-- 1) Diagnostico inicial: lista todos os vendedores.
SELECT *
FROM TABELA_DE_VENDEDORES;

-- 1b) Diagnostico complementar: notas fiscais sem combinacao.
SELECT *
FROM NOTAS_FISCAIS;

-- 2) Tentativa sem JOIN: conta notas por matricula, mas falta GROUP BY e o nome do vendedor.
--    Este comando gera erro porque existe agregacao sem agrupar.
-- SELECT MATRICULA, COUNT(*) AS NUMERO_NOTAS
-- FROM NOTAS_FISCAIS;

-- 3) Primeiro INNER JOIN: une tabelas, mas colunas sem prefixo podem gerar ambiguidade.
SELECT MATRICULA,
       NOME,
       COUNT(*) AS NUMERO_NOTAS
FROM NOTAS_FISCAIS
INNER JOIN TABELA_DE_VENDEDORES
    ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA
GROUP BY MATRICULA,
         NOME;

-- 4) JOIN com nomes qualificados: remove a ambiguidade de colunas repetidas.
SELECT NOTAS_FISCAIS.MATRICULA,
       TABELA_DE_VENDEDORES.NOME,
       COUNT(*) AS NUMERO_NOTAS
FROM NOTAS_FISCAIS
INNER JOIN TABELA_DE_VENDEDORES
    ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA
GROUP BY NOTAS_FISCAIS.MATRICULA,
         TABELA_DE_VENDEDORES.NOME;

-- 5) JOIN com alias: sintaxe mais enxuta mantendo o relacionamento claro.
SELECT NF.MATRICULA,
       TV.NOME,
       COUNT(*) AS NUMERO_NOTAS
FROM NOTAS_FISCAIS AS NF
INNER JOIN TABELA_DE_VENDEDORES AS TV
    ON NF.MATRICULA = TV.MATRICULA
GROUP BY NF.MATRICULA,
         TV.NOME;

-- 6) Ordem invertida: a posicao das tabelas em um INNER JOIN nao altera o resultado.
SELECT NF.MATRICULA,
       TV.NOME,
       COUNT(*) AS NUMERO_NOTAS
FROM TABELA_DE_VENDEDORES AS TV
INNER JOIN NOTAS_FISCAIS AS NF
    ON NF.MATRICULA = TV.MATRICULA
GROUP BY NF.MATRICULA,
         TV.NOME;

-- Boas praticas resumidas:
--   * Qualifique colunas identicas entre tabelas (Tabela.Coluna ou Alias.Coluna).
--   * Use alias curtos para deixar a leitura mais rapida.
--   * Sempre inclua no GROUP BY as colunas nao agregadas que aparecem no SELECT.
