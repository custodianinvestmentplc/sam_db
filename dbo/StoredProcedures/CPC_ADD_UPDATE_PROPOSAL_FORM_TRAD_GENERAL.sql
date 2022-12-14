create procedure dbo.CPC_ADD_UPDATE_PROPOSAL_FORM_TRAD_GENERAL(
	@caller varchar(150),
	@data dbo.UDT_CPC_FORM_TRAD_GENERAL readonly
)
as
begin
	set nocount on;

	merge dbo.CPC_PROPOSAL_FORM_TRAD_GENERAL as trg
	using @data as src on (
		trg.CPF_CPP_REF_NBR = src.CPF_CPP_REF_NBR
		and trg.CPF_PPCT_TYPE_CODE = src.CPF_PPCT_TYPE_CODE
	)
	when matched and (
		trg.SALUTATION_TITLE_CODE <> src.SALUTATION_TITLE_CODE
		or trg.SALUTATION_OTHERS <> src.SALUTATION_OTHERS
		or trg.PRODUCT_CODE <> src.PRODUCT_CODE
		or trg.FIRST_NAME <> src.FIRST_NAME
		or trg.MIDDLE_NAME <> src.MIDDLE_NAME
		or trg.SURNAME <> src.SURNAME
		or trg.DATE_OF_BIRTH <> CAST(SRC.DATE_OF_BIRTH AS DATE)
		or trg.GENDER <> src.GENDER
		or trg.GENDER_OTHERS <> src.GENDER_OTHERS
		or trg.STATE_OF_ORIGIN_CODE <> src.STATE_OF_ORIGIN_CODE
		or trg.NATIONALITY_CODE <> src.NATIONALITY_CODE
		or trg.COUNTRY_OF_ORIGIN <> src.COUNTRY_OF_ORIGIN
		or trg.TOWN_OR_CITY_OF_BIRTH <> src.TOWN_OR_CITY_OF_BIRTH
		or trg.COUNTRY_OF_BIRTH <> src.COUNTRY_OF_BIRTH
		or trg.RESIDENTIAL_ADDRESS <> src.RESIDENTIAL_ADDRESS
		or trg.ADDRESS_TOWN <> src.ADDRESS_TOWN
		or trg.ADDRESS_CITY <> src.ADDRESS_CITY
		or trg.ADDRESS_STATE <> src.ADDRESS_STATE
		or trg.ADDRESS_COUNTRY <> src.ADDRESS_COUNTRY
	)
	then update set
		SALUTATION_TITLE_CODE = src.SALUTATION_TITLE_CODE,
		SALUTATION_OTHERS = src.SALUTATION_OTHERS,
		PRODUCT_CODE = src.PRODUCT_CODE,
		FIRST_NAME = src.FIRST_NAME,
		MIDDLE_NAME = src.MIDDLE_NAME,
		SURNAME = src.SURNAME,
		DATE_OF_BIRTH = CAST(SRC.DATE_OF_BIRTH AS DATE),
		GENDER = src.GENDER,
		GENDER_OTHERS = src.GENDER_OTHERS,
		STATE_OF_ORIGIN_CODE = src.STATE_OF_ORIGIN_CODE,
		NATIONALITY_CODE = src.NATIONALITY_CODE,
		COUNTRY_OF_ORIGIN = src.COUNTRY_OF_ORIGIN,
		TOWN_OR_CITY_OF_BIRTH = src.TOWN_OR_CITY_OF_BIRTH,
		COUNTRY_OF_BIRTH = src.COUNTRY_OF_BIRTH,
		RESIDENTIAL_ADDRESS = src.RESIDENTIAL_ADDRESS,
		ADDRESS_TOWN = src.ADDRESS_TOWN,
		ADDRESS_CITY = src.ADDRESS_CITY,
		ADDRESS_STATE = src.ADDRESS_STATE,
		ADDRESS_COUNTRY = src.ADDRESS_COUNTRY,
		LAST_MODIFIED_DATE = getdate(),
		LAST_MODIFIED_USER = @caller
	when not matched then insert (
		CPF_CPP_REF_NBR,
		CPF_PPCT_TYPE_CODE,
		SALUTATION_TITLE_CODE,
		SALUTATION_OTHERS,
		PRODUCT_CODE,
		FIRST_NAME,
		MIDDLE_NAME,
		SURNAME,
		DATE_OF_BIRTH,
		GENDER,
		GENDER_OTHERS,
		STATE_OF_ORIGIN_CODE,
		NATIONALITY_CODE,
		COUNTRY_OF_ORIGIN,
		TOWN_OR_CITY_OF_BIRTH,
		COUNTRY_OF_BIRTH,
		RESIDENTIAL_ADDRESS,
		ADDRESS_TOWN,
		ADDRESS_CITY,
		ADDRESS_STATE,
		ADDRESS_COUNTRY,
		CREATE_DATE,
		CREATE_USER,
		LAST_MODIFIED_DATE,
		LAST_MODIFIED_USER
	)
	values (
		src.CPF_CPP_REF_NBR,
		src.CPF_PPCT_TYPE_CODE,
		src.SALUTATION_TITLE_CODE,
		src.SALUTATION_OTHERS,
		src.PRODUCT_CODE,
		src.FIRST_NAME,
		src.MIDDLE_NAME,
		src.SURNAME,
		cast(src.DATE_OF_BIRTH as date),
		src.GENDER,
		src.GENDER_OTHERS,
		src.STATE_OF_ORIGIN_CODE,
		src.NATIONALITY_CODE,
		src.COUNTRY_OF_ORIGIN,
		src.TOWN_OR_CITY_OF_BIRTH,
		src.COUNTRY_OF_BIRTH,
		src.RESIDENTIAL_ADDRESS,
		src.ADDRESS_TOWN,
		src.ADDRESS_CITY,
		src.ADDRESS_STATE,
		src.ADDRESS_COUNTRY,
		getdate(),
		@caller,
		getdate(),
		@caller
	);
end

GO

