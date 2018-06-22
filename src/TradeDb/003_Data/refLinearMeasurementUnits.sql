IF OBJECT_ID('tempdb..[#refLinearMeasurementUnits]') IS NOT NULL DROP TABLE [#refLinearMeasurementUnits];   

CREATE TABLE [#refLinearMeasurementUnits]  
(   
	[UnitID] char(2) NOT NULL  , 
	[Description] varchar(50) NOT NULL  , 
	[IsDeleted] bit NOT NULL  
);    

INSERT [#refLinearMeasurementUnits]([UnitID], [Description], [IsDeleted]) VALUES('cm', 'Centimeters', 0);
INSERT [#refLinearMeasurementUnits]([UnitID], [Description], [IsDeleted]) VALUES('ft', 'Feet', 0);
INSERT [#refLinearMeasurementUnits]([UnitID], [Description], [IsDeleted]) VALUES('in', 'Inches', 0);
INSERT [#refLinearMeasurementUnits]([UnitID], [Description], [IsDeleted]) VALUES('m ', 'Meters', 0);  

DELETE dst  
FROM [dbo].[refLinearMeasurementUnits] dst   
	LEFT JOIN [#refLinearMeasurementUnits] src ON dst.[UnitID] = src.[UnitID]  
WHERE src.[UnitID] IS NULL;    

UPDATE dst  
SET [Description] = src.[Description]  , 
	[IsDeleted] = src.[IsDeleted]  
FROM [dbo].[refLinearMeasurementUnits] dst  
	JOIN [#refLinearMeasurementUnits] src ON dst.[UnitID] = src.[UnitID]  
WHERE src.[Description] <> dst.[Description]  OR 
	src.[IsDeleted] <> dst.[IsDeleted];    
	
INSERT [dbo].[refLinearMeasurementUnits] (   
	[UnitID], [Description], [IsDeleted]  
)  
SELECT src.[UnitID], src.[Description], src.[IsDeleted]  
FROM [#refLinearMeasurementUnits] src   
	LEFT JOIN [dbo].[refLinearMeasurementUnits] dst ON dst.[UnitID] = src.[UnitID]  
WHERE dst.[UnitID] IS NULL;    