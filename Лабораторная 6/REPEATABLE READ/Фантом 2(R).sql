use my_db
--������ REPEATABLE READ (2)

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION 
INSERT Dish(dish_id, [type_id], dish_name, Kkal, price) VALUES(20, 5, '�����', 300, 110)
COMMIT