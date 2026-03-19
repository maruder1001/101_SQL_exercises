----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


Select *
From HumanResources.Employee;



----------- Create a temporary table #Temp1 
Declare @StartDate Date = '2014-03-03';
DROP TABLE IF EXISTS #Temp1;

Select  
		*,
		Rank() Over(Order By e.HireDate) as Seniority,
		DATEDIFF(Day, e.HireDate, @StartDate) as Employment_Days,
		DATEDIFF(MONTH, e.HireDate, @StartDate) as Employment_Months,
		DATEDIFF(Year, e.HireDate, @StartDate) as Employment_Years
Into #Temp1 
From HumanResources.Employee as e;

--- Check specific employees and update their employment time
Select * 
From #Temp1
Where BusinessEntityID in ('288','286')


Update #Temp1
	Set Employment_Years = '0'
	Where BusinessEntityID in ('288','286')



-----  How many employees worked for more than 5.5 years?

Select * 
From #Temp1


Declare @EmploymentSpan Float = '5.5';

Select * 
From #Temp1
Where Employment_Days > @EmploymentSpan*365.25;



------ Group Employees into four groups depending on their EmploymentTime:

------ 1. Employed Less Than 1 Year
------ 2. Employed 1-3 Years
------ 3. Employed 4-6
------ 4. Employed Over 6 Years

Select *,
	Case
			When Employment_Days < 1*365.25 Then '1'
			When Employment_Days >= 1*365.25 And Employment_Days < 4*365.25 Then '2'
			When Employment_Days >= 4*365.25 And Employment_Days < 6*365.25 Then '3'
			When Employment_Days >= 6*365.25 Then '4'
	End as EmploymentTime_Tier
From #Temp1



------ Then show statistic of this grouping, namely how many Employees are in each group, what is the average Vacation and Sick time in each group
With CTE_Employment_Tier AS (
		Select *,
			Case
					When Employment_Days < 1*365.25 Then '1'
					When Employment_Days >= 1*365.25 And Employment_Days < 4*365.25 Then '2'
					When Employment_Days >= 4*365.25 And Employment_Days < 6*365.25 Then '3'
					When Employment_Days >= 6*365.25 Then '4'
			End as EmploymentTime_Tier
		From #Temp1 )
Select Count(EmploymentTime_Tier) as CNT_Employment_Tier
		,AVG(VacationHours) as avg_VacationHours
		,AVG(SickLeaveHours) as avg_SickLeaveHours
From CTE_Employment_Tier
Group by EmploymentTime_Tier;