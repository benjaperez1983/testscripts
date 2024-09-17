USE test;
GO

DROP PROCEDURE IF EXISTS sp_foreign_key_syntax_error;
GO

CREATE PROCEDURE sp_foreign_key_syntax_error AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
None

This script will compile but does not execute.
syntax error at or near "FOREIGN"

*/----------------------------------------------------

DROP TABLE IF EXISTS Child;
DROP TABLE IF EXISTS Parent;

CREATE TABLE Parent
(
ParentID INTEGER UNIQUE NOT NULL --Added the NOT NULL for Babelfish to run without error
);

--Babelfish error
--syntax error at or near "FOREIGN"
CREATE TABLE Child
(
ChildID INTEGER IDENTITY(1,1),
ParentID INTEGER FOREIGN KEY REFERENCES Parent (ParentID) --Removed the FOREIGN KEY REFERENCES for Babelfish to run without error
);
GO

EXECUTE sp_foreign_key_syntax_error;
