USE L_10
SET STATISTICS IO ON
SET STATISTICS TIME ON
GO

--��� �������
SELECT companyname, shippeddate, freight
FROM Customers
JOIN Orders ON Orders.customerid = Customers.customerid
WHERE Customers.city = 'London'
	AND Orders.freight > 250

--� ��������
CREATE CLUSTERED INDEX Customer_clustered ON Customers (CustomerID)
CREATE CLUSTERED INDEX Orders_clustered ON Orders (CustomerID) 

CREATE NONCLUSTERED INDEX Orders_nonclustered ON Orders(shippeddate, freight)
CREATE NONCLUSTERED INDEX Customer_nonclustered ON Customers(city)
INCLUDE(companyname)

SELECT companyname, shippeddate, freight
FROM Customers
JOIN Orders ON Orders.customerid = Customers.customerid
WHERE Customers.city = 'London'
	AND Orders.freight > 250

DROP INDEX Customer_clustered ON Customers
DROP INDEX Orders_clustered ON Orders
DROP INDEX Orders_nonclustered ON Orders
DROP INDEX Customer_nonclustered ON Customers

--��� �������:   ����� �� = 110 ��, ����������� ����� = 224 ��, ����� ���������� ������ = 30026.
--� ��������:    ����� �� = 16 ��, ����������� ����� = 191 ��, ����� ���������� ������ = 416.
