-- ================================================================
-- Desafio | Curso 4 | Aula 04 | Atividade 04 | Avaliando condicoes com IF/ELSE
-- Objetivo: testar uma expressao logica envolvendo idade e formacoes e
-- determinar se a condicao retorna 'EXPRESSAO VERDADEIRA' ou 'EXPRESSAO FALSA'.
-- ================================================================

-- Passo 1: declarar variaveis de idade e formacoes
DECLARE @IDADE_ALUNO INT;
DECLARE @FORMADO_INGLES BIT;
DECLARE @FORMADO_ALEMAO BIT;

-- Passo 2: atribuir valores de teste (aluno com 17 anos, formado em ingles)
SET @IDADE_ALUNO = 17;
SET @FORMADO_INGLES = 1;
SET @FORMADO_ALEMAO = 0;

-- Passo 3: avaliar expressao composta e exibir resultado
IF ((@IDADE_ALUNO >= 18 OR @FORMADO_INGLES = 1)
    OR (@IDADE_ALUNO < 18 AND @FORMADO_ALEMAO = 1))
    PRINT 'EXPRESSAO VERDADEIRA';
ELSE
    PRINT 'EXPRESSAO FALSA';

-- Resultado esperado: 'EXPRESSAO VERDADEIRA', porque mesmo menor de 18,
-- o aluno é formado em ingles, satisfazendo a primeira parte do OR.
