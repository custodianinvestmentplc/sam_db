CREATE procedure dbo.CPC_PROPOSAL_FORM_ADD_MEDICAL_HISTORY (
	@caller varchar(150),
	@ref_nbr varchar(50),
	@content_type varchar(50),
	@hospital_name varchar(150),
	@hospital_address varchar(250),
	@height numeric(18,2),
	@weight numeric(18,2)
)
as
begin
	set nocount on;

	declare @rec_count int;

	select @rec_count = count(*)
	from dbo.CPC_PROPOSAL_FORM_TRAD_MEDICAL_HISTORY a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type;

	if (@rec_count = 1)
	begin
		update a set
			a.HOSPITAL_NAME = @hospital_name,
			a.HOSPITAL_ADDRESS = @hospital_address,
			a.HEIGHT_IN_METERS = @height,
			a.WEIGHT_IN_KG = @weight,
			a.LAST_MODIFIED_DATE = GETDATE(),
			a.LAST_MODIFIED_USER = @caller
		from dbo.CPC_PROPOSAL_FORM_TRAD_MEDICAL_HISTORY a
		where a.CPF_CPP_REF_NBR = @ref_nbr
		and a.CPF_PPCT_TYPE_CODE = @content_type;
	end

	if (@rec_count = 0)
	begin
		insert into dbo.CPC_PROPOSAL_FORM_TRAD_MEDICAL_HISTORY (
			CPF_CPP_REF_NBR,
			CPF_PPCT_TYPE_CODE,
			HOSPITAL_NAME,
			HOSPITAL_ADDRESS,
			HEIGHT_IN_METERS,
			WEIGHT_IN_KG,
			CREATE_DATE,
			CREATE_USER,
			LAST_MODIFIED_DATE,
			LAST_MODIFIED_USER
		)
		values (
			@ref_nbr,
			@content_type,
			@hospital_name,
			@hospital_address,
			@height,
			@weight,
			GETDATE(),
			@caller,
			GETDATE(),
			@caller
		);
	end
end

GO

