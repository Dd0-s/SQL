USE my_db
--Работник уволился - указать это
UPDATE Employee SET end_date = '06/10/2020'
WHERE (Surname = 'Статкевич' and Name= 'Екатерина')

Select * FROM Employee

--Поставщик сменил название
UPDATE Provider SET Provider_name = 'House of Food'
WHERE (Provider_name = 'Food House')

Select * FROM Provider