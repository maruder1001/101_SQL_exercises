----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


Select *
From Production.ProductInventory as inv
Order By inv.ProductID


------- a. Build a table that shows Product Inventory Quantity by Product Name

Drop Table if exists #Temp1

Select p.[Name] as ProductName
		, SUM(inv.Quantity) as Quantity
		, p.SafetyStockLevel
		, p.ReorderPoint
		, Case
				When SUM(inv.Quantity) < p.SafetyStockLevel Then 1
				Else 0
		  End as Below_SafetyStockLevel
		, Case
				When SUM(inv.Quantity) < p.ReorderPoint Then 1
				Else 0
		  End as Below_ReorderPoint
INTO #Temp1
From Production.[Product] as p
	Inner Join Production.ProductInventory as inv on inv.ProductID = p.ProductID
Group by p.[Name]
		, p.SafetyStockLevel
		, p.ReorderPoint


------- b. How many productIDs in Production.Product?

Select Count( p.ProductID) as CNT_ProductID
From Production.[Product] as p


------- c. How many unique productIDs in inventory?

Select Count(Distinct p.ProductID) as CNT_ProductID_Inventory
From Production.ProductInventory as p

------- d. Write a query to show a count of products in the Product table but not in the inventory table.

Select Count(p.ProductID) as CNT_ProductID_NotInInventory
From Production.[Product] as p
Where p.ProductID not in (Select Distinct ProductID From Production.ProductInventory)

------- e. Use the Temp Table created in a, how many products below safety stock level?

Select Sum(Below_SafetyStockLevel) as Products_Below_SafetyStockLevel
From #Temp1

------- f. Use the Temp Table created in a, how many products below reorder point?

Select Sum(Below_ReorderPoint) as Products_Below_ReorderPoint
From #Temp1