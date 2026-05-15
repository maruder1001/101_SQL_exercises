----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


------- What is the heaviest product that AdventureWorks sells?

Select Distinct WeightUnitMeasureCode
From Production.[Product]



Select [Name]
		, [Weight]
		, WeightUnitMeasureCode
		, Case
			When WeightUnitMeasureCode = 'G' then  [Weight]*0.001
			When WeightUnitMeasureCode = 'LB' then  [Weight]*0.45359237
		 End as Weight_kg
From Production.[Product]
Order by Weight_kg Desc;