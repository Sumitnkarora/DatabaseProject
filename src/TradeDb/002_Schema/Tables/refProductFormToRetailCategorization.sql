CREATE TABLE [dbo].[refProductFormToRetailCategorization]
(
	[Id] INT NOT NULL IDENTITY(1, 1)
,	[BisacCode] VARCHAR(10) NOT NULL
,	[ProductFormId] CHAR(2) NOT NULL
,	[ProductFormDetailId] CHAR(4) NOT NULL
,	[LanguageCode] CHAR(3) NOT NULL
,	[MerchandiseCategory] VARCHAR(10) NOT NULL
,	[LayoutModule] VARCHAR(20) NOT NULL
,	CONSTRAINT [PK_refProductFormToRetailCategorization] PRIMARY KEY CLUSTERED ([Id])
,	CONSTRAINT [FK_refProductFormToRetailCategorization_refProductForm] FOREIGN KEY([ProductFormId]) REFERENCES [dbo].[refProductForm]([Id])
,	CONSTRAINT [FK_refProductFormToRetailCategorization_refProductFormDetail] FOREIGN KEY([ProductFormDetailId]) REFERENCES [dbo].[refProductFormDetail]([Id])
);
