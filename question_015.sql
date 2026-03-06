----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

Select *
From HumanResources.Employee

Select *
From Person.Person


--------------- a. Employees ages


Select  DATEDIFF(year, BirthDate,  '2014/08/15' ) as age
From HumanResources.Employee



Select  CONCAT(p.FirstName, ' ', p.LastName) as full_name,
		e.JobTitle,
		DATEDIFF(year, BirthDate, '2014/08/15' ) as age
From HumanResources.Employee as e
Inner Join Person.Person as p On p.BusinessEntityID = e.BusinessEntityID
ORDER BY e.BusinessEntityID ASC;

--- The oldest employee's age

Select MAX( DATEDIFF(year, BirthDate, '2014/08/15' ) ) as age
From HumanResources.Employee



--- The youngest employee's age

Select MIN( DATEDIFF(year, BirthDate, '2014/08/15' ) ) as age
From HumanResources.Employee



--------------- b. Employees' average age by Organization level

Select 
	OrganizationLevel,
	Format(Avg(Cast( DATEDIFF(day, BirthDate, '2014/08/15' )/365.25 as decimal)), 'N1') as age
From HumanResources.Employee
Group by OrganizationLevel




--------------- c. Employees' average age, rounded up

Select 
	OrganizationLevel,
	Ceiling(Avg(Cast( DATEDIFF(day, BirthDate, '2014/08/15' )/365.25 as decimal)))  as age
From HumanResources.Employee
Group by OrganizationLevel


--------------- d. Employees' average age, rounded up

Select 
	OrganizationLevel,
	Format(Avg(Cast( DATEDIFF(day, BirthDate, '2014/08/15' )/365.25 as decimal)), 'N1') as age,
	Ceiling(Avg(Cast( DATEDIFF(day, BirthDate, '2014/08/15' )/365.25 as decimal)))  as age_round_up,
	Floor(Avg(Cast( DATEDIFF(day, BirthDate, '2014/08/15' )/365.25 as decimal)))  as age_round_down
From HumanResources.Employee
Group by OrganizationLevel