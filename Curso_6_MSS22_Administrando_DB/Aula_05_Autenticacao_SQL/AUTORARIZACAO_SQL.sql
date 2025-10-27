ALTER SERVER ROLE [dbcreator] ADD MEMBER [Igor];

CREATE DATABASE dbVendas2;

ALTER SERVER ROLE [dbcreator] DROP MEMBER [Igor];


SELECT * FROM sys.server_principals WHERE is_fixed_role = 1;