create procedure dbo.CPC_DATA_CAPTURE_FORM_TRAD_STEP_13 (
	@ref_nbr varchar(50),
	@content_type_code varchar(50)
)
AS
begin
	set nocount on;

	SELECT
		a.CPF_CPP_REF_NBR ReferenceNbr,
		a.CPF_PPCT_TYPE_CODE ContentTypeCode,
		a.SKIN_DISORDER SkinDisorder,
		a.NIGHT_SWEATS NightSweats,
		a.WEIGHT_LOSS WeightLoss,
		a.SWOLLEN_GLANDS SwollenGlands,
		a.RECURRENT_DIARRHEA RecurrentDiarrhea,
		a.HEPATITIS_B HepatitisB,
		a.HIV_AIDS HivAids,
		a.BLOOD_TRANSFUSION BloodTransfusion,
		a.PAST_TIME_ACTIVITIES PastTimeActivities,
		a.RESIDE_OUTSIDE_NIGERIA ResideOutsideNigeria
	FROM dbo.CPC_PROPOSAL_FORM_TRAD_OTHER_MEDICAL_INFO a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;
end

GO

