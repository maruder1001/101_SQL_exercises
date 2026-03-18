----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


--------- Update Ken Sánchez email address to 'Ken.Sánchez@adventure-works.com'  
Update ea
SET ea.EmailAddress = 'Ken.Sánchez@adventure-works.com'
	From Person.EmailAddress as ea
		Inner Join Person.Person as p on p.BusinessEntityID = ea.BusinessEntityID
Where ea.BusinessEntityID = '1';


Select *
From Person.EmailAddress as ea
Where ea.BusinessEntityID = '1';