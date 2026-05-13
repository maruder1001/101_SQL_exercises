----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


------ Add a line of SQL code that will show the rate percentile for each Adventureworks employee. Order by the highest percentile. 


Select BusinessEntityID
		, FullName
		, Department
		, RateChangeDate
		, Rate
		, Format( PERCENT_RANK() OVER (ORDER BY Rate)*100, 'N2' )as Percentile_Personal
		, Format( PERCENT_RANK() OVER (Partition by Department Order by Rate)*100, 'N2' )as Percentile_Dept
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
--Order by PERCENT_RANK() OVER (ORDER BY Rate) Desc