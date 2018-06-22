CREATE TABLE [dbo].[refReturnFormatSAPMap]
(
	[RFSMID] [int] NOT NULL IDENTITY(1, 1)
,	[ReturnFormat] [char](1)
,	[StripCover] [char](2)
,	[Returnable] [char](1)

,	CONSTRAINT [PK_refReturnFormatSAPMap] PRIMARY KEY CLUSTERED([RFSMID])
)
GO
