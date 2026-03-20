----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019




-------------  Show 25 top-spenders by region

Select *
From (
		Select CONCAT(p.FirstName, ' ', p.LastName) as FullName
			   , st.Name as Region
			   , Format( Sum(soh.TotalDue), 'C2' ) as TotalDue
			   , Sum(soh.TotalDue) as sort
			   , ROW_NUMBER() Over( Partition by st.Name Order by Sum(TotalDue) desc ) as RowNum
		From Sales.SalesTerritory as st
			Inner Join Sales.SalesOrderHeader as soh on soh.TerritoryID = st.TerritoryID
			Inner Join Sales.Customer as c on c.CustomerID = soh.CustomerID
			Inner Join Person.BusinessEntity as be on c.PersonID = be.BusinessEntityID
			Inner Join Person.Person as p on p.BusinessEntityID = be.BusinessEntityID
		Group by st.Name, CONCAT(p.FirstName, ' ', p.LastName)
	  )	as tab
Where RowNum <= 25
Order by RowNum;



-------------  Average spending per region among 25 top-spenders


With top_25_reg as (
					Select CONCAT(p.FirstName, ' ', p.LastName) as FullName
						   , st.Name as Region
						   , Format( Sum(soh.TotalDue), 'C2' ) as TotalDue
						   , Sum(soh.TotalDue) as sort
						   , ROW_NUMBER() Over( Partition by st.Name Order by Sum(TotalDue) desc ) as RowNum
					From Sales.SalesTerritory as st
						Inner Join Sales.SalesOrderHeader as soh on soh.TerritoryID = st.TerritoryID
						Inner Join Sales.Customer as c on c.CustomerID = soh.CustomerID
						Inner Join Person.BusinessEntity as be on c.PersonID = be.BusinessEntityID
						Inner Join Person.Person as p on p.BusinessEntityID = be.BusinessEntityID
					Group by st.Name, CONCAT(p.FirstName, ' ', p.LastName)
				  )
Select Region
		,  Format( AVG(sort), 'C2' ) as avg_region_dis
	   , AVG(sort) as avg_region
From top_25_reg
Where RowNum <= 25
Group by Region
Order by avg_region Desc;