USE L_10
SET STATISTICS IO ON
SET STATISTICS TIME ON
GO

--Без индекса
SELECT customerid, contactname, phone
FROM Customers
WHERE (City = 'London')
	AND (CustomerID BETWEEN 'A' AND 'Z')

--С индексом
CREATE NONCLUSTERED INDEX Customer_nonclustered ON Customers(city, CustomerID)
INCLUDE(phone, contactname)
GO

SELECT customerid, contactname, phone
FROM Customers
WHERE (City = 'London')
	AND (CustomerID BETWEEN 'A' AND 'Z')
GO

DROP INDEX Customer_nonclustered ON Customers
GO

--Без индекса:   Время ЦП = 171 мс, затраченное время = 413 мс, число логических чтений = 30006.
--С индексом:    Время ЦП = 31 мс, затраченное время = 356 мс, число логических чтений = 736.

