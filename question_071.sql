----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


------  a. Create a username for each person by removing the "@adventure-works.com" on their email in the EmailAddress table.

Select Replace(EmailAddress, '@adventure-works.com', '') as Username
From Person.EmailAddress;


------  b. Are there any duplicate usernames?

Select *
From (
	Select Replace(EmailAddress, '@adventure-works.com', '') as Username
	From Person.EmailAddress ) a
Group by Username
Having Count( Distinct Username ) > 1;


------  c. Take the results from Part A and join Person.Person. Then create a temporary password.

Select ea.BusinessEntityID
		, ea.EmailAddress
		, Lower(Replace(EmailAddress, '@adventure-works.com', '')) as Username
		, Lower(Concat( Left(p.FirstName, 2), '.', Left(p.LastName, 2), '.', Left(NewID(), 5) )) as initial_Password
From Person.EmailAddress as ea
	Inner Join Person.Person as p on p.BusinessEntityID = ea.BusinessEntityID
Order by ea.BusinessEntityID Asc;