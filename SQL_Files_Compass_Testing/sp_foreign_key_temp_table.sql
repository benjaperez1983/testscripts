USE test;
GO

DROP PROCEDURE IF EXISTS sp_foreign_key_temp_table;
GO

CREATE PROCEDURE sp_foreign_key_temp_table AS

/*----------------------------------------------------
SQL Server Message:
Skipping FOREIGN KEY constraint '#Ungroup' definition for temporary table. FOREIGN KEY constraints are not enforced on local or global temporary tables.

Babelfish Error Message:
None

This script will compile but does not execute.
column "integervalue" referenced in foreign key constraint does not exist

*/----------------------------------------------------

DROP TABLE IF EXISTS #Ungroup;
DROP TABLE IF EXISTS #Numbers;

CREATE TABLE #Ungroup
(
ProductDescription  VARCHAR(100) PRIMARY KEY,
Quantity            INTEGER NOT NULL
);

INSERT INTO #Ungroup (ProductDescription, Quantity) VALUES
('Pencil',3),('Eraser',4),('Notebook',2);

-- Create a numbers table
SELECT IntegerValue
INTO   #Numbers
FROM   (VALUES(1),(2),(3),(4)) a(IntegerValue) 

--Skipping FOREIGN KEY constraint '#Ungroup' definition for temporary table. FOREIGN KEY constraints are not enforced on local or global temporary tables.
ALTER TABLE #Ungroup ADD FOREIGN KEY (Quantity) REFERENCES #Numbers(IntegerValue);

DROP TABLE IF EXISTS #Ungroup;
DROP TABLE IF EXISTS #Numbers;
GO

EXECUTE sp_foreign_key_temp_table;
