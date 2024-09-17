USE test;
GO

DROP TABLE IF EXISTS tbl_rowguidcol;
GO

-- syntax error near 'ROWGUIDCOL' at line 5 and character position 48
CREATE TABLE tbl_rowguidcol (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    GuidColumn UNIQUEIDENTIFIER DEFAULT NEWID() ROWGUIDCOL
);
GO