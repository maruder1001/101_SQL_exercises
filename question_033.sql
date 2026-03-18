----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

-----------  Changing CEO's email back to the previous one

Update Person.EmailAddress
	Set EmailAddress = 'ken0@adventure-works.com'
	Where BusinessEntityID = 1



Select *
From Person.EmailAddress as ea
		Inner Join Person.Person as p on p.BusinessEntityID = ea.BusinessEntityID
Where p.FirstName = 'Ken' and p.LastName = 'Sánchez';




---- Write an instruction that would use Rollback and Commit if the logic for email change is correct (only on echange for a specific person)


Select @@TRANCOUNT as OpenTransaction


Begin Tran

Update Person.EmailAddress
	Set EmailAddress = 'Ken.Sánchez@adventure-works.com'
Where BusinessEntityID = 1

If @@ROWCOUNT > 1
	RollBack;
Else
	Commit;


---- Check the update
Select *
From Person.EmailAddress as ea
Where ea.EmailAddress = 'Ken.Sánchez@adventure-works.com';