use my_db
--Не разрешить вставить блюдо в будущий заказ, если оно удалено.
IF OBJECT_ID ('delete_order_2', 'TR') IS NOT NULL
	DROP TRIGGER delete_order_2
GO

CREATE TRIGGER delete_order_2
ON Order_dish
AFTER INSERT, UPDATE
AS BEGIN
	IF exists (SELECT Order_id, Dish_id FROM Inserted WHERE Dish_id in (SELECT Dish_id FROM Dish WHERE Menu = 0) and
	(SELECT [Date] FROM [Order] WHERE Order_id in (SELECT Order_id FROM Inserted)) > GETDATE())
	BEGIN
		RAISERROR ('Нельзя вставить несуществующее блюдо в будущий заказ', 16, 10);
		ROLLBACK
	END
END