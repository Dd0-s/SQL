use my_db
--Фантом SERIALIZABLE (2)

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION 
INSERT Dish(dish_id, [type_id], dish_name, Kkal, price) VALUES(20, 5, 'Халва', 300, 110)
COMMIT