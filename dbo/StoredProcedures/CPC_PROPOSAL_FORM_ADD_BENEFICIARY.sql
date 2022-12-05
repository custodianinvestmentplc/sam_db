CREATE procedure dbo.CPC_PROPOSAL_FORM_ADD_BENEFICIARY (
	@caller varchar(150),
	@ref_nbr varchar(50),
	@content_type_code varchar(50),
	@beneficiary_name varchar(150),
	@dob varchar(50),
	@relation varchar(50),
	@proportion_pct numeric(5,2),
	@new_beneficiary_id numeric(25,0) output
)
as
begin
	set nocount on;

	declare @tbl table (new_id numeric(25,0));

	insert into dbo.CPC_PROPOSAL_FORM_TRAD_BENEFICIARY (
		CPF_CPP_REF_NBR,
		CPF_PPCT_TYPE_CODE,
		BENEFICIARY_NAME,
		BENEFICIARY_DOB,
		BENEFICIARY_RELATIONSHIP,
		PROPOTION_PCT,
		CREATE_DATE,
		CREATE_USER,
		LAST_MODIFIED_DATE,
		LAST_MODIFIED_USER,
		RECORD_STATUS
	)
	OUTPUT inserted.ROW_ID into @tbl(new_id)
	values (
		@ref_nbr,
		@content_type_code,
		@beneficiary_name,
		cast(@dob as date),
		@relation,
		@proportion_pct,
		GETDATE(),
		@caller,
		GETDATE(),
		@caller,
		'DRAFT'
	);

	select @new_beneficiary_id = a.new_id
	from @tbl a;
end

GO

