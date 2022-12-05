create procedure dbo.CPC_DATA_CAPTURE_FORM_TRAD_STEP_11 (
	@ref_nbr varchar(50),
	@content_type_code varchar(50)
)
AS
begin
	set nocount on;

	SELECT
		a.CPF_CPP_REF_NBR ReferenceNbr,
		a.CPF_PPCT_TYPE_CODE ContentTypeCode,
		a.HOSPITAL_NAME HospitalName,
		a.HOSPITAL_ADDRESS HospitalAddress,
		a.HEIGHT_IN_METERS HeightInMeters,
		a.WEIGHT_IN_KG WeightInKg
	FROM dbo.CPC_PROPOSAL_FORM_TRAD_MEDICAL_HISTORY a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;
end

GO

