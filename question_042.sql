----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


-- creating a comment for each Sales Order ID and updating the database

With CTE_comments as (
Select soh.SalesOrderID
		, (
		CONCAT(cp.FirstName, ' ', cp.LastName) + ' is a(n) '
		+ Case
				When cp.PersonType = 'SC' Then 'Store Contact'
				When cp.PersonType = 'IN' Then 'Individual (retail) customer'
				When cp.PersonType = 'SP' Then 'Sales person'
				When cp.PersonType = 'EM' Then 'Employee (non-sales)'				
				When cp.PersonType = 'VC' Then 'Vendor contact'				
				When cp.PersonType = 'GC' Then 'General contact'
		End 
		+ ' and purchased ' 
		+ Cast(Sum(OrderQTY) as varchar) 
		+ ' Product(s) from '
		+ Case
				When CONCAT(sp.FirstName, ' ', sp.LastName) = ' ' Then 'No Sales Person'
				Else CONCAT(sp.FirstName, ' ', sp.LastName)
			End
		+ ' on '
		+ Convert(varchar, OrderDate, 101) + '.'  
		) as Comment
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
)
Update soh
Set Comment = cte.Comment
From Sales.SalesOrderHeader as soh
	Inner Join CTE_comments as cte on cte.SalesOrderID = soh.SalesOrderID;


Select *
From Sales.SalesOrderHeader

Update Sales.SalesOrderHeader
Set Comment = Null