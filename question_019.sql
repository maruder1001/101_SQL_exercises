----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


Select *
From Sales.SalesOrderHeader;


--- Column names

Select t.name as TableName,
		c.name as ColumnName,
		ep.value as Definitions
From sys.extended_properties as ep
	Inner Join sys.tables as t on t.object_id = ep.major_id
	Inner Join sys.columns as c on c.object_id = ep.major_id and c.column_id = ep.minor_id
Where t.name in ('SalesOrderHeader')


-------- a. 

Select 
	Cast(Min(OrderDate) as Date) as First_date,
	Convert( Date, Max(OrderDate) ) as Last_Date
From Sales.SalesOrderHeader;