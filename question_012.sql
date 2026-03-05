Use AdventureWorks2019


Select *
From HumanResources.Employee


Select *
From Person.Person




--- a. 

Select  Concat(p.FirstName, ' ', p.LastName) as FullName
From HumanResources.Employee as e
	INNER JOIN Person.Person as p On p.BusinessEntityID = e.BusinessEntityID
Where JobTitle = 'Chief Executive Officer'



--- b. 

Select  Concat(p.FirstName, ' ', p.LastName) as FullName,
		HireDate
From HumanResources.Employee as e
	INNER JOIN Person.Person as p On p.BusinessEntityID = e.BusinessEntityID
Where JobTitle = 'Chief Executive Officer'


--- c. 

Select  JobTitle,
		Concat(p.FirstName, ' ', p.LastName) as FullName
From HumanResources.Employee as e
	INNER JOIN Person.Person as p On p.BusinessEntityID = e.BusinessEntityID
Where OrganizationLevel = '1'