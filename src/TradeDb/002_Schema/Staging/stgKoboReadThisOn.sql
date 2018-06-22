CREATE TABLE [stgKoboReadThisOn] (
    [EBookID] [varchar] (36) NOT NULL ,
    [PlatformGroup] [varchar] (100) ,
    [Format] [varchar] (100) NULL ,
    [DRM] [varchar] (100) NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_stgKoboReadThisOn_EBookID] ON [dbo].[stgKoboReadThisOn] ([EBookID]) WITH (FILLFACTOR=90);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgKoboReadThisOn] TO [KoboImporterApp];
GO