SELECT type_desc, COUNT(type_desc) AS type_count
FROM [AdventureWorks2019].[sys].[objects]
GROUP BY type_desc
ORDER BY COUNT(type_desc) DESC
