USE test;
GO

CREATE PROCEDURE sp_not_null_in_alter_table_alter_column AS


/*----------------------------------------------------
SQL Server Message:
Commands completed successfully.

Babelfish Error Message:
'NOT NULL in ALTER TABLE ALTER COLUMN' is not currently supported in Babelfish

*/----------------------------------------------------

DROP TABLE IF EXISTS #EmployeePayRecords;


CREATE TABLE #EmployeePayRecords
(
EmployeeID  INTEGER,
FiscalYear  INTEGER,
StartDate   DATE,
EndDate     DATE,
PayRate     MONEY
);


--NOT NULL
ALTER TABLE #EmployeePayRecords ALTER COLUMN EmployeeID INTEGER NOT NULL;
ALTER TABLE #EmployeePayRecords ALTER COLUMN FiscalYear INTEGER NOT NULL;
ALTER TABLE #EmployeePayRecords ALTER COLUMN StartDate DATE NOT NULL;
ALTER TABLE #EmployeePayRecords ALTER COLUMN EndDate DATE NOT NULL;
ALTER TABLE #EmployeePayRecords ALTER COLUMN PayRate MONEY NOT NULL;


--PRIMARY KEY
ALTER TABLE #EmployeePayRecords ADD CONSTRAINT PK_FiscalYearCalendar
                                    PRIMARY KEY (EmployeeID,FiscalYear);
--CHECK CONSTRAINTS
ALTER TABLE #EmployeePayRecords ADD CONSTRAINT Check_Year_StartDate
                                    CHECK (FiscalYear = DATEPART(YYYY,StartDate));
ALTER TABLE #EmployeePayRecords ADD CONSTRAINT Check_Month_StartDate
                                    CHECK (DATEPART(MM,StartDate) = 01);
ALTER TABLE #EmployeePayRecords ADD CONSTRAINT Check_Day_StartDate
                                    CHECK (DATEPART(DD,StartDate) = 01);
ALTER TABLE #EmployeePayRecords ADD CONSTRAINT Check_Year_EndDate
                                    CHECK (FiscalYear = DATEPART(YYYY,EndDate));
ALTER TABLE #EmployeePayRecords ADD CONSTRAINT Check_Month_EndDate
                                    CHECK (DATEPART(MM,EndDate) = 12);
ALTER TABLE #EmployeePayRecords ADD CONSTRAINT Check_Day_EndDate
                                    CHECK (DATEPART(DD,EndDate) = 31);
ALTER TABLE #EmployeePayRecords ADD CONSTRAINT Check_Payrate
                                    CHECK (PayRate > 0);

