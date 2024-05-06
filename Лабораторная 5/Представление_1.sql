--Категория, количество блюд этой категории, среднее количество заказов в день, средняя стоимость блюда.
GO
IF OBJECT_ID ('Dishes') IS NOT NULL  
DROP VIEW Dishes;
GO 
CREATE VIEW Dishes(Категория, Количество_блюд_этой_категории, Среднее_количество_заказов_в_день, Средняя_стоимость_блюда) as 
    with Dish1 (name1, amount1) as
	(SELECT Type_dish, COUNT(DISH_ID) FROM 
	Dish JOIN [Type] 
	ON [Type].[type_id] = Dish.[type_id]
	group by [type_dish]),

	[table] (name1, number1) as 
	(select Type_dish, sum([Order].order_id) from [Order]
	join Order_Dish
	ON [Order].Order_id = Order_Dish.dish_id
	join [Dish]
	ON Order_Dish.dish_id = Dish.dish_id
	join [type]
	ON [type].[type_id] = dish.[type_id]
	group by Type_dish, [date]),

	Dish2 (name2, amount2) as 
	(select name1, round(avg(cast(number1 as float)),2) 
	from [table]
	group by name1),

	Dish3 (name3, amount3) as
	(select Type_dish, round(AVG(CAST(PRICE AS float)),2) from dish
	join [type]
	ON [type].[type_id] = dish.[type_id]
	GROUP BY Type_dish)

select name1, amount1, amount2, amount3 from Dish1
	join Dish2
	on name1=name2
	join Dish3
	on name2=name3
	with check option
go
select * from Dishes

--Какую категорию блюд чаще всего заказывают
SELECT TOP(1) WITH TIES Категория 
FROM Dishes 
ORDER BY Среднее_количество_заказов_в_день DESC

-- Общее среднее количество заказов в день
SELECT round(AVG(Среднее_количество_заказов_в_день),1) as Количесвто
FROM Dishes