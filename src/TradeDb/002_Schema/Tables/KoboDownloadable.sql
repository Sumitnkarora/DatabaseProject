CREATE TABLE [KoboDownloadable] (
    [EBookID] [varchar] (36) NOT NULL ,
    [Format] [varchar] (100) NULL ,
    [DRM] [varchar] (100) NULL ,
    [DateChanged] [datetime] NULL 
);
GO

CREATE NONCLUSTERED INDEX [IX_KoboDownloadable_EBookID] ON [dbo].[KoboDownloadable] ([EBookID]) WITH (FILLFACTOR=90);