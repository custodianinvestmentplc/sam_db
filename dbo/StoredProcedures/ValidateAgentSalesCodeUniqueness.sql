CREATE PROCEDURE [dbo].[ValidateAgentSalesCodeUniqueness]
	@agent_code varchar(50)
AS
BEGIN
	set nocount on;

	declare @cnt int = 0;
	declare @err varchar(200);
	declare @validation_test_name varchar(50) = 'AGENT_SALES_CODE_UNIQUENESS';

	select @cnt = count(*)
	from dbo.SALES_TEAM a
	where exists (
		select 1
		from dbo.AgentCodes b
		where b.AGN_SHT_DESC = a.AGN_SHT_DESC
		and b.AGN_CODE = @agent_code
	);

	if (@cnt > 1)
	begin
		set @err = 'Agent Code linked to multiple Sales Team';
		exec dbo.SaveValidationResult @agent_code, @validation_test_name, @err;
	end
END

GO

