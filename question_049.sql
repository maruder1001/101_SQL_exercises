----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


-------  Using the INFORMATION_SCHEMA.COLUMNS table find the data type for Vendor.Name

Select 	cols.DOMAIN_SCHEMA
		, cols.DOMAIN_NAME
		, cols.DATA_TYPE
From INFORMATION_SCHEMA.COLUMNS as cols
Where cols.TABLE_SCHEMA = 'Purchasing' and cols.TABLE_NAME = 'Vendor' and cols.COLUMN_NAME = 'Name';



-------  Does this data type have an alias? In other words, is it a user defined data type? If so, what is it?

Select 	cols.DOMAIN_SCHEMA
		, cols.DOMAIN_NAME
From INFORMATION_SCHEMA.COLUMNS as cols
Where cols.DOMAIN_NAME is not Null;

Select 	cols.DOMAIN_SCHEMA
		, cols.DOMAIN_NAME
From INFORMATION_SCHEMA.COLUMNS as cols
Where cols.TABLE_SCHEMA = 'Purchasing' and cols.TABLE_NAME = 'Vendor' and cols.COLUMN_NAME = 'Name';



-------  Using the INFORMATION_SCHEMA.COLUMNS table show a count of data types by user defined data types.

Select   cols.DOMAIN_NAME
		, Count(cols.DOMAIN_NAME) as CNT
From INFORMATION_SCHEMA.COLUMNS as cols
Where cols.DOMAIN_NAME is not Null
Group by cols.DOMAIN_NAME
