create procedure dbo.CPC_DATA_CAPTURE_FORM_TRAD_STEP_6 (
	@ref_nbr varchar(50),
	@content_type_code varchar(50)
)
AS
begin
	set nocount on;

	SELECT
		CPF_CPP_REF_NBR ReferenceNbr,
		CPF_PPCT_TYPE_CODE ContentTypeCode,
		SCHOOL_FEES_PER_TERM SchoolFeesAmount,
		BENEFIT_PCT BenefitPercent
	FROM dbo.CPC_PROPOSAL_FORM_TRAD_CHILDREN_EDUCATION a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;
end

GO

