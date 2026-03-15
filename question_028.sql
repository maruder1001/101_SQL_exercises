----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


------- a. Sales Reason

Select *
From Sales.SalesReason;


Select *
From Sales.SalesOrderHeaderSalesReason;

-------- b. 

Select sr.Name as Reason,
		Format( Count(sr.SalesReasonID), 'N0' ) as CNT_reasons
From Sales.SalesOrderHeaderSalesReason as soh_sr
	Inner Join Sales.SalesReason as sr on sr.SalesReasonID = soh_sr.SalesReasonID
Group by sr.Name;



------- c. 

Select sr.Name as Reason,
		Format( Count(sr.SalesReasonID), 'N0' ) as CNT_reasons_dis,
		Count(sr.SalesReasonID)as CNT_reasons_sort
From Sales.SalesOrderHeaderSalesReason as soh_sr
	Inner Join Sales.SalesReason as sr on sr.SalesReasonID = soh_sr.SalesReasonID
Group by sr.Name
Order by 3 Desc;
