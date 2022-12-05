CREATE FUNCTION [dbo].[GetAgentName]
(
	@agent_business_code varchar(50)
)
RETURNS varchar(150)
AS
BEGIN
	declare @return_value varchar(150);

	select top (1) 
		@return_value = b.AGN_NAME 
	from dbo.SALES_TEAM b 
	where b.AGN_SHT_DESC = @agent_business_code;

	return @return_value;
END

GO

