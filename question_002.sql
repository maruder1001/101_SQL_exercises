-- PART A

-- approach 1.
SELECT 
	COUNT(DISTINCT schems.name) AS SchemaName,
	COUNT(DISTINCT tabs.name) AS TableName,
	COUNT(cols.name) AS ColumnName
FROM sys.tables AS tabs
INNER JOIN sys.columns AS cols   ON cols.object_id = tabs.object_id
INNER JOIN sys.schemas AS schems ON schems.schema_id = tabs.schema_id



-- approach 2.
SELECT 
	COUNT(DISTINCT TABLE_SCHEMA) AS SchemaName,
	COUNT(DISTINCT TABLE_NAME) AS TableName,
	COUNT(COLUMN_NAME) AS ColumnName
FROM INFORMATION_SCHEMA.columns
WHERE table_name NOT IN (
							SELECT TABLE_NAME FROM INFORMATION_SCHEMA.views
						)


-- PART B

-- approach 1.
SELECT 
	schems.name AS SchemaName,
	tabs.name AS TableName,
	cols.name AS ColumnName
FROM sys.tables AS tabs
INNER JOIN sys.columns AS cols   ON cols.object_id = tabs.object_id
INNER JOIN sys.schemas AS schems ON schems.schema_id = tabs.schema_id


-- approach 2.
SELECT 
	TABLE_SCHEMA AS SchemaName,
	TABLE_NAME AS TableName,
	COLUMN_NAME AS ColumnName
FROM INFORMATION_SCHEMA.columns
WHERE table_name NOT IN (
							SELECT TABLE_NAME FROM INFORMATION_SCHEMA.views
						)