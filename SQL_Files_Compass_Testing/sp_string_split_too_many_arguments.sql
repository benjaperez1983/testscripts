USE test;
GO

DROP PROCEDURE IF EXISTS sp_string_split_too_many_arguments;
GO

CREATE PROCEDURE sp_string_split_too_many_arguments AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
None

This script will compile but does not execute.
function string_split has too many arguments specified.

*/----------------------------------------------------

DROP TABLE IF EXISTS #Strings;

CREATE TABLE #Strings
(
QuoteId  INTEGER IDENTITY(1,1) PRIMARY KEY,
String   VARCHAR(100) NOT NULL
);

INSERT INTO #Strings (String) VALUES
('SELECT EmpID FROM Employees;'),('SELECT * FROM Transactions;');

WITH cte_StringSplit AS
(
SELECT b.Ordinal AS RowNumber,
       a.QuoteId,
       a.String,
       b.[Value] AS Word,
       LEN(b.[Value]) AS WordLength
FROM   #Strings a CROSS APPLY
       STRING_SPLIT(String,' ', 1) b
)
SELECT RowNumber,
       QuoteID,
       String,
       CHARINDEX(Word, String) AS Starts,
       (CHARINDEX(Word, String) + WordLength) - 1 AS Ends,
       Word
FROM cte_StringSplit;
GO

EXECUTE sp_string_split_too_many_arguments;
GO
