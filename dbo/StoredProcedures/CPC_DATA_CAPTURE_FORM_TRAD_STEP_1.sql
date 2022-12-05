create procedure dbo.CPC_DATA_CAPTURE_FORM_TRAD_STEP_1 (
	@ref_nbr varchar(50),
	@content_type_code varchar(50)
)
AS
begin
	set nocount on;

	SELECT
		CPF_CPP_REF_NBR ReferenceNbr,
		CPF_PPCT_TYPE_CODE ContentTypeCode,
		SALUTATION_TITLE_CODE Title,
		SALUTATION_OTHERS OtherTitle,
		PRODUCT_CODE ProductCode,
		FIRST_NAME Firstname,
		MIDDLE_NAME Middlename,
		SURNAME Surname,
		DATE_OF_BIRTH Dob,
		GENDER Gender,
		GENDER_OTHERS GenderOthers,
		STATE_OF_ORIGIN_CODE StateOfOrigin,
		NATIONALITY_CODE Nationality,
		COUNTRY_OF_ORIGIN NationalityOthers,
		TOWN_OR_CITY_OF_BIRTH TownOrCityOfBirth,
		COUNTRY_OF_BIRTH CountryOfBirth,
		RESIDENTIAL_ADDRESS Address,
		ADDRESS_TOWN TownOfAddress,
		ADDRESS_CITY CityOfAddress,
		ADDRESS_STATE StateOfAddress,
		ADDRESS_COUNTRY CountryOfAddress
	FROM dbo.CPC_PROPOSAL_FORM_TRAD_GENERAL a
	where a.CPF_CPP_REF_NBR = @ref_nbr
	and a.CPF_PPCT_TYPE_CODE = @content_type_code;
end

GO

