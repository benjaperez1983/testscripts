USE test;
GO

DROP PROCEDURE IF EXISTS sp_global_variables_system_functions;
GO

CREATE PROCEDURE sp_global_variables_system_functions AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
None

This script will compile but does not execute.
function <name> does not exist

*/----------------------------------------------------

SELECT 'System' AS MyFunctionType,  '@@DEF_SORTORDER_ID'  AS MyFunction, @@DEF_SORTORDER_ID AS MyValue, 'No Microsoft documentation provided. Same as SELECT SERVERPROPERTY(SqlSortOrder);' AS Description

SELECT 'System', '@@PACK_RECEIVED', @@PACK_RECEIVED, 'Returns the number of input packets read from the network by SQL Server since it was last started.'

SELECT 'Configuration' AS MyFunctionType, '@@DBTS' AS MyFunction, CAST(@@DBTS AS VARCHAR(255)) AS MyValue, 'This function returns the value of the current timestamp data type for the current database.' AS MyDescription

SELECT 'Configuration', '@@LANGID', CAST(@@LANGID AS VARCHAR(255)), 'Returns the local language identifier (ID) of the language that is currently being used.'

SELECT 'Configuration', '@@REMSERVER', CAST(@@REMSERVER AS VARCHAR(255)), 'Returns the name of the remote SQL Server database server as it appears in the login record.'

SELECT 'Statistical' AS MyFunctionType, '@@CONNECTIONS' AS MyFunction, @@CONNECTIONS AS MyValue, 'This function returns the number of attempted connections - both successful and unsuccessful - since SQL Server was last started.' AS MyDescription

SELECT 'Statistical', '@@CPU_BUSY', @@CPU_BUSY, 'This function returns the amount of time that SQL Server has spent in active operation since its latest start. @@CPU_BUSY returns a result measured in CPU time increments, or "ticks." This value is cumulative for all CPUs, so it may exceed the actual elapsed time. To convert to microseconds, multiply by @@TIMETICKS.'

SELECT 'Statistical', '@@IDLE', @@IDLE, 'Returns the time that SQL Server has been idle since it was last started. The result is in CPU time increments, or "ticks," and is cumulative for all CPUs, so it may exceed the actual elapsed time. Multiply by @@TIMETICKS to convert to microseconds.'

SELECT 'Statistical', '@@IO_BUSY', @@IO_BUSY, 'Returns the time that SQL Server has spent performing input and output operations since SQL Server was last started. The result is in CPU time increments ("ticks"), and is cumulative for all CPUs, so it may exceed the actual elapsed time. Multiply by @@TIMETICKS to convert to microseconds.'

SELECT 'Statistical', '@@PACK_SENT', @@PACK_SENT, 'Returns the number of output packets written to the network by SQL Server since it was last started.'

SELECT 'Statistical', '@@PACKET_ERRORS', @@PACKET_ERRORS, 'Returns the number of network packet errors that have occurred on SQL Server connections since SQL Server was last started.'

SELECT 'Statistical', '@@TIMETICKS', @@TIMETICKS, 'Returns the number of microseconds per tick.'

SELECT 'Statistical', '@@TOTAL_ERRORS', @@TOTAL_ERRORS, 'Returns the number of disk write errors encountered by SQL Server since SQL Server last started.'

SELECT 'Statistical', '@@TOTAL_READ', @@TOTAL_READ, 'Returns the number of disk reads, not cache reads, by SQL Server since SQL Server was last started.'

SELECT 'Statistical', '@@TOTAL_WRITE', @@TOTAL_WRITE, 'Returns the number of disk writes by SQL Server since SQL Server was last started.'
GO
