USE test;
GO

DROP PROCEDURE IF EXISTS sp_string_agg_function_requires_two_arguments;
GO

CREATE PROCEDURE sp_string_agg_function_requires_two_arguments AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
None

This script will compile but does not execute.
The string_agg function requires 2 arguments

*/----------------------------------------------------

DROP TABLE IF EXISTS #DMLTable;

CREATE TABLE #DMLTable
(
SequenceNumber  INTEGER PRIMARY KEY,
String          VARCHAR(100) NOT NULL
);

INSERT INTO #DMLTable (SequenceNumber, String) VALUES
(1,'SELECT'),
(2,'Product,'),
(3,'UnitPrice,'),
(4,'EffectiveDate'),
(5,'FROM'),
(6,'Products'),
(7,'WHERE'),
(8,'UnitPrice'),
(9,'> 100');

--Solution 1
--STRING_AGG
SELECT  STRING_AGG(CONVERT(NVARCHAR(MAX),String), ' ') WITHIN GROUP (ORDER BY SequenceNumber ASC)
FROM    #DMLTable;

DROP TABLE IF EXISTS #DMLTable;
GO

EXECUTE sp_string_agg_function_requires_two_arguments;
GO