CREATE TABLE [dbo].[refProductStatusMapping]
(
	[Id] INT NOT NULL IDENTITY(1, 1)
,	[PublishingStatusId] CHAR(2) NOT NULL
,	[ProductAvailabilityId] CHAR(2) NOT NULL
,	[StatusCode] VARCHAR(5) NOT NULL
,	CONSTRAINT [PK_refProductStatusMapping] PRIMARY KEY CLUSTERED ([Id])
,	CONSTRAINT [FK_refProductStatusMapping_refPublishingStatus] FOREIGN KEY([PublishingStatusId]) REFERENCES [dbo].[refPublishingStatus]([Id])
,	CONSTRAINT [FK_refProductStatusMapping_refProductAvailability] FOREIGN KEY([ProductAvailabilityId]) REFERENCES [dbo].[refProductAvailability]([Id])
,	CONSTRAINT [FK_refProductStatusMapping_refStatusCode] FOREIGN KEY([StatusCode]) REFERENCES [dbo].[refStatusCode]([Id])
);
