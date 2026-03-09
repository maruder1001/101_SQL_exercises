----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

Select *
From Person.Person;


--------- a.  How many Individual customer?


Select  p.PersonType,
		Count(Distinct p.BusinessEntityID) as CNT
From Person.Person as p
Where p.PersonType = 'IN'
GROUP BY p.PersonType;


--------- b. Breakdown by the countries.


Select  cr.Name,
		Format( Count(Distinct p.BusinessEntityID), 'N0' ) as CNT
From Person.Person as p
	Inner Join Person.BusinessEntityAddress as bea on bea.BusinessEntityID = p.BusinessEntityID
	Inner Join Person.Address as a on a.AddressID = bea.AddressID
	Inner Join Person.StateProvince as sp on sp.StateProvinceID = a.StateProvinceID
	Inner Join Person.CountryRegion as cr on cr.CountryRegionCode = sp.CountryRegionCode
Where p.PersonType = 'IN'
GROUP BY cr.Name
Order by CNT Desc;


--------- b. Breakdown by the countries in %


Select  cr.Name,
		Format( Count(Distinct p.BusinessEntityID), 'N0' ) as CNT,
		Format( Cast(Count(Distinct p.BusinessEntityID) as float) / ( 
																Select  Count(Distinct p.BusinessEntityID) as CNT
																From Person.Person as p
																Where p.PersonType = 'IN'
																GROUP BY p.PersonType ), 'P' ) as '%_Total'
From Person.Person as p
	Inner Join Person.BusinessEntityAddress as bea on bea.BusinessEntityID = p.BusinessEntityID
	Inner Join Person.Address as a on a.AddressID = bea.AddressID
	Inner Join Person.StateProvince as sp on sp.StateProvinceID = a.StateProvinceID
	Inner Join Person.CountryRegion as cr on cr.CountryRegionCode = sp.CountryRegionCode
Where p.PersonType = 'IN'
GROUP BY cr.Name
Order by CNT Desc;
