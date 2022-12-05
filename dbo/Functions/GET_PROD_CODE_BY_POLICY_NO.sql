CREATE FUNCTION [dbo].[GET_PROD_CODE_BY_POLICY_NO]
(
	@policyNumber varchar(50)
)
RETURNS VARCHAR(50)
AS
BEGIN
	declare @prod_code varchar(50);

	select
		@prod_code = a.PROD_CODE
	from dbo.TQ_POLICIES a
	where a.POLICY_NO = @policyNumber;

	RETURN @prod_code;
END

GO

