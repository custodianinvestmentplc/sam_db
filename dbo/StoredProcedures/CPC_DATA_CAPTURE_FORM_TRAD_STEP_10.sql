create procedure dbo.CPC_DATA_CAPTURE_FORM_TRAD_STEP_10 (
	@ref_nbr varchar(50),
	@content_type_code varchar(50)
)
AS
begin
	set nocount on;

	SELECT
		a.CPF_CPP_REF_NBR ReferenceNbr,
		a.CPF_PPCT_TYPE_CODE ContentTypeCode,
		a.HAS_OTHER_INSURER HasOtherInsurer,
		a.INSURER_NAME OtherInsurerName,
		a.SUM_ASSURED OtherSumAssured,
		a.PRIOR_PROPOSAL_DECLINE PriorProposalDecline,
		a.DECLINE_REASON DeclineReason
	FROM dbo.CPC_PROPOSAL_FORM_TRAD_OTHER_INSURER_DETAILS a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;
end

GO

