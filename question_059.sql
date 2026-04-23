----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019

Select FullName
		, Format([Road Bikes], 'C2')  as 'Road Bikes'
		, Format([Mountain Bikes], 'C2') as 'Mountain Bikes'
		, Format([Touring Bikes], 'C2') as  'Touring Bikes'
From (
		Select Concat( FirstName, Coalesce(' ' + MiddleName, ''), ' ', LastName) as FullName
				, psc.Name as ProductSubCategory
				, LineTotal

		From Sales.SalesOrderDetail as sod
			Inner Join Production.[Product] as p			on p.ProductID = sod.ProductID
			Inner Join Production.ProductSubcategory as psc	on psc.ProductSubcategoryID = p.ProductSubcategoryID
			Inner Join Sales.SalesOrderHeader as soh		on soh.SalesOrderID = sod.SalesOrderID
			Inner Join Person.Person as pr					on pr.BusinessEntityID = soh.SalesPersonID
		Where Year(OrderDate) = 2013

	) as a
Pivot(
	Sum(LineTotal)
	For ProductSubCategory in ( [Road Bikes], [Mountain Bikes], [Touring Bikes] )
		) as b
Order By ( [Road Bikes] + [Mountain Bikes] + [Touring Bikes] ) Desc