CREATE TABLE [dbo].[stgIngramPublisherMarketing]
(
	PID 		DECIMAL(18,0),
	Note		TEXT,
	Flag		CHAR(1) DEFAULT(0) -- 0 = Not Processed, 1=Marked For Processing , 2=Processed
	, [ISBN] VARCHAR(10) NULL
)

GO 

CREATE NONCLUSTERED INDEX stgIngramPublisherMarketing_PID on
 stgIngramPublisherMarketing(PID) 

GO

GRANT SELECT, INSERT, UPDATE, DELETE ON [dbo].[stgIngramPublisherMarketing] TO [IngramImportApp];
GO