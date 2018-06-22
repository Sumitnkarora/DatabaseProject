CREATE TABLE [dbo].[refProductAvailability]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
,	CONSTRAINT [PK_refProductAvailability] PRIMARY KEY CLUSTERED ([Id])
);
