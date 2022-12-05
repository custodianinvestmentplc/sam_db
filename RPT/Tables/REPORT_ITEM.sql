CREATE TABLE [RPT].[REPORT_ITEM] (
    [REPORT_ID]              INT           IDENTITY (1, 1) NOT NULL,
    [MODULE_ROW_ID]          INT           NULL,
    [REPORT_DISPLAY_NAME]    VARCHAR (150) NULL,
    [CLIENT_ROUTE_ATTRIBUTE] VARCHAR (150) NULL,
    PRIMARY KEY CLUSTERED ([REPORT_ID] ASC)
);


GO

