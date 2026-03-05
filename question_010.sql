Use AdventureWorks2019

Select * 
From sys.extended_properties


Select *
From sys.columns;

Select *
From sys.tables;


-- Part a.

Select *
From sys.extended_properties ext_prop
Inner Join sys.tables  as T ON T.object_id = ext_prop.major_id
Inner Join sys.columns as C ON C.object_id = ext_prop.major_id
							And C.column_id = ext_prop.minor_id

WHERE class = 1



-- Part b. 


Select  T.name as TableName
		, c.name as ColumnName
		, ext_prop.value as 'Definition'
From sys.extended_properties ext_prop
Inner Join sys.tables  as T ON T.object_id = ext_prop.major_id
Inner Join sys.columns as C ON C.object_id = ext_prop.major_id
							And C.column_id = ext_prop.minor_id

WHERE class = 1 and T.name Like 'Person'

