CREATE FUNCTION [dbo].[GetOrcHierarchyNodeRate]
(
	@scenario_id varchar(50),
	@prod_type varchar(50),
	@orc_position varchar(50)
)
RETURNS FLOAT
AS
BEGIN
	declare @return_value float;

	select
		@return_value = a.ORC_RATE
	from dbo.ORC_SCENARIO_RATE a
	where a.SCENARIO_ID = @scenario_id
	and a.PRODUCT_TYPE = @prod_type
	and a.ORC_POSITION = @orc_position;

	if (@return_value is null)
	begin
		set @return_value = 0;
	end

	return @return_value;
END

GO

