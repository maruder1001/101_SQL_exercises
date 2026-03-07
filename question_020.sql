----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


Select *
From Sales.SalesOrderHeader;



Select 
	Status
	,Convert(date,Min(OrderDate)) as FirstDate --matches the pending status
	,Convert(date,Max(OrderDate)) as LastDate
from Purchasing.PurchaseOrderHeader
Group by Status
 
 
Select 
	Convert(date,Min(DueDate)) as FirstDate
	,Convert(date,Max(DueDate)) as LastDate
	,Convert(date,Min(StartDate)) as FirstStartDate --matches TransactionHistory
	,Convert(date,Max(StartDate)) as LastStartDate --matches TransactionHistory
	,Convert(date,Min(EndDate)) as FirstEndDate
	,Convert(date,Max(EndDate)) as LastEndDate
from Production.WorkOrder