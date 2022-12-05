CREATE FUNCTION [dbo].[GET_AGN_CODE_BY_POLICY_NO] (
	@policyNumber varchar(50)
)
RETURNS VARCHAR(50)
AS
BEGIN
	declare @agent_code varchar(50);

	select
		@agent_code = a.AGN_CODE
	from dbo.TQ_POLICIES a
	where a.POLICY_NO = @policyNumber;

	RETURN @agent_code;
END

GO

