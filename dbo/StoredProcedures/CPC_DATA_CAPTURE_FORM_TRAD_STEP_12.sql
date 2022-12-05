create procedure dbo.CPC_DATA_CAPTURE_FORM_TRAD_STEP_12 (
	@ref_nbr varchar(50),
	@content_type_code varchar(50)
)
AS
begin
	set nocount on;

	SELECT
		a.CPF_CPP_REF_NBR ReferenceNbr,
		a.CPF_PPCT_TYPE_CODE ContentTypeCode,
		a.SICK_OR_MEDICATION SickOrOnMedication,
		a.MEDICATION_DETAILS MedicationDetails,
		a.IS_PREGNANT IsPregnant,
		a.EXPECTED_DELIVERY_MONTH ExpectedDeliveryMonth,
		a.SMOKED Smoked,
		a.TUBERCULOSIS Tuberculosis,
		a.EPILEPSY Epilepsy,
		a.HEART_DISEASE HeartDisease,
		a.INSANITY Insanity,
		a.DIABETES Diabetes,
		a.HYPERTENSION Hypertension,
		a.OTHER_ILLNESS OtherIllness,
		a.OTHER_ILLNESS_DETAILS OtherIllnessDetails
	FROM dbo.CPC_PROPOSAL_FORM_TRAD_MISC a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;
end

GO

