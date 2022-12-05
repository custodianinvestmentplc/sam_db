create procedure dbo.cpc_get_proposal_pack_by_ref_nbr (
	@ref_nbr varchar(50)
)
as
begin
	set nocount on;

	select
		a.ROW_ID TableRowId,
		a.REF_NBR ReferenceNumber,
		a.TITLE Title,
		a.LOCAL_SYS_BRANCH_CODE InitiatingBranchCode,
		a.AGENT_SHT_DESC InitatingAgentCode,
		a.CREATE_DATE CreateDate,
		a.CREATE_USER CreateUserEmail,
		b.BRANCH_NAME InitiatingBranchName,
		c.AGN_NAME InitiatingAgentName,
		d.DISPLAY_NAME CreateUserName
	from dbo.CPC_PROPOSAL_PACKS a
	join dbo.CPC_BRANCHES b on a.LOCAL_SYS_BRANCH_CODE = b.LOCAL_SYSTEM_CODE
	join dbo.SALES_TEAM c on a.AGENT_SHT_DESC = c.AGN_SHT_DESC
	join dbo.USER_REGISTER d on a.CREATE_USER = d.USER_EMAIL
	where a.REF_NBR = @ref_nbr;
end

GO

