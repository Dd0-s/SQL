use my_db
--���������� ��������� READ UNCOMMITTED (2)(���� 180)

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION
UPDATE Dish
SET Price = 140
WHERE Dish.dish_id = 3
COMMIT