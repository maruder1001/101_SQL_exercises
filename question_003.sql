-- Part a.

--CREATE DATABASE Edited_AdventureWorks2019
USE Edited_AdventureWorks2019



-- Part b.

--SELECT *
--FROM AdventureWorks2019.sys.check_constraints


--SELECT *
--FROM AdventureWorks2019.INFORMATION_SCHEMA.CHECK_CONSTRAINTS


SELECT 
	t.name as TableName,
	c.name as ColumnName,
	cc.name as CheckConstraintName,
	cc.definition as CheckConstraintDefinition
FROM AdventureWorks2019.sys.check_constraints AS cc
	INNER JOIN AdventureWorks2019.sys.tables AS t ON t.object_id = cc.parent_object_id
	LEFT JOIN AdventureWorks2019.sys.columns AS c on c.object_id = cc.parent_object_id  
			and	c.column_id = cc.parent_column_id

-- Part c.

Create Table tbl_CheckContraint(
	TableName varchar(100),
	ColumnName varchar(100),
	CheckConstraint varchar(250),
	[Definition] varchar(500),
	ConstraintLevel varchar(100)
	)


-- Part d.

Insert Into tbl_CheckContraint(
	TableName ,
	ColumnName ,
	CheckConstraint ,
	[Definition] ,
	ConstraintLevel 
	)
		SELECT 
			t.name as TableName,
			c.name as ColumnName,
			cc.name as CheckConstraintName,
			cc.definition as CheckConstraintDefinition,
			null
		FROM AdventureWorks2019.sys.check_constraints AS cc
			INNER JOIN AdventureWorks2019.sys.tables AS t ON t.object_id = cc.parent_object_id
			LEFT JOIN AdventureWorks2019.sys.columns AS c on c.object_id = cc.parent_object_id  
					and	c.column_id = cc.parent_column_id


-- Part e.

Update tbl_CheckContraint
Set ConstraintLevel =	Case When ColumnName is Null
						Then 'TableLevel'
						Else 'ColumnLevel'
						End



-- Part f.


-- Part g.

DROP Table tbl_CheckContraint
Select *
From tbl_CheckContraint
