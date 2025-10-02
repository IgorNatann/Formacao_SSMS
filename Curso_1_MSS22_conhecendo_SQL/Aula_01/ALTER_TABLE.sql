-- =========================================
-- Aula 01 - Ajustando a tabela de clientes
-- Objetivo geral: reforcar como garantir integridade apos criar a tabela.
-- Contexto: apos a carga inicial, deixamos o CPF sem restricoes; agora vamos definir regra de negocio.
-- Conceitos principais: ALTER TABLE, NOT NULL, PRIMARY KEY CLUSTERED.
-- =========================================

-- Passo 1 | Tornar o CPF obrigatorio na tabela de clientes.
-- Por que importa: documentos de identificacao nao podem ficar vazios e serao usados em relatorios e joins.
ALTER TABLE [TABELA_CLIENTES] ALTER COLUMN [CPF] CHAR(11) NOT NULL;

-- Passo 2 | Definir o CPF como chave primaria para evitar duplicacoes.
-- PRIMARY KEY CLUSTERED garante unicidade e cria o indice fisico da tabela em cima do CPF.
ALTER TABLE [TABELA_CLIENTES]
    ADD CONSTRAINT PK_TABELA_CLIENTES
        PRIMARY KEY CLUSTERED ([CPF]);
