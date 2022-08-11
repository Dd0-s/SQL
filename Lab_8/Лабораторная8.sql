USE my_db
GO
--������� ����� ���� ������, ��������� ����������� ������������� ���� ������
SELECT name AS '�������'
FROM sys.sysobjects
WHERE xtype = 'U' 
AND [uid] =
(
	SELECT [uid]
	FROM sys.sysusers
	WHERE name = user_name()
)
AND name <> 'sysdiagrams'

--������� ��� �������, ��� ������� �������, ������� ����, ��������� �� ������ ������� null-��������, 
--�������� ���� ������ ������� �������, ������ ����� ���� ������ 
--��� ���� ������, ��������� ����������� ������������� ���� ������ � ���� �� ��������

SELECT tab.name AS '�������', col.name AS '�������', col.isnullable AS 'ISNULLABLE', [type].name AS '���', col.[length] AS '������'
FROM sys.sysobjects AS tab
JOIN sys.syscolumns AS col ON col.id = tab.id
JOIN sys.systypes AS [type] ON col.xtype = [type].xtype
WHERE tab.xtype = 'U' 
AND tab.[uid] =
(
	SELECT [uid]
	FROM sys.sysusers
	WHERE name = user_name()
)
AND tab.name <> 'sysdiagrams'

--������� �������� ����������� ����������� (��������� � ������� �����), ��� �������, � ������� ��� ���������
--������� ����, ��� ��� �� ����������� ('PK' ��� ���������� ����� � 'F' ��� ��������)
--��� ���� ����������� �����������, ��������� ����������� ������������� ���� ������

SELECT keys.name AS '�����������', tab.name AS '�������', keys.xtype AS '�������'
FROM sys.sysobjects AS keys
JOIN sys.sysobjects AS tab ON keys.parent_obj = tab.id AND tab.xtype = 'U'
WHERE keys.xtype IN ('F', 'PK')
AND keys.[uid] = 
(
	SELECT [uid]
	FROM sys.sysusers
	WHERE name = user_name()
) 
AND tab.name <> 'sysdiagrams'

--������� �������� �������� �����, ��� �������, ���������� ������� ����, ��� �������, ���������� ��� ������������ ����
--��� ���� ������� ������, ��������� ����������� ������������� ���� ������

SELECT obj.name AS '������� ����', fk_from.name AS '�������� �������', fk_to.name AS '������������ �������'
FROM sys.sysreferences AS keys
JOIN sys.sysobjects AS obj ON keys.constid = obj.id
JOIN sys.sysobjects AS fk_from ON keys.fkeyid = fk_from.id
JOIN sys.sysobjects AS fk_to ON keys.rkeyid = fk_to.id
WHERE obj.[uid] =
(
	SELECT [uid]
	FROM sys.sysusers
	WHERE name = user_name()
)

--������� �������� �������������, SQL-������, ��������� ��� �������������
--��� ���� �������������, ��������� ����������� ������������� ���� ������

SELECT [views].name AS '�������������', comments.[text] AS '������'
FROM sys.sysobjects AS [views]
JOIN sys.syscomments AS comments ON [views].id = comments.id
WHERE [views].xtype = 'V'
AND [views].[uid] =
(
	SELECT [uid]
	FROM sys.sysusers
	WHERE name = user_name()
)
ORDER BY [views].name

--������� �������� ��������, ��� �������, ��� ������� ��������� �������
--��� ���� ���������, ��������� ����������� ������������� ���� ������

SELECT trig.name AS '�������', tab.name AS '�������'
FROM sys.sysobjects AS trig
JOIN sys.sysobjects AS tab ON trig.parent_obj = tab.id
WHERE trig.xtype = 'TR'
AND trig.[uid] =
(
	SELECT [uid]
	FROM sys.sysusers
	WHERE name = user_name()
)