----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

Select *
From Production.Product


------ a. How many products?

Select Count(Distinct p.ProductID) as CNT
From Production.Product as p
Where FinishedGoodsFlag = 1



------ b. How many of these products are actively being sold by AdventureWorks?

Select Count(*) as CNT
From Production.Product as p
Where FinishedGoodsFlag = 1  and SellEndDate is null;



------ c. How many of these active products are made in house vs. purchased?

SELECT
    SUM(CASE WHEN FinishedGoodsFlag = 1 AND MakeFlag = 1 THEN 1 ELSE 0 END) AS Produced,
    SUM(CASE WHEN FinishedGoodsFlag = 1 AND MakeFlag = 0 THEN 1 ELSE 0 END) AS Purchased
FROM Production.Product
Where SellEndDate is null;
