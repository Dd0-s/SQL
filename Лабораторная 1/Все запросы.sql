--Первый запрос
SELECT CAST(AVG(salary + isnull(commission,0)) as int) as Average FROM employee

--Второй запрос
SELECT top(1) description
FROM Price INNER JOIN Product
ON Price.product_id = Product.product_id
           INNER JOIN Item
ON Product.product_id = Item.product_id
WHERE (YEAR(start_date) < 1990) and (YEAR(end_date) > 1988 or end_date IS NULL) 
ORDER BY (List_price - Actual_price) DESC

--Третий запрос
SElECT top(1) Manager_id
FROM Employee INNER JOIN Customer
ON Employee.employee_id = Customer.salesperson_id
              INNER JOIN Sales_order
ON Customer.customer_id = Sales_order.customer_id
WHERE year(Order_date) = 1990
ORDER BY sum(Sales_order.total) OVER (PARTITION BY Manager_id)

--Четвертый запрос
SELECT description
FROM Product INNER JOIN Price
ON Price.product_id = Product.product_id
where YEAR(start_date) = 1988
GROUP BY Price.product_id, Product.description
HAVING COUNT(Price.product_id) > 1
