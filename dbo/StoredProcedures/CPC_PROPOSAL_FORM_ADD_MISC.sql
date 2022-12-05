create procedure dbo.CPC_PROPOSAL_FORM_ADD_MISC (
	@caller varchar(150),
	@data dbo.UDT_CPC_FORM_TRAD_MISC readonly
)
as
begin
	set nocount on;

	declare @ref_nbr varchar(50);
	declare @content_type varchar(50);
	declare @rec_count int;

	select top (1)
		@ref_nbr = a.CPF_CPP_REF_NBR,
		@content_type = a.CPF_PPCT_TYPE_CODE
	from @data a;

	select @rec_count = count(*)
	from dbo.CPC_PROPOSAL_FORM_TRAD_MISC a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type;

	if (@rec_count = 1)
	begin
		update a set
			a.SICK_OR_MEDICATION = b.SICK_OR_MEDICATION,
			a.MEDICATION_DETAILS = b.MEDICATION_DETAILS,
			a.IS_PREGNANT = b.IS_PREGNANT,
			a.EXPECTED_DELIVERY_MONTH = b.EXPECTED_DELIVERY_MONTH,
			a.SMOKED = b.SMOKED,
			a.TUBERCULOSIS = b.TUBERCULOSIS,
			a.EPILEPSY = b.EPILEPSY,
			a.HEART_DISEASE = b.HEART_DISEASE,
			a.INSANITY = b.INSANITY,
			a.DIABETES = b.DIABETES,
			a.HYPERTENSION = b.HYPERTENSION,
			a.OTHER_ILLNESS = b.OTHER_ILLNESS,
			a.OTHER_ILLNESS_DETAILS = b.OTHER_ILLNESS_DETAILS,
			a.LAST_MODIFIED_DATE = GETDATE(),
			a.LAST_MODIFIED_USER = @caller
		from dbo.CPC_PROPOSAL_FORM_TRAD_MISC a
		inner join @data b on (
			b.CPF_CPP_REF_NBR = a.CPF_CPP_REF_NBR 
			and b.CPF_PPCT_TYPE_CODE = a.CPF_PPCT_TYPE_CODE
		);
	end

	if (@rec_count = 0)
	begin
		insert into dbo.CPC_PROPOSAL_FORM_TRAD_MISC (
			CPF_CPP_REF_NBR,
			CPF_PPCT_TYPE_CODE,
			SICK_OR_MEDICATION,
			MEDICATION_DETAILS,
			IS_PREGNANT,
			EXPECTED_DELIVERY_MONTH,
			SMOKED,
			TUBERCULOSIS,
			EPILEPSY,
			HEART_DISEASE,
			INSANITY,
			DIABETES,
			HYPERTENSION,
			OTHER_ILLNESS,
			OTHER_ILLNESS_DETAILS,
			CREATE_DATE,
			CREATE_USER,
			LAST_MODIFIED_DATE,
			LAST_MODIFIED_USER
		)
		select
			a.CPF_CPP_REF_NBR,
			a.CPF_PPCT_TYPE_CODE,
			a.SICK_OR_MEDICATION,
			a.MEDICATION_DETAILS,
			a.IS_PREGNANT,
			a.EXPECTED_DELIVERY_MONTH,
			a.SMOKED,
			a.TUBERCULOSIS,
			a.EPILEPSY,
			a.HEART_DISEASE,
			a.INSANITY,
			a.DIABETES,
			a.HYPERTENSION,
			a.OTHER_ILLNESS,
			a.OTHER_ILLNESS_DETAILS,
			GETDATE(),
			@caller,
			GETDATE(),
			@caller
		from @data a
	end
end

GO

