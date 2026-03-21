----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


-------- Show how many month per year were taken into consideration

Select 
	ShipYear
	, CompletedMonths
	,Format(TotalFreight,'C0') as TotalFreight
	,Format(AvgFreight,'C0') as AvgFreight
	,Format(Sum(TotalFreight) Over (Order by ShipYear),'C0') as RunningTotal
From(
	Select 
		Year(ShipDate) as ShipYear
		, Count( Distinct Month(ShipDate) ) as CompletedMonths
		,Sum(Freight) as TotalFreight
		,Avg(Freight) as AvgFreight 
	From Sales.SalesOrderHeader
	Group by 
		Year(ShipDate))a


-------- Averate Total Freight per month

Select 
	ShipYear
	, CompletedMonths
	,Format(TotalFreight,'C2') as TotalFreight
	,Format(Sum(TotalFreight) Over (Order by ShipYear),'C2') as RunningTotal
	,Format(AvgFreight,'C2') as AvgFreight_YEAR
	,Format(TotalFreight_month ,'C2') as AvgFreight_MONTH
From(
	Select 
		Year(ShipDate) as ShipYear
		, Count( Distinct Month(ShipDate) ) as CompletedMonths
		,Sum(Freight) as TotalFreight
		,Sum(Freight) / Count( Distinct Month(ShipDate) )  as TotalFreight_month
		,Avg(Freight) as AvgFreight 
	From Sales.SalesOrderHeader
	Group by 
		Year(ShipDate))a