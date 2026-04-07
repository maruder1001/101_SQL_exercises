----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


-------  Using INFORMATION_SCHEMA.COLUMNS write a query that will show every column that has the columnName = Status.  

Select 	*
From INFORMATION_SCHEMA.COLUMNS as cols
Where cols.COLUMN_NAME Like 'Status';


------ Create a new User defined data type named 'Status.

CREATE TYPE Status FROM VARCHAR(20) NOT NULL;


------  Write an Alter statement to change the data type on PurchaseOrderHeader.Status from tinyint to the new User Defined data type, status.

ALTER TABLE Purchasing.PurchaseOrderHeader
DROP CONSTRAINT DF_PurchaseOrderHeader_Status;

ALTER TABLE Purchasing.PurchaseOrderHeader
DROP CONSTRAINT CK_PurchaseOrderHeader_Status;

ALTER TABLE Purchasing.PurchaseOrderHeader
ALTER COLUMN Status Status NOT NULL;


-- See the original constraint definitions
SELECT name, definition
FROM sys.default_constraints
WHERE parent_object_id = OBJECT_ID('Purchasing.PurchaseOrderHeader');

SELECT name, definition
FROM sys.check_constraints
WHERE parent_object_id = OBJECT_ID('Purchasing.PurchaseOrderHeader');


-- Re-add default constraint
ALTER TABLE Purchasing.PurchaseOrderHeader
ADD CONSTRAINT DF_PurchaseOrderHeader_Status DEFAULT '1' FOR Status;

-- Re-add check constraint
ALTER TABLE Purchasing.PurchaseOrderHeader
ADD CONSTRAINT CK_PurchaseOrderHeader_Status CHECK (Status BETWEEN '1' AND '8');




---------  Drop Status TYPE

DROP TYPE Status;  ------- an error, the type is in use and cannot be dropped



-------- Write an Alter Statement to change the data type on PurchaseOrderHeader.Status back to the tinyint


ALTER TABLE Purchasing.PurchaseOrderHeader
DROP CONSTRAINT DF_PurchaseOrderHeader_Status;

ALTER TABLE Purchasing.PurchaseOrderHeader
DROP CONSTRAINT CK_PurchaseOrderHeader_Status;

ALTER TABLE Purchasing.PurchaseOrderHeader
ALTER COLUMN Status tinyint NOT NULL;


---------  Drop Status TYPE, attempt 2

DROP TYPE Status; 