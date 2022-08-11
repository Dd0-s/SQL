--Имя повара,фамилия повара, средняя коллорийность его блюд, количество приготовленные 'Первых блюд'
IF OBJECT_ID ('Cook') IS NOT NULL  
DROP VIEW Cook;
GO
CREATE VIEW Cook (Имя, Фамилия, Средняя_калорийность, Количество) as
    with table1(name1, surname1, [avg]) as
    (SELECT Name, Surname, AVG(KKal) FROM 
	Dish JOIN Order_Dish 
	ON Dish.Dish_id = Order_dish.Dish_id
	     JOIN Employee
	ON Order_dish.Cook_id = Employee.Employee_id	
		 Join [Type]
	ON [Type].[Type_id] = Dish.[Type_id]
	GROUP BY Cook_id, Name, Surname),
	
	table2(name2, surname2, n) as
	(SELECT name, surname, count(Order_dish.dish_id) FROM
	Dish JOIN Order_Dish 
	ON Dish.Dish_id = Order_dish.Dish_id
	     JOIN Employee
	ON Order_dish.Cook_id = Employee.Employee_id	
		 Join [Type]
	ON [Type].[Type_id] = Dish.[Type_id]
	Where [Type_dish] = 'Первое'
	GROUP BY cook_id, name, surname)

	select name1, surname1, [avg], n from table1
	join table2
	on name1=name2 and surname1=surname2
	with check option
		
GO
SELECT * FROM Cook