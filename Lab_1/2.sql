SELECT top(1) description
FROM Price INNER JOIN Product
ON Price.product_id = Product.product_id
           INNER JOIN Item
ON Product.product_id = Item.product_id
WHERE (YEAR(start_date) < 1990) and (YEAR(end_date) > 1988 or end_date IS NULL) 
ORDER BY (List_price - Actual_price) DESC