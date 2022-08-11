use my_db
--Потерянные изменения READ UNCOMMITTED (1) (Было 180)

UPDATE Dish
SET Price = 180
WHERE Dish.dish_id = 3

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION
UPDATE Dish
SET Price = 150
WHERE Dish.dish_id = 3
COMMIT

SELECT * FROM Dish WHERE Dish.dish_id = 3