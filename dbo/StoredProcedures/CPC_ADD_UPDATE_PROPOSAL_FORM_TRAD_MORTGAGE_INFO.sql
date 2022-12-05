CREATE procedure dbo.CPC_ADD_UPDATE_PROPOSAL_FORM_TRAD_MORTGAGE_INFO(
	@caller varchar(150),
	@ref_nbr varchar(50),
	@content_code varchar(50),
	@mortgage_name varchar(50),
	@mortgage_address varchar(150),
	@interst_rate varchar(50),
	@action_code int --1 = Applicable |2 = Not Applicable
)
as
begin
	set nocount on;

	declare @rec_count int;

	select @rec_count = count(*)
	from dbo.CPC_PROPOSAL_FORM_TRAD_MORTGAGE_INFO a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_code;

	if (@action_code = 2)
	begin
		if (@rec_count = 1)
		begin
			--Delete the existing record.
			delete
			from dbo.CPC_PROPOSAL_FORM_TRAD_MORTGAGE_INFO
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
				a.NAME_OF_INSTITUTION = @mortgage_name,
				a.ADDRESS_OF_INSTITUTION = @mortgage_address,
				a.INTEREST_RATE = convert(NUMERIC(5,2), @interst_rate),
				a.LAST_MODIFIED_DATE = GETDATE(),
				a.LAST_MODIFIED_USER = @caller
			from dbo.CPC_PROPOSAL_FORM_TRAD_MORTGAGE_INFO a
			where a.CPF_CPP_REF_NBR = @ref_nbr
			and a.CPF_PPCT_TYPE_CODE = @content_code;
		end
		if (@rec_count = 0)
		begin
			insert into dbo.CPC_PROPOSAL_FORM_TRAD_MORTGAGE_INFO (
				CPF_CPP_REF_NBR,
				CPF_PPCT_TYPE_CODE,
				NAME_OF_INSTITUTION,
				ADDRESS_OF_INSTITUTION,
				INTEREST_RATE,
				CREATE_DATE,
				CREATE_USER,
				LAST_MODIFIED_DATE,
				LAST_MODIFIED_USER
			)
			values (
				@ref_nbr,
				@content_code,
				@mortgage_name,
				@mortgage_address,
				convert(numeric(5,2), @interst_rate),
				GETDATE(),
				@caller,
				GETDATE(),
				@caller
			);
		end
	end
end

GO

