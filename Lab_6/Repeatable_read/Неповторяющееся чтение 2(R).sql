use my_db
--��������������� ������ READ COMMITTED(2)

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION
UPDATE Employee
SET name = '������'
WHERE Employee.employee_id = 2
COMMIT