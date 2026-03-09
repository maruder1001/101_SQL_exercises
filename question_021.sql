----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

Select *
From Person.CountryRegion

--------- a.  Countries and states list

Select cr.Name as Country, 
		sp.Name as State_Province
From Person.StateProvince as sp
	Inner Join Person.CountryRegion as cr on cr.CountryRegionCode = sp.CountryRegionCode
;


--------- b.  Countries and states list with tax rates


Select *
From Sales.SalesTaxRate;


Select cr.Name as Country, 
		sp.Name as State_Province,
		tax.TaxRate
From Person.StateProvince as sp
	Inner Join Person.CountryRegion as cr on cr.CountryRegionCode = sp.CountryRegionCode
	Left Join Sales.SalesTaxRate as tax on tax.StateProvinceID = sp.StateProvinceID;


--------- c.  Rows mismatch between Person.StateProvince and Person.StateProvince


Select cr.Name as Country, 
		sp.Name as State_Province,
		Count(tax.TaxType) as CNT
From Person.StateProvince as sp
	Inner Join Person.CountryRegion as cr on cr.CountryRegionCode = sp.CountryRegionCode
	Left Join Sales.SalesTaxRate as tax on tax.StateProvinceID = sp.StateProvinceID
Group By cr.Name, sp.Name
Having Count(tax.TaxType) > 1; 


--------- d.  Highest tax rates

Select cr.Name as Country, 
		sp.Name as State_Province,
		tax.TaxRate
From Person.StateProvince as sp
	Inner Join Person.CountryRegion as cr on cr.CountryRegionCode = sp.CountryRegionCode
	Left Join Sales.SalesTaxRate as tax on tax.StateProvinceID = sp.StateProvinceID
Where tax.TaxType is not Null
ORDER BY tax.TaxRate Desc
;
