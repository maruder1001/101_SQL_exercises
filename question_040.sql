----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


----- List of completed months in the database
Select 
	Year(ShipDate) as ShipYear
	,Month(ShipDate) as ShipMonth
	,DATENAME(MONTH, DATEFROMPARTS(Year(ShipDate), Month(ShipDate) , 1)) as ShipMonth_name
From Sales.SalesOrderHeader
Group by Year(ShipDate), Month(ShipDate)
Order by Year(ShipDate), Month(ShipDate);



----- Add monthy spending on freight
Select 
	Year(ShipDate) as ShipYear
	,Month(ShipDate) as ShipMonth
	,DATENAME(MONTH, DATEFROMPARTS(Year(ShipDate), Month(ShipDate) , 1)) as ShipMonth_name
	,Sum(Freight) as TotalFreight
	,Avg(Freight) as AvgFreight 
From Sales.SalesOrderHeader
Group by Year(ShipDate), Month(ShipDate) 
Order by Year(ShipDate), Month(ShipDate);



----- Add cumulative sum over the months

Select 
	ShipYear
	, ShipMonth
	, ShipMonth_name
	,Format(TotalFreight,'C2') as TotalFreight
	,Format(AvgFreight,'C2') as AvgFreight
	,Format(Sum(TotalFreight) Over (Order by ShipYear, ShipMonth),'C2') as RunningTotal_Month
From(
		Select 
			Year(ShipDate) as ShipYear
			,Month(ShipDate) as ShipMonth
			,DATENAME(MONTH, DATEFROMPARTS(Year(ShipDate), Month(ShipDate) , 1)) as ShipMonth_name
			,Sum(Freight) as TotalFreight
			,Avg(Freight) as AvgFreight 
		From Sales.SalesOrderHeader
		Group by Year(ShipDate), Month(ShipDate)
) a
Order by ShipYear, ShipMonth;



----- Add yearly cumulative sum (sum resets after each December)



Select 
	ShipYear
	, ShipMonth
	, ShipMonth_name
	,Format(TotalFreight,'C2') as TotalFreight
	,Format(AvgFreight,'C2') as AvgFreight
	,Format(Sum(TotalFreight) Over (Order by ShipYear, ShipMonth),'C2') as RunningTotal_Month
	,Format(Sum(TotalFreight) Over (Partition by ShipYear Order by ShipMonth),'C2') as RunningTotal_YM
From(
		Select 
			Year(ShipDate) as ShipYear
			,Month(ShipDate) as ShipMonth
			,DATENAME(MONTH, DATEFROMPARTS(Year(ShipDate), Month(ShipDate) , 1)) as ShipMonth_name
			,Sum(Freight) as TotalFreight
			,Avg(Freight) as AvgFreight 
		From Sales.SalesOrderHeader
		Group by Year(ShipDate), Month(ShipDate)
) a
Order by ShipYear, ShipMonth;