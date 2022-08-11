SELECT description
FROM Product INNER JOIN Price
ON Price.product_id = Product.product_id
where YEAR(start_date) = 1988
GROUP BY Price.product_id, Product.description
HAVING COUNT(Price.product_id) > 1