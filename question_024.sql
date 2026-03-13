----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


Select *
From Sales.SalesOrderHeader;



--- a. SubTotal and TotalDue definitions in SalesOrderHeader



Select t.name as TableName,
		c.name as ColumnName,
		ep.value as Definitions
From sys.extended_properties as ep
	Inner Join sys.tables as t on t.object_id = ep.major_id
	Inner Join sys.columns as c on c.object_id = ep.major_id and c.column_id = ep.minor_id
Where t.name in ('SalesOrderHeader') and ( c.name in ('SubTotal') or c.name in ('TotalDue') )




--- b. SubTotal and TotalDue definitions in SalesOrderHeader

Select t.name as TableName,
		c.name as ColumnName,
		ep.value as Definitions
From sys.extended_properties as ep
	Inner Join sys.tables as t on t.object_id = ep.major_id
	Inner Join sys.columns as c on c.object_id = ep.major_id and c.column_id = ep.minor_id
Where t.name in ('SalesOrderDetail') and c.name in ('LineTotal') 



--- a. numerical values

Select 
	Format( Sum(SubTotal), 'C2' )  as SubTotal,
	Format( Sum(TotalDue), 'C2' ) as TotalDue,
	Format( Sum(SubTotal) - Sum(TotalDue), '$#,##0.00;-$#,##0.00') as Vals_Difference
From Sales.SalesOrderHeader
Where SalesOrderID = '69411'


Select 
	Format( Sum(LineTotal), 'C2' )  as LineTotal
From Sales.SalesOrderDetail
Where SalesOrderID = '69411'


-- c.

Select
	Format( Sum(TotalDue), 'C2' ) as TotalDue,
	Format(Sum(SubTotal) + sum(TaxAmt) + Sum(Freight), 'C2' ) as Num_check
From Sales.SalesOrderHeader
--- Where SalesOrderID = '69411'


-- d.

Select
	Format( Sum(LineTotal ), 'C2' ) as TotalDue,
	Format( Sum(UnitPrice*(1-UnitPriceDiscount)*OrderQty), 'C2' ) as Num_check
From Sales.SalesOrderDetail
Where SalesOrderID = '69411'