/*
================================================================================
  DOCUMENTAÇÃO: ESTUDO DE JOINs EM SQL
================================================================================

📚 CONCEITOS FUNDAMENTAIS
-------------------------
O que é JOIN?
  JOIN é uma operação que combina linhas de duas ou mais tabelas baseado em 
  uma condição de relacionamento entre elas (geralmente chaves estrangeiras).

INNER JOIN:
  Retorna apenas os registros que possuem correspondência em AMBAS as tabelas.

================================================================================
*/


-- =============================================================================
-- 1. CONSULTAS EXPLORATÓRIAS SIMPLES
-- =============================================================================
-- Objetivo: Conhecer a estrutura e os dados das tabelas antes de combiná-las.

SELECT * FROM TABELA_DE_VENDEDORES;

SELECT * FROM NOTAS_FISCAIS;

-- =============================================================================
-- 2. CONTAGEM SEM JOIN (INCOMPLETA)
-- =============================================================================
-- ⚠️ PROBLEMA: Esta query está INCOMPLETA - falta o GROUP BY
-- - Mostra apenas a matrícula, sem o nome do vendedor
-- - Não há relacionamento com a tabela de vendedores

SELECT MATRICULA, COUNT(*) AS NUMERO_NOTAS FROM NOTAS_FISCAIS;

-- =============================================================================
-- 3. PRIMEIRO JOIN - CONTAGEM POR VENDEDOR
-- =============================================================================
-- O que faz:
-- - Combina as duas tabelas pela matrícula
-- - Conta quantas notas fiscais cada vendedor emitiu
-- - Agrupa por matrícula e nome
--
-- ⚠️ AMBIGUIDADE: MATRICULA existe nas duas tabelas - pode gerar erro

SELECT MATRICULA, NOME, COUNT(*) AS NUMERO_NOTAS FROM NOTAS_FISCAIS 
INNER JOIN TABELA_DE_VENDEDORES 
ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA 
GROUP BY MATRICULA, NOME;

-- =============================================================================
-- 4. JOIN COM QUALIFICAÇÃO DE COLUNAS
-- =============================================================================
-- ✅ MELHORIA: Qualifica explicitamente de qual tabela vem cada coluna
-- - NOTAS_FISCAIS.MATRICULA
-- - TABELA_DE_VENDEDORES.NOME
--
-- BENEFÍCIO: Elimina ambiguidade e melhora a legibilidade

SELECT NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME, COUNT(*) AS NUMERO_NOTAS 
FROM NOTAS_FISCAIS 
INNER JOIN TABELA_DE_VENDEDORES 
ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA 
GROUP BY NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME;

-- =============================================================================
-- 5. JOIN COM ALIAS (FORMA OTIMIZADA) ⭐
-- =============================================================================
-- ✅ MELHOR PRÁTICA:
-- - NF = alias para NOTAS_FISCAIS
-- - TV = alias para TABELA_DE_VENDEDORES
-- - Código mais limpo e fácil de ler
-- - Reduz digitação e possibilidade de erros

SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS NUMERO_NOTAS 
FROM NOTAS_FISCAIS NF 
INNER JOIN TABELA_DE_VENDEDORES TV 
ON NF.MATRICULA = TV.MATRICULA 
-- Agrupamento pelos campos MATRICULA e NOME para contar notas fiscais por vendedor
GROUP BY NF.MATRICULA, TV.NOME;

-- =============================================================================
-- 6. INVERTENDO A ORDEM DO JOIN
-- =============================================================================
-- 📌 APRENDIZADO IMPORTANTE:
-- - A ordem das tabelas no INNER JOIN NÃO AFETA O RESULTADO
-- - FROM TV INNER JOIN NF = FROM NF INNER JOIN TV
-- - O resultado é o mesmo, apenas a sequência de processamento pode variar

SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS NUMERO_NOTAS 
FROM TABELA_DE_VENDEDORES TV  
INNER JOIN NOTAS_FISCAIS NF
ON NF.MATRICULA = TV.MATRICULA 
GROUP BY NF.MATRICULA, TV.NOME;

/*
================================================================================
  🎯 RESUMO DAS BOAS PRÁTICAS
================================================================================

PRÁTICA                 | EXEMPLO                      | BENEFÍCIO
------------------------|------------------------------|---------------------------
Usar ALIAS              | FROM NOTAS_FISCAIS NF        | Código mais limpo
Qualificar colunas      | NF.MATRICULA                 | Evita ambiguidade
Documentar              | -- Agrupamento por vendedor  | Facilita manutenção
GROUP BY após JOIN      | Sempre com COUNT, SUM, etc.  | Resultados corretos

================================================================================
  💡 CONCEITOS-CHAVE PARA ESTUDAR
================================================================================

1. RELACIONAMENTO 1:N
   Um vendedor pode ter várias notas fiscais

2. CHAVE ESTRANGEIRA
   MATRICULA em NOTAS_FISCAIS referencia TABELA_DE_VENDEDORES

3. AGREGAÇÃO
   COUNT(*) com GROUP BY para estatísticas

4. QUALIFICAÇÃO DE COLUNAS
   Tabela.Coluna ou Alias.Coluna

================================================================================
  🔄 PRÓXIMOS PASSOS DE ESTUDO
================================================================================

- LEFT JOIN:        Para incluir vendedores sem notas fiscais
- RIGHT JOIN:       Para visualizar notas sem vendedor associado
- FULL OUTER JOIN:  Combinação de LEFT e RIGHT
- CROSS JOIN:       Produto cartesiano entre tabelas

================================================================================
*/