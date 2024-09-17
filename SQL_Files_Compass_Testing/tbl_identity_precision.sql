--identity column must have precision 18 or less
CREATE TABLE tbl_identity_precision 
(
id [numeric](20, 0) IDENTITY(1,1) NOT NULL
);
