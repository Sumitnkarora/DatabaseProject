CREATE TABLE dbo.refBisacToMCLMMap
(
	[BISACCode] VARCHAR(10) NOT NULL
,	[LanguageCode] CHAR(2) NOT NULL
,	[BindingCode] VARCHAR(50) NOT NULL
,	[MerchCategoryId] VARCHAR(10) NULL
,	[LayoutModuleId] VARCHAR(20) NULL

,	CONSTRAINT [PK_refBisacToMCLMMap] PRIMARY KEY CLUSTERED ([BISACCode], [LanguageCode], [BindingCode])
,	CONSTRAINT [FK_refBisacToMCLMMap_refBisacSubjects] FOREIGN KEY ([BISACCode]) REFERENCES [dbo].[refBisacSubjects]([BISACCode])
,	CONSTRAINT [FK_refBisacToMCLMMap_refLayoutModules] FOREIGN KEY ([LayoutModuleId]) REFERENCES [dbo].[refLayoutModules]([LayoutModuleId])
,	CONSTRAINT [FK_refBisacToMCLMMap_refMerchandiseCategories] FOREIGN KEY ([MerchCategoryId]) REFERENCES [dbo].[refMerchandiseCategories]([MerchCategoryId])
);
GO
