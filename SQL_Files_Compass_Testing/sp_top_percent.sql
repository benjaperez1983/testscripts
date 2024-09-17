USE test;
GO

CREATE PROCEDURE sp_top_percent AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
None

This script will compile but does not execute.
TOP # PERCENT is not yet supported

*/----------------------------------------------------

DROP TABLE IF EXISTS #SampleData;

CREATE TABLE #SampleData
(
IntegerValue  INTEGER NOT NULL
);

INSERT INTO #SampleData (IntegerValue) VALUES
(5),(6),(10),(10),(13),(14),(17),(20),(81),(90),(76);

--Median
SELECT
        ((SELECT TOP 1 IntegerValue
        FROM    (
                SELECT  TOP 50 PERCENT IntegerValue
                FROM    #SampleData
                ORDER BY IntegerValue
                ) a
        ORDER BY IntegerValue DESC) +  --Add the Two Together
        (SELECT TOP 1 IntegerValue
        FROM (
            SELECT  TOP 50 PERCENT IntegerValue
            FROM    #SampleData
            ORDER BY IntegerValue DESC
            ) a
        ORDER BY IntegerValue ASC)
        ) * 1.0 /2 AS Median;

--Mean and Range
SELECT  AVG(IntegerValue) AS Mean,
        MAX(IntegerValue) - MIN(IntegerValue) AS [Range]
FROM    #SampleData;

--Mode
SELECT  TOP 1
        IntegerValue AS Mode,
        COUNT(*) AS ModeCount
FROM    #SampleData
GROUP BY IntegerValue
ORDER BY ModeCount DESC;

DROP TABLE IF EXISTS #SampleData;
GO