CREATE PROCEDURE [dbo].[GetScenarioIdProducts]
	@scenario_id varchar(50)
AS
BEGIN
	set nocount on;

	SELECT distinct 
		a.SCENARIO_ID ScenarioId, 
		a.PRODUCT_TYPE ProductType
	FROM dbo.ORC_SCENARIO_RATE a
	where a.SCENARIO_ID = @scenario_id;
END

GO

