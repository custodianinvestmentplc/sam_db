CREATE PROCEDURE [dbo].[GetAllSalesTeam]
AS
BEGIN
	set nocount on;

	SELECT
		a.AGN_CODE AgentSystemCode,
		a.AGN_SHT_DESC BusinessCode,
		a.AGN_NAME FullName,
		a.AGN_POSITION SalesLevel
	FROM dbo.SALES_TEAM a
END

GO

