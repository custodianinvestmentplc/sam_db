CREATE PROCEDURE [dbo].[GetAgentOrcHierarchyNodeList]
	@agent_business_code varchar(50),
	@scenario_id varchar(50)
AS
BEGIN
	set nocount on;
	
	declare @traditional_business_code varchar(50) = 'TRADITIONAL';
	declare @annuity_business_code varchar(50) = 'ANNUITY';

	SELECT
		a.AGN_SHT_DESC AgentBusinessCode,
		a.ORC_AGN_SHT_DESC OrcNodeBusinessCode,
		dbo.GetAgentName(a.ORC_AGN_SHT_DESC) OrcNodeFullName,
		a.HIERARCHY_TYPE OrcNodeType,
		a.APPLY_ORC_FLAG ApplyCommission,
		dbo.GetOrcHierarchyNodeRate(@scenario_id, @traditional_business_code, a.HIERARCHY_TYPE) ComRateTraditional,
		dbo.GetOrcHierarchyNodeRate(@scenario_id, @annuity_business_code, a.HIERARCHY_TYPE) ComRateAnnuity
	FROM dbo.AGENT_ORC_HIERARCHY a
	where a.AGN_SHT_DESC = @agent_business_code;
END

GO

