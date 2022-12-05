CREATE TABLE [dbo].[TQ_COMS_DATA] (
    [UPLOAD_DATA_ROW_ID]  INT             NOT NULL,
    [POLICY_NUMBER]       VARCHAR (50)    NULL,
    [RECEIPT_NUMBER]      VARCHAR (50)    NULL,
    [ALLOCATED_AMOUNT]    NUMERIC (18, 2) NULL,
    [DEPOSIT_AMOUNT]      NUMERIC (18, 2) NULL,
    [AGN_CODE]            VARCHAR (50)    NOT NULL,
    [GROSS_COMM]          FLOAT (53)      NULL,
    [COMMISSION_RATE_PCT] FLOAT (53)      NULL,
    [WHT_AMT]             FLOAT (53)      NULL,
    [DR_CR]               VARCHAR (1)     NULL,
    [PROD_CODE]           VARCHAR (50)    NULL,
    [PROD_NAME]           VARCHAR (150)   NULL,
    [SRC]                 VARCHAR (50)    NULL,
    [AGN_SHT_DESC]        VARCHAR (50)    NULL
);


GO

