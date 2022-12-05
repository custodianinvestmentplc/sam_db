CREATE TABLE [dbo].[group_cust] (
    [_key_in]              INT           NULL,
    [_key_out]             INT           NULL,
    [_score]               REAL          NULL,
    [CustKey]              VARCHAR (50)  NULL,
    [CustName]             VARCHAR (150) NULL,
    [CustName_clean]       VARCHAR (150) NULL,
    [_Similarity_CustName] REAL          NULL
);


GO

