CREATE TABLE [stgKoboDownloadable] (
    [EBookID] [varchar] (36) NOT NULL ,
    [Format] [varchar] (100) NULL ,
    [DRM] [varchar] (100) NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_stgKoboDownloadable_EBookID] ON [dbo].[stgKoboDownloadable] ([EBookID]) WITH (FILLFACTOR=90);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgKoboDownloadable] TO [KoboImporterApp];
GO