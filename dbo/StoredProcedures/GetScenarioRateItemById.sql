CREATE PROCEDURE [dbo].[GetScenarioRateItemById]
	@scenario_id varchar(50)
AS
BEGIN
	set nocount on;

	SELECT
		a.SCENARIO_ID ScenarioId,
		a.PRODUCT_TYPE ProductType,
		a.ORC_POSITION OrcPosition,
		a.ORC_RATE OrcRate
	FROM dbo.ORC_SCENARIO_RATE a
	where a.SCENARIO_ID = @scenario_id;
END

GO

