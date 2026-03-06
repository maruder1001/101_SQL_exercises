----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

Select *
From Production.Product

Select *
From Sales.SalesOrderDetail



----------- a.

SELECT FORMAT(SUM(LineTotal), 'C') AS LineTotal_Sum
FROM Sales.SalesOrderDetail;


----------- b.

SELECT 
    FORMAT(SUM(CASE WHEN p.MakeFlag = 1 THEN s.LineTotal Else 0 END), 'C') AS Produced,
    FORMAT(SUM(CASE WHEN p.MakeFlag = 0 THEN s.LineTotal Else 0 END), 'C') AS Purchased
FROM Sales.SalesOrderDetail as s
Inner Join Production.Product as p On p.ProductID = s.ProductID


--------- c. 

SELECT 
    Case When p.MakeFlag = 1 Then 'Manufactured'
    Else 'Purchased' End as Make,
    Format( Sum(s.LineTotal), 'C') as LineTotal_sum,
    Format( Count(Distinct s.SalesOrderID), 'N0' )as SalesOrderID_CNT
FROM Sales.SalesOrderDetail as s
    Inner Join Production.Product as p On p.ProductID = s.ProductID
Group by p.MakeFlag;



--------- d. 


SELECT 
    Case When p.MakeFlag = 1 Then 'Manufactured'
    Else 'Purchased' End as Make,
    Format( Sum(s.LineTotal), 'C') as LineTotal_sum,
    Format( Count(Distinct s.SalesOrderID), 'N0' )as SalesOrderID_CNT,
    Format( Sum(s.LineTotal) / Count(Distinct s.SalesOrderID), 'C')  as avg_LineTotal
FROM Sales.SalesOrderDetail as s
    Inner Join Production.Product as p On p.ProductID = s.ProductID
Group by p.MakeFlag;
