CREATE TABLE [dbo].[CPC_PROPOSAL_PACKS] (
    [ROW_ID]                NUMERIC (25)  IDENTITY (1, 1) NOT NULL,
    [REF_NBR]               VARCHAR (50)  NULL,
    [TITLE]                 VARCHAR (150) NULL,
    [TAG]                   VARCHAR (150) NULL,
    [LOCAL_SYS_BRANCH_CODE] VARCHAR (50)  NULL,
    [AGENT_SHT_DESC]        VARCHAR (50)  NULL,
    [CREATE_DATE]           DATETIME      NULL,
    [CREATE_USER]           VARCHAR (150) NULL,
    [PROPOSAL_PACK_TYPE]    VARCHAR (50)  NULL
);


GO

