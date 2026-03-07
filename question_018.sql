----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019

Select *
From Production.TransactionHistory;


Select *
From Production.TransactionHistoryArchive;


--- a. Abbreviations meaning

Select t.name as TableName,
		c.name as ColumnName,
		ep.value as Definitions
From sys.extended_properties as ep
	Inner Join sys.tables as t on t.object_id = ep.major_id
	Inner Join sys.columns as c on c.object_id = ep.major_id and c.column_id = ep.minor_id
Where t.name in ('TransactionHistory') and c.name in ('TransactionType')


--- b. Union TransactionHistory and TransactionHistoryArchive
--- Those tables do not have common key so Inner Join would not work

Select * From Production.TransactionHistory
Union
Select * From Production.TransactionHistoryArchive;



--- c. Find the First and Last TransactionDate in the TransactionHistory 
---    and TransactionHistoryArchive tables. Use the union written in part b. 
---    The current data type for TransactionDate is datetime. Convert or Cast 
---    the data type to date.


Select Cast(Min(TransactionDate) as Date) as First_date,
		Convert( Date, Max(TransactionDate) ) as Last_Date
From (Select * From Production.TransactionHistory
Union
Select * From Production.TransactionHistoryArchive) as TransHist_u;


--- d. Find the First and Last Date for each transaction type. Use a case 
---    statement to specify the transaction types.


Select 
	Case	When TransactionType = 'W' Then 'WorkOrder'
			When TransactionType = 'S' Then 'SaleOrder'
			When TransactionType = 'P' Then 'PurchaseOrder'
			Else Null End as TransactionType,
	Cast(Min(TransactionDate) as Date) as First_date,
	Convert( Date, Max(TransactionDate) ) as Last_Date
From (Select * From Production.TransactionHistory
Union
Select * From Production.TransactionHistoryArchive) as TransHist_u
Group by TransactionType;