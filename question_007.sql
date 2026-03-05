--USE AdventureWorks2019

-- part a.
SELECT 
	T.name as TableName
	,C.name as ColumnName
FROM sys.tables as T
	INNER JOIN sys.columns as C ON T.object_id = c.object_id
WHERE C.name LIKE '%rate%'



-- part b.
SELECT 
	T.name as TableName
	,C.name as ColumnName
FROM sys.tables as T
	INNER JOIN sys.columns as C ON T.object_id = c.object_id
WHERE 1=1 
		and T.name LIKE '%History%' 
		and C.name LIKE '%rate%'