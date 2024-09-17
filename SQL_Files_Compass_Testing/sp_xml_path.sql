
USE test;
GO


CREATE PROCEDURE sp_xml_path AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
None

This script does not produce the same results as SQL Server

*/----------------------------------------------------

DROP TABLE IF EXISTS #DMLTable;
GO

CREATE TABLE #DMLTable
(
SequenceNumber  INTEGER PRIMARY KEY,
String          VARCHAR(100) NOT NULL
);
GO

INSERT INTO #DMLTable (SequenceNumber, String) VALUES
(1,'SELECT'),
(2,'Product,'),
(3,'UnitPrice,'),
(4,'EffectiveDate'),
(5,'FROM'),
(6,'Products'),
(7,'WHERE'),
(8,'UnitPrice'),
(9,'> 100');
GO

--Does not output the same results as SQL Server
--XML Path
SELECT  DISTINCT
        STUFF((
            SELECT  CAST(' ' AS VARCHAR(MAX)) + String
            FROM    #DMLTable U
            ORDER BY SequenceNumber
        FOR XML PATH('')), 1, 1, '') AS DML_String
FROM    #DMLTable;
GO

DROP TABLE IF EXISTS #DMLTable;
GO
