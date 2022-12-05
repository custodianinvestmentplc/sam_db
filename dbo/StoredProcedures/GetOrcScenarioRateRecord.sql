CREATE PROCEDURE [dbo].[GetOrcScenarioRateRecord]
	@scenario_id varchar(50),
	@prod_type varchar(50),
	@orc_position varchar(50)
AS
BEGIN
	set nocount on;

	select
		a.SCENARIO_ID ScenarioId,
		a.PRODUCT_TYPE ProductType,
		a.ORC_POSITION OrcPositionCode,
		a.ORC_RATE OrcRate
	from dbo.ORC_SCENARIO_RATE a
	where a.SCENARIO_ID = @scenario_id
	and a.PRODUCT_TYPE = @prod_type
	and a.ORC_POSITION = @orc_position;
END

GO

