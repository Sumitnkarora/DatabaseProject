CREATE TABLE [dbo].[refLayoutModules]
(
	[LayoutModuleId] VARCHAR(20) NOT NULL
,	[Description] NVARCHAR(MAX) NULL
,	[VisibleToCart] BIT NOT NULL

,	CONSTRAINT [PK_refLayoutModules] PRIMARY KEY CLUSTERED ([LayoutModuleId])
);
GO
