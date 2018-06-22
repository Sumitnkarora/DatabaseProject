CREATE TABLE [dbo].[EBookExclusions](
	[ExclusionText] [nvarchar](255) NOT NULL,
	[ExclusionType] [varchar](50) NOT NULL
);
GO

CREATE NONCLUSTERED INDEX [IX_EBookExclusions_ExclusionText] ON [dbo].[EBookExclusions] ([ExclusionText]) WITH (FILLFACTOR=90);
GO

CREATE NONCLUSTERED INDEX [IX_EBookExclusions_ExclusionType] ON [dbo].[EBookExclusions] ([ExclusionType]) WITH (FILLFACTOR=90);
GO