CREATE procedure dbo.CPC_PROPOSAL_FORM_SAVE_DRAFT_BENEFICIARY (
	@ref_nbr varchar(50),
	@content_type_code varchar(50),
	@caller varchar(150)
)
as
begin
	set nocount on;
	
	declare @total_proportion numeric(5,2);

	select @total_proportion = convert(int, ROUND(sum(a.PROPOTION_PCT),0))
	FROM dbo.CPC_PROPOSAL_FORM_TRAD_BENEFICIARY a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code
	and a.RECORD_STATUS = 'DRAFT'

	if (@total_proportion = 1)
	begin
		update a set 
			a.RECORD_STATUS = 'ACTIVE',
			a.LAST_MODIFIED_USER = @caller,
			a.LAST_MODIFIED_DATE = GETDATE()
		from dbo.CPC_PROPOSAL_FORM_TRAD_BENEFICIARY a
		where a.CPF_CPP_REF_NBR = @ref_nbr
		and a.CPF_PPCT_TYPE_CODE = @content_type_code
		and a.RECORD_STATUS = 'DRAFT';
	end
end

GO

