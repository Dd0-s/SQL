--Удалить всю информацию о заказах до 2019 года
use my_db
DELETE FROM Purchase
WHERE YEAR(Buy_date) < 2019

SELECT *  FROM Purchase
