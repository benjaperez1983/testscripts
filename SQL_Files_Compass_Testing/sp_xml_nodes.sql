USE test;
GO

DROP PROCEDURE IF EXISTS sp_xml_nodes;
GO

CREATE PROCEDURE sp_xml_nodes AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
'XML NODES' is not currently supported in Babelfish

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


--'XML NODES' is not currently supported in Babelfish
SELECT 
  ID, 
  BookData.value('(Title)[1]', 'VARCHAR(100)') AS BookTitle
FROM 
  #SampleXmlTable
CROSS APPLY 
  Data.nodes('/Books/Book') AS Books(BookData);

DROP TABLE IF EXISTS #SampleXmlTable;
GO