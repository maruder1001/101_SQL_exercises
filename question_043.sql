----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

Select *
From Sales.SalesPersonQuotaHistory as spqh

Select *
From Sales.SalesPerson as sp


------ How many people in sales meet their YTD Quotas?

Select Count(Distinct sp.BusinessEntityID) as Salesmen_YTD
From  (
		Select *
		From Sales.SalesPerson as sp
		Where sp.SalesYTD >= sp.SalesQuota
		) as sp


------ How many Salesmen have YTD Sales higher than the average?


Select Count(Distinct sp.BusinessEntityID) as Salesmen_above_avg
From Sales.SalesPerson AS sp
Where sp.SalesYTD > (	SELECT AVG(SalesYTD) AS avg_sales 
						FROM Sales.SalesPerson )