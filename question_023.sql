----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019



---------  

DECLARE @TotalRetailCustomers FLOAT;
SELECT @TotalRetailCustomers = COUNT(DISTINCT p.BusinessEntityID)
								FROM Person.Person AS p
								WHERE p.PersonType = 'IN'
								GROUP BY p.PersonType;

Select  cr.Name,
		Format( Count(Distinct p.BusinessEntityID), 'N0' ) as CNT,
		Format( Cast(Count(Distinct p.BusinessEntityID) as float) / ( @TotalRetailCustomers ), 'P' ) as '%_Total'
From Person.Person as p
	Inner Join Person.BusinessEntityAddress as bea on bea.BusinessEntityID = p.BusinessEntityID
	Inner Join Person.Address as a on a.AddressID = bea.AddressID
	Inner Join Person.StateProvince as sp on sp.StateProvinceID = a.StateProvinceID
	Inner Join Person.CountryRegion as cr on cr.CountryRegionCode = sp.CountryRegionCode
Where p.PersonType = 'IN'
GROUP BY cr.Name
Order by CNT Desc;
