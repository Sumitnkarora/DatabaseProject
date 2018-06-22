CREATE TABLE [dbo].[refProductFormToSAPCategorization]
(
	[Id] INT NOT NULL IDENTITY(1, 1)
,	[ProductFormId] CHAR(2) NOT NULL
,	[ProductFormDetailId] CHAR(4) NOT NULL
,	[SAPDiscountCode] CHAR(2) NOT NULL
,	[SAPProductHierarchy] CHAR(2) NOT NULL
,	[SAPProductType] CHAR(2) NOT NULL
,	CONSTRAINT [PK_refProductFormToSAPCategorization] PRIMARY KEY CLUSTERED ([Id])
,	CONSTRAINT [FK_refProductFormToSAPCategorization_refProductForm] FOREIGN KEY([ProductFormId]) REFERENCES [dbo].[refProductForm]([Id])
,	CONSTRAINT [FK_refProductFormToSAPCategorization_refProductFormDetail] FOREIGN KEY([ProductFormDetailId]) REFERENCES [dbo].[refProductFormDetail]([Id])
,	CONSTRAINT [FK_refProductFormToSAPCategorization_refSAPDiscountCode] FOREIGN KEY([SAPDiscountCode]) REFERENCES [dbo].[refSAPDiscountCode]([Id])
,	CONSTRAINT [FK_refProductFormToSAPCategorization_refSAPProductHierarchy] FOREIGN KEY([SAPProductHierarchy]) REFERENCES [dbo].[refSAPProductHierarchy]([Id])
,	CONSTRAINT [FK_refProductFormToSAPCategorization_refSAPProductType] FOREIGN KEY([SAPProductType]) REFERENCES [dbo].[refSAPProductType]([Id])
);
