----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019

Select * 
From Sales.vSalesPersonSalesByFiscalYears


------------ Pivot Function

Select SalesPersonID
		, FullName
		, JobTitle
		, SalesTerritory
		, Format( [2012], 'C2') as '2012'
		, Format( [2013], 'C2') as '2013'
		, Format( [2014], 'C2') as '2014'
From(
	Select 
			soh.SalesPersonID
			, Concat( FirstName, Coalesce(' ' + MiddleName, ''), ' ', LastName) as FullName
			, e.JobTitle
			, st.Name as SalesTerritory
			, soh.SubTotal
			, Year(DateAdd(m,6,OrderDate)) as FiscalYear
		From sales.SalesPerson as sp
			Inner Join Sales.SalesOrderHeader as soh on sp.BusinessEntityID = soh.SalesPersonID
			Inner Join Sales.SalesTerritory as st    on st.TerritoryID = sp.TerritoryID
			Inner Join HumanResources.Employee as e  on e.BusinessEntityID = sp.BusinessEntityID
			Inner Join Person.Person as p            on p.BusinessEntityID = sp.BusinessEntityID) as a

	Pivot (

		Sum(SubTotal)
		For FiscalYear
		In([2012], [2013], [2014])

	) as b
	Order By 1