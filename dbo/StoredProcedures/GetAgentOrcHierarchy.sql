CREATE PROCEDURE [dbo].[GetAgentOrcHierarchy]
	@agent_business_code varchar(50)
AS
BEGIN
	set nocount on;

	SELECT
		a.AGN_SHT_DESC AgentBusinessCode,
		a.ORC_AGN_SHT_DESC OrcNodeBusinessCode,
		a.HIERARCHY_TYPE OrcNodeType,
		a.APPLY_ORC_FLAG ApplyCommission
	FROM dbo.AGENT_ORC_HIERARCHY a
	where a.AGN_SHT_DESC = @agent_business_code;
END

GO

