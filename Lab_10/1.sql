USE L_10
SET STATISTICS IO ON
SET STATISTICS TIME ON
GO

--��� �������
SELECT customerid, contactname, phone
FROM Customers
WHERE (City = 'London')
	AND (CustomerID BETWEEN 'A' AND 'Z')

--� ��������
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

--��� �������:   ����� �� = 171 ��, ����������� ����� = 413 ��, ����� ���������� ������ = 30006.
--� ��������:    ����� �� = 31 ��, ����������� ����� = 356 ��, ����� ���������� ������ = 736.

