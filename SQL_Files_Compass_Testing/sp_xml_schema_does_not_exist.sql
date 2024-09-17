USE test;
GO

DROP PROCEDURE IF EXISTS sp_xml_schema_does_not_exist;
GO

CREATE PROCEDURE sp_xml_schema_does_not_exist AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
schema "test_data" does not exist

*/----------------------------------------------------

DROP TABLE IF EXISTS #SampleXmlTable;
GO

CREATE TABLE #SampleXmlTable
(
    ID INT PRIMARY KEY,
    Data XML
);

INSERT INTO #SampleXmlTable (ID, Data) VALUES
(1, '<Books>
        <Book>
            <Title>SQL Fundamentals</Title>
            <Author>John Doe</Author>
        </Book>
        <Book>
            <Title>Advanced SQL Queries</Title>
            <Author>Jane Smith</Author>
        </Book>
     </Books>'),

(2, '<Books>
        <Book>
            <Title>Learning XML</Title>
            <Author>Alice Johnson</Author>
        </Book>
     </Books>');

SELECT 
  ID, 
  Data.value('(/Books/Book[1]/Title)[1]', 'VARCHAR(100)') AS FirstBookTitle
FROM #SampleXmlTable;

SELECT 
  ID, 
  Data
FROM 
  #SampleXmlTable
WHERE 
  Data.exist('/Books/Book[Author="John Doe"]') = 1;
GO

----'XML NODES' is not currently supported in Babelfish
--SELECT 
--  ID, 
--  BookData.value('(Title)[1]', 'VARCHAR(100)') AS BookTitle
--FROM 
--  #SampleXmlTable
--CROSS APPLY 
--  Data.nodes('/Books/Book') AS Books(BookData);

DROP TABLE IF EXISTS #SampleXmlTable;
GO