-- =========================================
-- Aula 03 - SELECT com INNER JOIN
-- Objetivo geral: entender como relacionar tabelas para responder perguntas que exigem dados de mais de uma origem.
-- Contexto: usaremos NOTAS_FISCAIS e TABELA_DE_VENDEDORES para descobrir quem emitiu cada nota.
-- Conceitos principais: SELECT, FROM, INNER JOIN, GROUP BY, alias de tabelas e colunas agregadas.
-- Sugestao de estudo: revise cada bloco, execute as consultas no SQL Server Management Studio e compare resultados.
-- =========================================

-- -----------------------------------------
-- Bloco 1 | Inspecionar a tabela de vendedores
-- Descricao: lista todos os vendedores cadastrados.
-- Conceitos-chave: SELECT, FROM.
-- Aplicacao: conferencias de cadastro ou base para filtrar vendedores em relatorios.
SELECT *
FROM TABELA_DE_VENDEDORES;

-- -----------------------------------------
-- Bloco 2 | Inspecionar a tabela de notas fiscais
-- Descricao: visualiza todas as notas sem relacionar com vendedores.
-- Conceitos-chave: SELECT, FROM.
-- Aplicacao: diagnostico inicial para entender quais matriculas aparecem nas notas.
SELECT *
FROM NOTAS_FISCAIS;

-- -----------------------------------------
-- Bloco 3 | Tentativa sem JOIN (erro proposital)
-- Descricao: mesmo que estaria perto da resposta, mas falha por falta de GROUP BY e do nome do vendedor.
-- Conceitos-chave: COUNT, agregacao, necessidade do GROUP BY.
-- Aplicacao: mostra por que nao basta agregar quando precisamos do nome correspondente.
-- Resultado esperado: erro "Column 'NOTAS_FISCAIS.MATRICULA' is invalid in the select list" (ou similar).
-- SELECT MATRICULA, COUNT(*) AS NUMERO_NOTAS
-- FROM NOTAS_FISCAIS;

-- -----------------------------------------
-- Bloco 4 | Primeiro INNER JOIN
-- Descricao: relaciona notas a vendedores e traz a contagem de notas por matricula.
-- Conceitos-chave: INNER JOIN, ON, GROUP BY, COUNT.
-- Aplicacao: relatorio simples de produtividade por vendedor a partir da matricula.
SELECT MATRICULA,            -- ainda sem qualificar: cuidado com colunas duplicadas entre tabelas
       NOME,                 -- mesma advertencia para colunas com o mesmo nome em mais de uma tabela
       COUNT(*) AS NUMERO_NOTAS
FROM NOTAS_FISCAIS
INNER JOIN TABELA_DE_VENDEDORES
    ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA
GROUP BY MATRICULA,
         NOME;

-- -----------------------------------------
-- Bloco 5 | JOIN com nomes qualificados
-- Descricao: usa Tabela.Coluna para eliminar ambiguidade da consulta anterior.
-- Conceitos-chave: qualificacao de colunas, legibilidade, boas praticas de JOIN.
-- Aplicacao: padrao recomendado quando tabelas compartilham nomes de campos, evitando erros de manutencao.
SELECT NOTAS_FISCAIS.MATRICULA,
       TABELA_DE_VENDEDORES.NOME,
       COUNT(*) AS NUMERO_NOTAS
FROM NOTAS_FISCAIS
INNER JOIN TABELA_DE_VENDEDORES
    ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA
GROUP BY NOTAS_FISCAIS.MATRICULA,
         TABELA_DE_VENDEDORES.NOME;

-- -----------------------------------------
-- Bloco 6 | JOIN com alias
-- Descricao: substitui nomes longos por apelidos (alias) para simplificar a leitura.
-- Conceitos-chave: alias com AS, mesma logica de INNER JOIN e GROUP BY.
-- Aplicacao: consultas complexas com varias tabelas onde a legibilidade depende de abreviacoes consistentes.
SELECT NF.MATRICULA,
       TV.NOME,
       COUNT(*) AS NUMERO_NOTAS
FROM NOTAS_FISCAIS AS NF
INNER JOIN TABELA_DE_VENDEDORES AS TV
    ON NF.MATRICULA = TV.MATRICULA
GROUP BY NF.MATRICULA,
         TV.NOME;

-- -----------------------------------------
-- Bloco 7 | Ordem das tabelas no INNER JOIN
-- Descricao: inverte a ordem de declaracao das tabelas mostrando que o resultado permanece o mesmo.
-- Conceitos-chave: comutatividade do INNER JOIN, alias reaproveitados.
-- Aplicacao: reforca que o mais importante e a condicao de uniao, nao a ordem de aparicao.
SELECT NF.MATRICULA,
       TV.NOME,
       COUNT(*) AS NUMERO_NOTAS
FROM TABELA_DE_VENDEDORES AS TV
INNER JOIN NOTAS_FISCAIS AS NF
    ON NF.MATRICULA = TV.MATRICULA
GROUP BY NF.MATRICULA,
         TV.NOME;

-- -----------------------------------------
-- Boas praticas finais
-- * Qualifique colunas identicas entre tabelas (Tabela.Coluna ou Alias.Coluna).
-- * Use alias curtos e significativos para ganhar legibilidade sem perder contexto.
-- * Sempre inclua no GROUP BY as colunas nao agregadas presentes no SELECT.
-- * Verifique o plano de execucao em consultas maiores para confirmar que o JOIN esta eficiente.
