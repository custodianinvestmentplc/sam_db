create procedure dbo.cpc_fetch_proposal_pack_content_types
as
begin
	set nocount on;

	select
		a.PPCT_TYPE_CODE ProposalTypeCode,
		a.PPCT_SHT_DESC ProposalTypeShortDesc,
		PPCT_DESC ProposalTypeDescription,
		PPCT_CREATE_DATE CreateDate,
		PPCT_CREATE_USER CreateUser
	from dbo.CPC_PROPOSAL_PACK_CONTENT_TYPES a;
end

GO

