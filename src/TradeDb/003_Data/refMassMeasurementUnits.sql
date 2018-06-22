IF OBJECT_ID('tempdb..[#refMassMeasurementUnits]') IS NOT NULL DROP TABLE [#refMassMeasurementUnits];    

CREATE TABLE [#refMassMeasurementUnits]  
(   
	[UnitID] char(2) NOT NULL  , 
	[Description] varchar(50) NOT NULL  , 
	[IsDeleted] bit NOT NULL  
);    

INSERT [#refMassMeasurementUnits]([UnitID], [Description], [IsDeleted]) VALUES('gr', 'Grams', 0);
INSERT [#refMassMeasurementUnits]([UnitID], [Description], [IsDeleted]) VALUES('kg', 'Kilograms', 0);
INSERT [#refMassMeasurementUnits]([UnitID], [Description], [IsDeleted]) VALUES('lb', 'Pounds', 0);
INSERT [#refMassMeasurementUnits]([UnitID], [Description], [IsDeleted]) VALUES('oz', 'Ounces', 0);

DELETE dst  
FROM [dbo].[refMassMeasurementUnits] dst   
	LEFT JOIN [#refMassMeasurementUnits] src ON dst.[UnitID] = src.[UnitID]  
WHERE src.[UnitID] IS NULL;    

UPDATE dst  
SET [Description] = src.[Description]  , 
	[IsDeleted] = src.[IsDeleted]  
FROM [dbo].[refMassMeasurementUnits] dst  
	JOIN [#refMassMeasurementUnits] src ON dst.[UnitID] = src.[UnitID]  
WHERE src.[Description] <> dst.[Description]  OR 
	src.[IsDeleted] <> dst.[IsDeleted];    
	
INSERT [dbo].[refMassMeasurementUnits] (   
	[UnitID], [Description], [IsDeleted] 
)  
SELECT src.[UnitID], src.[Description], src.[IsDeleted]  
FROM [#refMassMeasurementUnits] src   
	LEFT JOIN [dbo].[refMassMeasurementUnits] dst ON dst.[UnitID] = src.[UnitID]  
WHERE dst.[UnitID] IS NULL;    