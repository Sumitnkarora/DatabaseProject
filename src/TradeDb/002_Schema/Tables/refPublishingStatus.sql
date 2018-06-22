CREATE TABLE [dbo].[refPublishingStatus]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
,	CONSTRAINT [PK_refPublishingStatus] PRIMARY KEY CLUSTERED ([Id])
);
