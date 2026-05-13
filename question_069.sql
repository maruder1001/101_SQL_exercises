----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


------ Add two lines of sql code. The first will show the quartile for each employee compared to the whole company. 
------ The second will show the quartile for each employee within their department. If a department only has two employees then the department will only have 2 quartiles.


Select BusinessEntityID
		, FullName
		, Department
		, RateChangeDate
		, Rate
		, Format( PERCENT_RANK() OVER (ORDER BY Rate)*100, 'N2' )as Percentile_Personal
		, Format( PERCENT_RANK() OVER (Partition by Department Order by Rate)*100, 'N2' )as Percentile_Dept
		, NTILE(4) OVER (ORDER BY Rate Desc) AS rate_quartile_Personal
		, NTILE(4) OVER (Partition by Department Order by Rate Desc) AS rate_quartile_Dept
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
Order by PERCENT_RANK() OVER (ORDER BY Rate) Desc