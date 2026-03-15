----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


------ Checking the 8 bikes of specific mdoel (ProductModelID = 19)

SELECT 
    p.ProductID,
    p.Name,
    p.ProductModelID,
    p.SellStartDate,
    p.SellEndDate,
    p.DiscontinuedDate
FROM Production.Product p
WHERE p.ProductModelID = 19;


-------- Find the most recent order of those bikes

SELECT 
    MAX(soh.OrderDate) AS LastOrderDate_Model19
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod 
     ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p 
     ON p.ProductID = sod.ProductID
WHERE p.ProductModelID = 19;

-----  Find the most recent order in the entire system

SELECT 
    MAX(OrderDate) AS LastOrder_AnyProduct
FROM Sales.SalesOrderHeader;


------ The bike has not been sold for last two years.