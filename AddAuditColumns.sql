USE Development;
GO

-- Author: Colin Haley
-- Create Date: 9/22/2015
-- Description: Add some Audit columns to  all new table creates in a specific database.
-- Written for SQL Server 2012

ALTER PROCEDURE AddAuditColumns
	@TableName VARCHAR(MAX)

AS
BEGIN
	SET NOCOUNT ON;
DECLARE @sql VARCHAR(MAX)
BEGIN
	SET @sql = 'ALTER TABLE ' + @TableName + 'ADD LastWriteTime smalldatetime NOT NULL DEFAULT GETDATE()'
	-- Change to NOW() for MySQL instead of SQLServer
	EXEC(@sql)

	SET @sql = 'ALTER TABLE ' + @TableName + 'ADD LastModifiedBy VARCHAR(60) NULL'
	-- For purposes of the demo i'll allow null values
	EXEC(@sql)
END
END