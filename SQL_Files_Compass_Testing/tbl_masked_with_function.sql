USE test;
GO

--'MASKED' is not currently supported in Babelfish
CREATE TABLE tbl_masked_with_function (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(255) MASKED WITH (FUNCTION = 'email()') -- Masked column
);
GO
