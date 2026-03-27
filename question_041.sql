----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019



---- All data

Select *
From Sales.SalesOrderHeader as soh
	Inner Join Sales.Customer as c on c.CustomerID = soh.CustomerID
	Inner Join Person.Person as cp on cp.BusinessEntityID = c.PersonID
	Left Join Person.Person as sp on sp.BusinessEntityID = soh.SalesPersonID;




--- Relevant data


Select soh.SalesOrderID
		, CONCAT(cp.FirstName, ' ', cp.LastName) as Customer_Name
		, Case
				When cp.PersonType = 'SC' Then 'Store Contact'
				When cp.PersonType = 'IN' Then 'Individual (retail) customer'
				When cp.PersonType = 'SP' Then 'Sales person'
				When cp.PersonType = 'EM' Then 'Employee (non-sales)'				
				When cp.PersonType = 'VC' Then 'Vendor contact'				
				When cp.PersonType = 'GC' Then 'General contact'
		End as Person_Type
		,	Case
				When CONCAT(sp.FirstName, ' ', sp.LastName) = ' ' Then 'No Sales Person'
				Else CONCAT(sp.FirstName, ' ', sp.LastName)
			End as SalesPerson_Name
		, Convert(DATE, soh.OrderDate) as Order_Date
		, SUM(sod.OrderQty) as Quantity_Purchased
From Sales.SalesOrderHeader as soh
	Inner Join Sales.SalesOrderDetail as sod on sod.SalesOrderID = soh.SalesOrderID
	Inner Join Sales.Customer as c on c.CustomerID = soh.CustomerID
	Inner Join Person.Person as cp on cp.BusinessEntityID = c.PersonID  --- get customers names
	Left Join Person.Person as sp  on sp.BusinessEntityID = soh.SalesPersonID  --- get sales persons names
Group by 
    soh.SalesOrderID
    ,CONCAT(cp.FirstName,' ',cp.LastName)
    ,cp.PersonType
    ,OrderDate
    ,CONCAT(sp.FirstName,' ',sp.LastName)
Order by Quantity_Purchased Desc;