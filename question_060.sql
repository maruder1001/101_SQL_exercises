----==================================================

--To comment the lines you have to use combination
--Ctrl+K  then  Ctrl+C


--To uncomment the lines you have to use combination
--Ctrl+K  then  Ctrl+U

----==================================================

Use AdventureWorks2019


DROP TABLE IF EXISTS dbo.SalesPersonSurvey ;
GO
CREATE TABLE dbo.SalesPersonSurvey
(SurveyId INT NOT NULL IDENTITY(1, 1),
 [Overall Experience] TINYINT NOT NULL,
 [Will you purchase from AdventureWorks Again] TINYINT NOT NULL,
 [Likelihood to recommend to a friend] TINYINT NOT NULL,
 [SalesPerson I worked with was helpful] TINYINT NOT NULL,
 [SalesPerson I worked with was Kind] TINYINT NOT NULL)
 
INSERT INTO dbo.SalesPersonSurvey 
    ([Overall Experience]
    ,[Will you purchase from AdventureWorks Again]
    ,[Likelihood to recommend to a friend]
    ,[SalesPerson I worked with was helpful]
   ,[SalesPerson I worked with was Kind])
VALUES
 (5,4,3,3,3),(2,3,4,2,2),(1,1,4,1,1)
,(4,5,5,5,2),(2,3,5,5,5),(3,3,5,5,5)
,(4,3,5,5,5),(1,1,1,1,1),(4,3,5,4,5)
,(2,3,3,3,3)
 
---- Unpivot the table

Select SurveyId
        , Question
        , Response
From SalesPersonSurvey
Unpivot(
    Response for Question in( 
         [Overall Experience]
        ,[Will you purchase from AdventureWorks Again]
        ,[Likelihood to recommend to a friend]
        ,[SalesPerson I worked with was helpful]
        ,[SalesPerson I worked with was Kind]
    )
) as a