----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


-------  Calculate prediction of next year memory usage
-------  Assumptions: so far the data was collected for 1127 days, assume that for the next 365 days data aquisition will have the same rate.


Alter View vDatabaseAllocation
As (

	Select t.name as TableName
			, Max(p.rows) as RowCNT
			, Sum(u.total_pages * 8) as TotalAllocated_kB
			, Sum(u.used_pages * 8) as Used_kB
			, Sum(u.total_pages)*8 - Sum(u.used_pages)*8 as Unused_kB
			, Case
				When Cast( (Sum(u.total_pages)*8 - Sum(u.used_pages)*8) as decimal) / Nullif( Sum(u.total_pages * 8), 0 ) < 0.10 Then 1
				Else 0
			End as Flag  ------ When more than 90% of allocated memory is used.
			, Format( (Cast( Sum(u.used_pages*8) as decimal )/1127 )*1492 , 'N0'    ) as  pred_Used_kB
	From sys.allocation_units as u
		inner join sys.partitions as p on p.hobt_id = u.container_id
		inner join sys.tables as t on t.object_id = p.object_id
	Group by t.name
)


Select *
From vDatabaseAllocation;