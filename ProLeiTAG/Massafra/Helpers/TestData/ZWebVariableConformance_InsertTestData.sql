Use dbOds
GO

DELETE FROM [Facade].[ZWebVariableConformance]
GO

INSERT INTO [Facade].[ZWebVariableConformance] (
       [_Key]
      ,[Format]
      ,[LowerLimit]
      ,[LowerVetoLimit]
      ,[RecordingTime]
      ,[SetpointValueRunning]
      ,[SortOrder]
      ,[UnitOfMeasurement]
      ,[UpperLimit]
      ,[UpperVetoLimit]
      ,[Value]
      ,[ValueCategoryGlobalName]
      ,[ValueCategoryLocalName]
      ,[_BatchKey]
      ,[_BatchTypeKey]
      ,[_EnumerationLink]
      ,[_MaterialKey]
      ,[_UnitKey]
      ,[_ValueCategoryKey]
  
)
SELECT TOP 100 
       [_Key]
      ,[Format]
      ,[LowerLimit]
      ,[LowerVetoLimit]
      ,[RecordingTime]
      ,[SetpointValueRunning]
      ,[SortOrder]
      ,[UnitOfMeasurement]
      ,[UpperLimit]
      ,[UpperVetoLimit]
      ,[Value]
      ,[ValueCategoryGlobalName]
      ,[ValueCategoryLocalName]
      ,[_BatchKey]
      ,[_BatchTypeKey]
      ,[_EnumerationLink]
      ,[_MaterialKey]
      ,[_UnitKey]
      ,[_ValueCategoryKey]
FROM   [BERGAMO-SV201\PLANTIT].[dbOds].[Facade].[ZWebVariableConformance]
ORDER BY RecordingTime DESC
GO

SELECT * FROM [Facade].[ZWebVariableConformance]
