create procedure dbo.CPC_DATA_CAPTURE_FORM_TRAD_STEP_2 (
	@ref_nbr varchar(50),
	@content_type_code varchar(50)
)
AS
begin
	set nocount on;

	SELECT
		CPF_CPP_REF_NBR ReferenceNbr,
		CPF_PPCT_TYPE_CODE ContentTypeCode,
		TIN Tin,
		EMPLOYER_NAME Employer,
		EMPLOYER_ADDRESS EmployerAddress,
		EMPLOYER_EMAIL EmployerEmail,
		EMPLOYER_PHONE_NBR EmployerTelephone,
		CUST_RELIGION Religion,
		CUST_OCCUPATION CustomerOccupation,
		CUST_SOURCE_OF_FUNDS CustomerSourceOfFunds
	FROM dbo.CPC_PROPOSAL_FORM_TRAD_TAX_DETAILS a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;
end

GO

