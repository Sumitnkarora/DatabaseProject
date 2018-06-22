CREATE TABLE [dbo].[tblLastRunTime] (
    [ID]          INT           NOT NULL,
    [LastRunTime] DATETIME      NOT NULL,
    [Description] VARCHAR (100) NULL,
    CONSTRAINT [PK_tblLastRunTime] PRIMARY KEY CLUSTERED ([ID] ASC) 
);
GO

GRANT SELECT, INSERT, UPDATE ON dbo.tblLastRunTime TO TwrImageExportApp;
GO