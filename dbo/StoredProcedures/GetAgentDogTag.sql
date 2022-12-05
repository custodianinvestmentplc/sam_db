CREATE PROCEDURE [dbo].[GetAgentDogTag]
	@agn_sht_desc varchar(50)
AS
BEGIN
	set nocount on;

	select
		a.AGN_CODE InternalCode,
		a.AGN_SHT_DESC BusinessCode,
		a.AGN_NAME TagLabel,
		a.AGN_STATUS TagStatus,
		b.AGN_POSITION AgentPosition,
		c.SALES_POSITION_MAP_CODE AgentPositionCode,
		d.SCENARIO_ID AgentOrcScenarioId,
		(select top 1 s.SCENARIO_DESC from dbo.ORC_SCENARIOS s where s.SCENARIO_ID = d.scenario_id) ScenarioDesc
	from dbo.AgentCodes a
	left outer join dbo.SALES_TEAM b on b.AGN_SHT_DESC = a.AGN_SHT_DESC
	left outer join dbo.SALES_TEAM_POSITION_MAP c on c.AGENT_POSITION = b.AGN_POSITION
	left outer join dbo.AGENT_ORC_SCENARIO d on d.AGN_SHT_DESC = a.AGN_SHT_DESC
	where a.AGN_SHT_DESC = @agn_sht_desc;
END

GO

