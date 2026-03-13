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



--------- a. Taking Mountain-100 bikes variants only

SELECT *
FROM Production.Product AS p
WHERE p.ProductNumber LIKE 'BK-M82%';



--------- b. 


SELECT p.ProductID,
		p.Name,
		--- sop.SpecialOfferID,
		so.Description,
		Format(so.DiscountPct*100, 'N') as Dis_Prc, 
		FORMAT(so.StartDate, 'yyyy-MM-dd') AS StartDate,
		FORMAT(so.EndDate, 'yyyy-MM-dd') AS EndDate
FROM Production.Product AS p
	Inner Join Sales.SpecialOfferProduct as sop on sop.ProductID = p.ProductID
	Inner Join Sales.SpecialOffer as so on so.SpecialOfferID = sop.SpecialOfferID
WHERE p.ProductNumber LIKE 'BK-M82%' and sop.SpecialOfferID != 1
Order by 5 Asc;



--------- c.


SELECT p.ProductID,
		p.Name,
		--- sop.SpecialOfferID,
		so.Description,
		Format(so.DiscountPct*100, 'N') as Dis_Prc, 
		FORMAT(so.StartDate, 'yyyy-MM-dd') AS StartDate,
		FORMAT(so.EndDate, 'yyyy-MM-dd') AS EndDate,
		FORMAT(p.DiscontinuedDate, 'yyyy-MM-dd') AS DisDate,
		FORMAT(p.SellEndDate, 'yyyy-MM-dd') AS SellEndDate
FROM Production.Product AS p
	Inner Join Sales.SpecialOfferProduct as sop on sop.ProductID = p.ProductID
	Inner Join Sales.SpecialOffer as so on so.SpecialOfferID = sop.SpecialOfferID
WHERE p.ProductID = '775'
Order by 4 Desc;



---- d.

Select 
	Max(OrderDate) as MostRecentDate
From Sales.SalesOrderHeader soh
	Inner Join Sales.SalesOrderDetail sod on sod.SalesOrderID = soh.SalesOrderID
	Inner Join Production.Product p on p.ProductID = sod.ProductID
Where sod.ProductID = '775';