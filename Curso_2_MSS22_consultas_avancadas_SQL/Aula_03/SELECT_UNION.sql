/*
Guia de Bolso: UNION x UNION ALL
--------------------------------
Objetivo: Reunir rapidamente bairros registrados em TABELA_DE_CLIENTES (TC) e TABELA_DE_VENDEDORES (TV).
Definicoes rapidas:
- UNION: concatena conjuntos eliminando duplicidades (DISTINCT implicito), reordena conforme otimizacao do banco.
- UNION ALL: concatena conjuntos mantendo duplicidades (sem DISTINCT), ideal para contagens e analises de frequencia.
Regras essenciais:
1. Cada SELECT deve ter o mesmo numero de colunas, na mesma ordem e com tipos compativeis.
2. Alias de colunas sao herdados do primeiro SELECT.
3. Filtragens adicionais (WHERE, GROUP BY, ORDER BY) devem ser aplicadas dentro de cada SELECT ou ao conjunto final.
Como usar este roteiro:
- Execute os passos em sequencia para visualizar diferencas.
- Adapte filtros (WHERE) para segmentar regioes ou periodos especificos.
*/

-- [1] Verificacao inicial: bairros distintos presentes na tabela de vendedores (TV)
SELECT DISTINCT BAIRRO
FROM TABELA_DE_VENDEDORES;

-- [2] UNION: combina clientes e vendedores retornando uma lista unica de bairros
SELECT BAIRRO
FROM TABELA_DE_CLIENTES
UNION
SELECT BAIRRO
FROM TABELA_DE_VENDEDORES;

-- [3] UNION ALL: mesmo conjunto, mas preservando duplicidades para medir sobreposicao
SELECT BAIRRO
FROM TABELA_DE_CLIENTES
UNION ALL
SELECT BAIRRO
FROM TABELA_DE_VENDEDORES;

-- [4] UNION ALL com tag de origem: evidencia em quais tabelas cada bairro aparece (mantem repeticoes)
SELECT BAIRRO, 'CLIENTE' AS ORIGEM
FROM TABELA_DE_CLIENTES
UNION ALL
SELECT BAIRRO, 'VENDEDOR' AS ORIGEM
FROM TABELA_DE_VENDEDORES;

-- [5] UNION com tag de origem: consolida bairros unicos, exibindo origem da primeira ocorrencia
SELECT BAIRRO, 'CLIENTE' AS ORIGEM
FROM TABELA_DE_CLIENTES
UNION
SELECT BAIRRO, 'VENDEDOR' AS ORIGEM
FROM TABELA_DE_VENDEDORES;
