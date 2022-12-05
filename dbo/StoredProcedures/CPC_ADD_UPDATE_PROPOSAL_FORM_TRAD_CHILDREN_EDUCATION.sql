CREATE procedure dbo.CPC_ADD_UPDATE_PROPOSAL_FORM_TRAD_CHILDREN_EDUCATION (
	@caller varchar(150),
	@ref_nbr varchar(50),
	@content_code varchar(50),
	@school_fees_amt numeric(18,2),
	@benefit_pct numeric(5,2),
	@action_code int --1 = Applicable |2 = Not Applicable
)
as
begin
	set nocount on;

	declare @rec_count int;

	select @rec_count = count(*)
	from dbo.CPC_PROPOSAL_FORM_TRAD_CHILDREN_EDUCATION a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_code;

	if (@action_code = 2)
	begin
		if (@rec_count = 1)
		begin
			--Delete the existing record.
			delete
			from dbo.CPC_PROPOSAL_FORM_TRAD_CHILDREN_EDUCATION
			where CPF_CPP_REF_NBR = @ref_nbr
			and CPF_PPCT_TYPE_CODE = @content_code;
		end
	end
	if (@action_code = 1)
	begin
		if (@rec_count = 1)
		begin
			update a set
				a.CPF_CPP_REF_NBR = @ref_nbr,
				a.CPF_PPCT_TYPE_CODE = @content_code,
				a.SCHOOL_FEES_PER_TERM = @school_fees_amt,
				a.BENEFIT_PCT = @benefit_pct,
				a.LAST_MODIFIED_DATE = GETDATE(),
				a.LAST_MODIFIED_USER = @caller
			from dbo.CPC_PROPOSAL_FORM_TRAD_CHILDREN_EDUCATION a
			where a.CPF_CPP_REF_NBR = @ref_nbr
			and a.CPF_PPCT_TYPE_CODE = @content_code;
		end
		if (@rec_count = 0)
		begin
			insert into dbo.CPC_PROPOSAL_FORM_TRAD_CHILDREN_EDUCATION (
				CPF_CPP_REF_NBR,
				CPF_PPCT_TYPE_CODE,
				SCHOOL_FEES_PER_TERM,
				BENEFIT_PCT,
				CREATE_DATE,
				CREATE_USER,
				LAST_MODIFIED_DATE,
				LAST_MODIFIED_USER
			)
			values (
				@ref_nbr,
				@content_code,
				@school_fees_amt,
				@benefit_pct,
				GETDATE(),
				@caller,
				GETDATE(),
				@caller
			);
		end
	end
end

GO

