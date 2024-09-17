USE test
GO

DROP PROCEDURE IF EXISTS sp_is_distinct_from;
GO

CREATE PROCEDURE sp_is_distinct_from AS

/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
syntax error near 'WHERE' at line 46 and character position 0

*/----------------------------------------------------


DROP TABLE IF EXISTS #TableA;
DROP TABLE IF EXISTS #TableB;

CREATE TABLE #TableA
(
ID          INTEGER,
Fruit       VARCHAR(255),
Quantity    INTEGER
);

CREATE TABLE #TableB
(
ID          INTEGER,
Fruit       VARCHAR(255),
Quantity    INTEGER
);

INSERT INTO #TableA VALUES(1,'Apple',17);
INSERT INTO #TableA VALUES(2,'Peach',20);
INSERT INTO #TableA VALUES(3,'Mango',11);
INSERT INTO #TableA VALUES(4,'Mango',15);
INSERT INTO #TableA VALUES(5,NULL,5);
INSERT INTO #TableA VALUES(6,NULL,3);

INSERT INTO #TableB VALUES(1,'Apple',17);
INSERT INTO #TableB VALUES(2,'Peach',25);
INSERT INTO #TableB VALUES(3,'Kiwi',20);
INSERT INTO #TableB VALUES(4,NULL,NULL);

SELECT  *
FROM    #TableA a,
        #TableB b
WHERE   a.Fruit IS DISTINCT FROM b.Fruit;  --Babelfish error
GO
