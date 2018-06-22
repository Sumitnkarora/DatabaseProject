CREATE PROCEDURE [dbo].[uspProductsDBValidateCore]
as

set nocount on

---- VALIDATION Section ----
--Safety check - Reason should be null at the start of this script
update stgTradeBronteCore
	set Reason = null

--CurrencyTypeID
update stgTradeBronteCore
	set Reason = 'CurrencyTypeID doesn''t exist in refCurrencyTypes'
from stgTradeBronteCore s
left join refCurrencyTypes c on s.CurrencyTypeID = c.CurrencyTypeID
where Reason is null and s.CurrencyTypeID is not null and c.CurrencyTypeID is null

--ItemCost
update stgTradeBronteCore
	set Reason = 'ItemCost is not correct'
where Reason is null and ISNUMERIC(ItemCost) <> 1 and ItemCost is not null

--CostOverridden
update stgTradeBronteCore
	set Reason = 'CostOverridden should be 0 or 1'
where Reason is null and CostOverridden not in ('0','1')

--SourcePrice
update stgTradeBronteCore
	set Reason = 'SourcePrice is not correct'
where Reason is null and ISNUMERIC(SourcePrice) <> 1 and SourcePrice is not null

--ListPrice
update stgTradeBronteCore
	set Reason = 'ListPrice is not correct'
where Reason is null and ISNUMERIC(ListPrice) <> 1 and ListPrice is not null

--ListPriceOverridden
update stgTradeBronteCore
	set Reason = 'ListPriceOverridden should be 0 or 1'
where Reason is null and ListPriceOverridden not in ('0','1')

--AdjustedPrice
update stgTradeBronteCore
	set Reason = 'AdjustedPrice is not correct'
where Reason is null and ISNUMERIC(AdjustedPrice) <> 1 and AdjustedPrice is not null

--AdjustedPriceOverridden
update stgTradeBronteCore
	set Reason = 'AdjustedPriceOverridden should be 0 or 1'
where Reason is null and AdjustedPriceOverridden not in ('0','1')

--CostFactorID
update stgTradeBronteCore
	set Reason = 'CostFactorID should be 1 or 2'
where Reason is null and CostFactorID not in ('1','2')

--StatusID
update stgTradeBronteCore
	set Reason = 'StatusID doesn''t exist in refStatusCodes'
from stgTradeBronteCore s
left join refStatusCodes c on s.StatusID = c.StatusID
where Reason is null and s.StatusID is not null and c.StatusID is null

--OnSaleDate
update stgTradeBronteCore
	set Reason = 'OnSaleDate is not correct'
where Reason is null and ISDATE(OnSaleDate) <> 1 and OnSaleDate is not null

--IsDeleted
update stgTradeBronteCore
	set Reason = 'IsDeleted flag should be 0 or 1'
where Reason is null and IsDeleted not in ('0','1')

--Move all invalidated items to TradeBronteCoreExceptions
insert into TradeBronteCoreExceptions (PID,Title,Subtitle,CurrencyTypeID,ItemCost,CostOverridden,SourcePrice,ListPrice,ListPriceOverridden,AdjustedPrice,AdjustedPriceOverridden,VendorID,CostFactorID,StatusID,OnSaleDate,IsDeleted,[FileName],Reason,ExceptionDate)
select PID,Title,Subtitle,CurrencyTypeID,ItemCost,CostOverridden,SourcePrice,ListPrice,ListPriceOverridden,AdjustedPrice,AdjustedPriceOverridden,VendorID,CostFactorID,StatusID,OnSaleDate,IsDeleted,[FileName], Reason, getdate()
from stgTradeBronteCore 
where Reason is not null

--Delete all invalidated items from stgTradeBronteCore
delete stgTradeBronteCore 
where Reason is not null


---- UPDATE Section ----
--Insert all records that do not have corresponding datain TradeDataByVendor
insert into TradeDataByVendor (PID, ISBN, ISBN13, VendorId, SAPVendorId, VSRCode, Title)
select s.PID, dbo.fnPIDToISBN10(s.PID), dbo.fnPIDToISBN13(s.PID), 301442, 703416, '', ''
	from stgTradeBronteCore s
	left join TradeDataByVendor v on v.PID = s.PID and v.SAPVendorId = 703416 and v.VSRCode = ''
	where v.PID is null

--Keep Track of ISBN13s that are going to trigger updates from TradeDataByVendor 
SELECT ISBN13 
INTO #UpdatedISBNs 
FROM stgTradeBronteCore t
JOIN TradeDataByVendor c ON t.pid = c.pid AND c.SAPVendorId = 703416 AND VSRCode = ''
WHERE (t.title IS NOT NULL AND t.title <> c.title) OR
	(t.Subtitle IS NOT NULL AND LEN(t.subtitle)<=100 AND t.subtitle <> ISNULL(c.subtitle, '')) OR
	(t.CurrencyTypeID IS NOT NULL AND t.CurrencyTypeID <> ISNULL(c.ItemPriceCurrency, '')) OR
	(t.ListPrice IS NOT NULL AND t.ListPrice <> ISNULL(c.ItemPrice, '')) OR
	(t.StatusID IS NOT NULL AND t.StatusID <> ISNULL(c.StatusCode, '')) OR
	(t.OnSaleDate IS NOT NULL AND t.OnSaleDate <> ISNULL(c.StreetDate, ''))

--Updates title
update TradeDataByVendor 
set title = t.title
from stgTradeBronteCore t
join TradeDataByVendor  c on t.pid = c.pid 
	-- only do updates for products assigned to "Indigo Books"
	and c.SAPVendorId = 703416 and VSRCode = ''
where isnull(t.title,-1) <> c.title and t.title is not null 

--Updates subtitle
update TradeDataByVendor 
set subtitle = t.subtitle
from stgTradeBronteCore t
join TradeDataByVendor  c on t.pid = c.pid
	-- only do updates for products assigned to "Indigo Books"
	and c.SAPVendorId = 703416 and VSRCode = '' 
where ((t.subtitle <>c.subtitle and len(t.subtitle)<=100) or (c.subtitle is null and t.subtitle is not null and len(t.subtitle)<=100)) 

--Updates ItemPriceCurrency & ItemPrice
update TradeDataByVendor  
set 	ItemPriceCurrency = case when t.CurrencyTypeID is not null then t.CurrencyTypeID else c.ItemPriceCurrency end,
	   ItemPrice = case when t.ListPrice is not null then cast(t.ListPrice as money) else c.ItemPrice end
from stgTradeBronteCore t
join TradeDataByVendor  c on t.pid = c.pid
	-- only do updates for products assigned to "Indigo Books"
	and c.SAPVendorId = 703416 and VSRCode = ''
where (t.CurrencyTypeID IS NOT NULL AND t.CurrencyTypeID <> ISNULL(c.ItemPriceCurrency, '')) OR
	(t.ListPrice IS NOT NULL AND t.ListPrice <> ISNULL(c.ItemPrice, ''))

--Updates status code
update TradeDataByVendor 
set StatusCode = t.StatusID 
from stgTradeBronteCore t
join TradeDataByVendor c on t.pid = c.pid
	-- only do updates for products assigned to "Indigo Books"
	and c.SAPVendorId = 703416 and VSRCode = ''
where t.StatusID <> c.StatusCode or (c.StatusCode is null and t.StatusID is not null)

--Updates street date
update TradeDataByVendor 
set StreetDate = t.OnSaleDate 
from stgTradeBronteCore t
join TradeDataByVendor  c on t.pid = c.pid
	-- only do updates for products assigned to "Indigo Books"
	and c.SAPVendorId = 703416 and VSRCode = ''
where t.OnSaleDate is not null 

-- update Indigo Attributes table
insert into TradeIndigoAttributes (ISBN13, SAPVendorId, VSRCode, ItemCost, SourcePrice, AdjustedPrice, IsDeleted, IsSearchable, IsPreview)
select dv.ISBN13, dv.SAPVendorId, dv.VSRCode, '', '', '', 0, 0, 0
from TradeDataByVendor dv 
join stgTradeBronteCore stg on dv.pid = stg.pid
left outer join TradeIndigoAttributes it on it.ISBN13 = dv.ISBN13 and it.SAPVendorId = dv.SAPVendorId and it.VSRCode = dv.VSRCode
where it.ISBN13 is NULL and it.SAPVendorId is NULL and it.VSRCode is NULL

--Keep Track of ISBN13s that are going to trigger updates from TradeIndigoAttributes
INSERT INTO #UpdatedISBNs
SELECT c.ISBN13
FROM stgTradeBronteCore t
JOIN TradeDataByVendor  c ON t.pid = c.pid AND c.SAPVendorId = 703416 AND VSRCode = ''
JOIN TradeIndigoAttributes it ON it.ISBN13 = c.ISBN13 AND it.SAPVendorId = c.SAPVendorId AND it.VSRCode = c.VSRCode
WHERE (t.ItemCost IS NOT NULL AND cast(t.ItemCost as money) <> it.ItemCost) OR
	(t.CostOverridden IS NOT NULL AND cast(t.CostOverridden as bit) <> it.CostOverridden) OR
	(t.SourcePrice IS NOT NULL AND cast(t.SourcePrice as money) <> it.SourcePrice) OR
	(t.ListPriceOverridden IS NOT NULL AND cast(t.ListPriceOverridden as bit) <> it.ListPriceOverridden) OR
	(t.AdjustedPrice IS NOT NULL AND cast(t.AdjustedPrice as money) <> it.AdjustedPrice) OR
	(t.AdjustedPriceOverridden IS NOT NULL AND cast(t.AdjustedPriceOverridden as bit) <> it.AdjustedPriceOverridden) OR
	(t.CostFactorID IS NOT NULL AND t.CostFactorID <> ISNULL(it.CostFactorID,''))

--Update Indigo Attributes
update TradeIndigoAttributes  
set 	
	ItemCost = case when t.ItemCost is not null then cast(t.ItemCost as money) else it.ItemCost end,
	CostOverridden = case when t.CostOverridden is not null then t.CostOverridden else it.CostOverridden end,
	SourcePrice = case when t.SourcePrice is not null then cast(t.SourcePrice as money) else it.SourcePrice end,
	ListPriceOverridden = case when t.ListPriceOverridden is not null then t.ListPriceOverridden else it.ListPriceOverridden end,
	AdjustedPrice = case when t.AdjustedPrice is not null then cast(t.AdjustedPrice as money) else it.AdjustedPrice end,
	AdjustedPriceOverridden = case when t.AdjustedPriceOverridden is not null then t.AdjustedPriceOverridden else it.AdjustedPriceOverridden end,
	CostFactorID = case when t.CostFactorID is not null then t.CostFactorID else it.CostFactorID end
from stgTradeBronteCore t
join TradeDataByVendor  c on t.pid = c.pid
	-- only do updates for products assigned to "Indigo Books"
	and c.SAPVendorId = 703416 and VSRCode = ''
join TradeIndigoAttributes it on it.ISBN13 = c.ISBN13 and it.SAPVendorId = c.SAPVendorId and it.VSRCode = c.VSRCode
where (
	t.ItemCost is not null 
	or t.CostOverridden is not null 
	or t.SourcePrice is not null 
	or t.ListPriceOverridden is not null 
	or t.AdjustedPrice is not null 
	or t.AdjustedPriceOverridden is not null) 

update TradeIndigoAttributes  
set IsDeleted = t.IsDeleted 
from stgTradeBronteCore t
join TradeDataByVendor  c on t.pid = c.pid
	-- only do updates for products assigned to "Indigo Books"
	and c.SAPVendorId = 703416 and VSRCode = ''
join TradeIndigoAttributes it on it.ISBN13 = c.ISBN13 and it.SAPVendorId = c.SAPVendorId and it.VSRCode = c.VSRCode
where t.IsDeleted is not null 


-- Update the DateChanged column of all Timestamp records of PID with Priority 1 for CA region
UPDATE TradeDataTimestamps
SET DateChanged = GETDATE()
FROM TradeDataTimestamps t 
JOIN TradeDataPriority p ON t.SAPVendorId = p.SAPVendorId AND t.VSRCode = p.VSRCode AND t.ISBN13 = p.ISBN13
JOIN (Select Distinct ISBN13 from #UpdatedISBNs) u ON u.ISBN13 = t.ISBN13
WHERE p.Priority = 1 and p.RegionId = 'CA'

---- Post Processing
-- set Bronte Core Archive
insert into TradeBronteCoreArchive (PID,Title,Subtitle,CurrencyTypeID,ItemCost,CostOverridden,SourcePrice,ListPrice,ListPriceOverridden,AdjustedPrice,AdjustedPriceOverridden,VendorID,CostFactorID,StatusID,OnSaleDate,IsDeleted,[FileName],DateCreated)
select PID,Title,Subtitle,CurrencyTypeID,ItemCost,CostOverridden,SourcePrice,ListPrice,ListPriceOverridden,AdjustedPrice,AdjustedPriceOverridden,VendorID,CostFactorID,StatusID,OnSaleDate,IsDeleted,[FileName],GetDate() as DateCreated
from stgTradeBronteCore
GO

GRANT EXECUTE ON [dbo].[uspProductsDBValidateCore] TO [CoreFileImporterApp]; 
GO