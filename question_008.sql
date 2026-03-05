-- Part a.

SELECT DATA_TYPE, COUNT(*) as CNT
FROM information_schema.columns
GROUP BY DATA_TYPE
ORDER BY CNT DESC;


-- Part b.

SELECT 
	CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL THEN 'Character'
		 WHEN Numeric_Precision IS NOT NULL THEN 'Numeric'
		 WHEN DateTime_Precision IS NOT NULL THEN 'Date'
		 ELSE NULL
		 END 'DataTypeGroup'
        , COUNT(*) as DataTypeCNT
FROM information_schema.columns
GROUP BY 	
	CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL THEN 'Character'
		 WHEN Numeric_Precision IS NOT NULL THEN 'Numeric'
		 WHEN DateTime_Precision IS NOT NULL THEN 'Date'
		 ELSE NULL
		 END
ORDER BY DataTypeCNT DESC;


-- Part c.

SELECT DATA_TYPE
FROM information_schema.columns
WHERE   CHARACTER_MAXIMUM_LENGTH IS NULL
		AND Numeric_Precision IS NULL
		AND DateTime_Precision IS NULL;