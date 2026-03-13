----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


Select *
From Production.Product;


Select t.name as TableName,
		c.name as ColumnName,
		ep.value as Definitions
From sys.extended_properties as ep
	Inner Join sys.tables as t on t.object_id = ep.major_id
	Inner Join sys.columns as c on c.object_id = ep.major_id and c.column_id = ep.minor_id
Where t.name in ('Product')




Select 
		p.Name,
		Format( p.ListPrice, 'C2' ) as Gross_Rev,
		Format( p.ListPrice - p.StandardCost, 'C2' )   as Net_Rev,
		p.ListPrice - p.StandardCost  as sort
From Production.Product as p
Order by 4 Desc;
