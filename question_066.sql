----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


------ a. Join vEmployeeDepartmentHistory to EmployeePayHistory.

Select *
From HumanResources.vEmployeeDepartmentHistory as edh
	Inner Join HumanResources.EmployeePayHistory as eph on eph.BusinessEntityID = edh.BusinessEntityID


------ b. Write a statement that will give you one    row per employee (290 rows) and only show the most recent and active rate. 


Select *
From (
		Select Row_number() Over(Partition by edh.BusinessEntityID Order by eph.RateChangeDate Desc) as RowNum
			, edh.BusinessEntityID
			, CONCAT( edh.FirstName, ' ', Coalesce(edh.MiddleName || ' ', '') , edh.LastName ) as FullName
			, edh.Department
			, eph.RateChangeDate
			, eph.Rate
	From HumanResources.vEmployeeDepartmentHistory as edh
		Inner Join HumanResources.EmployeePayHistory as eph on eph.BusinessEntityID = edh.BusinessEntityID ) a
Where RowNum = '1'