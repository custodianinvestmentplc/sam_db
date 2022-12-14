CREATE TYPE [dbo].[UDT_CPC_FORM_TRAD_IDENTITY] AS TABLE (
    [CPF_CPP_REF_NBR]                VARCHAR (50)  NULL,
    [CPF_PPCT_TYPE_CODE]             VARCHAR (50)  NULL,
    [MEANS_OF_IDENTIFICATION]        VARCHAR (50)  NULL,
    [MEANS_OF_IDENTIFICATION_OTHERS] VARCHAR (50)  NULL,
    [IDENTIFICATION_NBR]             VARCHAR (150) NULL,
    [COUNTRY_OF_ISSUE]               VARCHAR (50)  NULL,
    [COUNTRY_OF_ISSUE_OTHERS]        VARCHAR (50)  NULL,
    [ISSUING_AUTHORITY]              VARCHAR (150) NULL,
    [DATE_ISSUED]                    DATE          NULL,
    [DATE_EXPIRED]                   DATE          NULL,
    [RESIDENTIAL_PERMIT_NBR]         VARCHAR (150) NULL);


GO

