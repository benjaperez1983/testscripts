USE test
GO

DROP PROCEDURE IF EXISTS sp_cte_does_not_exist;
GO

CREATE PROCEDURE sp_cte_does_not_exist AS
/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
None

This script will compile but does not execute.
relation "cte_duplicates" does not exist

*/----------------------------------------------------

DROP TABLE IF EXISTS #SampleData;

CREATE TABLE #SampleData
(
IntegerValue  INTEGER NOT NULL
);

INSERT INTO #SampleData (IntegerValue) VALUES
(1),(1),(2),(3),(3),(4);

WITH cte_Duplicates AS
(
SELECT  ROW_NUMBER() OVER (PARTITION BY IntegerValue ORDER BY IntegerValue) AS Rnk
FROM    #SampleData
)
DELETE FROM cte_Duplicates WHERE Rnk > 1;

SELECT * FROM #SampleData;

DROP TABLE IF EXISTS #SampleData;
GO

--EXECUTE sp_cte_does_not_exist;