----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


-------  Calculate avg totaldue on July 4 in past years for the whole day.

Select  Format( Sum(soh.TotalDue)/ Count(Distinct soh.OrderDate), 'C2' ) as AVG_TotalDue
From Sales.SalesOrderHeader as soh
Where DATEPART(MM, soh.OrderDate) = 07 and DATEPART(DD, soh.OrderDate) = 04;


-------  Calculate Totaldue on July 4 on each recorded year.

Select  Year(soh.OrderDate) as 'Year (07.04.)'
		, DateName(weekday, soh.OrderDate) as 'Week_Day'
		, Format( Sum(soh.TotalDue), 'C2' ) as Sum_TotalDue
From Sales.SalesOrderHeader as soh
Where DATEPART(MM, soh.OrderDate) = 07 and DATEPART(DD, soh.OrderDate) = 04
Group by soh.OrderDate
Order by soh.OrderDate Desc;


----- Put this query in temp table.


Select  Year(soh.OrderDate) as 'Year (07.04.)'
		, DateName(weekday, soh.OrderDate) as 'Week_Day'
		, Format( Sum(soh.TotalDue), 'C2' ) as Sum_TotalDue
Into #Temp1
From Sales.SalesOrderHeader as soh
Where DATEPART(MM, soh.OrderDate) = 07 and DATEPART(DD, soh.OrderDate) = 04
Group by soh.OrderDate
Order by soh.OrderDate Desc;



Select *
From #Temp1