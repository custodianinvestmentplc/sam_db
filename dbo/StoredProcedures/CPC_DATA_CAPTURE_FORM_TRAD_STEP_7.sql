CREATE procedure dbo.CPC_DATA_CAPTURE_FORM_TRAD_STEP_7 (
	@ref_nbr varchar(50),
	@content_type_code varchar(50)
)
AS
begin
	set nocount on;

	SELECT
		CPF_CPP_REF_NBR ReferenceNbr,
		CPF_PPCT_TYPE_CODE ContentTypeCode,
		a.NOMINEE_NAME NomineeName,
		a.NOMINEE_DOB NomineeDob,
		a.RELATIONSHIP NomineeRelationship,
		a.NOMINEE_SUM_ASSURED SumAssured
	FROM dbo.CPC_PROPOSAL_FORM_TRAD_DIGITAL_PLAN_NOMINEES a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;
end

GO

