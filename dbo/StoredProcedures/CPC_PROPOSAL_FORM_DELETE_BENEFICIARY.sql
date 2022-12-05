CREATE procedure dbo.CPC_PROPOSAL_FORM_DELETE_BENEFICIARY (
	@ref_nbr varchar(50),
	@content_type_code varchar(50),
	@beneficiary_row_id numeric(25,0)
)
as
begin
	set nocount on;

	declare @rec_count int;

	delete
	from dbo.CPC_PROPOSAL_FORM_TRAD_BENEFICIARY
	where CPF_CPP_REF_NBR = @ref_nbr
	and CPF_PPCT_TYPE_CODE = @content_type_code
	and ROW_ID = @beneficiary_row_id;

	select @rec_count = count(*)
	from dbo.CPC_PROPOSAL_FORM_TRAD_BENEFICIARY a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;

	if (@rec_count > 0)
	begin
		update a set
			a.RECORD_STATUS = 'DRAFT',
			a.LAST_MODIFIED_DATE = GETDATE(),
			a.LAST_MODIFIED_USER = 'SYSTEM'
		from dbo.CPC_PROPOSAL_FORM_TRAD_BENEFICIARY a
		where a.CPF_CPP_REF_NBR = @ref_nbr
		and a.CPF_PPCT_TYPE_CODE = @content_type_code;
	end;
end

GO

