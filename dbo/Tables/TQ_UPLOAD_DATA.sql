CREATE TABLE [dbo].[TQ_UPLOAD_DATA] (
    [ROW_ID]           INT             IDENTITY (1, 1) NOT NULL,
    [TQ_TRAN_NBR]      VARCHAR (50)    NULL,
    [POLICY_NO]        VARCHAR (50)    NULL,
    [AGN_SHT_DESC]     VARCHAR (50)    NULL,
    [PROD_NAME]        VARCHAR (150)   NULL,
    [RECEIPT_NO]       VARCHAR (50)    NULL,
    [RECEIPT_DATE]     VARCHAR (50)    NULL,
    [RECEIPT_TQ_DATE]  VARCHAR (50)    NULL,
    [INSTALLMENT_AMT]  NUMERIC (18, 2) NULL,
    [DEPOSIT_AMT]      NUMERIC (18, 2) NULL,
    [ALLOCATED_AMT]    NUMERIC (18, 2) NULL,
    [COMM_RATE_PCT]    FLOAT (53)      NULL,
    [COMM_AMT]         NUMERIC (18, 2) NULL,
    [WTH_TAX_RATE_PCT] FLOAT (53)      NULL,
    [WHT_AMT]          NUMERIC (18, 2) NULL,
    [NET_COMM]         NUMERIC (18, 2) NULL,
    [DR_CR_IND]        VARCHAR (1)     NULL,
    [SRC]              VARCHAR (50)    NULL
);


GO

