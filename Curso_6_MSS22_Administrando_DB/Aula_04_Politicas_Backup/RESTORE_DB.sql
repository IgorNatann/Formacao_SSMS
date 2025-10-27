SELECT * FROM tb_controle_backups

RESTORE HEADERONLY FROM
DISK = 'C:\Users\Igorn\Documents\Alura\Formacao_MSSQLSERVER\Curso_6_MSS22_Administrando_DB\Aula_02_Gerenciando_DB\Data\BACKUP\POLITICA_BACKUP_20220101.BAK'

USE MASTER;
ALTER DATABASE dbVendas SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE dbVendas;

use master;

-- Iniciando Restore - (NORECOVERY) - Sinaliza que ainda será restaurado outras bkps.
RESTORE DATABASE dbVendas FROM DISK = 'C:\Users\Igorn\Documents\Alura\Formacao_MSSQLSERVER\Curso_6_MSS22_Administrando_DB\Aula_02_Gerenciando_DB\Data\BACKUP\POLITICA_BACKUP_20220101.BAK'
WITH FILE = 1, NORECOVERY;

RESTORE DATABASE dbVendas FROM DISK = 'C:\Users\Igorn\Documents\Alura\Formacao_MSSQLSERVER\Curso_6_MSS22_Administrando_DB\Aula_02_Gerenciando_DB\Data\BACKUP\POLITICA_BACKUP_20220101.BAK'
WITH FILE = 9, NORECOVERY;

RESTORE DATABASE dbVendas FROM DISK = 'C:\Users\Igorn\Documents\Alura\Formacao_MSSQLSERVER\Curso_6_MSS22_Administrando_DB\Aula_02_Gerenciando_DB\Data\BACKUP\POLITICA_BACKUP_20220101.BAK'
WITH FILE = 10, NORECOVERY;

RESTORE DATABASE dbVendas FROM DISK = 'C:\Users\Igorn\Documents\Alura\Formacao_MSSQLSERVER\Curso_6_MSS22_Administrando_DB\Aula_02_Gerenciando_DB\Data\BACKUP\POLITICA_BACKUP_20220101.BAK'
WITH FILE = 11, RECOVERY;