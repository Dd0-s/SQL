--организация,количество типов ингредиентов,которые покупались у данной организации,средняя сумма,которую столовая ежедневно тратит на закупку ингредиентов у данной организации за последний год
IF OBJECT_ID ('Purchasing') IS NOT NULL  
DROP VIEW Purchasing;
GO
CREATE VIEW Purchasing (Организация, Количество_различных_ингредиентов, Средняя_сумма) as 
    SELECT Provider_name, COUNT(Distinct Ingredients_id), round(avg(cast(Total AS float))/(DATEDIFF(day,'01/01/2020',GETDATE())),2) FROM 
	Provider JOIN Purchase 
	ON Provider.Provider_id = Purchase.Provider_id
	WHERE YEAR(Buy_date) = 2020
	group by Provider_name

go	
SELECT * FROM Purchasing
--найти поставщика наибольшего количество различных ингридиентов 
SELECT TOP(1) WITH TIES Организация
FROM Purchasing
ORDER BY Количество_различных_ингредиентов DESC