IF OBJECT_ID ('Employee2') IS NOT NULL  
DROP VIEW Employee2;
GO
CREATE VIEW Employee2 (Имя, Фамилия) as 
    SELECT Name, Surname FROM Employee