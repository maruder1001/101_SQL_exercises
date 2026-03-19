----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


Select *
From HumanResources.Employee;


----- Establish employees' Seniority based on their HireDate

Select p.FirstName,
		p.LastName,
		Rank() Over(Order By e.HireDate) as Seniority,
		e.HireDate
From HumanResources.Employee as e
	inner join Person.Person as p on p.BusinessEntityID = e.BusinessEntityID;


------- Calculate the employment times for each employee (in days, months and years)

Declare @StartDate Date = '2014-03-03';

Select p.FirstName,
		p.LastName,
		Rank() Over(Order By e.HireDate) as Seniority,
		e.HireDate,
		DATEDIFF(Day, e.HireDate, @StartDate) as Employment_Days,
		DATEDIFF(MONTH, e.HireDate, @StartDate) as Employment_Months,
		DATEDIFF(Year, e.HireDate, @StartDate) as Employment_Years
From HumanResources.Employee as e
	inner join Person.Person as p on p.BusinessEntityID = e.BusinessEntityID;