CREATE procedure dbo.CPC_DATA_CAPTURE_FORM_TRAD_STEP_4 (
	@ref_nbr varchar(50),
	@content_type_code varchar(50)
)
AS
begin
	set nocount on;

	SELECT
		CPF_CPP_REF_NBR ReferenceNbr,
		CPF_PPCT_TYPE_CODE ContentTypeCode,
		BANK_NAME BankName,
		ACCOUNT_NUMBER AccountNumber,
		ACCOUNT_NAME AccountName,
		BVN Bvn,
		BANK_PRODUCT_NAME BankProductName
	FROM dbo.CPC_PROPOSAL_FORM_TRAD_BANK_INFO a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;
end

GO

