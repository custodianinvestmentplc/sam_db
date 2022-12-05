CREATE TABLE [dbo].[ProductionData] (
    [PLAN_NAME]            VARCHAR (50)    NULL,
    [BRANCH]               VARCHAR (50)    NULL,
    [PRP_SURNAME]          VARCHAR (300)   NULL,
    [PRP_OTHER_NAMES]      VARCHAR (300)   NULL,
    [POL_ANB]              NUMERIC (5)     NULL,
    [PRP_DOB]              VARCHAR (50)    NULL,
    [PROD_CODE]            NUMERIC (38)    NULL,
    [PRP_CODE]             NUMERIC (15)    NULL,
    [PROPOSAL_NO]          VARCHAR (102)   NULL,
    [POLICY_NO]            VARCHAR (102)   NULL,
    [NARRATIVE]            VARCHAR (200)   NULL,
    [TRANSACTION_DATE]     VARCHAR (50)    NULL,
    [RECEIPT_DATE]         VARCHAR (50)    NULL,
    [SOURCE]               VARCHAR (200)   NULL,
    [MM]                   VARCHAR (2)     NULL,
    [MONTH]                VARCHAR (36)    NULL,
    [POSTING_DATE]         VARCHAR (20)    NULL,
    [ACCOUNT_NUMBER]       VARCHAR (30)    NULL,
    [RECEIPT_NO]           VARCHAR (100)   NULL,
    [DEBIT_PREMIUM]        NUMERIC (15)    NULL,
    [CREDIT_PREMIUM]       NUMERIC (15)    NULL,
    [ITB_REF3]             NUMERIC (15)    NULL,
    [ITB_TRANSACTION_CODE] NUMERIC (15)    NULL,
    [POL_CURRENT_SA]       NUMERIC (23, 5) NULL,
    [ENDR_TYPE]            VARCHAR (4000)  NULL,
    [POL_EFFECTIVE_DATE]   VARCHAR (20)    NULL,
    [POL_MATURITY_DATE]    VARCHAR (20)    NULL,
    [POL_REF_NO]           VARCHAR (100)   NULL,
    [POL_FREQ_OF_PAYMENT]  VARCHAR (4000)  NULL,
    [POL_TERM]             INT             NULL,
    [INST_PREM]            NUMERIC (15)    NULL,
    [ANNUALIZED_PREM]      NUMERIC (15)    NULL,
    [AGN_NAME]             VARCHAR (100)   NULL,
    [UNITMANAGER]          VARCHAR (100)   NULL,
    [AGENCYMANAGER]        VARCHAR (100)   NULL,
    [BRANCHMANAGER]        VARCHAR (100)   NULL,
    [REGIONALMANAGER]      VARCHAR (100)   NULL,
    [AGN_SHT_DESC]         VARCHAR (50)    NULL,
    [AGN_CODE]             VARCHAR (50)    NULL,
    [BRN_CODE]             VARCHAR (50)    NULL
);


GO
