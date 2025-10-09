-- ================================================================
-- Curso 3 | Aula 05 | Atividade 08 | Demonstracao de CHECK constraints
-- Objetivo: validar regras de idade por cidade usando constraints CHECK e
-- observar o comportamento nas insercoes.
-- ================================================================

-- Passo 1: criar tabela com restricao simples (idade minima 18)
CREATE TABLE TAB_CHECK (
    ID INT NOT NULL,
    NOME VARCHAR(50) NULL,
    IDADE INT NULL,
    CIDADE VARCHAR(50) NULL,
    CONSTRAINT CHK_IDADE CHECK (IDADE >= 18)
);

-- Passo 2: inserir registro valido (idade >= 18)
INSERT INTO TAB_CHECK VALUES (1, 'JOAO', 19, 'RIO DE JANEIRO');

-- Passo 3: tentar inserir registro invalido (idade 16) para ver o erro
INSERT INTO TAB_CHECK VALUES (2, 'PEDRO', 16, 'RIO DE JANEIRO');

-- Passo 4: inserir valor que atende a regra apos ajuste
INSERT INTO TAB_CHECK VALUES (2, 'PEDRO', 20, 'RIO DE JANEIRO');

-- Passo 5: criar tabela com regra condicional por cidade
CREATE TABLE TAB_CHECK_2 (
    ID INT NOT NULL,
    NOME VARCHAR(50) NULL,
    IDADE INT NULL,
    CIDADE VARCHAR(50) NULL,
    CONSTRAINT CHK_IDADE2 CHECK (
        (IDADE >= 18 AND CIDADE = 'RIO DE JANEIRO') OR
        (IDADE >= 16 AND CIDADE = 'SAO PAULO')
    )
);

-- Passo 6: testar insercoes em TAB_CHECK_2
INSERT INTO TAB_CHECK_2 VALUES (1, 'JOAO', 19, 'RIO DE JANEIRO');   -- passa
INSERT INTO TAB_CHECK_2 VALUES (2, 'PEDRO', 17, 'RIO DE JANEIRO');  -- falha (idade < 18)
INSERT INTO TAB_CHECK_2 VALUES (2, 'PEDRO', 17, 'SAO PAULO');       -- passa (idade >= 16)
