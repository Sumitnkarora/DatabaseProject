﻿CREATE TABLE [dbo].[stgTradeEnhancedContent]
(
	[ISBN13] VARCHAR(13) NOT NULL
,	[SAPVendorID] VARCHAR(20) NOT NULL
,	[VSRCode] VARCHAR(20) NOT NULL
,	[ID] INT NOT NULL
,	[ContentCode] VARCHAR(2) NOT NULL
,	[ContentType] VARCHAR(2) NULL
,	[URL] NVARCHAR(MAX) NULL
,	[Content] NVARCHAR(MAX) NOT NULL
);
GO

GRANT SELECT, INSERT, UPDATE, DELETE ON stgTradeEnhancedContent TO OnixImportApp;
GO