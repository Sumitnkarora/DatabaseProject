CREATE procedure [dbo].[spBowkerUpdateImportLog]
	@fileName varchar(500),
	@status varchar(10) = 'OK',
	@error varchar(8000) = null
as
insert into stgBowkerFileImportLog (NumProducts, Status, [FileName], ErrorText) 
select count(*), @status, @fileName, @error  from stgBowkerProduct
GO

GRANT EXECUTE ON [dbo].[spBowkerUpdateImportLog] TO [BowkerApp]; 
GO