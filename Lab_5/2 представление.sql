--�����������,���������� ����� ������������,������� ���������� � ������ �����������,������� �����,������� �������� ��������� ������ �� ������� ������������ � ������ ����������� �� ��������� ���
IF OBJECT_ID ('Purchasing') IS NOT NULL  
DROP VIEW Purchasing;
GO
CREATE VIEW Purchasing (�����������, ����������_���������_������������, �������_�����) as 
    SELECT Provider_name, COUNT(Distinct Ingredients_id), round(avg(cast(Total AS float))/(DATEDIFF(day,'01/01/2020',GETDATE())),2) FROM 
	Provider JOIN Purchase 
	ON Provider.Provider_id = Purchase.Provider_id
	WHERE YEAR(Buy_date) = 2020
	group by Provider_name

go	
SELECT * FROM Purchasing
--����� ���������� ����������� ���������� ��������� ������������ 
SELECT TOP(1) WITH TIES �����������
FROM Purchasing
ORDER BY ����������_���������_������������ DESC