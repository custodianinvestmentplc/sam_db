create procedure dbo.CPC_ADD_UPDATE_PROPOSAL_FORM_TRAD_BANK_INFO(
	@caller varchar(150),
	@data dbo.UDT_CPC_FORM_TRAD_BANK_INFO readonly
)
as
begin
	set nocount on;

	merge dbo.CPC_PROPOSAL_FORM_TRAD_BANK_INFO as t
	using @data as s on (
		t.CPF_CPP_REF_NBR = s.CPF_CPP_REF_NBR
		and t.CPF_PPCT_TYPE_CODE = s.CPF_PPCT_TYPE_CODE
	)
	when matched then update set
		BANK_NAME = s.BANK_NAME,
		ACCOUNT_NUMBER = s.ACCOUNT_NUMBER,
		ACCOUNT_NAME = s.ACCOUNT_NAME,
		BVN = s.BVN,
		BANK_PRODUCT_NAME = s.BANK_PRODUCT_NAME,
		LAST_MODIFIED_DATE = getdate(),
		LAST_MODIFIED_USER = @caller
	when not matched then insert (
		CPF_CPP_REF_NBR,
		CPF_PPCT_TYPE_CODE,
		BANK_NAME,
		ACCOUNT_NUMBER,
		ACCOUNT_NAME,
		BVN,
		BANK_PRODUCT_NAME,
		CREATE_DATE,
		CREATE_USER,
		LAST_MODIFIED_DATE,
		LAST_MODIFIED_USER
	)
	values (
		s.CPF_CPP_REF_NBR,
		s.CPF_PPCT_TYPE_CODE,
		BANK_NAME,
		ACCOUNT_NUMBER,
		ACCOUNT_NAME,
		BVN,
		BANK_PRODUCT_NAME,
		getdate(),
		@caller,
		getdate(),
		@caller
	);
end

GO

