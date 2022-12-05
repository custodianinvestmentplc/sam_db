CREATE procedure dbo.CPC_ADD_UPDATE_PROPOSAL_FORM_TRAD_DIGITAL_PLAN (
	@caller varchar(150),
	@ref_nbr varchar(50),
	@content_type_code varchar(50),
	@data dbo.UDT_CPC_FORM_TRAD_DIGITAL_PLAN readonly,
	@action_code int --1 = Applicable |2 = Not Applicable
)
as
begin
	set nocount on;

	declare @rec_count int;

	select @rec_count = count(*)
	from dbo.CPC_PROPOSAL_FORM_TRAD_DIGITAL_PLAN_NOMINEES a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;

	if (@action_code = 2)
	begin
		if (@rec_count > 0)
		begin
			delete
			from dbo.CPC_PROPOSAL_FORM_TRAD_DIGITAL_PLAN_NOMINEES
			where CPF_CPP_REF_NBR = @ref_nbr
			and CPF_PPCT_TYPE_CODE = @content_type_code;
		end
	end
	if (@action_code = 1)
	begin
		delete
		from dbo.CPC_PROPOSAL_FORM_TRAD_DIGITAL_PLAN_NOMINEES
		where CPF_CPP_REF_NBR = @ref_nbr
		and CPF_PPCT_TYPE_CODE = @content_type_code;		

		insert into dbo.CPC_PROPOSAL_FORM_TRAD_DIGITAL_PLAN_NOMINEES (
			CPF_CPP_REF_NBR,
			CPF_PPCT_TYPE_CODE,
			NOMINEE_NAME,
			NOMINEE_DOB,
			RELATIONSHIP,
			NOMINEE_SUM_ASSURED,
			CREATE_DATE,
			CREATE_USER,
			LAST_MODIFIED_DATE,
			LAST_MODIFIED_USER
		)
		select
			a.CPF_CPP_REF_NBR,
			a.CPF_PPCT_TYPE_CODE,
			a.NOMINEE_NAME,
			cast(a.NOMINEE_DOB as date),
			a.RELATIONSHIP,
			a.NOMINEE_SUM_ASSURED,
			GETDATE(),
			@caller,
			GETDATE(),
			@caller
		from @data a
	end
end

GO

