USE test;
GO

DROP PROCEDURE IF EXISTS sp_alter_database;
GO

CREATE PROCEDURE sp_alter_database AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
'ALTER DATABASE' is not currently supported in Babelfish

*/----------------------------------------------------

ALTER DATABASE test SET RECOVERY FULL;
GO
