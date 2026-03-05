USE AdventureWorks2019


--Select 
--    O.name as FK_Name
--    ,S1.name as SchemaName
--    ,T1.name as TableName
--    ,C1.name as ColumnName
--    ,S2.name as ReferencedSchemaName
--    ,T2.name as ReferencedTableName
--    ,C2.name as ReferencedColumnName
--INTO Edited_AdventureWorks2019.dbo.Table_Relationships
--From sys.foreign_key_columns FKC
--    INNER JOIN sys.objects O ON O.object_id = FKC.constraint_object_id
--    INNER JOIN sys.tables T1 ON T1.object_id = FKC.parent_object_id
--    INNER JOIN sys.tables T2 ON T2.object_id = FKC.referenced_object_id
--    INNER JOIN sys.columns C1 ON C1.column_id = parent_column_id 
--		             AND C1.object_id = T1.object_id
--    INNER JOIN sys.columns C2 ON C2.column_id = referenced_column_id 
--			     AND C2.object_id = T2.object_id
--    INNER JOIN sys.schemas S1 ON T1.schema_id = S1.schema_id
--    INNER JOIN sys.schemas S2 ON T2.schema_id = S2.schema_id


SELECT FK_Name, COUNT(*) as CNT
FROM [Edited_AdventureWorks2019].[dbo].[Table_Relationships]
GROUP BY FK_Name
HAVING COUNT(*)>1



SELECT COUNT(*) as CNT
FROM [Edited_AdventureWorks2019].[dbo].[Table_Relationships]
WHERE ColumnName = 'BusinessEntityID' or ReferencedColumnName = 'BusinessEntityID'