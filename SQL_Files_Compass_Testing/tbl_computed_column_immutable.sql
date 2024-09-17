USE test;
GO

--generation expression is not immutable
CREATE TABLE tbl_computed_column_immutable
(
[Name]        VARCHAR(100) NOT NULL,
LineNumber    TINYINT NOT NULL,
RelationCode  AS (CONVERT(VARCHAR(50),CASE WHEN [Name] = '' AND LineNumber=(0) THEN NULL ELSE [Name] + CONVERT(VARCHAR(5),LineNumber,0) END,0))
);
GO
