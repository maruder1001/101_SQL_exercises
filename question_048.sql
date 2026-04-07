----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019




------- add a column to the Purchasing.Vendor: "CreditRatingDesc" (varchar(100) data type)

ALTER TABLE Purchasing.Vendor 
ADD CreditRatingDesc  varchar(100);




---- update "CreditRatingDesc" based on CreditRating value


Update v 
Set CreditRatingDesc = Case
							When v.CreditRating = '1' Then 'Superior'
							When v.CreditRating = '2' Then 'Excellent'
							When v.CreditRating = '3' Then 'Above Average'
							When v.CreditRating = '4' Then 'Average'
							When v.CreditRating = '5' Then 'Below Average'
							Else 'error'
						End
From Purchasing.Vendor as v;



Select v.BusinessEntityID
		, v.CreditRating
		, v.CreditRatingDesc
From Purchasing.Vendor as v;




----- Drop (delete) a column

ALTER TABLE Purchasing.Vendor 
DROP COLUMN CreditRatingDesc;