CREATE TABLE [dbo].[refSAPDiscountCode]
(
	[Id] CHAR(2) NOT NULL
,	[Description] VARCHAR(MAX) NULL
,	CONSTRAINT [PK_refSAPDiscountCode] PRIMARY KEY CLUSTERED ([Id])
);
