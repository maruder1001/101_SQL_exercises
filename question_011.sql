Use AdventureWorks2019


--- a. 

Select 
	Count(*) as EmpCNT,
	Count(Distinct BusinessEntityID) as EmpCNT2,
	Count(Distinct NationalIDNumber) as EmpCNT3
From HumanResources.Employee



--- b.

Select CurrentFlag,
		Count(*) as EmpCNT
From HumanResources.Employee
Group by CurrentFlag


--- c.

Select 
		Distinct JobTitle as jobs
From HumanResources.Employee as e
	INNER JOIN Person.Person as p On p.BusinessEntityID = e.BusinessEntityID
Where PersonType = 'SP'


Select 
		Count(Distinct JobTitle) as job_CNT
From HumanResources.Employee as e
	INNER JOIN Person.Person as p On p.BusinessEntityID = e.BusinessEntityID
Where PersonType = 'SP'




--- d. 



Select 
		Count(Distinct e.BusinessEntityID) as SP_CNT
From HumanResources.Employee as e
	INNER JOIN Person.Person as p On p.BusinessEntityID = e.BusinessEntityID
Where PersonType = 'SP'



Select  JobTitle,
		Count(Distinct e.BusinessEntityID) as SP_CNT
From HumanResources.Employee as e
	INNER JOIN Person.Person as p On p.BusinessEntityID = e.BusinessEntityID
Where PersonType = 'SP'
Group by JobTitle