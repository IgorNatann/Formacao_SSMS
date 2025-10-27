SELECT * FROM MASTER.sys.sql_logins;

SELECT name, LOGINPROPERTY(name, 'PasswordLastSetTime') FROM MASTER.sys.sql_logins;

SELECT name, password_hash FROM MASTER.sys.sql_logins;

CREATE LOGIN Teste_01 WITH PASSWORD = 'Teste_01';

SELECT name, password_hash FROM MASTER.sys.sql_logins;

SELECT name FROM MASTER.sys.sql_logins
WHERE PWDCOMPARE(name, password_hash) = 1;

CREATE LOGIN Teste_02 WITH PASSWORD = 'Teste_02';

SELECT name FROM MASTER.sys.sql_logins
WHERE PWDCOMPARE(name + '123', password_hash) = 1;

CREATE LOGIN Teste WITH PASSWORD = 'Teste123';

SELECT name FROM MASTER.sys.sql_logins
WHERE PWDCOMPARE(name + '123', password_hash) = 1;