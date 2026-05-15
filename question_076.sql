----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


Select * From Sales.vPersonDemographics
Where BusinessEntityID = '20392'

Select * From Person.Person
Where BusinessEntityID = '20392'


------- a. Select vPersonDemographics into a table and name the table Dup_PersonDemographics. Only insert rows/values that have a 'DateFirstPurchase'

Drop Table if exists Dup_PersonDemographics

Select * 
Into Dup_PersonDemographics
From Sales.vPersonDemographics
Where DateFirstPurchase is not Null 


Select *
From Dup_PersonDemographics


------- b. Write an alter statement and add two columns to Dup_PersonDemographics. Column Names and datatypes:
-------  - FullName: varchar(255)
-------  - Age: int


ALTER TABLE Dup_PersonDemographics
ADD FullName varchar(255),
	 Age INT;



-------  c. Update the FullName column to be the First and Last Name from Person.Person

Select Concat(FirstName, ' ', LastName) as FullName
From Person.Person

UPDATE Dup_PersonDemographics
SET FullName = CONCAT(FirstName, ' ', LastName)
FROM Dup_PersonDemographics
	INNER JOIN Person.Person ON Dup_PersonDemographics.BusinessEntityID = Person.Person.BusinessEntityID;

Select *
From Dup_PersonDemographics


-------  d. Update the age column to be the years between the persons birthday and August 15, 2014.

UPDATE Dup_PersonDemographics
Set Age =  DATEDIFF(Year, BirthDate, '2014-08-15')
