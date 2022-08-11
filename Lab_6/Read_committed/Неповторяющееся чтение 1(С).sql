use my_db
--Неповторяющееся чтение READ COMMITTED (1)

UPDATE Employee
SET name = 'Злата'
WHERE Employee.employee_id = 2

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION 
SELECT * 
FROM Employee
WHERE Employee.employee_id = 2

SELECT * 
FROM Employee
WHERE Employee.employee_id = 2
COMMIT 