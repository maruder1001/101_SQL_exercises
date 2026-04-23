----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


----- Definition of #Temp1

DROP TABLE IF EXISTS #Temp1;
DROP TABLE IF EXISTS #Temp2;

Select  Year(soh.OrderDate) as 'Year (07.04.)'
		, DateName(weekday, soh.OrderDate) as 'Week_Day'
		, Sum(soh.TotalDue) as Sum_TotalDue
Into #Temp1
From Sales.SalesOrderHeader as soh
Where DATEPART(MM, soh.OrderDate) = 07 and DATEPART(DD, soh.OrderDate) = 04
Group by soh.OrderDate
Order by soh.OrderDate Desc;




-------  Show statistics of TotalDue by days of the week using whole data base

Select  DateName(weekday, soh.OrderDate) as 'Week_Day'
		, Count( Distinct soh.OrderDate ) as 'CNT_Week_Day'
		, Format( Sum(soh.TotalDue), 'C2') as 'TotalDue'
		, Format( Sum(soh.TotalDue) / Count( Distinct soh.OrderDate ), 'C2')  as 'AvgTotalperWkDay'
From Sales.SalesOrderHeader as soh
Group by DateName(weekday, soh.OrderDate)
Order by 4 Desc;
 


Select  DateName(weekday, soh.OrderDate) as 'Week_Day'
		, Count( Distinct soh.OrderDate ) as 'CNT_Week_Day'
		, Sum(soh.TotalDue) as 'TotalDue'
		, Sum(soh.TotalDue) / Count( Distinct soh.OrderDate )  as 'AvgTotalperWkDay'
Into #Temp2
From Sales.SalesOrderHeader as soh
Group by DateName(weekday, soh.OrderDate);


--------- Compare the average totaldue during a normal Dayofweek to the TotalDue on July 4.

Select #Temp1.[Year (07.04.)]
		, #Temp1.Week_Day
		, #Temp1.Sum_TotalDue
		, #Temp2.AvgTotalperWkDay
From #Temp1
	Join #Temp2 on #Temp2.Week_Day = #Temp1.Week_Day



--------- Add a flag to make the comparision easier

Select #Temp1.[Year (07.04.)]
		, #Temp1.Week_Day
		, Format(#Temp1.Sum_TotalDue, 'C2')  as Sum_TotalDue
		, Format(#Temp2.AvgTotalperWkDay, 'C2')  as AvgTotalperWkDay
		, Case When #Temp1.Sum_TotalDue > #Temp2.AvgTotalperWkDay
			Then 'Higher Sales' Else 'Lower Sales' 
			End as Profitable_Flg
From #Temp1
	Join #Temp2 on #Temp2.Week_Day = #Temp1.Week_Day