CREATE PROCEDURE [dbo].[GetOrcScenarios]
AS
BEGIN
	set nocount on;

	select
		a.SCENARIO_ID ScenarioId,
		a.SCENARIO_DESC ScenarioDescription
	from dbo.ORC_SCENARIOS a
END

GO

