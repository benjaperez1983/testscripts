USE test;
GO

DROP PROCEDURE IF EXISTS sp_dm_missing_index_groups;
GO

CREATE PROCEDURE sp_dm_missing_index_groups AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
None

This script will compile but does not execute.
relation "sys.dm_db_missing_index_groups" does not exist

*/----------------------------------------------------

SELECT *
FROM    sys.dm_db_missing_index_groups AS mig INNER JOIN
        sys.dm_db_missing_index_group_stats AS migs ON migs.group_handle = mig.index_group_handle INNER JOIN
        sys.dm_db_missing_index_details AS mid ON mig.index_handle = mid.index_handle;
GO

EXECUTE sp_dm_missing_index_groups;
GO