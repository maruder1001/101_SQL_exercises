----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


Select sp.BusinessEntityID
		, Lag( sp.BusinessEntityID, 1, null  ) Over(Order by sp.SalesYTD ) as ID_Lag 
		, Lead( sp.BusinessEntityID, 1, null ) Over(Order by sp.SalesYTD  ) as ID_Lead
		, CONCAT( pp.FirstName, COALESCE(' ' + MiddleName, ''), ' ', pp.LastName ) as FullName
		, IsNull(st.[Name], 'No Territory') as TerritoryName
		, Format(sp.SalesYTD, 'C2') as SalesYTD
		, Lag( Format(sp.SalesYTD, 'C2'), 1, null  ) Over(Order by sp.SalesYTD ) as SalesYTD_Lag 
		, Lead( Format(sp.SalesYTD, 'C2'), 1, null  ) Over(Order by sp.SalesYTD ) as SalesYTD_Lead 
		, sp.SalesYTD as order_col
		, Rank() Over (
						Order by sp.SalesYTD Desc 
						) as SalesYTD_Rank

		, Rank() Over (
						Partition by st.TerritoryID
						Order by sp.SalesYTD Desc 
						) as SalesYTD_Territory_Rank
		, Percent_Rank() Over( 
								Order by sp.SalesYTD
								)*100 as SalesYTD_Percentile
From Sales.SalesPerson as sp	
	Inner Join Person.Person as pp on pp.BusinessEntityID = sp.BusinessEntityID
	Left Join Sales.SalesTerritory as st on st.TerritoryID = sp.TerritoryID
Order by order_col Desc;