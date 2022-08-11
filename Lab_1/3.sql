SElECT top(1) Manager_id
FROM Employee INNER JOIN Customer
ON Employee.employee_id = Customer.salesperson_id
              INNER JOIN Sales_order
ON Customer.customer_id = Sales_order.customer_id
WHERE year(Order_date) = 1990
ORDER BY sum(Sales_order.total) OVER (PARTITION BY Manager_id)