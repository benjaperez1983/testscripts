USE test;
GO

DROP PROCEDURE IF EXISTS sp_ignore_nulls;
GO

CREATE PROCEDURE sp_ignore_nulls AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
syntax error near 'OVER' at line 16 and character position 38

*/----------------------------------------------------

WITH cte_Lag_Lead AS
(
SELECT 1 AS ID, 100 AS MyValue
UNION
SELECT 2 AS ID, 200 AS MyValue
UNION
SELECT 3 AS ID, NULL AS MyValue
UNION
SELECT NULL AS ID, 300 AS MyValue
)
SELECT  *,
        LAG(MyValue,1,0) IGNORE NULLS OVER (ORDER BY ID) AS LagIgnoreNulls,
        LEAD(MyValue,1,0) IGNORE NULLS OVER (ORDER BY ID) AS LeadIgnoreNulls,
        LAG(MyValue,1,0) RESPECT NULLS OVER (ORDER BY ID) AS LagRespectNulls,
        LEAD(MyValue,1,0) RESPECT NULLS OVER (ORDER BY ID) AS LeadRespectNulls
FROM    cte_Lag_Lead
ORDER BY ID;
GO

