create procedure dbo.cpc_get_proposal_pack_content_record (
	@proposal_ref_nbr varchar(50),
	@row_id numeric(25,0)
)
as
begin
	set nocount on;

	select
		A.ROW_ID ProposalPackContentRowId,
		a.PPC_CPP_REF_NBR ProposalPackRefNbr,
		a.PPC_PPCT_TYPE_CODE ContentTypeCode,
		b.PPCT_SHT_DESC ContentTypeShortDesc,
		b.PPCT_DESC ContentTypeDescription,
		a.PPC_CREATE_DATE CreateDate,
		a.PPC_CREATE_USER CreateUser,
		a.PPC_STATUS ContentStatus
	from dbo.CPC_PROPOSAL_PACK_CONTENTS a
	join dbo.CPC_PROPOSAL_PACK_CONTENT_TYPES b on b.PPCT_TYPE_CODE = a.PPC_PPCT_TYPE_CODE
	where a.PPC_CPP_REF_NBR = @proposal_ref_nbr
	and a.ROW_ID = @row_id
end

GO

