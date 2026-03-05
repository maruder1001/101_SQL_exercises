--USE AdventureWorks2019

--SELECT *
--FROM sys.foreign_key_columns as FKC
--	INNER JOIN sys.objects as o ON o.object_id = FKC.constraint_object_id
--	INNER JOIN sys.tables as T1 ON T1.object_id = FKC.parent_object_id
--	INNER JOIN sys.tables as T2 ON T2.object_id = FKC.referenced_object_id
--	INNER JOIN sys.columns as C1 ON C1.column_id = parent_column_id
--		AND C1.object_id = T1.object_id
--	INNER JOIN sys.columns as C2 ON C2.column_id = referenced_column_id
--		AND C2.object_id = T2.object_id
--	INNER JOIN sys.schemas as S1 ON T1.schema_id = S1.schema_id
--	INNER JOIN sys.schemas as S2 ON T2.schema_id = S2.schema_id


SELECT 
	O.name as FK_Name
	,S1.name as SchemaName
	,T1.name as TableName
	,C1.name as ColumnName
	,S2.name as ReferencedSchemaName
	,T2.name as ReferencedTableName
	,C2.name as ReferencedColumnName
FROM sys.foreign_key_columns as FKC
	INNER JOIN sys.objects as O ON O.object_id = FKC.constraint_object_id
	INNER JOIN sys.tables as T1 ON T1.object_id = FKC.parent_object_id
	INNER JOIN sys.tables as T2 ON T2.object_id = FKC.referenced_object_id
	INNER JOIN sys.columns as C1 ON C1.column_id = parent_column_id
		AND C1.object_id = T1.object_id
	INNER JOIN sys.columns as C2 ON C2.column_id = referenced_column_id
		AND C2.object_id = T2.object_id
	INNER JOIN sys.schemas as S1 ON T1.schema_id = S1.schema_id
	INNER JOIN sys.schemas as S2 ON T2.schema_id = S2.schema_id
WHERE O.name = 'FK_SalesOrderHeader_CurrencyRate_CurrencyRateID'