CREATE TABLE [dbo].[CPC_PROPOSAL_PACK_CONTENTS] (
    [ROW_ID]             NUMERIC (25)  IDENTITY (1, 1) NOT NULL,
    [PPC_CPP_REF_NBR]    VARCHAR (50)  NULL,
    [PPC_PPCT_TYPE_CODE] VARCHAR (50)  NULL,
    [PPC_CREATE_DATE]    DATETIME      NULL,
    [PPC_CREATE_USER]    VARCHAR (150) NULL,
    [PPC_STATUS]         VARCHAR (50)  NULL
);


GO
