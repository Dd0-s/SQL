USE my_db
--При удалении блюда удаляются все будущие заказы, содержащие это блюдо.
IF OBJECT_ID ('delete_order_1', 'TR') IS NOT NULL
   DROP TRIGGER delete_order_1
GO

CREATE TRIGGER delete_order_1
ON Dish
INSTEAD OF DELETE 
AS BEGIN
    UPDATE Dish SET Menu = 0 WHERE Dish_id in (SELECT Dish_id FROM Deleted)
	DELETE FROM [Order] WHERE [Date] > GETDATE() and
	Order_id in (SELECT Order_id FROM Order_dish WHERE Dish_id in (SELECT Dish_id FROM Deleted))
END
