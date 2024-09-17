USE test;
GO

DROP PROCEDURE IF EXISTS sp_last_identity_value;
GO

CREATE PROCEDURE sp_last_identity_value AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
'$IDENTITY' is not currently supported in Babelfish

*/----------------------------------------------------

DROP TABLE IF EXISTS #ExampleTable;

-- Create a table with an identity column and a ROWGUIDCOL column
CREATE TABLE #ExampleTable (
    ID INT IDENTITY(1,1) PRIMARY KEY
);

-- Insert data into the table
INSERT INTO #ExampleTable DEFAULT VALUES;
INSERT INTO #ExampleTable DEFAULT VALUES; -- Insert a couple of rows to update the identity and ROWGUID values

DECLARE @minidentval INT;
DECLARE @maxidentval INT;
DECLARE @nextidentval INT;

SELECT @minidentval = MIN($IDENTITY),
       @maxidentval = MAX($IDENTITY)
FROM   #ExampleTable;

PRINT(CONCAT('@minidentval= ', @minidentval));
PRINT(CONCAT('@maxidentval= ', @maxidentval));
GO
