use my_db
--��������������� ������ READ COMMITTED(2)

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
BEGIN TRANSACTION
UPDATE Employee
SET name = '������'
WHERE Employee.employee_id = 2
COMMIT