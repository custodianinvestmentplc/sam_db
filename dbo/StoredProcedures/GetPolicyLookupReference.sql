CREATE PROCEDURE [dbo].[GetPolicyLookupReference]
	@policy_nbr varchar(50)
AS
BEGIN
	set nocount on;
	
	select
		a.AGN_CODE AgentCode,
		a.POLICY_NO PolicyNumber,
		a.AGENT_SHT_DESC AgentBusinessCode,
		a.PROD_CODE ProductCode,
		a.POLICY_STATUS PolicyStatus
	from dbo.TQ_POLICIES a
	where a.POLICY_NO = @policy_nbr;

END

GO

