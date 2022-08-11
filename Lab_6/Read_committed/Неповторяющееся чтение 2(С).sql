use my_db
--Неповторяющееся чтение READ COMMITTED(2)

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
UPDATE Employee
SET name = 'Наташа'
WHERE Employee.employee_id = 2
COMMIT