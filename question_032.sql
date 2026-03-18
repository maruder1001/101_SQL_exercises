----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


Select *
From Person.EmailAddress as ea
		Inner Join Person.Person as p on p.BusinessEntityID = ea.BusinessEntityID
Where p.FirstName = 'Ken' and p.LastName = 'Sánchez';



-----------  Changing CEO's email back to the previous one

Update Person.EmailAddress
	Set EmailAddress = 'ken0@adventure-works.com'
	Where BusinessEntityID = 1


-------- Check the number of Transactions

Select @@TRANCOUNT as OpenTransactions


--------  Start a transaction

Begin Tran


-------- Update incorrectly emails of both Ken Sanchezes

Update ea
SET ea.EmailAddress = 'Ken.Sánchez@adventure-works.com'
	From Person.EmailAddress as ea
		Inner Join Person.Person as p on p.BusinessEntityID = ea.BusinessEntityID
Where p.FirstName = 'Ken' and p.LastName = 'Sánchez';

Select *
From Person.EmailAddress as ea
Where ea.EmailAddress = 'Ken.Sánchez@adventure-works.com';


------- Run the rollback statement

Rollback




----- Create Commit instruction to correctly update the email address

Begin Tran

Update Person.EmailAddress
Set EmailAddress = 'Ken.Sánchez@adventure-works.com'
Where BusinessEntityID = 1

Commit