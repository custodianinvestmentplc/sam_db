CREATE TABLE [dbo].[USER_APP_REGISTER] (
    [ROW_ID]      INT IDENTITY (1, 1) NOT NULL,
    [USER_ROW_ID] INT NOT NULL,
    [APP_ROW_ID]  INT NOT NULL,
    PRIMARY KEY CLUSTERED ([ROW_ID] ASC),
    FOREIGN KEY ([APP_ROW_ID]) REFERENCES [dbo].[APP_REGISTER] ([ROW_ID]),
    FOREIGN KEY ([USER_ROW_ID]) REFERENCES [dbo].[USER_REGISTER] ([ROW_ID])
);


GO

