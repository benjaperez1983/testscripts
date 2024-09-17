USE test;
GO

CREATE PROCEDURE sp_unpivot AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
'UNPIVOT' is not currently supported in Babelfish

*/----------------------------------------------------


DROP TABLE IF EXISTS #WorkflowCases;

CREATE TABLE #WorkflowCases
(
Workflow  VARCHAR(100) PRIMARY KEY,
Case1     INTEGER NOT NULL DEFAULT 0,
Case2     INTEGER NOT NULL DEFAULT 0,
Case3     INTEGER NOT NULL DEFAULT 0
);

INSERT INTO #WorkflowCases (Workflow, Case1, Case2, Case3) VALUES
('Alpha',0,0,0),('Bravo',0,1,1),('Charlie',1,0,0),('Delta',0,0,0);

--Solution 1
--Add each column
SELECT  Workflow,
        Case1 + Case2 + Case3 AS PassFail
FROM    #WorkflowCases;

--Solution 2
--UNPIVOT operator
WITH cte_PassFail AS
(
SELECT  Workflow, CaseNumber, PassFail
FROM    (
        SELECT Workflow,Case1,Case2,Case3
        FROM #WorkflowCases
        ) p UNPIVOT (PassFail FOR CaseNumber IN (Case1,Case2,Case3)) AS UNPVT
)
SELECT  Workflow,
        SUM(PassFail) AS PassFail
FROM    cte_PassFail
GROUP BY Workflow
ORDER BY 1;

DROP TABLE IF EXISTS #WorkflowCases;