----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


------  a. Inser this data into a table called "Person.Username".


DROP TABLE IF EXISTS Person.Username;

CREATE TABLE Person.Username (
    BusinessEntityID INT not null,
    EmailAddress VARCHAR(100),
    CharCNT INT,
    Username VARCHAR(100),
    PRIMARY KEY (BusinessEntityID)
);

INSERT INTO Person.Username (BusinessEntityID, EmailAddress, CharCNT, Username)
Select 
    BusinessEntityID
    ,EmailAddress
    ,CHARINDEX('@',EmailAddress) CharCNT
    , Lower( Left(EmailAddress,CHARINDEX('@',EmailAddress)-1)) as Username
From Person.EmailAddress
Order by 1 asc;


Select *
From Person.Username;


------ b. add a line of code that will return the length of the character string in the username.


Select *
        , Len(Username) Username_length
From Person.Username;


------ c. For security purposes each username needs at least 5 characters. Therefore if a username only has 2 characters then add a "123" at the end.


UPDATE Person.Username
Set Username = 
        Case
                When Len(Username) = 2 Then CONCAT(Username, '123')
                When Len(Username) = 3 Then CONCAT(Username, '12')
                When Len(Username) = 4 Then CONCAT(Username, '1')
                Else Username
          End 
From Person.Username;

Select *
From Person.Username;


------   d. Truncate the table. 

TRUNCATE TABLE Person.Username;

Select *
From Person.Username;


------ e. Drop table. 

DROP TABLE IF EXISTS Person.Username;

Select *
From Person.Username;