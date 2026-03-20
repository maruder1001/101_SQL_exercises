----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

Select *
From Sales.SalesOrderHeader;



------- total expenditure on freight

Select Format( SUM(Freight), 'C2' ) as TotalFreightCost
From Sales.SalesOrderHeader;


------- expenditure on freight - yearly breakdown

Select Year( ShipDate ) as YearShip
		, Format( SUM(Freight), 'C2' ) as YearlyFreightCost
		, Format( AVG(Freight), 'C2' ) as avg_YearlyFreightCost
From Sales.SalesOrderHeader
Group by Year( ShipDate )
Order by YearShip;


-------  add running total

Select *
		, Format( Sum(YearlyFreightCost) over (Order By YearShip) , 'C2' ) as RunningTotal
From (
		Select Year( ShipDate ) as YearShip
				,  SUM(Freight) as YearlyFreightCost
				,  AVG(Freight) as avg_YearlyFreightCost
		From Sales.SalesOrderHeader
		Group by Year( ShipDate )
		) as yearly
Order by YearShip;