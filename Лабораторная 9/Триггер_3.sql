USE my_db
--Если после обновления заказа - заказ стал будущим и содержать удаленное блюдо, то удалить его.
IF OBJECT_ID ('delete_order_3', 'TR') IS NOT NULL
   DROP TRIGGER delete_order_3
GO

CREATE TRIGGER delete_order_3
ON [Order]
AFTER UPDATE 
AS BEGIN
	DELETE FROM [Order] WHERE Order_id in (SELECT Order_id FROM Inserted) and
	Order_id in (SELECT Order_id FROM Order_dish WHERE Dish_id in (SELECT Dish_id FROM Dish WHERE Menu = 0)) and
	(SELECT [Date] FROM Inserted) > GETDATE()
END