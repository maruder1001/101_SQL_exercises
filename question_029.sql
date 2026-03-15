----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

----- How the number of rows changes when we include multuiple Sales Reasons for particulat OrderIDs
Select 
	Count(soh.SalesOrderID) as All_Orders,
	Count(Distinct soh.SalesOrderID) as All_Orders_no_multi,
	Count( soh_sr.SalesOrderID  ) as All_Orders_with_SalesReason
From Sales.SalesOrderHeader as soh
	Left Join Sales.SalesOrderHeaderSalesReason as soh_sr on soh_sr.SalesOrderID = soh.SalesOrderID
	Left Join Sales.SalesReason as sr on sr.SalesReasonID = soh_sr.SalesReasonID;




---- The count of Sale Reasons Amount for all of the Orders (How many orders have 0 reasons, 1 reason, 2 reasons ect. ...)

With CTE as (
	Select 
		 soh.SalesOrderID,
		Count( soh_sr.SalesOrderID  ) as CNT
	From Sales.SalesOrderHeader as soh
		Left Join Sales.SalesOrderHeaderSalesReason as soh_sr on soh_sr.SalesOrderID = soh.SalesOrderID
		Left Join Sales.SalesReason as sr on sr.SalesReasonID = soh_sr.SalesReasonID
	Group by soh.SalesOrderID 
)
Select  CNT as Reasons_Amount,
		Count( CNT ) as Reasons_Count
From CTE
Group By CNT
Order by 1;