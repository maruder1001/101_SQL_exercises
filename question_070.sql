----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


------  How many distinct orderdates exist in Sales.SalesOrderHeader?

Select Count(Distinct soh.OrderDate) as Distinct_OrderDates
From Sales.SalesOrderHeader as soh


------  How many distinct orderdates exist in Sales.SalesOrderHeader?


Select Datediff(Day, Min(soh.OrderDate), Max(soh.OrderDate))+1 as Days_between_Dates
From Sales.SalesOrderHeader as soh


------ There are 1124 distinct days in Sales.SalesOrderHeader. However, there are 1127 from the first orderdate and the last orderdate. Find the missing three dates.

------ However this code works only with an assumption that the missing dates refer to one
------ day between recorded dates

Select *
From (
Select soh.OrderDate
		, Lag(soh.OrderDate) Over(Order by soh.OrderDate) as Previous_day
		, Datediff(Day, Lag(soh.OrderDate) Over(Order by soh.OrderDate), soh.OrderDate ) as Days_between_Dates
From Sales.SalesOrderHeader as soh
) a
Where Days_between_Dates > 1


----- another solution, proposed in the course

If object_id('dimDate') is not null drop table dimDate
go

Declare @StartDate as Date = (Select Min(orderdate) From Sales.SalesOrderHeader )
Declare @StopDate  as Date = (Select Max(orderdate) From Sales.SalesOrderHeader )

Create Table dimDate
	( [DateKey] INT Primary Key
	, [Date] Date	)

While (@StartDate <= @StopDate)
Begin 
	Insert Into dimDate
	Select Convert(char(8), @StartDate, 112) as DateKey, @StartDate as Date
    Set @StartDate = DATEADD(Day, 1, @StartDate)
End

Select [Date] as Missing_Dates
From dimDate as d
	Left Join Sales.SalesOrderHeader as soh
		on soh.OrderDate = d.Date
Where OrderDate is null