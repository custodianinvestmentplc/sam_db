create procedure dbo.CPC_PROPOSAL_FORM_ADD_OTHER_MEDICAL_INFO (
	@caller varchar(150),
	@data dbo.UDT_CPC_FORM_TRAD_OTHER_MEDICAL_INFO readonly
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
	from dbo.CPC_PROPOSAL_FORM_TRAD_OTHER_MEDICAL_INFO a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type;

	if (@rec_count = 1)
	begin
		update a set
			a.SKIN_DISORDER = b.SKIN_DISORDER,
			a.NIGHT_SWEATS = b.NIGHT_SWEATS,
			a.WEIGHT_LOSS = b.WEIGHT_LOSS,
			a.SWOLLEN_GLANDS = b.SWOLLEN_GLANDS,
			a.RECURRENT_DIARRHEA = b.RECURRENT_DIARRHEA,
			a.HEPATITIS_B = b.HEPATITIS_B,
			a.HIV_AIDS = b.HIV_AIDS,
			a.BLOOD_TRANSFUSION = b.BLOOD_TRANSFUSION,
			a.PAST_TIME_ACTIVITIES = b.PAST_TIME_ACTIVITIES,
			a.RESIDE_OUTSIDE_NIGERIA = b.RESIDE_OUTSIDE_NIGERIA,
			a.LAST_MODIFIED_DATE = GETDATE(),
			a.LAST_MODIFIED_USER = @caller
		from dbo.CPC_PROPOSAL_FORM_TRAD_OTHER_MEDICAL_INFO a
		inner join @data b on (
			b.CPF_CPP_REF_NBR = a.CPF_CPP_REF_NBR 
			and b.CPF_PPCT_TYPE_CODE = a.CPF_PPCT_TYPE_CODE
		);
	end

	if (@rec_count = 0)
	begin
		insert into dbo.CPC_PROPOSAL_FORM_TRAD_OTHER_MEDICAL_INFO (
			CPF_CPP_REF_NBR,
			CPF_PPCT_TYPE_CODE,
			SKIN_DISORDER,
			NIGHT_SWEATS,
			WEIGHT_LOSS,
			SWOLLEN_GLANDS,
			RECURRENT_DIARRHEA,
			HEPATITIS_B,
			HIV_AIDS,
			BLOOD_TRANSFUSION,
			PAST_TIME_ACTIVITIES,
			RESIDE_OUTSIDE_NIGERIA,
			CREATE_DATE,
			CREATE_USER,
			LAST_MODIFIED_DATE,
			LAST_MODIFIED_USER
		)
		select
			a.CPF_CPP_REF_NBR,
			a.CPF_PPCT_TYPE_CODE,
			a.SKIN_DISORDER,
			a.NIGHT_SWEATS,
			a.WEIGHT_LOSS,
			a.SWOLLEN_GLANDS,
			a.RECURRENT_DIARRHEA,
			a.HEPATITIS_B,
			a.HIV_AIDS,
			a.BLOOD_TRANSFUSION,
			a.PAST_TIME_ACTIVITIES,
			a.RESIDE_OUTSIDE_NIGERIA,
			GETDATE(),
			@caller,
			GETDATE(),
			@caller
		from @data a
	end
end

GO

