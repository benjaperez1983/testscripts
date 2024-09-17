USE test
GO

DROP PROCEDURE IF EXISTS sp_generate_series;
GO

CREATE PROCEDURE sp_generate_series AS
/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
None

This script will compile but does not execute.
column "value" does not exist

*/----------------------------------------------------

DECLARE @vTotalNumbers INTEGER = 10;

--Solution 1
--SQL Server has GENERATE SERIES begining with version 2022
SELECT value
FROM GENERATE_SERIES(1, 10);
GO

EXECUTE sp_generate_series;
GO