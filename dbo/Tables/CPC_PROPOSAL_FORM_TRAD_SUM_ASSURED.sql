CREATE TABLE [dbo].[CPC_PROPOSAL_FORM_TRAD_SUM_ASSURED] (
    [CPF_CPP_REF_NBR]    VARCHAR (50)    NULL,
    [CPF_PPCT_TYPE_CODE] VARCHAR (50)    NULL,
    [SUM_ASSURED]        NUMERIC (18, 2) NULL,
    [TERM_YEAR]          INT             NULL,
    [FIRST_PREMIUM_PAID] NUMERIC (18, 2) NULL,
    [REGULAR_PREMIUM]    NUMERIC (18, 2) NULL,
    [PAYMENT_FREQUENCY]  VARCHAR (50)    NULL,
    [FROM_DATE]          DATE            NULL,
    [MATURIRY_DATE]      DATE            NULL,
    [PAYMENT_MODE]       VARCHAR (50)    NULL,
    [CREATE_DATE]        DATETIME        NULL,
    [CREATE_USER]        VARCHAR (150)   NULL,
    [LAST_MODIFIED_DATE] DATETIME        NULL,
    [LAST_MODIFIED_USER] VARCHAR (150)   NULL
);


GO

