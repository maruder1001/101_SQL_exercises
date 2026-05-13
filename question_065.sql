----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


---- Show the list of employees (First and Last Name) that are in the view above more than once.

Select edh.BusinessEntityID
		, CONCAT( edh.FirstName, ' ', Coalesce(edh.MiddleName || ' ', '') , edh.LastName ) as FullName
From HumanResources.vEmployeeDepartmentHistory as edh
	Inner Join HumanResources.Employee as e on e.BusinessEntityID = edh.BusinessEntityID
Where edh.BusinessEntityID in (
		Select BusinessEntityID
		From HumanResources.vEmployeeDepartmentHistory
		Group by BusinessEntityID
		Having Count(*) > 1
	)
Order by edh.BusinessEntityID;



---- Now show why they are listed more than once
---- Ans: Employees changed their departments


Select edh.BusinessEntityID
		, CONCAT( edh.FirstName, ' ', Coalesce(edh.MiddleName || ' ', '') , edh.LastName ) as FullName
		, edh.Department
From HumanResources.vEmployeeDepartmentHistory as edh
Where edh.BusinessEntityID in (
		Select BusinessEntityID
		From HumanResources.vEmployeeDepartmentHistory
		Group by BusinessEntityID
		Having Count(*) > 1
	)
Order by edh.BusinessEntityID;