CREATE PROCEDURE [dbo].[ValidateAgentCodeStatus]
	@agent_code varchar(50)
AS
BEGIN
	set nocount on;

	declare @cnt int = 0;
	declare @err varchar(200);
	declare @validation_test_name varchar(50) = 'AGENT_STATUS';

	select @cnt = count(*)
	from dbo.AgentCodes a
	where a.AGN_CODE = @agent_code
	and a.AGN_STATUS <> 'ACTIVE'

	if (@cnt > 0)
	begin
		set @err = 'The Agent Code is INACTIVE';
		exec dbo.SaveValidationResult @agent_code, @validation_test_name, @err;
	end
END

GO

