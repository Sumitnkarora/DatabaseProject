CREATE PROCEDURE [dbo].[uspInsertTradeStatFile]
	@filename varchar(8000),
	@statusid int
AS
    declare 
@d varchar(3),
@m varchar(15),
@y varchar(4),
@h varchar(3),
@min varchar(3),
@s varchar(3),
@formattedfile varchar(8000)

    set @d = right('0'+ cast(day(getdate())as varchar(3)),2)
	set @m = cast(datename(mm,getdate())as varchar(15))
	set @y = year(getdate())
	set @min = right('0'+cast(datepart(mi, getdate())as varchar(3)),2)
	set @h = right('0'+cast(datepart(hh, getdate())as varchar(3)),2)
	set @s = right('0'+cast(datepart(s, getdate())as varchar(3)),2)
    set @formattedfile =  replace(@filename,'.txt','')+'_'+@m+'_'+@d+'_'+@y+'-'+@h+@min+@s+'.txt'
	insert TradeStatFileProductsDB ([filename], statusid, datecreated)
		values (@formattedfile, @statusid, getdate())
GO

GRANT EXECUTE ON [dbo].[uspInsertTradeStatFile] TO [CoreFileImporterApp]; 
GO