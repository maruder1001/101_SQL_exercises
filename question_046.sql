----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

Select *
From Purchasing.Vendor as v;



------ Show each credit rating by a count of vendors

Select Count(Distinct v.BusinessEntityID) as CNT
From Purchasing.Vendor as v
Group by v.CreditRating;


------ Add commentary to each  CreditRating


Select Count(Distinct v.BusinessEntityID) as CNT
	, Case
		When v.CreditRating = '1' Then 'Superior'
		When v.CreditRating = '2' Then 'Excellent'
		When v.CreditRating = '3' Then 'Above Average'
		When v.CreditRating = '4' Then 'Average'
		When v.CreditRating = '5' Then 'Below Average'
		Else 'error'
	End as CreditRating_Comm
From Purchasing.Vendor as v
Group by v.CreditRating;




--- The same as above but without Case statement


Select Count(Distinct v.BusinessEntityID) as CNT
	, Choose( v.CreditRating, 'Superior', 'Excellent'  , 'Above Average'  , 'Average' , 'Below Average'   )  as CreditRating_Comm
From Purchasing.Vendor as v
Group by v.CreditRating;



------ Show PreferredVendorStatus by a count of Vendors


Select Count(Distinct v.BusinessEntityID) as CNT
	, Case
		When v.PreferredVendorStatus = '0' Then 'Not Preferred'
		When v.PreferredVendorStatus = '1' Then 'Preferred'
		Else 'error'
	End as PreferredVendorStatus_Comm
From Purchasing.Vendor as v
Group by v.PreferredVendorStatus;



------ Show PreferredVendorStatus by a count of Vendors but without Case statement


Select Count(Distinct v.BusinessEntityID) as CNT
	, Choose( v.PreferredVendorStatus, 'Not Preferred', 'Preferred'  , 'Above Average'  , 'Average' , 'Below Average'   ) as PreferredVendorStatus_Comm
From Purchasing.Vendor as v
Group by v.PreferredVendorStatus;

------ Choose() function starts counting from 1 and not from '0' thus it is not suitable for this task. Unless adding +1 to v.PreferredVendorStatus.