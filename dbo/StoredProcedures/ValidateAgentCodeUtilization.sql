CREATE PROCEDURE [dbo].[ValidateAgentCodeUtilization]
	@agent_code varchar(50)
AS
BEGIN
	set nocount on;

	declare @cnt int = 0;
	declare @err varchar(200);
	declare @validation_test_name varchar(50) = 'AGENT_CODE_UTILIZATION';

	select @cnt = count(*)
	from dbo.AgentCodes a
	where a.AGN_CODE = @agent_code
	and exists (
		select 1
		from dbo.SALES_TEAM b
		where b.AGN_SHT_DESC = a.AGN_SHT_DESC
	);

	if (@cnt = 0)
	begin
		set @err = 'Agent Code not found in Sales Team Table';
		exec dbo.SaveValidationResult @agent_code, @validation_test_name, @err;
	end
END

GO

