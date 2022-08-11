use my_db
--Фантом SERIALIZABLE (1)

DELETE FROM Dish
WHERE Dish.dish_id = 20

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION 

SELECT * 
FROM Dish
WHERE Dish.[type_id] = 5 

SELECT * 
FROM Dish
WHERE Dish.[type_id] = 5 
COMMIT
