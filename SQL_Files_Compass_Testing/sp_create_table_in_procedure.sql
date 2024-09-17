CREATE PROCEDURE sp_create_table_in_procedure AS
BEGIN
CREATE TABLE MyPermanentTable (
ID      INT PRIMARY KEY,
myValue VARCHAR(100));
END
GO
