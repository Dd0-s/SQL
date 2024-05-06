USE my_db

--Сделать заказ на 600-800 КKал
SELECT top(1) a.Dish_name AS '1', b.Dish_name AS '2', c.Dish_name AS '3', d.Dish_name AS '4' FROM Dish AS a
join Dish AS b ON b.[Type_id] = 2
join Dish AS c ON c.[Type_id] = 3
join Dish AS d ON d.[Type_id] = 4
WHERE a.[Type_id] = 1 and a.KKal + b.KKal + c.KKal + d.KKal between 600 and 800

--Самое дешевое первое блюдо
SELECT TOP(1) WITH TIES Dish_name
FROM Dish INNER JOIN [Type]
ON [Type].[Type_id]=Dish.[Type_id]
WHERE ([Type].Type_dish = 'Первое')
ORDER BY Price DESC

--Средний ежедневный доход столовой
SELECT SUM(Price)/31
FROM Dish INNER JOIN Order_dish
ON Dish.Dish_id = Order_Dish.Dish_id
		   INNER JOIN [Order]
ON Order_dish.Order_id = [Order].Order_id
           INNER JOIN Employee
ON Order_Dish.Cook_id = Employee.Employee_id
WHERE ([date]>='01/03/2020' and [date]<='31/03/2020' and Canteen_id = 1)

--Самое популярное блюдо в марте
SELECT top(1) WITH TIES Dish_name
FROM Dish INNER JOIN Order_Dish
ON Dish.Dish_id = Order_dish.Dish_id 
		   INNER JOIN [Order]
ON Order_dish.Order_id  = [Order].Order_id
WHERE ([date]>='01/03/2020' and [date]<='31/03/2020')
GROUP BY Dish_name
ORDER BY COUNT(Dish_name) DESC

--Масса продуктов, купленных в столовую по адрессу: Москва, Вешняковская Ул., дом 2, кв. 64 за апрель
SELECT SUM(Wight)
FROM Canteen INNER JOIN Purchase
ON Canteen.Canteen_id = Purchase.Canteen_id
WHERE (Buy_date>='01/04/2020' and Buy_date <='30/04/2020' and Location = 'Москва, Вешняковская Ул., дом 2, кв. 64')
GROUP BY Purchase.Canteen_id

--Поставщик, который получил наибольшие выплаты за июнь
SELECT TOP(1) Provider_name
FROM Provider INNER JOIN Purchase
ON Provider.Provider_id = Purchase.Provider_id
WHERE (Buy_date>='01/06/2020' and Buy_date <='30/06/2020')
ORDER BY sum(Total) OVER (PARTITION BY Purchase.Provider_id)

--Какие работники работают по понедельникам по адрессу: Москва, Туристская Ул., дом 14/К. 1, кв. 158
SELECT Name, Surname
FROM Canteen INNER JOIN Employee
ON Canteen.Canteen_id = Employee.Canteen_id
where(Location = 'Москва, Туристская Ул., дом 14/К. 1, кв. 158' and CHARINDEX('пн', Day_work) > 0)
