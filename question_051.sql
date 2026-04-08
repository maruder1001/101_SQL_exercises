----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================


Use AdventureWorks2019


-------  Print Total allocated memory for the database and later break it down to used and unused memory

Select t.name as TableName
		, Max(p.rows) as RowCNT
		, Sum(u.total_pages * 8) as TotalAllocated_kB
		, Sum(u.used_pages * 8) as Used_kB
		, Sum((u.total_pages-u.used_pages) * 8) as Unused_kB
From sys.allocation_units as u
	inner join sys.partitions as p on p.hobt_id = u.container_id
	inner join sys.tables as t on t.object_id = p.object_id
Group by t.name;