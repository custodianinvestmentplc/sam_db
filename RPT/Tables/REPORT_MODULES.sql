CREATE TABLE [RPT].[REPORT_MODULES] (
    [ROW_ID]         INT           IDENTITY (1, 1) NOT NULL,
    [MODULE_ID_NAME] VARCHAR (50)  NULL,
    [DISPLAY_NAME]   VARCHAR (150) NULL,
    [URL_SEGMENT]    VARCHAR (150) NULL,
    PRIMARY KEY CLUSTERED ([ROW_ID] ASC)
);


GO

