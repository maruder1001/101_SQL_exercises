----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================



Use AdventureWorks2019

Select *
From Purchasing.Vendor


----------------------------------- a. 

--Select v.Name,
--		v.CreditRating
--From Purchasing.Vendor as v
--Order By v.CreditRating Desc

--SELECT v.CreditRating,
--       COUNT(*) AS VendorCount
--FROM Purchasing.Vendor AS v
--GROUP BY v.CreditRating
--HAVING v.CreditRating > 4;


SELECT v.Name,
       v.CreditRating
FROM Purchasing.Vendor AS v
WHERE v.CreditRating = (
        Select Max(CreditRating)
        From Purchasing.Vendor
);


----------------------------------- b. 


Select 
    Case
        When v.PreferredVendorStatus = 1 Then 'Preferred'
        When v.PreferredVendorStatus = 0 Then 'Not Preferred'
        Else 'error'
    End as Opinion,
    Count(*) as Total_1
From Purchasing.Vendor as v
Group By v.PreferredVendorStatus;



----------------------------------- c. 

Select  v.Name,
        v.CreditRating,
    Case
        When v.PreferredVendorStatus = 1 Then 'Preferred'
        When v.PreferredVendorStatus = 0 Then 'Not Preferred'
        Else 'error'
    End as Opinion,

    Case
        When v.CreditRating >= avg_data.MidPoint Then 'High'
        Else 'Low'
    End as Credit_Rating_Opinion

From Purchasing.Vendor as v
Cross Join (
            Select ( MAX(CreditRating) + MIN(CreditRating) )/2.0 as MidPoint
            From Purchasing.Vendor
            ) as avg_data
Where v.ActiveFlag = 1 and v.PreferredVendorStatus = 1
Order by v.CreditRating Desc;




-----------------------------------   d.  


Select Count(*) as Active_NotPreferred
From Purchasing.Vendor as v
Where v.ActiveFlag = 1 and v.PreferredVendorStatus = 0;


