----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

Select *
From Purchasing.Vendor as v;



------ Approved vs. Not approved with Case statement


Select Count(v.CreditRating_comment) as CNT
		, v.CreditRating_comment
From (Select  
		Case
			When CreditRating = '1' Then 'Approved'
			Else 'Not Approved'
		End as CreditRating_comment
From Purchasing.Vendor) as v
Group by v.CreditRating_comment;



------ Approved vs. Not approved with Choose function


Select Count(v.CreditRating_comment) as CNT
		, v.CreditRating_comment

From (	Select  
			Choose(v1.CreditRating, 'Approved', 'Not Approved', 'Not Approved', 'Not Approved', 'Not Approved') as CreditRating_comment
		From Purchasing.Vendor as v1) as v

Group by v.CreditRating_comment;


------ Approved vs. Not approved with If function

Select Count(v.CreditRating_comment) as CNT
		, v.CreditRating_comment

From (	Select  
			IIf(v1.CreditRating = '1', 'Approved', 'Not Approved') as CreditRating_comment
		From Purchasing.Vendor as v1) as v

Group by v.CreditRating_comment;