Use AdventureWorks2019


Select *
From HumanResources.Employee


Select *
From Person.Person

Select *
From HumanResources.EmployeeDepartmentHistory

Select *
From HumanResources.Department


--- a. 

Select  Concat(p.FirstName, ' ', p.LastName) as FullName,
		JobTitle
From HumanResources.Employee as e
	INNER JOIN Person.Person as p On p.BusinessEntityID = e.BusinessEntityID
Where p.LastName = 'Evans'



--- b. 

Select  Concat(p.FirstName, ' ', p.LastName) as Full_Name,
		e.JobTitle as Job_Title,
		dep.Name as Department_Name
From HumanResources.Employee as e
	INNER JOIN Person.Person as p On p.BusinessEntityID = e.BusinessEntityID
	INNER JOIN HumanResources.EmployeeDepartmentHistory as his On his.BusinessEntityID = e.BusinessEntityID
	INNER JOIN HumanResources.Department as dep On dep.DepartmentID = his.DepartmentID
Where p.LastName = 'Evans';