----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


-------  Add a flag that will show the tables that have less than 10% space unused.


Select t.name as TableName
		, Max(p.rows) as RowCNT
		, Sum(u.total_pages * 8) as TotalAllocated_kB
		, Sum(u.used_pages * 8) as Used_kB
		, Sum(u.total_pages)*8 - Sum(u.used_pages)*8 as Unused_kB
		, Case
			When Cast( (Sum(u.total_pages)*8 - Sum(u.used_pages)*8) as decimal) / Nullif( Sum(u.total_pages * 8), 0 ) < 0.10 Then 1
			Else 0
		End as Flag
From sys.allocation_units as u
	inner join sys.partitions as p on p.hobt_id = u.container_id
	inner join sys.tables as t on t.object_id = p.object_id
Group by t.name;


-------

Create View vDatabaseAllocation
As (

Select t.name as TableName
		, Max(p.rows) as RowCNT
		, Sum(u.total_pages * 8) as TotalAllocated_kB
		, Sum(u.used_pages * 8) as Used_kB
		, Sum(u.total_pages)*8 - Sum(u.used_pages)*8 as Unused_kB
		, Case
			When Cast( (Sum(u.total_pages)*8 - Sum(u.used_pages)*8) as decimal) / Nullif( Sum(u.total_pages * 8), 0 ) < 0.10 Then 1
			Else 0
		End as Flag
From sys.allocation_units as u
	inner join sys.partitions as p on p.hobt_id = u.container_id
	inner join sys.tables as t on t.object_id = p.object_id
Group by t.name

)

Select *
From vDatabaseAllocation