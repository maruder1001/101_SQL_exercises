----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


Select *
From Sales.SalesTerritory;



------------- List of all regions

Select st.Name
From Sales.SalesTerritory as st;



-------------  Add the Sum(TotalDue) to the list of regions

Select st.Name as Region,
		Format( Sum(soh.TotalDue), 'C2' ) as Sum_TotalDue,
		 Sum(soh.TotalDue) as Sum_TotalDue_order
From Sales.SalesTerritory as st
	Inner Join Sales.SalesOrderHeader as soh on soh.TerritoryID = st.TerritoryID
Group by st.Name
Order by 3 Desc;


-------------  Add each customer name. Concatenate First and Last Names

--Select CONCAT(p.FirstName, ' ', p.LastName) as FullName,
--	*
--From Person.Person as p
--Order by p.LastName Asc;


Select c.TerritoryID,
		CONCAT(p.FirstName, ' ', p.LastName) as FullName
From Sales.Customer as c
	Inner Join Person.BusinessEntity as be on c.PersonID = be.BusinessEntityID
	Inner Join Person.Person as p on p.BusinessEntityID = be.BusinessEntityID;




Select CONCAT(p.FirstName, ' ', p.LastName) as FullName
       , st.Name as Region
	   , Format( soh.TotalDue, 'C2' ) as TotalDue
From Sales.SalesTerritory as st
	Inner Join Sales.SalesOrderHeader as soh on soh.TerritoryID = st.TerritoryID
	Inner Join Sales.Customer as c on c.CustomerID = soh.CustomerID
	Inner Join Person.BusinessEntity as be on c.PersonID = be.BusinessEntityID
	Inner Join Person.Person as p on p.BusinessEntityID = be.BusinessEntityID
Order by st.Name, p.LastName;



------------ Rank each customer by region. Show the biggest (most spending) customers per Region.



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
Order by RowNum;
