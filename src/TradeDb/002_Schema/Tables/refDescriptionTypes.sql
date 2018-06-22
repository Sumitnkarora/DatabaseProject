CREATE TABLE [dbo].[refDescriptionTypes]
(
	[DescriptionTypeId] TINYINT NOT NULL IDENTITY(1, 1)
,	[Description] VARCHAR(MAX) NULL

-- Fields below are from [ProductsDb].[dbo].[tbl_CMN_DescriptionTypes] 
,	[IsActive] [bit] NOT NULL DEFAULT(1)
,	[ProductTypeID] [smallint] NULL
,	[CreatedBy] [varchar](30) NULL
,	[ChangedBy] [varchar](30) NULL
,	[DateCreated] [datetime] NULL
,	[DateChanged] [datetime] NULL
,	[IsDeleted] [bit] NOT NULL DEFAULT(0)
,	[ExportDescriptionTypeId] VARCHAR(6) NOT NULL DEFAULT 0, 
    CONSTRAINT [PK_refDescriptionTypes] PRIMARY KEY CLUSTERED([DescriptionTypeId])
)
