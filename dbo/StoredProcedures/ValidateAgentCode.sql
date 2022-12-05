CREATE PROCEDURE [dbo].[ValidateAgentCode]
	@agent_code varchar(50)
AS
BEGIN
	set nocount on;

	declare @cnt int = 0;
	declare @err varchar(200);
	declare @validation_test_name varchar(50) = 'AGENT_CODE_VALIDITY';

	select @cnt = count(*)
	from dbo.AgentCodes a
	where a.AGN_CODE = @agent_code

	if (@cnt = 0)
	begin
		set @err = 'Agent Code does not Exist in TQ';
		exec dbo.SaveValidationResult @agent_code, @validation_test_name, @err;
	end

	if (@cnt > 0)
	begin
		set @err = 'Multiple records exists in TQ for Agent Code';
		exec dbo.SaveValidationResult @agent_code, @validation_test_name, @err;
	end
END

GO

