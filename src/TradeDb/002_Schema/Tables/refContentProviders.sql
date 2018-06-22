--Previously known as [ProductsDb].[dbo].[tbl_CMN_ContentProviders] 
CREATE TABLE [dbo].[refContentProviders](
	[ProviderID] [smallint] NOT NULL,
	[ProviderName] [varchar](50) NOT NULL,
	[Priority] [tinyint] NULL,
	[CreatedBy] [varchar](30) NULL,
	[ChangedBy] [varchar](30) NULL,
	[DateCreated] [datetime] NULL,
	[DateChanged] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL, 
    CONSTRAINT [PK_refContentProviders] PRIMARY KEY ([ProviderID])
)

GO

ALTER TABLE [dbo].[refContentProviders] ADD  CONSTRAINT [validPriorityRange] CHECK  (([Priority] >= 1 and [Priority] <= 100))
GO

ALTER TABLE [dbo].[refContentProviders] CHECK CONSTRAINT [validPriorityRange]
GO

CREATE TRIGGER [dbo].[trg_AuditINS_refContentProviders] ON [dbo].[refContentProviders]
FOR INSERT
AS
IF @@Rowcount = 0
	RETURN
ELSE
	UPDATE [refContentProviders]
	SET CreatedBy = user_name(), ChangedBy = user_name(), DateCreated = getdate(), DateChanged = getdate()
	FROM [refContentProviders] INNER JOIN inserted I
	ON [refContentProviders].ProviderID = I.ProviderID

ALTER TABLE [dbo].[refContentProviders] ENABLE TRIGGER [trg_AuditINS_refContentProviders]
GO

CREATE TRIGGER [dbo].[trg_AuditUPD_refContentProviders] ON [dbo].[refContentProviders]
FOR UPDATE
AS
IF @@Rowcount = 0
	RETURN
ELSE
	UPDATE [refContentProviders]
	SET ChangedBy = user_name(), DateChanged = getdate()
	FROM [refContentProviders] INNER JOIN inserted I
	ON [refContentProviders].ProviderID = I.ProviderID

ALTER TABLE [dbo].[refContentProviders] ENABLE TRIGGER [trg_AuditUPD_refContentProviders]
GO