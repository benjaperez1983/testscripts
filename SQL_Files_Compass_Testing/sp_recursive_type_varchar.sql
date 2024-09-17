USE test;
GO

CREATE PROCEDURE sp_recursive_type_varchar AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
recursive query "cte_permutations" column 1 has type "varchar" in non-recursive term but type text overall

*/----------------------------------------------------

DROP TABLE IF EXISTS #TestCases;

CREATE TABLE #TestCases
(
TestCase  VARCHAR(1) PRIMARY KEY
);
GO

INSERT INTO #TestCases (TestCase) VALUES
('A'),('B'),('C');

DECLARE @vTotalElements INTEGER = (SELECT COUNT(*) FROM #TestCases);

--Recursion
WITH cte_Permutations (Permutation, Id, Depth)
AS
(
SELECT  CAST(TestCase AS VARCHAR(MAX)),
        CONCAT(CAST(TestCase AS VARCHAR(MAX)),';'),
        1 AS Depth
FROM    #TestCases
UNION ALL
SELECT  CONCAT(a.Permutation,',',b.TestCase),
        CONCAT(a.Id,b.TestCase,';'),
        a.Depth + 1
FROM    cte_Permutations a,
        #TestCases b
WHERE   a.Depth < @vTotalElements AND
        a.Id NOT LIKE CONCAT('%',b.TestCase,';%')
)
SELECT  Permutation
FROM    cte_Permutations
WHERE   Depth = @vTotalElements;

DROP TABLE IF EXISTS #TestCases;