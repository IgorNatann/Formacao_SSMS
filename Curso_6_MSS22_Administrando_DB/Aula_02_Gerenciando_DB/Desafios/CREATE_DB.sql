-- Objetivo geral: criar a base VENDAS alinhada aos requisitos de armazenamento, com arquivos separados para dados primarios, dados auxiliares e log.
CREATE DATABASE VENDAS
ON PRIMARY ( -- Secao 1 - arquivo principal de dados (PRIMARY).
    NAME = N'VENDAS',
    FILENAME = N'c:\bases\VENDAS.mdf',
    SIZE = 200MB,
    MAXSIZE = 500MB,
    FILEGROWTH = 50MB
)
, FILEGROUP FG_SECUNDARIO ( -- Secao 2 - arquivo secundario de dados.
    NAME = N'VENDAS_AUX',
    FILENAME = N'c:\bases\VENDAS_AUX.ndf',
    SIZE = 100MB,
    MAXSIZE = 250MB,
    FILEGROWTH = 20MB
)
LOG ON ( -- Secao 3 - arquivo de log de transacoes.
    NAME = N'VENDAS_LOG',
    FILENAME = N'c:\bases\VENDAS_LOG.ldf',
    SIZE = 50MB,
    MAXSIZE = 300MB,
    FILEGROWTH = 40MB
);

-- Resumo dos aprendizados:
-- 1) Definir arquivos fisicos com nomes logicos distintos melhora a organizacao.
-- 2) Controlar SIZE, MAXSIZE e FILEGROWTH ajuda no planejamento de capacidade.
-- 3) Separar dados e log facilita rotinas de administracao e backup.
