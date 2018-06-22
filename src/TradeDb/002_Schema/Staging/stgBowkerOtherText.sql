CREATE TABLE [dbo].[stgBowkerOtherText](
	[RecordReference] [varchar](32) NULL,
	[TextTypeCode] [char](2) NULL,
	[TextFormat] [char](2) NULL,
	[Text] [ntext] NULL,
	[TextSourceTitle] [nvarchar](100) NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgBowkerOtherText] TO [BowkerApp];
GO