CREATE TABLE [dbo].[refProductFormToMediaBinding]
(
	[Id] INT NOT NULL IDENTITY(1, 1)
,	[ProductFormId] CHAR(2) NOT NULL
,	[ProductFormDetailId] CHAR(4) NOT NULL
,	[MediaCode] CHAR(2) NOT NULL
,	[BindingCode] CHAR(2) NOT NULL
,	CONSTRAINT [PK_refProductFormToMediaBinding] PRIMARY KEY CLUSTERED ([Id])
,	CONSTRAINT [FK_refProductFormToMediaBinding_refProductForm] FOREIGN KEY([ProductFormId]) REFERENCES [dbo].[refProductForm]([Id])
,	CONSTRAINT [FK_refProductFormToMediaBinding_refProductFormDetail] FOREIGN KEY([ProductFormDetailId]) REFERENCES [dbo].[refProductFormDetail]([Id])
);
