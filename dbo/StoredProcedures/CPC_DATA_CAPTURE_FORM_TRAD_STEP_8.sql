CREATE procedure dbo.CPC_DATA_CAPTURE_FORM_TRAD_STEP_8 (
	@ref_nbr varchar(50),
	@content_type_code varchar(50)
)
AS
begin
	set nocount on;

	SELECT
		CPF_CPP_REF_NBR ReferenceNbr,
		CPF_PPCT_TYPE_CODE ContentTypeCode,
		BENEFICIARY_NAME BeneficiaryName,
		BENEFICIARY_DOB BeneficiaryDob,
		BENEFICIARY_RELATIONSHIP BeneficiaryRelationship,
		PROPOTION_PCT BeneficiaryProportionPct,
		ROW_ID RecordRowId
	FROM dbo.CPC_PROPOSAL_FORM_TRAD_BENEFICIARY a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;
end

GO

