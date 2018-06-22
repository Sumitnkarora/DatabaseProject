CREATE TABLE [KoboReadThisOn] (
    [EBookID] [varchar] (36) NOT NULL ,
    [PlatformGroup] [varchar] (100) ,
    [Format] [varchar] (100) NULL ,
    [DRM] [varchar] (100) NULL ,
    [DateChanged] [datetime] NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_KoboReadThisOn_EBookID] ON [dbo].[KoboReadThisOn] ([EBookID]) WITH (FILLFACTOR=90);