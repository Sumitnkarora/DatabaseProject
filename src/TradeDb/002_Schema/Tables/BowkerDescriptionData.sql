CREATE TABLE [dbo].[BowkerDescriptionData] (
    [PID]              Decimal (12)   NOT NULL,
    [DescriptionTypeId]   TINYINT        NOT NULL,
    [DescriptionText]     NVARCHAR (MAX) NULL,
    [DescriptionStatusId] TINYINT        NOT NULL,
    [ProviderID]          SMALLINT       NULL,
    [CreatedBy]           VARCHAR (30)   NULL DEFAULT USER_NAME(),
    [ChangedBy]           VARCHAR (30)   NULL DEFAULT USER_NAME(),
    [DateCreated]         DATETIME       NULL DEFAULT GETDATE(),
    [DateChanged]         DATETIME       NULL DEFAULT GETDATE(),
    CONSTRAINT [PK_BowkerDescriptionData] PRIMARY KEY CLUSTERED ([PID], [DescriptionTypeId]),
    CONSTRAINT [FK_BowkerDescriptionData_refContentProvider] FOREIGN KEY ([ProviderID]) REFERENCES [dbo].[refContentProviders] ([ProviderID]),
    CONSTRAINT [FK_BowkerDescriptionData_refDescriptionStatusCodes] FOREIGN KEY ([DescriptionStatusId]) REFERENCES [dbo].[refDescriptionStatusCodes] ([DescriptionStatusId]),
    CONSTRAINT [FK_BowkerDescriptionData_refDescriptionTypes] FOREIGN KEY ([DescriptionTypeId]) REFERENCES [dbo].[refDescriptionTypes] ([DescriptionTypeId])
);
