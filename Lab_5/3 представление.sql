--имя работника, количество обработанных заказов за все время работы
IF OBJECT_ID ('Employee1') IS NOT NULL  
DROP VIEW Employee1;
GO
CREATE VIEW Employee1 (Имя, Фамилия, Количество) as 
    SELECT Name, Surname, COUNT(order_id) FROM 
	[Order] JOIN Employee 
	ON [Order].Employee_id = Employee.Employee_id
	group by [Order].Employee_id, name, surname
GO
SELECT * FROM Employee1