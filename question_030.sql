----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019



--------- The info from reviews
Select pr.*,
		p.Name
From Production.ProductReview as pr
	Inner Join Production.Product as p on pr.ProductID = p.ProductID; 


--------- Finding people by their first name as last name
Select p.FirstName,
		p.LastName,
		soh.OrderDate,
		pr.Name
From Sales.SalesOrderHeader as soh 
	Inner Join Person.Person as p on p.BusinessEntityID = soh.CustomerID
	Inner Join Sales.SalesOrderDetail as sod on sod.SalesOrderID = soh.SalesOrderID
	Inner Join Production.Product as pr on pr.ProductID = sod.ProductID
Where p.FirstName Like '%David%' and pr.Name like '%HL%' 
;


---------- It seems that the data is either incomplete or damaged as I cannot find the people who wrote the review mails.