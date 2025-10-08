-- ================================================================
-- Guia rapido | Restauracao de banco a partir de arquivo .bak
-- Objetivo: servir como cola pratica para listar arquivos logicos,
-- executar RESTORE DATABASE e validar o conteudo restaurado.
-- Ajuste caminhos conforme ambiente/local do backup.
-- ================================================================

-- Passo 0: garantir que o banco esteja fora de uso quando sobrescrever
-- EXEC sp_who2 'active'; -- opcional para inspecionar conexoes
-- ALTER DATABASE NomeBanco SET SINGLE_USER WITH ROLLBACK IMMEDIATE; -- se precisar

USE master;
GO

-- Passo 1: listar nomes logicos presentes no .bak
-- Use o resultado para preencher os parametros MOVE do RESTORE.
RESTORE FILELISTONLY
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\Restore\SUCOS_FRUTAS.bak';
GO

-- Passo 2: restaurar o banco apontando caminhos fisicos desejados
-- Substitua SUCOS_FRUTAS pelos nomes logicos retornados, se forem diferentes.
RESTORE DATABASE SUCOS_FRUTAS
FROM DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\Restore\SUCOS_FRUTAS.bak'
WITH MOVE 'SUCOS_FRUTAS'     TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\Restore\SUCOS_FRUTAS.mdf',
     MOVE 'SUCOS_FRUTAS_log' TO 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\Restore\SUCOS_FRUTAS.ldf',
     REPLACE; -- remova se nao for sobrescrever
GO

-- Passo 3: recolocar em multi-user caso tenha forcado single-user (opcional)
-- ALTER DATABASE SUCOS_FRUTAS SET MULTI_USER;

-- Passo 4: validar se as tabelas principais estao acessiveis
USE SUCOS_FRUTAS;
GO

SELECT TOP (10) * FROM TABELA_DE_CLIENTES;
SELECT TOP (10) * FROM ITENS_NOTAS_FISCAIS;
SELECT TOP (10) * FROM NOTAS_FISCAIS;
SELECT TOP (10) * FROM TABELA_DE_PRODUTOS;
SELECT TOP (10) * FROM TABELA_DE_VENDEDORES;
GO
