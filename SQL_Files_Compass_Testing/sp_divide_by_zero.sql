USE test;
GO

DROP PROCEDURE IF EXISTS sp_divide_by_zero;
GO

CREATE PROCEDURE sp_divide_by_zero AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
division by zero

*/----------------------------------------------------

DROP TABLE IF EXISTS #Products;
GO

CREATE TABLE #Products
(
ProductID    INTEGER PRIMARY KEY,
ProductName  VARCHAR(100) NOT NULL
);
GO

ALTER TABLE #Products ADD ComputedColumn AS (0/0);
GO

DROP TABLE IF EXISTS #Products;
GO