CREATE PROCEDURE [dbo].[EraseCalculatedCommissionTable]
AS
BEGIN
	set nocount on;

	truncate table dbo.COMS_COMPUTATION_OUTPUT;
	truncate table dbo.COMS_ERROR;
END

GO

