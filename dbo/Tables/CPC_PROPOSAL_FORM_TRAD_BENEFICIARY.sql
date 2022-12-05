CREATE TABLE [dbo].[CPC_PROPOSAL_FORM_TRAD_BENEFICIARY] (
    [ROW_ID]                   NUMERIC (25)   IDENTITY (1, 1) NOT NULL,
    [CPF_CPP_REF_NBR]          VARCHAR (50)   NULL,
    [CPF_PPCT_TYPE_CODE]       VARCHAR (50)   NULL,
    [BENEFICIARY_NAME]         VARCHAR (150)  NULL,
    [BENEFICIARY_DOB]          DATE           NULL,
    [BENEFICIARY_RELATIONSHIP] VARCHAR (50)   NULL,
    [PROPOTION_PCT]            NUMERIC (5, 2) NULL,
    [CREATE_DATE]              DATETIME       NULL,
    [CREATE_USER]              VARCHAR (150)  NULL,
    [LAST_MODIFIED_DATE]       DATETIME       NULL,
    [LAST_MODIFIED_USER]       VARCHAR (150)  NULL,
    [RECORD_STATUS]            VARCHAR (10)   NULL
);


GO

