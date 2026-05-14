----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


------- Build a report with the following information: 

-------------- Employee First and Last Name
--------------Job Title
--------------Country
--------------State
--------------City
--------------Postal Code
--------------AddressLine1
--------------AddressLine2

Select Concat(p.FirstName, ' ', p.LastName) as FullName
		, e.JobTitle
		, cr.[Name] as Country
		, sp.[Name] as [State]
		, a.City
		, a.PostalCode
		, a.AddressLine1
		, a.AddressLine2
From Person.Person as p
	Inner Join HumanResources.Employee as e on e.BusinessEntityID = p.BusinessEntityID	
	Inner Join Person.BusinessEntityAddress as bea on bea.BusinessEntityID = p.BusinessEntityID	
	Inner Join Person.[Address] as a on a.AddressID = bea.AddressID
	Inner Join Person.StateProvince as sp on sp.StateProvinceID = a.StateProvinceID
	Inner Join Person.CountryRegion as cr on cr.CountryRegionCode = sp.CountryRegionCode
Order by p.LastName