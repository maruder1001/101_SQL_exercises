----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

------ Create a stored procedure called "Sales_Report_YTD":

DROP PROCEDURE IF EXISTS Sales_Report_YTD;

CREATE PROCEDURE Sales_Report_YTD 
	@BusinessEntityID int
as (
		Select sp.BusinessEntityID
			, Format(sp.CommissionPct, 'p') as CommissionPct
			, Format(sp.SalesYTD, 'C2') as SalesYTD
			, Format(sp.CommissionPct* sp.SalesYTD, 'C2') as Commission
			, Format(sp.Bonus, 'C2') as Bonus
		From Sales.SalesPerson as sp
		Where sp.BusinessEntityID = @BusinessEntityID
)


------ Execute the Stored Procedure

Exec Sales_Report_YTD @BusinessEntityID = '279'

------ Delete the Stored Procedure

Drop PROCEDURE Sales_Report_YTD