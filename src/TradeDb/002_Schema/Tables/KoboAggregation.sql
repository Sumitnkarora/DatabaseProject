CREATE TABLE [dbo].[KoboAggregation]
(
    [SourceEBookId] VARCHAR(36) NOT NULL , 
    [DestinationBookType] VARCHAR(20) NULL, 
    [DestinationEBookId] VARCHAR(36) NULL, 
    [DestinationISBN13] VARCHAR(13) NOT NULL, 
    [IndigoAggregationId] VARCHAR(32) NULL, 
    [DateChanged] DATETIME NOT NULL DEFAULT GETDATE(), 
    PRIMARY KEY ([SourceEBookId], [DestinationISBN13])
);
GO

CREATE NONCLUSTERED INDEX [IX_KoboAggregation_IndigoAggregationId] ON [dbo].[KoboAggregation] ([IndigoAggregationId])
GO
