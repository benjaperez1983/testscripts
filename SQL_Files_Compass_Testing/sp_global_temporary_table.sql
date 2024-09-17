USE test;
GO

DROP PROCEDURE IF EXISTS sp_global_temporary_table;
GO

CREATE PROCEDURE sp_global_temporary_table AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
'GLOBAL TEMPORARY TABLE' is not currently supported in Babelfish

*/----------------------------------------------------

DROP TABLE IF EXISTS ##GlobalTemporaryTable;

CREATE TABLE ##GlobalTemporaryTable
(
myColumnName  VARCHAR(100)
);

DROP TABLE IF EXISTS ##GlobalTemporaryTable;
GO