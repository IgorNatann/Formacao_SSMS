CREATE LOGIN Igor_1 WITH PASSWORD = 'Igor@123';

CREATE USER Igor_1 FOR LOGIN Igor_1;

-- Adicionando Permissão de Leitura.
EXEC sp_addrolemember 'db_datareader', 'Igor_1';

-- Adicionando Permissão de Escrita.
EXEC sp_addrolemember 'db_datawriter', 'Igor_1';