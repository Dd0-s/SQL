USE my_db
GO

--SELECT session_id FROM sys.dm_exec_sessions WHERE login_name = 'login_test'
KILL 52

CREATE LOGIN login_test WITH PASSWORD = '0000'
CREATE USER user_test FOR LOGIN login_test

------

--Проверка прав доступа у user_test
EXECUTE AS user = 'user_test'
BEGIN TRAN

SELECT * FROM Employee

SELECT Employee.name FROM Employee

UPDATE Employee
	SET phone = '89069129203176' WHERE Employee_id = 1

INSERT Provider(Provider_id, provider_name) VALUES(6,'Мираторг')

DELETE FROM Employee 
	WHERE Employee_id = 1

ROLLBACK
REVERT
------

--Присвоить новому пользователю права SELECT, INSERT, UPDATE в полном объеме на одну таблицу

GRANT INSERT, SELECT, UPDATE ON Dish TO user_test

EXECUTE AS USER = 'user_test'
BEGIN TRAN

SELECT * FROM Dish
SELECT * FROM Purchase

UPDATE Dish
	SET Price = 200
	WHERE dish_id = 1

INSERT Provider(Provider_id, provider_name) VALUES(6,'Мираторг')

DELETE FROM Dish 
	WHERE dish_id = 15

ROLLBACK
REVERT

REVOKE INSERT, SELECT, UPDATE ON dish TO user_test
-----

--Для одной таблицы новому пользователю присвоим права SELECT и UPDATE только избранных столбцов.
GRANT SELECT, UPDATE ON Employee (Name, Surname, employee_id) TO user_test

EXECUTE AS USER = 'user_test'
BEGIN TRAN

SELECT * FROM Employee

SELECT Name, Surname FROM Employee

UPDATE Employee	
 	SET canteen_id = 2
	WHERE employee_id = 3

UPDATE Employee
 	SET name = 'Андрей'
	WHERE employee_id = 1

ROLLBACK
REVERT

REVOKE SELECT, UPDATE on Employee TO user_test
------

--Для одной таблицы новому пользователю присвоим только право SELECT.

GRANT SELECT ON EMPLOYEE TO user_test;

EXECUTE AS USER = 'user_test'

SELECT * FROM [TYPE]

SELECT * FROM EMPLOYEE

UPDATE EMPLOYEE
	SET name = 'Кирилл'
	WHERE employee_id =  1

REVERT

REVOKE SELECT TO user_test
------

--Присвоим новому пользователю право доступа (SELECT) к представлению, созданному в лабораторной работе №5.

GRANT SELECT ON Dishes TO user_test

EXECUTE AS USER = 'user_test'

SELECT * FROM Dishes

SELECT * FROM Purchasing

REVERT

REVOKE SELECT TO user_test
------

--Cоздать стандартную роль уровня базы данных, присвоить ей право доступа (SELECT, UPDATE на некоторые столбцы) к представлению,
--созданному в лабораторной работе №5, назначить новому пользователю созданную роль.

CREATE ROLE role_test
GRANT SELECT, UPDATE ON Employee2 (Имя, Фамилия) TO role_test

EXECUTE sp_addrolemember 'role_test', 'user_test'

EXECUTE AS USER = 'user_test'
BEGIN TRAN

SELECT Имя, Фамилия FROM Employee2

UPDATE Employee2 SET Фамилия = 'Гусева'
	WHERE Имя = 'Арина'

ROLLBACK
REVERT
-----

EXECUTE sp_droprolemember 'role_test', 'user_test'

EXECUTE sp_droprole 'role_test'

EXECUTE sp_dropuser 'user_test'

EXECUTE sp_droplogin 'login_test'

