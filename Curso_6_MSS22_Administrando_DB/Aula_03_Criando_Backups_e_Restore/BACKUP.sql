BACKUP DATABASE dbVendas TO DISK = 'C:\Users\Igorn\Documents\Alura\Formacao_MSSQLSERVER\Curso_6_MSS22_Administrando_DB\Aula_02_Gerenciando_DB\Data\BACKUP\DBVENDAS_1.BAK';

EXEC IncluiNotasDia '2022-03-01'

SELECT COUNT(*) FROM tb_nota;

-- 3253 notas

BACKUP DATABASE dbVendas TO DISK = 'C:\Users\Igorn\Documents\Alura\Formacao_MSSQLSERVER\Curso_6_MSS22_Administrando_DB\Aula_02_Gerenciando_DB\Data\BACKUP\DBVENDAS_2.BAK';

EXEC IncluiNotasDia '2022-03-02'

-- 3322

EXEC IncluiNotasDia '2022-03-03'
SELECT COUNT(*) FROM tb_nota;

-- 3469

BACKUP DATABASE dbVendas TO DISK = 'C:\Users\Igorn\Documents\Alura\Formacao_MSSQLSERVER\Curso_6_MSS22_Administrando_DB\Aula_02_Gerenciando_DB\Data\BACKUP\DBVENDAS_3.BAK';