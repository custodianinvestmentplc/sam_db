CREATE TABLE [dbo].[COMS_COMPUTATION_OUTPUT] (
    [ROW_ID]                 INT             IDENTITY (1, 1) NOT NULL,
    [AGN_SHT_DESC]           VARCHAR (50)    NULL,
    [ORC_SCENARIO_ID]        VARCHAR (50)    NULL,
    [ORC_SCENARIO_RATE]      FLOAT (53)      NULL,
    [PROD_TYPE]              VARCHAR (50)    NULL,
    [COM_AMOUNT]             NUMERIC (18, 2) NULL,
    [COM_TYPE]               VARCHAR (50)    NULL,
    [COM_OWNER_AGN_SHT_DESC] VARCHAR (50)    NULL,
    [PRODUCT_NAME]           VARCHAR (150)   NULL,
    [SRC]                    VARCHAR (50)    NULL,
    [RECEIPT_ROW_ID]         INT             NULL
);


GO

