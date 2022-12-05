create procedure dbo.CPC_DATA_CAPTURE_FORM_TRAD_STEP_3 (
	@ref_nbr varchar(50),
	@content_type_code varchar(50)
)
AS
begin
	set nocount on;

	SELECT
		a.CPF_CPP_REF_NBR ReferenceNbr,
		a.CPF_PPCT_TYPE_CODE ContentTypeCode,
		a.MEANS_OF_IDENTIFICATION MeansOfIdentification,
		a.MEANS_OF_IDENTIFICATION_OTHERS MeansOfidentificationOthers,
		a.IDENTIFICATION_NBR IdentifiationNbr,
		a.COUNTRY_OF_ISSUE IdCountryOfIssue,
		a.COUNTRY_OF_ISSUE_OTHERS idCountryOfIssueOthers,
		a.ISSUING_AUTHORITY IdIssuingAuthrity,
		a.DATE_ISSUED IdIssueDate,
		a.DATE_EXPIRED IdExpiryDate,
		a.RESIDENTIAL_PERMIT_NBR ResidentPermitNbr
	FROM dbo.CPC_PROPOSAL_FORM_TRAD_IDENTITY a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;
end

GO

